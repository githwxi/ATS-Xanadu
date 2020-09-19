/* ****** ****** */
/*
Basics for Xats2js
*/
/* ****** ****** */
//
function
JS_assert
  ( b0 )
{
if
(!b0)
{
  // [b0] is false
  throw new Error();
} // if-then
return ; // [b0] is true
}
//
function
JS_assertloc
  ( b0, loc )
{
if
(!b0)
{
  // [b0] is false
  throw new Error(loc);
} // if-then
return ; // [b0] is true
}
function
JS_assertmsg
  ( b0, msg )
{
if
(!b0)
{
  // [b0] is false
  throw new Error(msg);
} // if-then
return ; // [b0] is true
}
//
/* ****** ****** */
function
JS_patckerr0()
{
  throw new Error();
}
function
JS_patckerr1(loc)
{
  throw new Error(loc);
}
/* ****** ****** */
function
JS_matcherr0()
{
  throw new Error();
}
function
JS_matcherr1(loc)
{
  throw new Error(loc);
}
/* ****** ****** */
//
// prelude/bool.sats
//
/* ****** ****** */
function
JS_bool_neg(b0)
{ return !b0 ; }
/* ****** ****** */
function
JS_bool_add(b1, b2)
{ return (b1 || b2) ; }
function
JS_bool_mul(b1, b2)
{ return (b1 && b2) ; }
/* ****** ****** */
//
// prelude/gint.sats
//
/* ****** ****** */
function
JS_gint_lt_sint_sint
  (x1, x2)
{ return (x1 < x2) ; }
function
JS_gint_gt_sint_sint
  (x1, x2)
{ return (x1 > x2) ; }
function
JS_gint_eq_sint_sint
  (x1, x2)
{ return (x1 === x2) ; }
function
JS_gint_lte_sint_sint
  (x1, x2)
{ return (x1 <= x2) ; }
function
JS_gint_gte_sint_sint
  (x1, x2)
{ return (x1 >= x2) ; }
function
JS_gint_neq_sint_sint
  (x1, x2)
{ return (x1 !== x2) ; }
/* ****** ****** */
function
JS_gint_add_sint_sint
  (x1, x2)
{ return (x1 + x2) ; }
function
JS_gint_sub_sint_sint
  (x1, x2)
{ return (x1 - x2) ; }
function
JS_gint_mul_sint_sint
  (x1, x2)
{ return (x1 * x2) ; }
/* ****** ****** */
function
JS_gint_div_sint_sint
  (x1, x2)
{ 
  var q0 = x1 / x2;
  if
  (q0 >= 0)
  {
    return Math.floor(q0) ;
  }
  else
  {
    return Math.ceil( q0 ) ;
  }
}
function
JS_gint_mod_sint_int
  (x1, x2)
{ return (x1 % x2) ; }
/* ****** ****** */

/* end of [basics.cats] */
