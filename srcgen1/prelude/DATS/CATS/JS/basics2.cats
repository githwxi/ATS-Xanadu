//////////////////////////////////////////////////////////////////.
//////////////////////////////////////////////////////////////////.
/*
Basics2 for Xats2js
*/
//////////////////////////////////////////////////////////////////.
//////////////////////////////////////////////////////////////////.
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
//////////////////////////////////////////////////////////////////.
//////////////////////////////////////////////////////////////////.
//
/*
HX: 0-dimensional
*/
//
//////////////////////////////////////////////////////////////////.
//////////////////////////////////////////////////////////////////.
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
  var A0 =
  XATS2JS_a0ptr_alloc();
  A0[0] = x0; return A0; }
//
/* ****** ****** */
//
function
XATS2JS_a0ref_get
  ( A0 )
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
XATS2JS_a0ref_dtget
  (A0)
{
    return A0[0]; }
//
function
XATS2JS_UN_a0ref_dtset
  (A0, x0)
{
    return (A0[0] = x0); }
//
//////////////////////////////////////////////////////////////////.
//////////////////////////////////////////////////////////////////.
//
// HX: 1-dimensional
//
//////////////////////////////////////////////////////////////////.
//////////////////////////////////////////////////////////////////.
//
function
XATS2JS_a1ptr_alloc
  (asz)
{
    return new Array(asz);
}
//
/* ****** ****** */
//
function
XATS2JS_a1ref_get$at
  (A0, i0)
{
    return A0[i0]; }
function
XATS2JS_a1ptr_get$at1
  (A0, i0)
{
    return A0[i0]; }
//
/* ****** ****** */
//
function
XATS2JS_a1ref_set$at
  (A0, i0, x0)
{
    return (A0[i0] = x0);
}
function
XATS2JS_a1ptr_set$at1
  (A0, i0, x0)
{
    return (A0[i0] = x0);
}
//
/* ****** ****** */
//
/*
function
XATS2JS_a1ptr_set$at$raw
  (A0, i0, x0)
{
    return (A0[i0] = x0);
}
*/
//
/* ****** ****** */
//
function
XATS2JS_a1ref_dtget$at
  (A0, i0)
{
    return A0[   i0   ]; }
function
XATS2JS_a1ref_cget$at
  (A0, i0)
{
    return A0[   i0   ]; }
//
//////////////////////////////////////////////////////////////////.
//////////////////////////////////////////////////////////////////.
//
// prelude/unsafex.sats
//
//////////////////////////////////////////////////////////////////.
//////////////////////////////////////////////////////////////////.
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
    return XATS2JS_lval_set(ptr, obj);
}
//
//////////////////////////////////////////////////////////////////.
//////////////////////////////////////////////////////////////////.
//
/*
HX-2026-01-16:
This is copied from
[prelude] to [srcgen1/prelude]
Fri Jan 16 06:53:07 PM EST 2026
*/
function
XATS2JS_strm_vt_forall0$f1un
  (fxs, test)
{
  let nilq1 =
    XATS2JS_strmcon_vt_nilq1
  while (1) {
    let cxs =
      XATS2JS_lazy_vt_eval(fxs)
    if (nilq1(cxs))
    {
      break;
    } else {
      let x01 =
        XATS2JS_strmcon_vt_head$raw1(cxs)
      if (test(x01))
      {
        fxs = XATS2JS_strmcon_vt_tail$raw0(cxs)
      } else {
        fxs = XATS2JS_strmcon_vt_tail$raw0(cxs)
        XATS2JS_lazy_vt_free(fxs); return false
      }
    }
  }
  return true // XATS2JS_strm_vt_forall0$f1un(...)
}
//
//////////////////////////////////////////////////////////////////.
//
function
XATS2JS_strm_vt_filter0$f1un
  (fxs, test, free)
{
  return XATS2JS_lazy_vt_make_f0un(
    () => XATS2JS_strmcon_vt_filter0$f1un(XATS2JS_lazy_vt_eval(fxs), test, free)
  )
}
//
function
XATS2JS_strmcon_vt_filter0$f1un
  (cxs, test, free)
{
  let nilq1 =
    XATS2JS_strmcon_vt_nilq1
  while (1) {
    if (nilq1(cxs))
    {
      return XATS2JS_strmcon_vt_nil()
    } else {
      let x01 = XATS2JS_strmcon_vt_head$raw1(cxs)
      let fxs = XATS2JS_strmcon_vt_tail$raw0(cxs)
      if (test(x01)) {
        return XATS2JS_strmcon_vt_cons(x01, XATS2JS_strm_vt_filter0$f1un(fxs, test, free))
      } else {
        free(x01);
        cxs = XATS2JS_lazy_vt_eval(fxs); continue;
      }
    }
  }
}
//
//////////////////////////////////////////////////////////////////.
//
function
XATS2JS_strx_vt_forall0$f1un
  (fxs, test)
{
  while (1) {
    let cxs =
      XATS2JS_lazy_vt_eval(fxs)
    let x01 =
      XATS2JS_strxcon_vt_head$raw1(cxs)
    if (test(x01))
    {
      fxs = XATS2JS_strxcon_vt_tail$raw0(cxs)
    } else {
      fxs = XATS2JS_strxcon_vt_tail$raw0(cxs)
      XATS2JS_lazy_vt_free(fxs); return false
    }
  }
  return true // XATS2JS_strx_vt_forall0$f1un(...)
}
//
//////////////////////////////////////////////////////////////////.
//
function
XATS2JS_strx_vt_filter0$f1un
  (fxs, test, free)
{
  return XATS2JS_lazy_vt_make_f0un(
    () => XATS2JS_strxcon_vt_filter0$f1un(XATS2JS_lazy_vt_eval(fxs), test, free)
  )
}
//
function
XATS2JS_strxcon_vt_filter0$f1un
  (cxs, test, free)
{
  while (1) {
    let x01 = XATS2JS_strxcon_vt_head$raw1(cxs)
    let fxs = XATS2JS_strxcon_vt_tail$raw0(cxs)
    if (test(x01)) {
      return XATS2JS_strxcon_vt_cons(x01, XATS2JS_strx_vt_filter0$f1un(fxs, test, free))
    } else {
      free(x01);
      cxs = XATS2JS_lazy_vt_eval(fxs); continue;
    }
  }
}
//
//////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
/* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_basics2.cats] */
////////////////////////////////////////////////////////////////////////.
