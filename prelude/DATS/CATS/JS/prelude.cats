/* ****** ****** */
/*
Basics for Xats2js
*/
/* ****** ****** */
//
/*
prelude/array.sats
For arrays of
various dimensions:
//
Ref: 0-dimensional
Array: 1-dimensional
Matrix: 2-dimensional
//
*/
//
/* ****** ****** */
//
/*
HX: 0-dimensional
*/
//
/* ****** ****** */
//
function
XATS2JS_a0ptr_alloc
  (  )
{
  return new Array(1);
}
//
function
XATS2JS_a0ptr_make_1val
  (x0)
{
let A0 =
XATS2JS_a0ptr_alloc();
A0[0] = x0; return A0; }
//
/* ****** ****** */
//
function
XATS2JS_a0ref_get
  (A0)
{
  return A0[0]; }
//
function
XATS2JS_a0ref_set
  (A0, x0)
{
  return (A0[0] = x0); }
//
/* ****** ****** */
//
function
XATS2JS_a0ref_get0
  (A0)
{
  return A0[0]; }
//
function
XATS2JS_UN_a0ref_set0
  (A0, x0)
{
  return (A0[0] = x0); }
//
/* ****** ****** */
//
// HX: 1-dimensional
//
/* ****** ****** */

function
XATS2JS_a1ptr_alloc
  (asz)
{
  return new Array(asz);
}

/* ****** ****** */

function
XATS2JS_a1ref_get_at
  (A0, i0)
{
  return A0[i0];
}
function
XATS2JS_a1ptr_get_at
  (A0, i0)
{
  return A0[i0];
}

/* ****** ****** */

function
XATS2JS_a1ref_set_at
  (A0, i0, x0)
{
  return (A0[i0] = x0);
}
function
XATS2JS_a1ptr_set_at
  (A0, i0, x0)
{
  return (A0[i0] = x0);
}
function
XATS2JS_a1ptr_set_at_raw
  (A0, i0, x0)
{
  return (A0[i0] = x0);
}

/* ****** ****** */
//
function
XATS2JS_a1ref_get0_at
  (A0, i0)
{ return A0[   i0   ]; }
function
XATS2JS_a1ref_cget_at
  (A0, i0)
{ return A0[   i0   ]; }
//
/* ****** ****** */
//
// prelude/unsafe.sats
//
/* ****** ****** */
//
function
XATS2JS_UN_p2tr_get
  (ptr)
{
  return XATS2JS_lval_get(ptr);
}
function
XATS2JS_UN_p2tr_set
  (ptr, obj)
{
  XATS2JS_lval_set(ptr, obj); return;
}
//
/* ****** ****** */

/* end of [ATS3/XANADU_prelude_DATS_CATS_JS_prelude.cats] */