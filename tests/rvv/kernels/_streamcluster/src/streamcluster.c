/*
 * Copyright (C) 2008 Princeton University
 * All rights reserved.
 * Authors: Jia Deng, Gilberto Contreras
 *
 * streamcluster - Online clustering algorithm
 *
 */
#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <math.h>
#include <limits.h>
#include <mem.h>

// RISC-V VECTOR Version by Cristóbal Ramírez Lazo, "Barcelona 2019"
#ifdef USE_RISCV_VECTOR
#include "../../common/vector_defines.h"
#endif


#define MAXNAMESIZE 1024 // max filename length
#define SEED 1
/* increase this to reduce probability of random error */
/* increasing it also ups running time of "speedy" part of the code */
/* SP = 1 seems to be fine */
#define SP 1 // number of repetitions of speedy must be >=1

/* higher ITER --> more likely to get correct # of centers */
/* higher ITER also scales the running time almost linearly */
#define ITER 3 // iterate ITER* k log k times; ITER >= 1

#define CACHE_LINE 64 // cache line in byte

/* this structure represents a point */
/* these will be passed around to avoid copying coordinates */
typedef struct {
  float weight;
  float *coord;
  long assign;  /* number of point where this one is assigned */
  float cost;  /* cost of that assignment, weight*distance */
} Point;

/* this is the array of points */
typedef struct {
  long num; /* number of points; may not be N if this is a sample */
  int dim;  /* dimensionality */
  Point *p; /* the array itself */
} Points;


static bool *switch_membership; //whether to switch membership in pgain
static bool* is_center; //whether a point is a center
static int* center_table; //index table of centers

static int nproc; //# of threads

static char* heap[2048*1024*8];


float dist(Point p1, Point p2, int dim);

int isIdentical(float *i, float *j, int D)
// tells whether two points of D dimensions are identical
{
  int a = 0;
  int equal = 1;

  while (equal && a < D) {
    if (i[a] != j[a]) equal = 0;
    else a++;
  }
  if (equal) return 1;
  else return 0;

}

/* comparator for floating point numbers */
static int floatcomp(const void *i, const void *j)
{
  float a, b;
  a = *(float *)(i);
  b = *(float *)(j);
  if (a > b) return (1);
  if (a < b) return (-1);
  return(0);
}

/* shuffle points into random order */
void shuffle(Points *points)
{
  long i, j;
  Point temp;
  for (i=0;i<points->num-1;i++) {
    j=(lrand48()%(points->num - i)) + i;
    temp = points->p[i];
    points->p[i] = points->p[j];
    points->p[j] = temp;
  }
}

/* shuffle an array of integers */
void intshuffle(int *intarray, int length)
{
  long i, j;
  int temp;
  for (i=0;i<length;i++) {
    j=(lrand48()%(length - i))+i;
    temp = intarray[i];
    intarray[i]=intarray[j];
    intarray[j]=temp;
  }
}

/* compute Euclidean distance squared between two points */
float dist(Point p1, Point p2, int dim )
{
#ifdef USE_RISCV_VECTOR
  float result=0.0;
  int i;
  //unsigned long int gvl = __builtin_epi_vsetvl(dim, __epi_e32, __epi_m1);
  unsigned long int gvl = __riscv_vsetvl_e32m1(dim); //PLCT

 _MMR_f32 result1,result2, _aux, _diff, _coord1, _coord2;

  result1 = _MM_SET_f32(0.0,gvl);
  result2 = _MM_SET_f32(0.0,gvl);
  for (i=0;i<dim;i=i+gvl) {

   // gvl = __builtin_epi_vsetvl(dim-i, __epi_e32, __epi_m1);
   gvl = __riscv_vsetvl_e32m1(dim-i); //PLCT

    _coord1 = _MM_LOAD_f32(&(p1.coord[i]),gvl);
    _coord2 = _MM_LOAD_f32(&(p2.coord[i]),gvl);

    _diff = _MM_SUB_f32(_coord2,_coord1,gvl);
    result1   = _MM_MACC_f32(result1,_diff,_diff,gvl);
  }
  result2 = _MM_REDSUM_f32(result1,result2,gvl);
  result = _MM_VGETFIRST_f32(result2,gvl);
  FENCE();
  //printf("result = %lf\n",result);
  return result;
#else // USE_RISCV_VECTOR
  int i;
  float result=0.0;
  for (i=0;i<dim;i++)
    result += (p1.coord[i] - p2.coord[i])*(p1.coord[i] - p2.coord[i]);
  //printf("result = %d\n",result);
  return(result);

#endif // USE_RISCV_VECTOR

}

float pspeedy(Points *points, float z, long *kcenter, int pid)
{
  //my block
  long bsize = points->num/nproc;
  long k1 = bsize * pid;
  long k2 = k1 + bsize;
  if( pid == nproc-1 ) k2 = points->num;

  static double totalcost;

  static bool open = false;
  static double* costs; //cost for each thread.
  static int i;

  /* create center at first point, send it to itself */
  for( int k = k1; k < k2; k++ )    {
    float distance = dist(points->p[k],points->p[0],points->dim );
    points->p[k].cost = distance * points->p[k].weight;
    points->p[k].assign=0;
  }

  if( pid==0 )   {
    *kcenter = 1;
    costs = (double*)malloc(sizeof(double)*nproc);
  }


  if( pid != 0 ) { // we are not the master threads. we wait until a center is opened.
    while(1) {
      if( i >= points->num ) break;
      for( int k = k1; k < k2; k++ )
	{
	  float distance = dist(points->p[i],points->p[k],points->dim);
	  if( distance*points->p[k].weight < points->p[k].cost )
	    {
	      points->p[k].cost = distance * points->p[k].weight;
	      points->p[k].assign=i;
	    }
	}
    }
  }
  else  { // I am the master thread. I decide whether to open a center and notify others if so.
    for(i = 1; i < points->num; i++ )  {
      bool to_open = ((float)lrand48()/(float)INT_MAX)<(points->p[i].cost/z);
      if( to_open )  {
	(*kcenter)++;

	open = true;
	for( int k = k1; k < k2; k++ )  {
	  float distance = dist(points->p[i],points->p[k],points->dim );
	  if( distance*points->p[k].weight < points->p[k].cost )  {
	    points->p[k].cost = distance * points->p[k].weight;
	    points->p[k].assign=i;
	  }
	}

	open = false;
      }
    }

    open = true;
  }


  open = false;
  double mytotal = 0;
  for( int k = k1; k < k2; k++ )  {
    mytotal += points->p[k].cost;
  }
  costs[pid] = mytotal;

  // aggregate costs from each thread
  if( pid == 0 )
    {
      totalcost=z*(*kcenter);
      for( int i = 0; i < nproc; i++ )
	{
	  totalcost += costs[i];
	}
      free(costs);
    }

  return(totalcost);
}


/* For a given point x, find the cost of the following operation:
 * -- open a facility at x if there isn't already one there,
 * -- for points y such that the assignment distance of y exceeds dist(y, x),
 *    make y a member of x,
 * -- for facilities y such that reassigning y and all its members to x
 *    would save cost, realize this closing and reassignment.
 *
 * If the cost of this operation is negative (i.e., if this entire operation
 * saves cost), perform this operation and return the amount of cost saved;
 * otherwise, do nothing.
 */

/* numcenters will be updated to reflect the new number of centers */
/* z is the facility cost, x is the number of this point in the array
   points */


double pgain(long x, Points *points, double z, long int *numcenters, int pid)
{
  //  printf("pgain pthread %d begin\n",pid);

  //my block
  long bsize = points->num/nproc;
  long k1 = bsize * pid;
  long k2 = k1 + bsize;
  if( pid == nproc-1 ) k2 = points->num;

  int i;
  int number_of_centers_to_close = 0;

  static double *work_mem;
  static double gl_cost_of_opening_x;
  static int gl_number_of_centers_to_close;

  //each thread takes a block of working_mem.
  int stride = *numcenters+2;
  //make stride a multiple of CACHE_LINE
  int cl = CACHE_LINE/sizeof(double);
  if( stride % cl != 0 ) {
    stride = cl * ( stride / cl + 1);
  }
  int K = stride -2 ; // K==*numcenters

  //my own cost of opening x
  double cost_of_opening_x = 0;

  if( pid==0 )    {
    work_mem = (double*) malloc(stride*(nproc+1)*sizeof(double));
    gl_cost_of_opening_x = 0;
    gl_number_of_centers_to_close = 0;
  }

  /*For each center, we have a *lower* field that indicates
    how much we will save by closing the center.
    Each thread has its own copy of the *lower* fields as an array.
    We first build a table to index the positions of the *lower* fields.
  */

  int count = 0;
  for( int i = k1; i < k2; i++ ) {
    if( is_center[i] ) {
      center_table[i] = count++;
    }
  }
  work_mem[pid*stride] = count;

  if( pid == 0 ) {
    int accum = 0;
    for( int p = 0; p < nproc; p++ ) {
      int tmp = (int)work_mem[p*stride];
      work_mem[p*stride] = accum;
      accum += tmp;
    }
  }

  for( int i = k1; i < k2; i++ ) {
    if( is_center[i] ) {
      center_table[i] += (int)work_mem[pid*stride];
    }
  }

  //now we finish building the table. clear the working memory.
  memset(switch_membership + k1, 0, (k2-k1)*sizeof(bool));
  memset(work_mem+pid*stride, 0, stride*sizeof(double));
  if( pid== 0 ) memset(work_mem+nproc*stride,0,stride*sizeof(double));

  //my *lower* fields
  double* lower = &work_mem[pid*stride];
  //global *lower* fields
  double* gl_lower = &work_mem[nproc*stride];

//printf("----------------------------------------------------\n");
  for ( i = k1; i < k2; i++ ) {
//    printf("dim = %d \n" , points->dim);
    float x_cost = dist(points->p[i], points->p[x], points->dim ) * points->p[i].weight;
    float current_cost = points->p[i].cost;

    if ( x_cost < current_cost ) {

      // point i would save cost just by switching to x
      // (note that i cannot be a median,
      // or else dist(p[i], p[x]) would be 0)

      switch_membership[i] = 1;
      cost_of_opening_x += x_cost - current_cost;

    } else {

      // cost of assigning i to x is at least current assignment cost of i

      // consider the savings that i's **current** median would realize
      // if we reassigned that median and all its members to x;
      // note we've already accounted for the fact that the median
      // would save z by closing; now we have to subtract from the savings
      // the extra cost of reassigning that median and its members
      int assign = points->p[i].assign;
      lower[center_table[assign]] += current_cost - x_cost;
    }
  }

  // at this time, we can calculate the cost of opening a center
  // at x; if it is negative, we'll go through with opening it

  for ( int i = k1; i < k2; i++ ) {
    if( is_center[i] ) {
      double low = z;
      //aggregate from all threads
      for( int p = 0; p < nproc; p++ ) {
	low += work_mem[center_table[i]+p*stride];
      }
      gl_lower[center_table[i]] = low;
      if ( low > 0 ) {
	// i is a median, and
	// if we were to open x (which we still may not) we'd close i

	// note, we'll ignore the following quantity unless we do open x
	++number_of_centers_to_close;
	cost_of_opening_x -= low;
      }
    }
  }
  //use the rest of working memory to store the following
  work_mem[pid*stride + K] = number_of_centers_to_close;
  work_mem[pid*stride + K+1] = cost_of_opening_x;

  //  printf("thread %d cost complete\n",pid);

  if( pid==0 ) {
    gl_cost_of_opening_x = z;
    //aggregate
    for( int p = 0; p < nproc; p++ ) {
      gl_number_of_centers_to_close += (int)work_mem[p*stride + K];
      gl_cost_of_opening_x += work_mem[p*stride+K+1];
    }
  }

  // Now, check whether opening x would save cost; if so, do it, and
  // otherwise do nothing

  if ( gl_cost_of_opening_x < 0 ) {
    //  we'd save money by opening x; we'll do it
    for ( int i = k1; i < k2; i++ ) {
      bool close_center = gl_lower[center_table[points->p[i].assign]] > 0 ;
      if ( switch_membership[i] || close_center ) {
	// Either i's median (which may be i itself) is closing,
	// or i is closer to x than to its current median
	points->p[i].cost = points->p[i].weight *
	  dist(points->p[i], points->p[x], points->dim );
	points->p[i].assign = x;
      }
    }
    for( int i = k1; i < k2; i++ ) {
      if( is_center[i] && gl_lower[center_table[i]] > 0 ) {
	is_center[i] = false;
      }
    }
    if( x >= k1 && x < k2 ) {
      is_center[x] = true;
    }

    if( pid==0 ) {
      *numcenters = *numcenters + 1 - gl_number_of_centers_to_close;
    }
  }
  else {
    if( pid==0 )
      gl_cost_of_opening_x = 0;  // the value we'll return
  }

  if( pid == 0 ) {
    free(work_mem);
    //    free(is_center);
    //    free(switch_membership);
    //    free(proc_cost_of_opening_x);
    //    free(proc_number_of_centers_to_close);
  }

  return -gl_cost_of_opening_x;
}


/* facility location on the points using local search */
/* z is the facility cost, returns the total cost and # of centers */
/* assumes we are seeded with a reasonable solution */
/* cost should represent this solution's cost */
/* halt if there is < e improvement after iter calls to gain */
/* feasible is an array of numfeasible points which may be centers */

 float pFL(Points *points, int *feasible, int numfeasible,
	  float z, long *k, double cost, long iter, float e,
	  int pid)
{
  long i;
  long x;
  double change;
  long numberOfPoints;

  change = cost;
  /* continue until we run iter iterations without improvement */
  /* stop instead if improvement is less than e */
  while (change/cost > 1.0*e) {
    change = 0.0;
    numberOfPoints = points->num;
    /* randomize order in which centers are considered */

    if( pid == 0 ) {
      intshuffle(feasible, numfeasible);
    }

    for (i=0;i<iter;i++) {
      x = i%numfeasible;
      change += pgain(feasible[x], points, z, k, pid);
    }
    cost -= change;
  }
  return(cost);
}

int selectfeasible_fast(Points *points, int **feasible, int kmin, int pid)
{
  int numfeasible = points->num;
  if (numfeasible > (ITER*kmin*log((double)kmin)))
    numfeasible = (int)(ITER*kmin*log((double)kmin));
  *feasible = (int *)malloc(numfeasible*sizeof(int));

  float* accumweight;
  float totalweight;

  /*
     Calcuate my block.
     For now this routine does not seem to be the bottleneck, so it is not parallelized.
     When necessary, this can be parallelized by setting k1 and k2 to
     proper values and calling this routine from all threads ( it is called only
     by thread 0 for now ).
     Note that when parallelized, the randomization might not be the same and it might
     not be difficult to measure the parallel speed-up for the whole program.
   */
  //  long bsize = numfeasible;
  long k1 = 0;
  long k2 = numfeasible;

  float w;
  int l,r,k;

  /* not many points, all will be feasible */
  if (numfeasible == points->num) {
    for (int i=k1;i<k2;i++)
      (*feasible)[i] = i;
    return numfeasible;
  }

  accumweight= (float*)malloc(sizeof(float)*points->num);

  accumweight[0] = points->p[0].weight;
  totalweight=0;
  for( int i = 1; i < points->num; i++ ) {
    accumweight[i] = accumweight[i-1] + points->p[i].weight;
  }
  totalweight=accumweight[points->num-1];

  for(int i=k1; i<k2; i++ ) {
    w = (lrand48()/(float)INT_MAX)*totalweight;
    //binary search
    l=0;
    r=points->num-1;
    if( accumweight[0] > w )  {
      (*feasible)[i]=0;
      continue;
    }
    while( l+1 < r ) {
      k = (l+r)/2;
      if( accumweight[k] > w ) {
	r = k;
      }
      else {
	l=k;
      }
    }
    (*feasible)[i]=r;
  }

  free(accumweight);

  return numfeasible;
}

/* compute approximate kmedian on the points */
float pkmedian(Points *points, long kmin, long kmax, long* kfinal,
	       int pid)
{
  int i;
  double cost;
  double lastcost;
  double hiz, loz, z;

  static long k;
  static int *feasible;
  static int numfeasible;
  static double* hizs;

  if( pid==0 ) hizs = (double*)calloc(nproc,sizeof(double));
  hiz = loz = 0.0;
  long numberOfPoints = points->num;
  long ptDimension = points->dim;

  //my block
  long bsize = points->num/nproc;
  long k1 = bsize * pid;
  long k2 = k1 + bsize;
  if( pid == nproc-1 ) k2 = points->num;

  double myhiz = 0;
  for (long kk=k1;kk < k2; kk++ ) {
    myhiz += dist(points->p[kk], points->p[0],
		      ptDimension )*points->p[kk].weight;
  }
  hizs[pid] = myhiz;

  for( int i = 0; i < nproc; i++ )   {
    hiz += hizs[i];
  }

  loz=0.0; z = (hiz+loz)/2.0;
  /* NEW: Check whether more centers than points! */
  if (points->num <= kmax) {
    /* just return all points as facilities */
    for (long kk=k1;kk<k2;kk++) {
      points->p[kk].assign = kk;
      points->p[kk].cost = 0;
    }
    cost = 0;
    if( pid== 0 ) {
      free(hizs);
      *kfinal = k;
    }
    return cost;
  }

  if( pid == 0 ) shuffle(points);
  cost = pspeedy(points, z, &k, pid);

  i=0;
  /* give speedy SP chances to get at least kmin/2 facilities */
  while ((k < kmin)&&(i<SP)) {
    cost = pspeedy(points, z, &k, pid);
    i++;
  }

  /* if still not enough facilities, assume z is too high */
  while (k < kmin) {
    if (i >= SP) {hiz=z; z=(hiz+loz)/2.0; i=0;}
    if( pid == 0 ) shuffle(points);
    cost = pspeedy(points, z, &k, pid);
    i++;
  }

  /* now we begin the binary search for real */
  /* must designate some points as feasible centers */
  /* this creates more consistancy between FL runs */
  /* helps to guarantee correct # of centers at the end */

  if( pid == 0 )
    {
      numfeasible = selectfeasible_fast(points,&feasible,kmin,pid);
      for( int i = 0; i< points->num; i++ ) {
	is_center[points->p[i].assign]= true;
      }
    }

  while(1) {
    /* first get a rough estimate on the FL solution */
    lastcost = cost;
    cost = pFL(points, feasible, numfeasible,
	       z, &k, cost, (long)(ITER*kmax*log((double)kmax)), 0.1, pid);

    /* if number of centers seems good, try a more accurate FL */
    if (((k <= (1.1)*kmax)&&(k >= (0.9)*kmin))||
	((k <= kmax+2)&&(k >= kmin-2))) {

      /* may need to run a little longer here before halting without
	 improvement */
      cost = pFL(points, feasible, numfeasible,
		 z, &k, cost, (long)(ITER*kmax*log((double)kmax)), 0.001, pid);
    }

    if (k > kmax) {
      /* facilities too cheap */
      /* increase facility cost and up the cost accordingly */
      loz = z; z = (hiz+loz)/2.0;
      cost += (z-loz)*k;
    }
    if (k < kmin) {
      /* facilities too expensive */
      /* decrease facility cost and reduce the cost accordingly */
      hiz = z; z = (hiz+loz)/2.0;
      cost += (z-hiz)*k;
    }

    /* if k is good, return the result */
    /* if we're stuck, just give up and return what we have */
    if (((k <= kmax)&&(k >= kmin))||((loz >= (0.999)*hiz)) )
      {
	break;
      }
  }

  //clean up...
  if( pid==0 ) {
    free(feasible);
    free(hizs);
    *kfinal = k;
  }

  return cost;
}


/* compute the means for the k clusters */
int contcenters(Points *points)
{
  long i, ii;
  float relweight;

  for (i=0;i<points->num;i++) {
    /* compute relative weight of this point to the cluster */
    if (points->p[i].assign != i) {
      relweight=points->p[points->p[i].assign].weight + points->p[i].weight;
      relweight = points->p[i].weight/relweight;
      for (ii=0;ii<points->dim;ii++) {
	points->p[points->p[i].assign].coord[ii]*=1.0-relweight;
	points->p[points->p[i].assign].coord[ii]+=
	  points->p[i].coord[ii]*relweight;
      }
      points->p[points->p[i].assign].weight += points->p[i].weight;
    }
  }

  return 0;
}

/* copy centers from points to centers */
void copycenters(Points *points, Points* centers, long* centerIDs, long offset)
{
  long i;
  long k;

  bool *is_a_median = (bool *) calloc(points->num, sizeof(bool));

  /* mark the centers */
  for ( i = 0; i < points->num; i++ ) {
    is_a_median[points->p[i].assign] = 1;
  }

  k=centers->num;

  /* count how many  */
  for ( i = 0; i < points->num; i++ ) {
    if ( is_a_median[i] ) {
      memcpy( centers->p[k].coord, points->p[i].coord, points->dim * sizeof(float));
      centers->p[k].weight = points->p[i].weight;
      centerIDs[k] = i + offset;
      k++;
    }
  }

  centers->num = k;

  free(is_a_median);
}

struct pkmedian_arg_t
{
  Points* points;
  long kmin;
  long kmax;
  long* kfinal;
  int pid;
};

void* localSearchSub(void* arg_) {

  struct pkmedian_arg_t* arg= (struct pkmedian_arg_t*)arg_;
  pkmedian(arg->points,arg->kmin,arg->kmax,arg->kfinal,arg->pid);

  return NULL;
}

void localSearch( Points* points, long kmin, long kmax, long* kfinal ) {
    struct pkmedian_arg_t* arg = (struct pkmedian_arg_t*) malloc(sizeof(struct pkmedian_arg_t)*nproc);

    for( int i = 0; i < nproc; i++ ) {
      arg[i].points = points;
      arg[i].kmin = kmin;
      arg[i].kmax = kmax;
      arg[i].pid = i;
      arg[i].kfinal = kfinal;

      localSearchSub(&arg[0]);
    }

    free(arg);
}

//synthetic stream
struct SimStream {
  long n;
};

size_t streamread(struct SimStream* s, float* dest, int dim, int num ) {
  size_t count = 0;
  for( int i = 0; i < num && s->n > 0; i++ ) {
    for( int k = 0; k < dim; k++ ) {
      dest[i*dim + k] = lrand48()/(float)INT_MAX;
    }
    s->n--;
    count++;
  }
  return count;
};

int streamferror(struct SimStream* s)
{
  return 0;
};

int streamfeof(struct SimStream* s)
{
  return s->n <= 0;
};

void outcenterIDs( Points* centers, long* centerIDs) {
  int* is_a_median = (int*)calloc( sizeof(int), centers->num );
  for( int i =0 ; i< centers->num; i++ ) {
    is_a_median[centers->p[i].assign] = 1;
  }

  for( int i = 0; i < centers->num; i++ ) {
    if( is_a_median[i] ) {
      //printf("%u\n", centerIDs[i]);
      //printf("%lf\n", centers->p[i].weight);
      for( int k = 0; k < centers->dim; k++ ) {
        //printf("%lf ", centers->p[i].coord[k]);
      }
      //printf("\n\n");
    }
  }
}

void streamCluster( struct SimStream* stream,
		    long kmin, long kmax, int dim,
		    long chunksize, long centersize)
{

  float* block = (float*)malloc( chunksize*dim*sizeof(float) );
  float* centerBlock = (float*)malloc(centersize*dim*sizeof(float) );
  long* centerIDs = (long*)malloc(centersize*dim*sizeof(long));

  if( block == NULL ) {
    printf("not enough memory for a chunk!\n");
    return;
  }

  Points points;
  points.dim = dim;
  points.num = chunksize;
  points.p = (Point *)malloc(chunksize*sizeof(Point));

  for( int i = 0; i < chunksize; i++ ) {
    points.p[i].coord = &block[i*dim];
  }

  Points centers;
  centers.dim = dim;
  centers.p = (Point *)malloc(centersize*sizeof(Point));
  centers.num = 0;

  for( int i = 0; i< centersize; i++ ) {
    centers.p[i].coord = &centerBlock[i*dim];
    centers.p[i].weight = 1.0;
  }

  long IDoffset = 0;
  long kfinal;
  while(1) {

    size_t numRead  = streamread(stream, block, dim, chunksize );

    if( streamferror(stream) || numRead < (unsigned int)chunksize && !streamfeof(stream) ) {
      return;
    }

    points.num = numRead;
    for( int i = 0; i < points.num; i++ ) {
      points.p[i].weight = 1.0;
    }

    switch_membership = (bool*)malloc(points.num*sizeof(bool));
    is_center = (bool*)calloc(points.num,sizeof(bool));
    center_table = (int*)malloc(points.num*sizeof(int));

    localSearch(&points,kmin, kmax,&kfinal); // parallel

    contcenters(&points); /* sequential */
    if( kfinal + centers.num > centersize ) {
      return;
    }

    copycenters(&points, &centers, centerIDs, IDoffset); /* sequential */
    IDoffset += numRead;

    free(is_center);
    free(switch_membership);
    free(center_table);

    if( streamfeof(stream) ) {
      break;
    }
  }

  //finally cluster all temp centers
  switch_membership = (bool*)malloc(centers.num*sizeof(bool));
  is_center = (bool*)calloc(centers.num,sizeof(bool));
  center_table = (int*)malloc(centers.num*sizeof(int));

  localSearch( &centers, kmin, kmax ,&kfinal ); // parallel
  contcenters(&centers);
  outcenterIDs( &centers, centerIDs);
}

int main(int argc, char **argv)
{
  long kmin, kmax, n, chunksize, clustersize;
  int dim;
  printf("PARSEC Benchmark Suite\n");

#ifdef TINY
  kmin = 3; kmax = 10; dim = 128; n = 128; chunksize = 128;
  clustersize = 10; nproc = 1;
#elif SMALL
  kmin = 10; kmax = 20; dim = 128; n = 4096; chunksize = 4096;
  clustersize = 1000; nproc = 1;
#elif MEDIUM
  kmin = 10; kmax = 20; dim = 128; n = 8192; chunksize = 8192;
  clustersize = 1000; nproc = 1;
#elif LARGE
  kmin = 10; kmax = 20; dim = 128; n = 8192; chunksize = 8192;
  clustersize = 1000; nproc = 1;
#endif


  init_heap(heap, 2048*1024*8);
  struct SimStream stream = {n};

  asm("__perf_start:");
  streamCluster(&stream, kmin, kmax, dim, chunksize, clustersize);
  asm("__perf_end:");

  return 0;
}
