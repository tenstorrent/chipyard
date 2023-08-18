//#include <stdio.h>
//#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <mem.h>

/************************************************************************/
// RISC-V VECTOR Version by Cristóbal Ramírez Lazo, "Barcelona 2019"
#ifdef USE_RISCV_VECTOR
#include "../../common/vector_defines.h"
#endif
/************************************************************************/

//Enable RESULT_PRINT in order to see the result vector, for instruction count it should be disable
#define RESULT_PRINT
//#define INPUT_PRINT
#define MAXNAMESIZE 1024 // max filename length
#define M_SEED 9
#define MAX_WEIGHT 10
#define NUM_RUNS 100

int rows, cols;
int* wall;
int* result;
static char* heap [256*4096];

void init(int argc, char** argv);
void run();
void run_vector();

void init(int argc, char** argv)
{
#ifdef TINY
    cols = 32;
    rows = 32;
#elif SMALL
    cols = 1024;
    rows = 128;
#elif MEDIUM
    cols = 2048;
    rows = 256;
#elif LARGE
    cols = 2048;
    rows = 1024;
#endif
    printf("cols: %d rows: %d \n", cols , rows);

    wall = (int*) malloc(sizeof(int)*rows*cols);
    result = (int*) malloc(sizeof(int)*cols);

    for (int i = 0; i < rows; i++)
    {
        for (int j = 0; j < cols; j++)
        {
            wall[i*cols+j] = rand() % 10;
        }
    }


#ifdef INPUT_PRINT
    for (int i = 0; i < rows; i++)
    {
        for (int j = 0; j < cols; j++)
        {
            printf("%d ",wall[i*cols+j]) ;
        }
        printf("\n") ;
    }
#endif
}

void fatal(char *s)
{
  printf("error\n");
}

#define IN_RANGE(x, min, max)   ((x)>=(min) && (x)<=(max))
#define CLAMP_RANGE(x, min, max) x = (x<(min)) ? min : ((x>(max)) ? max : x )
#define MIN(a, b) ((a)<=(b) ? (a) : (b))

int main(int argc, char** argv)
{

   init_heap(heap, 256*4096);
   init(argc,argv);

#ifndef USE_RISCV_VECTOR
    asm("__perf_start:");
    run();
    asm("__perf_end:");
#else
    asm("__perf_start:");
    run_vector();
    asm("__perf_end:");
#endif

    return 0;
}

#ifndef USE_RISCV_VECTOR

void run()
{
    int min;
    int *src,*dst, *temp;

    for (int j=0; j<NUM_RUNS; j++) {
        src = (int *)malloc(sizeof(int)*cols);
        for (int x = 0; x < cols; x++){
            result[x] = wall[x];
        }

        dst = result;
        for (int t = 0; t < rows-1; t++) {
            temp = src;
            src = dst;
            dst = temp;
            for(int n = 0; n < cols; n++){
              min = src[n];
              if (n > 0)
                min = MIN(min, src[n-1]);
              if (n < cols-1)
                min = MIN(min, src[n+1]);
              dst[n] = wall[(t+1)*cols + n]+min;
            }
        }
    }

    free(dst);
    free(wall);
    free(src);
}

#else // USE_RISCV_VECTOR

void run_vector()
{
    int *dst;

    for (int j=0; j<NUM_RUNS; j++) {
        for (int x = 0; x < cols; x++){
            result[x] = wall[x];
        }
        dst = result;

       // unsigned long int gvl = __builtin_epi_vsetvl(cols, __epi_e32, __epi_m1);
        unsigned long int gvl = __riscv_vsetvl_e32m1(cols);  //PLCT
        _MMR_i32    xSrc_slideup;
        _MMR_i32    xSrc_slidedown;
        _MMR_i32    xSrc;
        _MMR_i32    xNextrow;

        int aux,aux2;

        for (int t = 0; t < rows-1; t++)
        {
            aux = dst[0] ;
            for(int n = 0; n < cols; n = n + gvl)
            {
                // gvl = __builtin_epi_vsetvl(cols-n, __epi_e32, __epi_m1);
                gvl = __riscv_vsetvl_e32m1(cols-n); //PLCT
                xNextrow = _MM_LOAD_i32(&dst[n],gvl);

                xSrc = xNextrow;
                aux2 = (n+gvl >= cols) ?  dst[n+gvl-1] : dst[n+gvl];
                xSrc_slideup = _MM_VSLIDE1UP_i32(xSrc,aux,gvl);
                xSrc_slidedown = _MM_VSLIDE1DOWN_i32(xSrc,aux2,gvl);

                xSrc = _MM_MIN_i32(xSrc,xSrc_slideup,gvl);
                xSrc = _MM_MIN_i32(xSrc,xSrc_slidedown,gvl);

                xNextrow = _MM_LOAD_i32(&wall[(t+1)*cols + n],gvl);
                xNextrow = _MM_ADD_i32(xNextrow,xSrc,gvl);

                aux = dst[n+gvl-1];
                _MM_STORE_i32(&dst[n],xNextrow,gvl);
                FENCE();
            }
        }

        FENCE();
    }
    printf("Found the smallest path\n");

    free(wall);
    free(dst);
}
#endif // USE_RISCV_VECTOR

void output_printfile(int *dst) {

    for (int j = 0; j < cols; j++)
    {
      printf("%d ", dst[j]);
    }
}
