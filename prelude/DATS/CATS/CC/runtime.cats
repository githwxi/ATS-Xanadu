/* ****** ****** */
/*
Runtime for Xats2cc
*/
/* ****** ****** */
#include <stdio.h>
#include <stdlib.h>
/* ****** ****** */
#define XATS2CC_btf1 1 // true
#define XATS2CC_btf0 0 // false
/* ****** ****** */
#define \
XATS2CC_ctag(dcon) ((dcon)->ctag0)
#define \
XATS2CC_carg(dcon, i0) ((dcon)->carg##i0)
/* ****** ****** */
void
XATS2CC_patckerr0()
{
  fprintf(stderr, "XATS2CC_patckerr0()\n"); exit(1);
}
/* ****** ****** */
void
XATS2CC_matcherr0()
{
  fprintf(stderr, "XATS2CC_matcherr0()\n"); exit(1);
}
/* ****** ****** */

/* end of [XATS2CC_runtime.cats] */
