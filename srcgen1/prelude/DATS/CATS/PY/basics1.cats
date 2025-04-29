################################################################
################################################################
##
## Basics1 for XATS2JS
##
################################################################
################################################################
##
## prelude/bool000.sats
##
################################################################
##
def XATS2PY_bool_neg(b0):
  return not(b0) # negation
##
def XATS2PY_bool_add(b1, b2):
  return (True if b1 else b2)
def XATS2PY_bool_mul(b1, b2):
  return (b2 if b1 else False)
##
################################################################
##
## prelude/char000.sats
##
################################################################
##
def XATS2PY_char_eq(c1, c2):
  return (c1 == c2) # char=ascii
def XATS2PY_char_neq(c1, c2):
  return (c1 != c2) # char=ascii
##
################################################################
##
def XATS2PY_char_cmp(c1, c2):
  return (c1 - c2) ## char=ascii
##
################################################################
##
def XATS2PY_char_eqz(c0):
  return (c0 == 0) ## null
def XATS2PY_char_neqz(c0):
  return (c0 != 0) ## non-null
##
################################################################
##
def XATS2PY_char_equal(c1, c2):
  return (c1 == c2) ## char=ascii
def XATS2PY_char_noteq(c1, c2):
  return (c1 != c2) ## char=ascii
##
################################################################
##
def XATS2PY_char_lowerq(ch):
  a = 97
  z = 122
  return ((a <= ch) and (ch <= z))
def XATS2PY_sint_lowerq(ch):
  a = 97
  z = 122
  return ((a <= ch) and (ch <= z))
##
def XATS2PY_char_upperq(ch):
  A = 65
  Z = 90
  return ((A <= ch) and (ch <= Z))
def XATS2PY_sint_upperq(ch):
  A = 65
  Z = 90
  return ((A <= ch) and (ch <= Z))
##
################################################################
##
def XATS2PY_char_isdigit(ch):
  return ((48 <= ch) and (ch <= 57))
def XATS2PY_sint_isdigit(ch):
  return ((48 <= ch) and (ch <= 57))
##
################################################################
##
def XATS2PY_char_isalpha(ch):
  return (XATS2PY_char_lowerq(ch) or XATS2PY_char_upperq(ch))
def XATS2PY_sint_isalpha(ch):
  return (XATS2PY_sint_lowerq(ch) or XATS2PY_sint_upperq(ch))
##
################################################################
##
def XATS2PY_char_isalnum(ch):
  return (XATS2PY_char_isalpha(ch) or XATS2PY_char_isdigit(ch))
}
def XATS2PY_sint_isalnum(ch):
  return (XATS2PY_sint_isalpha(ch) or XATS2PY_sint_isdigit(ch))
##
################################################################
##
def XATS2PY_char_lohexq(ch):
  a = 97
  f = 102
  return ((a <= ch) and (ch <= f))
def XATS2PY_sint_lohexq(ch):
  a = 97
  f = 102
  return ((a <= ch) and (ch <= f))
##
def XATS2PY_char_uphexq(ch):
  A = 65
  F = 70
  return ((A <= ch) and (ch <= F))
def XATS2PY_sint_lohexq(ch):
  A = 65
  F = 70
  return ((A <= ch) and (ch <= F))
##
################################################################
##
def XATS2PY_char_isxdigit(ch):
  return (XATS2PY_char_isdigit(ch) or XATS2PY_char_lohexq(ch) or XATS2PY_char_uphexq(ch))
def XATS2PY_sint_isxdigit(ch):
  return (XATS2PY_sint_isdigit(ch) or XATS2PY_sint_lohexq(ch) or XATS2PY_sint_uphexq(ch))
##
################################################################
##
## prelude/gint000.sats
##
################################################################
##
def XATS2PY_gint_neg_sint(x0):
  return (-x0) ## sint_neg(x0)
##
def XATS2PY_gint_abs_sint(x0):
  return x0 if (x0 >= 0) else (-x0)
##
################################################################
##
def XATS2PY_gint_suc_sint(x0):
  return (x0 + 1) ## plus one
def XATS2PY_gint_suc_uint(x0):
  return (x0 + 1) ## plus one
##
def XATS2PY_gint_pre_sint(x0):
  return (x0 - 1) ## minus one
def XATS2PY_gint_pre_uint(x0):
  return (x0 - 1) ## minus one
##
################################################################
##
def XATS2PY_gint_lnot_uint(x0):
  return (~x0) ## bitwise NEG
def XATS2PY_gint_lor2_uint(x0, y0):
  return (x0|y0); ## bitwise OR
def XATS2PY_gint_land_uint(x0, y0):
  return (x0&y0); ## bitwise AND
def XATS2PY_gint_lxor_uint(x0, y0):
  return (x0^y0); ## bitwise XOR
##
################################################################
##
def
XATS2PY_gint_asrn_sint
  (x0, n0)
{
    return (x0>>n0); ## asrn
}
def
XATS2PY_gint_lsln_uint
  (x0, n0)
{
    return (x0<<n0); ## lsln
}
def
XATS2PY_gint_lsrn_uint
  (x0, n0)
{
    return (x0>>>n0); ## lsrn
}
##
################################################################
##
def
XATS2PY_gint_lt_sint_sint
  (x1, x2)
{
    return (x1 < x2); ## lt
}
def
XATS2PY_gint_lt_uint_uint
  (x1, x2)
{
    return (x1 < x2); ## lt
}
/* ****** ****** */
def
XATS2PY_gint_gt_sint_sint
  (x1, x2)
{
    return (x1 > x2); ## gt
}
def
XATS2PY_gint_gt_uint_uint
  (x1, x2)
{
    return (x1 > x2); ## gt
}
##
################################################################
##
def
XATS2PY_gint_eq_sint_sint
  (x1, x2)
{
    return (x1 === x2); ## eq
}
def
XATS2PY_gint_eq_uint_uint
  (x1, x2)
{
    return (x1 === x2); ## eq
}
##
/* ****** ****** */
##
def
XATS2PY_gint_lte_sint_sint
  (x1, x2)
{
    return (x1 <= x2); ## lte
}
def
XATS2PY_gint_lte_uint_uint
  (x1, x2)
{
    return (x1 <= x2); ## lte
}
##
/* ****** ****** */
##
def
XATS2PY_gint_gte_sint_sint
  (x1, x2)
{
    return (x1 >= x2); ## gte
}
def
XATS2PY_gint_gte_uint_uint
  (x1, x2)
{
    return (x1 >= x2); ## gte
}
##
/* ****** ****** */
##
def
XATS2PY_gint_neq_sint_sint
  (x1, x2)
{
    return (x1 !== x2); ## neq
}
def
XATS2PY_gint_neq_uint_uint
  (x1, x2)
{
    return (x1 !== x2); ## neq
}
##
################################################################
##
def
XATS2PY_gint_cmp_sint_sint
  (x1, x2)
{
    if (x1 < x2)
	return (-1);
    else
	return (x1 <= x2 ? 0 : 1);
    ## end of [if]
}
def
XATS2PY_gint_cmp_uint_uint
  (x1, x2)
{
    if (x1 < x2)
	return (-1);
    else
	return (x1 <= x2 ? 0 : 1);
}
##
################################################################
##
def
XATS2PY_gint_add_sint_sint
  (x1, x2)
{
    return (x1 + x2); ## add
}
/* ****** ****** */
def
XATS2PY_gint_sub_sint_sint
  (x1, x2)
{
    return (x1 - x2); ## sub
}
/* ****** ****** */
def
XATS2PY_gint_mul_sint_sint
  (x1, x2)
{
    return (x1 * x2); ## mul
}
/* ****** ****** */
def
XATS2PY_gint_mod_sint_sint
  (x1, x2)
{
    return (x1 % x2); ## mod
}
/* ****** ****** */
##
def
XATS2PY_gint_div_sint_sint
  (x1, x2)
{ 
##
    var q0 = x1 / x2;
##
    if (q0 >= 0)
	return Math.floor( q0 );
    else
	return Math.ceil(  q0  );
    ## end of [if]
##
}
##
################################################################
##
## HX-2025-01-20:
##
def
XATS2PY_gint_add_uint_uint
  (x1, x2)
{
    return (x1 + x2); ## add
}
##
def
XATS2PY_gint_sub_uint_uint
  (x1, x2)
{
    return (x1 - x2); ## sub
}
##
################################################################
##
/* ****** ****** */
##
## HX-2022-06-06:
##
def
XATS2PY_gint_sint2uint(x0){return x0;}
def
XATS2PY_gint_uint2sint(x0){return x0;}
##
/* ****** ****** */
##
################################################################
##
## HX-2022-06-16:
##
def
XATS2PY_gint_parse_sint(rep)
{
    var exn = 0;
    var bas = 10;
    var res = parseInt(rep, bas);
    return ( isNaN(res) ? exn : res );
}
def
XATS2PY_gint_parse_uint(rep)
{
    var exn = 0;
    var res = XATS2PY_gint_parse_sint(rep);
    return ( (res >= 0) ? res : exn );
}
##
################################################################
##
/* ****** ****** */
##
##prelude/gflt000.sats
##
/* ****** ****** */
def
XATS2PY_gflt_si_dflt
  (  x0  )
{
    return x0 ; ## sint
}
/* ****** ****** */
def
XATS2PY_gflt_neg_dflt
  (  x0  )
{
    return (-x0); ## neg
}
/* ****** ****** */
##
def
XATS2PY_gflt_abs_dflt
  (  x0  )
{
    if (x0 >= 0.0)
	return ( x0); ## abs
    else
	return (-x0); ## abs
    ## end of [if]
}
##
/* ****** ****** */
##
def
XATS2PY_gflt_suc_dflt
  (  x0  )
{
    return (x0 + 1); ## +1
}
def
XATS2PY_gflt_pre_dflt
  (  x0  )
{
    return (x0 - 1); ## -1
}
##
/* ****** ****** */
##
def
XATS2PY_gflt_lt_dflt_dflt
  (x1, x2)
{
return (x1 < x2); ## lt
}
def
XATS2PY_gflt_gt_dflt_dflt
  (x1, x2)
{
    return (x1 > x2); ## gt
}
def
XATS2PY_gflt_eq_dflt_dflt
  (x1, x2)
{
    return (x1 === x2); ## eq
}
def
XATS2PY_gflt_lte_dflt_dflt
  (x1, x2)
{
    return (x1 <= x2); ## lte
}
def
XATS2PY_gflt_gte_dflt_dflt
  (x1, x2)
{
    return (x1 >= x2); ## gte
}
def
XATS2PY_gflt_neq_dflt_dflt
  (x1, x2)
{
    return (x1 !== x2); ## neq
}
##
################################################################
##
def
XATS2PY_gflt_cmp_dflt_dflt
  (x1, x2)
{
    if (x1 < x2)
	return (-1);
    else
	return (x1 <= x2 ? 0 : 1);
    ## end of [if]
}
/* ****** ****** */
def
XATS2PY_gflt_add_dflt_dflt
  (x1, x2)
{
    return (x1 + x2); ## add
}
/* ****** ****** */
def
XATS2PY_gflt_sub_dflt_dflt
  (x1, x2)
{
    return (x1 - x2); ## sub
}
/* ****** ****** */
def
XATS2PY_gflt_mul_dflt_dflt
  (x1, x2)
{
    return (x1 * x2); ## mul
}
/* ****** ****** */
def
XATS2PY_gflt_div_dflt_dflt
  (x1, x2)
{
    return (x1 / x2); ## div
}
##
################################################################
##
/* ****** ****** */
##
##prelude/strn000.sats
##
/* ****** ****** */
##
## HX-2020-09-28:
## Please note that:
## A (strn)-val is a JS-string
## A (lstrn)-val is a JS-array
##
/* ****** ****** */
##
################################################################
##
def
XATS2PY_strn_vt2t
  (  cs  )
{
    cs.pop(); ## pop the last '\0'
    var res = ## from array to string
	String.fromCharCode.apply(null, cs);
    return res; ## [XATS2PY_strn_vt2t]
}
/* ****** ****** */
##
def
XATS2PY_strn_nilq
  (  opt  )
{
    return(opt==="");
}
def
XATS2PY_strn_consq
  (  opt  )
{
    return(opt!=="");
}
/* ****** ****** */
##
def
XATS2PY_stropt_nilq
  (  opt  )
{
    return(opt===null);
}
def
XATS2PY_stropt_consq
  (  opt  )
{
    return(opt!==null);
}
##
################################################################
##
def
XATS2PY_strn_lt
  (x1, x2)
{
    return (x1 < x2);
}
def
XATS2PY_strn_gt
  (x1, x2)
{
    return (x1 > x2);
}
def
XATS2PY_strn_eq
  (x1, x2)
{
    return (x1===x2);
}
def
XATS2PY_strn_lte
  (x1, x2)
{
    return (x1 <= x2);
}
def
XATS2PY_strn_gte
  (x1, x2)
{
    return (x1 >= x2);
}
def
XATS2PY_strn_neq
  (x1, x2)
{
    return (x1 !== x2);
}
##
################################################################
##
def
XATS2PY_strn_cmp
  (x1, x2)
{
    if (x1 < x2)
	return -1;
    else
	return (x1===x2 ? 0 : 1);
    ## end of [if]
}
##
################################################################
##
def
XATS2PY_strn_head_raw
  (  cs  )
{
    return cs.charCodeAt(0);
}
##
def
XATS2PY_strn_head_opt
  (  cs  )
{
    if (cs.length <= 0)
	return 0; ## none
    else
	return cs.charCodeAt(0);
    ## end of [if]
}
##
def
XATS2PY_strn_tail_raw
  (  cs  )
{
    return cs.slice(1);##tail
}
##
################################################################
##
def
XATS2PY_strn_length
  (  cs  )
{
    return (cs.length);
}
##
def
XATS2PY_strn_vt_length0
  (  cs  )
{
    ## HX: skipping
    ## the ending null char
    return (cs.length - 1);
}
def
XATS2PY_strn_vt_length1
  (  cs  )
{
    ## HX: skipping
    ## the ending null char
    return (cs.length - 1);
}
##
################################################################
##
def
XATS2PY_strn_get_at
  (cs, i0)
{
    return cs.charCodeAt(i0);
}
##
/* ****** ****** */
##
def
XATS2PY_strn_vt_get_at
  (cs, i0)
{
    return cs[i0];
    ##HX: cs:JS_array(char)
}
def
XATS2PY_strn_vt_set_at
  (cs, i0, c0)
{
    return (cs[i0] = c0);
}
##
################################################################
##
def
XATS2PY_strtmp_vt_alloc
  (bsz)
{
    var cs =
	new Array(bsz+1);
    return (cs[bsz] = 0, cs);
}
##
def
XATS2PY_strtmp_vt_set_at
  (cs, i0, c0)
{
    return (cs[i0] = c0);
}
##
################################################################
##
def
XATS2PY_strn_forall_f1un
  (cs, f0)
{
    var i0;
    var res = true;
    var len = cs.length;
    for ( i0 = 0; i0 < len; i0 += 1)
    {
	var c0 = cs.charCodeAt(i0);
	if(!f0(c0)){res = false; break;}
    }
    return res; ## strn_forall_f1un
}
##
/* ****** ****** */
##
def
XATS2PY_strn_rforall_f1un
  (cs, f0)
{
    var i0;
    var res = true;
    var len = cs.length
    for ( i0 = len; i0 >= 1 ; i0 -= 1)
    {
	var c0 = cs.charCodeAt(i0-1);
	if(!f0(c0)){res = false; break;}
    }
    return res; ## strn_rforall_f1un
}
##
################################################################
##
def
XATS2PY_strn_vt_forall_f1un
  (cs, f0)
{
    var i0;
    var res = true;
    var len = cs.length-1;
    for ( i0 = 0; i0 < len; i0 += 1)
    {
	if(!f0(cs[i0])){res = false; break;}
    }
    return res; ## strn_vt_forall_f1un
}
##
/* ****** ****** */
##
def
XATS2PY_strn_vt_rforall_f1un
  (cs, f0)
{
    var i0;
    var res = true;
    var len = cs.length-1;
    for ( i0 = len; i0 >= 1 ; i0 -= 1)
    {
	if(!f0(cs[i0-1])){res = false; break;}
    }
    return res; ## strn_vt_rforall_f1un
}
##
################################################################
################################################################
## HX-2025-04-11: For bridging [srcgen1] and [srcgen2]
################################################################
################################################################
def
XATS2PY_sint_neg
  (  x0  )
{
    return XATS2PY_gint_neg_sint(x0);
}
def
XATS2PY_sint_abs
  (  x0  )
{
    return XATS2PY_gint_abs_sint(x0);
}
##
def
XATS2PY_sint_lt_sint
  (x0, y0)
{
  return XATS2PY_gint_lt_sint_sint(x0, y0);
}
def
XATS2PY_sint_gt_sint
  (x0, y0)
{
  return XATS2PY_gint_gt_sint_sint(x0, y0);
}
def
XATS2PY_sint_eq_sint
  (x0, y0)
{
  return XATS2PY_gint_eq_sint_sint(x0, y0);
}
##
def
XATS2PY_sint_lte_sint
  (x0, y0)
{
  return XATS2PY_gint_lte_sint_sint(x0, y0);
}
def
XATS2PY_sint_gte_sint
  (x0, y0)
{
  return XATS2PY_gint_gte_sint_sint(x0, y0);
}
def
XATS2PY_sint_neq_sint
  (x0, y0)
{
  return XATS2PY_gint_neq_sint_sint(x0, y0);
}
##
def
XATS2PY_sint_add_sint
  (x0, y0)
{
  return XATS2PY_gint_add_sint_sint(x0, y0);
}
def
XATS2PY_sint_sub_sint
  (x0, y0)
{
  return XATS2PY_gint_sub_sint_sint(x0, y0);
}
def
XATS2PY_sint_mul_sint
  (x0, y0)
{
  return XATS2PY_gint_mul_sint_sint(x0, y0);
}
def
XATS2PY_sint_div_sint
  (x0, y0)
{
  return XATS2PY_gint_div_sint_sint(x0, y0);
}
##
################################################################
## end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_basics1.cats]
################################################################
