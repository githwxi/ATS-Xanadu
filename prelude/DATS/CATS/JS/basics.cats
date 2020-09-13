/* ****** ****** */
/*
Basics for Xats2js
*/
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

/* end of [basics.cats] */
