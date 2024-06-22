////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
//
// HX-2024-06-22:
// ATS3-XANADU/srcgen2/xats2js/srcgen1
//
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
//
// prelude/SATS/bool000.sats
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_bool_neg
  (btf0)
{
    return (!btf0) ;
}
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_bool_add
  (btf1, btf2)
{
    return (btf1 || btf2);
}
//
function
XATS2JS_bool_mul
  (btf1, btf2)
{
    return (btf1 && btf2);
}
//
////////////////////////////////////////////////////////////////////////////////////
//
// prelude/SATS/char000.sats
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_char_eqz
  (chr0)
{
    return (0 === chr0); // eqz
}
function
XATS2JS_char_neqz
  (chr0)
{
    return (0 !== chr0); // neqz
}
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_char_cmp
  (chr1, chr2)
{
    if (chr1 < chr2)
	return (-1);
    else
	return (chr1 <= chr2 ? 0 : 1);
}
//
////////////////////////////////////////////////////////////////////////////////////
//
// prelude/SATS/gint000.sats
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_sint2uint
  (int0)
{
    return int0;
}
//
function
XATS2JS_gint_uint2sint
  (uix0)
{
    return uix0;
}
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_neg_sint
  (sint)
{
    return (-sint); // neg
}
//
/* ****** ****** */
//
function
XATS2JS_gint_abs_sint
  (sint)
{
    if (sint >= 0)
	return sint; // abs
    else
	return (-sint); // abs
}
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_succ_sint
  (sint)
{
    return (sint + 1); // +1
}
//
function
XATS2JS_gint_succ_uint
  (uint)
{
    return (uint + 1); // +1
}
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_pred_sint
  (sint)
{
    return (sint - 1); // -1
}
//
function
XATS2JS_gint_pred_uint
  (uint)
{
    return (uint - 1); // -1
}
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_lnot_uint
  (uint)
{
    return (~uint); // lnot
}
//
function
XATS2JS_gint_lor2_uint
  (uix0, uiy0)
{
    return (uix0 | uiy0); // lor2
}
//
function
XATS2JS_gint_land_uint
  (uix0, uiy0)
{
    return (uix0 & uiy0); // land
}
//
function
XATS2JS_gint_lxor_uint
  (uix0, uiy0)
{
    return (uix0 ^ uiy0); // lxor
}
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_asrn_sint
  (int0, n0)
{
    return (int0 >> n0); // asrn
}
//
function
XATS2JS_gint_lsln_uint
  (uix0, n0)
{
    return (uix0 << n0); // lsln
}
function
XATS2JS_gint_lsrn_uint
  (uix0, n0)
{
    return (uix0 >>> n0); // lsrn
}
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_lt_sint_sint
  (int1, int2)
{
    return (int1 < int2); // lt(<)
}
function
XATS2JS_gint_lt_uint_uint
  (uix1, uix2)
{
    return (uix1 < uix2); // lt(<)
}
//
function
XATS2JS_gint_gt_sint_sint
  (int1, int2)
{
    return (int1 > int2); // gt(>)
}
function
XATS2JS_gint_gt_uint_uint
  (uix1, uix2)
{
    return (uix1 > uix2); // gt(>)
}
//
function
XATS2JS_gint_eq_sint_sint
  (int1, int2)
{
    return (int1===int2); // eq(=)
}
function
XATS2JS_gint_eq_uint_uint
  (uix1, uix2)
{
    return (uix1===uix2); // eq(=)
}
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_lte_sint_sint
  (int1, int2)
{
    return (int1 <= int2); // lte(<=)
}
function
XATS2JS_gint_lte_uint_uint
  (uix1, uix2)
{
    return (uix1 <= uix2); // lte(<=)
}
//
function
XATS2JS_gint_gte_sint_sint
  (int1, int2)
{
    return (int1 >= int2); // gte(>=)
}
function
XATS2JS_gint_gte_uint_uint
  (uix1, uix2)
{
    return (uix1 >= uix2); // gte(>=)
}
//
function
XATS2JS_gint_neq_sint_sint
  (int1, int2)
{
    return (int1 !== int2); // neq(!=)
}
function
XATS2JS_gint_neq_uint_uint
  (uix1, uix2)
{
    return (uix1 !== uix2); // neq(!=)
}
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_cmp_sint_sint
  (int1, int2)
{
    if (int1 < int2)
	return (-1);
    else
	return (int1 <= int2 ? 0 : 1);
}
//
function
XATS2JS_gint_cmp_uint_uint
  (uix1, uix2)
{
    if (uix1 < uix2)
	return (-1);
    else
	return (uix1 <= uix2 ? 0 : 1);
}
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_add_sint_sint
  (int1, int2)
{
    return (int1 + int2); // add
}
//
function
XATS2JS_gint_sub_sint_sint
  (int1, int2)
{
    return (int1 - int2); // sub
}
//
function
XATS2JS_gint_mul_sint_sint
  (int1, int2)
{
    return (int1 * int2); // mul
}
//
function
XATS2JS_gint_mod_sint_sint
  (int1, int2)
{
    return (int1 % int2); // mod
}
//
function
XATS2JS_gint_div_sint_sint
  (int1, int2)
{ 
//
    let quot = int1 / int2;
//
    if (quot < 0)
	return Math.ceil( quot );
    else
	return Math.floor( quot );
}
//
////////////////////////////////////////////////////////////////////////////////////
//
// prelude/SATS/gflt000.sats
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_gflt_si_sflt
  (int0)
{
    return int0 ; // sint
}
function
XATS2JS_gflt_si_dflt
  (int0)
{
    return int0 ; // sint
}
//
function
XATS2JS_gflt_ui_sflt
  (uix0)
{
    return uix0 ; // uint
}
function
XATS2JS_gflt_ui_dflt
  (uix0)
{
    return uix0 ; // uint
}
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_gflt_neg_dflt
  (flt0)
{
  return (-flt0); // neg
}
//
/* ****** ****** */
//
function
XATS2JS_gflt_abs_dflt
  (flt0)
{
    if (flt0 >= 0.0)
	return flt0; // abs
    else
	return (-flt0); // abs
}
//
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
//
// end of [ATS3-XANADU/srcgen2/xats2js/srcgen1/xshared/runtime/xats2js_basics0.js]
//
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
