package chipyard

import org.chipsalliance.cde.config.{Config}
import freechips.rocketchip.devices.tilelink.{BootROMLocated}
import freechips.rocketchip.util.{ResourceFileName}

// Swap default chipyard bootrom for the cosim-compatible one shipped with the BOOM submodule.
// Required by the whisper-cosim flow (the cosim bootrom expects HTIF tohost/fromhost and CLINT-poke
// boot for secondary harts).
//
// The `WithBoomDebugHarness` mixin (the whisper-cosim DPI harness) is RESTORED as of
// 2026-08-10 and is mixed into every V4 config below that carries the COSIM bootrom. It was
// dropped at plan v2 step A2 because it existed only on the M1/M2 boom; boom now carries it
// again (`boom.v4.common.WithBoomDebugHarness` + `vsrc/core_harness*.v` + `DebugMicroOp`),
// which clears the A2 blocker on gate (e), the end-to-end cosim regressions.
//
// It SELF-GATES to VCS: the fragment sets `enableDebugHarness = isVcs`, sniffing
// SIMULATOR/SIM_NAME or the cwd, because the BlackBox SV uses `import "DPI-C"` that VCS
// handles natively and Verilator does not. So a Verilator build of these configs simply
// elaborates without the harness rather than failing. Force it on from a non-vcs path with
// SIMULATOR=vcs.
//
// Gate (f) is unaffected: `docs_caracal/v2-rebaseline/regen.sh` strips this mixin before
// elaborating its reference trees, precisely so the baseline comparison is not perturbed by
// cosim scaffolding. Do not remove that stripping rule.
class WithCustomBootROM extends Config((site, here, up) => {
    case BootROMLocated(x) => up(BootROMLocated(x), site)
        .map(_.copy(contentFileName = ResourceFileName("/bootrom/bootrom.rv64.img")))
})

// ---------------------
// BOOM V3 Configs
// Performant, stable baseline
// ---------------------

class SmallBoomV3Config extends Config(
  new boom.v3.common.WithNSmallBooms(1) ++                          // small boom config
  new chipyard.config.AbstractConfig)

class MediumBoomV3Config extends Config(
  new boom.v3.common.WithNMediumBooms(1) ++                         // medium boom config
  new chipyard.config.AbstractConfig)

class LargeBoomV3Config extends Config(
  new boom.v3.common.WithNLargeBooms(1) ++                          // large boom config
  new chipyard.config.WithSystemBusWidth(128) ++
  new chipyard.config.AbstractConfig)

class MegaBoomV3Config extends Config(
  new boom.v3.common.WithNMegaBooms(1) ++                           // mega boom config
  new chipyard.config.WithSystemBusWidth(128) ++
  new chipyard.config.AbstractConfig)

class DualSmallBoomV3Config extends Config(
  new boom.v3.common.WithNSmallBooms(2) ++                          // 2 boom cores
  new chipyard.config.AbstractConfig)

class Cloned64MegaBoomV3Config extends Config(
  new boom.v3.common.WithCloneBoomTiles(63, 0) ++
  new boom.v3.common.WithNMegaBooms(1) ++                           // mega boom config
  new chipyard.config.WithSystemBusWidth(128) ++
  new chipyard.config.AbstractConfig)

class LoopbackNICLargeBoomV3Config extends Config(
  new chipyard.harness.WithLoopbackNIC ++                        // drive NIC IOs with loopback
  new icenet.WithIceNIC ++                                       // build a NIC
  new boom.v3.common.WithNLargeBooms(1) ++
  new chipyard.config.WithSystemBusWidth(128) ++
  new chipyard.config.AbstractConfig)

class MediumBoomV3CosimConfig extends Config(
  new chipyard.harness.WithCospike ++                            // attach spike-cosim
  new chipyard.config.WithTraceIO ++                             // enable the traceio
  new boom.v3.common.WithNMediumBooms(1) ++
  new chipyard.config.AbstractConfig)

class dmiCheckpointingMediumBoomV3Config extends Config(
  new chipyard.config.WithNPMPs(0) ++                            // remove PMPs (reduce non-core arch state)
  new chipyard.harness.WithSerialTLTiedOff ++                    // don't attach anything to serial-tl
  new chipyard.config.WithDMIDTM ++                              // have debug module expose a clocked DMI port
  new boom.v3.common.WithNMediumBooms(1) ++
  new chipyard.config.AbstractConfig)

class dmiMediumBoomV3CosimConfig extends Config(
  new chipyard.harness.WithCospike ++                            // attach spike-cosim
  new chipyard.config.WithTraceIO ++                             // enable the traceio
  new chipyard.harness.WithSerialTLTiedOff ++                    // don't attach anythint to serial-tl
  new chipyard.config.WithDMIDTM ++                              // have debug module expose a clocked DMI port
  new boom.v3.common.WithNMediumBooms(1) ++
  new chipyard.config.AbstractConfig)

class SimBlockDeviceMegaBoomV3Config extends Config(
  new chipyard.harness.WithSimBlockDevice ++                     // drive block-device IOs with SimBlockDevice
  new testchipip.iceblk.WithBlockDevice ++                       // add block-device module to peripherybus
  new boom.v3.common.WithNMegaBooms(1) ++                        // mega boom config
  new chipyard.config.WithSystemBusWidth(128) ++
  new chipyard.config.AbstractConfig)

// ---------------------
// BOOM V4 Configs
// Less stable and performant, but with more advanced micro-architecture
// Use for PD exploration
// ---------------------

class SmallBoomV4Config extends Config(
  new boom.v4.common.WithBoomDebugHarness ++                        // whisper-cosim DPI harness (self-gates to VCS)
  new WithCustomBootROM ++                                          // Custom BootROM for COSIM
  new boom.v4.common.WithNSmallBooms(1) ++                          // small boom config
  new chipyard.config.AbstractConfig)

class MediumBoomV4Config extends Config(
  new boom.v4.common.WithBoomDebugHarness ++                        // whisper-cosim DPI harness (self-gates to VCS)
  new WithCustomBootROM ++                                          // Custom BootROM for COSIM
  new boom.v4.common.WithNMediumBooms(1) ++                         // medium boom config
  new chipyard.config.AbstractConfig)

class MediumBoomV4CommitLogConfig extends Config(
  new boom.v4.common.WithBoomCommitLogPrintf ++                     // emit per-retired-uop commit log via Chisel printf
  new boom.v4.common.WithNMediumBooms(1) ++
  new chipyard.config.AbstractConfig)

class LargeBoomV4Config extends Config(
  new boom.v4.common.WithBoomDebugHarness ++                        // whisper-cosim DPI harness (self-gates to VCS)
  new WithCustomBootROM ++                                          // Custom BootROM for COSIM
  new boom.v4.common.WithNLargeBooms(1) ++                          // large boom config
  new chipyard.config.WithSystemBusWidth(128) ++
  new chipyard.config.AbstractConfig)

class MegaBoomV4Config extends Config(
  new boom.v4.common.WithBoomDebugHarness ++                        // whisper-cosim DPI harness (self-gates to VCS)
  new WithCustomBootROM ++                                          // Custom BootROM for COSIM
  new boom.v4.common.WithNMegaBooms(1) ++                           // mega boom config
  new chipyard.config.WithSystemBusWidth(128) ++
  new chipyard.config.AbstractConfig)

// Caracal RVV 1.0 vector-enabled configs (plan v2, step A2).
//
// Only the two tiers plan v2 step A2 calls for are declared here. The M1/M2-era
// *VectorArithConfig / *VectorSnoopConfig configs were removed: they passed
// `enableVectorArith` / `vecScalarSnoopEnable` as fields of `VectorParams`, which
// they are not in v2 — they are `BoomCoreParams` sub-flags with their own fragments
// (`boom.v4.common.WithVectorArith`, `boom.v4.common.WithVecScalarSnoop`). Re-add
// those configs by composing the fragments when Phase F / Phase G land the logic
// behind them.
//
// NOTE: these do not elaborate yet, and that is expected at A2. `core.scala`
// still hardcodes `BasicDispatcher`, so the three IQ_V_* issueParams entries fall
// through to `require(false)`. Plan step D2 switches it to `CompactingDispatcher`
// (decision D2) and is what makes gate (c) reachable. SmallBoom is deliberately
// absent from the vector matrix (decision D3).
class MediumBoomV4VectorConfig extends Config(
  new boom.v4.common.WithBoomDebugHarness ++                        // whisper-cosim DPI harness (self-gates to VCS)
  new boom.v4.common.WithVecScalarSnoop ++                          // Phase G: scalar<-vector store forwarding
  new boom.v4.common.WithVector() ++                                // enable Caracal vector pipeline
  new WithCustomBootROM ++                                          // Custom BootROM for COSIM
  new boom.v4.common.WithNMediumBooms(1) ++                         // medium boom config
  new chipyard.config.AbstractConfig)

class MegaBoomV4VectorConfig extends Config(
  new boom.v4.common.WithBoomDebugHarness ++                        // whisper-cosim DPI harness (self-gates to VCS)
  new boom.v4.common.WithVecScalarSnoop ++                          // Phase G: scalar<-vector store forwarding
  new boom.v4.common.WithMegaBoomsVector ++                         // Mega-tier vector overrides
  new WithCustomBootROM ++                                          // Custom BootROM for COSIM
  new boom.v4.common.WithNMegaBooms(1) ++                           // mega boom config
  new chipyard.config.WithSystemBusWidth(128) ++
  new chipyard.config.AbstractConfig)

// Wide-D$-lane variants: same machines with a 128-bit LSU<->D$ request lane, so
// peak vector memory bandwidth doubles (128 b/cycle on Medium, 256 on Mega).
// Separate configs so the narrow ones above stay the regression baseline.
class MediumBoomV4VectorWideConfig extends Config(
  new boom.v4.common.WithBoomDebugHarness ++                        // whisper-cosim DPI harness (self-gates to VCS)
  new boom.v4.common.WithVecScalarSnoop ++                          // Phase G: scalar<-vector store forwarding
  new boom.v4.common.WithMediumBoomsVectorWide ++                   // Caracal vector pipeline, 128-bit D$ lane
  new WithCustomBootROM ++                                          // Custom BootROM for COSIM
  new boom.v4.common.WithNMediumBooms(1) ++                         // medium boom config
  new chipyard.config.AbstractConfig)

class MegaBoomV4VectorWideConfig extends Config(
  new boom.v4.common.WithBoomDebugHarness ++                        // whisper-cosim DPI harness (self-gates to VCS)
  new boom.v4.common.WithVecScalarSnoop ++                          // Phase G: scalar<-vector store forwarding
  new boom.v4.common.WithMegaBoomsVectorWide ++                     // Mega-tier vector overrides, 128-bit D$ lane
  new WithCustomBootROM ++                                          // Custom BootROM for COSIM
  new boom.v4.common.WithNMegaBooms(1) ++                           // mega boom config
  new chipyard.config.WithSystemBusWidth(128) ++
  new chipyard.config.AbstractConfig)

// EXPERIMENT: MegaBoomV4VectorWideConfig with all LSU queues/buffers/FIFOs, the
// vector register file and the ROB 4x deeper. Capacity-sensitivity probe for the
// memory-bound vector kernels; not a shipping tier.
class MegaBoomV4VectorWide4xConfig extends Config(
  new boom.v4.common.WithBoomDebugHarness ++                        // whisper-cosim DPI harness (self-gates to VCS)
  new boom.v4.common.WithVecScalarSnoop ++                          // Phase G: scalar<-vector store forwarding
  new boom.v4.common.WithMegaBoomsVectorWide4x ++                   // 4x LSU queues / VRF / ROB, 128-bit D$ lane
  new WithCustomBootROM ++                                          // Custom BootROM for COSIM
  new boom.v4.common.WithNMegaBooms(1) ++                           // mega boom config
  new chipyard.config.WithSystemBusWidth(128) ++
  new chipyard.config.AbstractConfig)

class DualSmallBoomV4Config extends Config(
  new WithCustomBootROM ++                                          // Custom BootROM for COSIM
  new boom.v4.common.WithNSmallBooms(2) ++                          // 2 boom cores
  new chipyard.config.AbstractConfig)

class Cloned64MegaBoomV4Config extends Config(
  new boom.v4.common.WithCloneBoomTiles(63, 0) ++
  new boom.v4.common.WithNMegaBooms(1) ++                           // mega boom config
  new chipyard.config.WithSystemBusWidth(128) ++
  new chipyard.config.AbstractConfig)

class MediumBoomV4CosimConfig extends Config(
  new chipyard.harness.WithCospike ++                            // attach spike-cosim
  new chipyard.config.WithTraceIO ++                             // enable the traceio
  new boom.v4.common.WithNMediumBooms(1) ++
  new chipyard.config.AbstractConfig)

class dmiCheckpointingMediumBoomV4Config extends Config(
  new chipyard.config.WithNPMPs(0) ++                            // remove PMPs (reduce non-core arch state)
  new chipyard.harness.WithSerialTLTiedOff ++                    // don't attach anything to serial-tl
  new chipyard.config.WithDMIDTM ++                              // have debug module expose a clocked DMI port
  new boom.v4.common.WithNMediumBooms(1) ++
  new chipyard.config.AbstractConfig)

class dmiMediumBoomV4CosimConfig extends Config(
  new chipyard.harness.WithCospike ++                            // attach spike-cosim
  new chipyard.config.WithTraceIO ++                             // enable the traceio
  new chipyard.harness.WithSerialTLTiedOff ++                    // don't attach anythint to serial-tl
  new chipyard.config.WithDMIDTM ++                              // have debug module expose a clocked DMI port
  new boom.v4.common.WithNMediumBooms(1) ++
  new chipyard.config.AbstractConfig)

class SimBlockDeviceMegaBoomV4Config extends Config(
  new chipyard.harness.WithSimBlockDevice ++                     // drive block-device IOs with SimBlockDevice
  new testchipip.iceblk.WithBlockDevice ++                       // add block-device module to peripherybus
  new boom.v4.common.WithNMegaBooms(1) ++                        // mega boom config
  new chipyard.config.WithSystemBusWidth(128) ++
  new chipyard.config.AbstractConfig)
