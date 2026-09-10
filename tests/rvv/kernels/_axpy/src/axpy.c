#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <assert.h>

#include <riscv_vector.h>

// axpy: dy[i] = a * dx[i] + dy[i]
//
// Tail- and mask-agnostic (ta,ma) RVV kernel.
//
// The default-policy __riscv_* intrinsics emit `vsetvli ..., ta, ma`, so every
// element beyond `vl` is a don't-care. We only ever store `vl` elements, so the
// tail is genuinely dead and there is nothing to preserve.
//
// This matters for performance: the old EPI-style intrinsics defaulted to
// tail-undisturbed (tu), which forced the compiler to insert a second
// `vsetvli zero, zero, e64, m8, tu, mu` before the vfmacc just to flip the tail
// policy. That extra vtype write serializes the loop (the vfmacc's destination
// register must be treated as live-in, and the vtype change is an ordering
// barrier). With ta,ma the whole body runs under a single vsetvli per iteration.
//
// Using the vfmacc.vf (scalar) form also removes the hoisted vfmv.v.f splat of
// `a`, so there is no loop-invariant vector reg carried across changing vl.
void axpy_intrinsics(double a, double *dx, double *dy, int n) {
  for (int i = 0; i < n;) {
    size_t vl = __riscv_vsetvl_e64m8(n - i);

    vfloat64m8_t v_dx  = __riscv_vle64_v_f64m8(&dx[i], vl);
    vfloat64m8_t v_dy  = __riscv_vle64_v_f64m8(&dy[i], vl);
    vfloat64m8_t v_res = __riscv_vfmacc_vf_f64m8(v_dy, a, v_dx, vl);
    __riscv_vse64_v_f64m8(&dy[i], v_res, vl);

    i += vl;
  }

  asm volatile("fence");
}
