////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
/*
Basics1 for XATS2JS
*/
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
//
//prelude/bool000.sats
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_bool_neg
(  b0  ){ return !b0 ; }
//
function
XATS2JS_bool_add
(b1, b2){ return (b1 || b2); }
function
XATS2JS_bool_mul
(b1, b2){ return (b1 && b2); }
//
////////////////////////////////////////////////////////////////
//
//prelude/char000.sats
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_char_eq
  (c1, c2)
{
  return (c1===c2); // eq
}
function
XATS2JS_char_neq
  (c1, c2)
{
  return (c1!==c2); // neq
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_char_cmp
  (c1, c2)
{
    if (c1 < c2)
	return (-1);
    else
	return (c1 <= c2 ? 0 : 1);
    // end of [if]
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_char_eqz
  (  c0  )
{
    return (0===c0); // eqz
}
function
XATS2JS_char_neqz
  (  c0  )
{
    return (0!==c0); // neqz
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_char_equal
  (c1, c2)
{
    return (c1===c2); // equal
}
function
XATS2JS_char_noteq
  (c1, c2)
{
    return (c1!==c2); // noteq
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_char_lowerq
  (  ch  )
{
    var a = 97;
    var z = 122;
    return ((a <= ch) && (ch <= z));
}
function
XATS2JS_sint_lowerq
  (  ch  )
{
    var a = 97;
    var z = 122;
    return ((a <= ch) && (ch <= z));
}
//
function
XATS2JS_char_upperq
  (  ch  )
{
    var A = 65;
    var Z = 90;
    return ((A <= ch) && (ch <= Z));
}
function
XATS2JS_sint_upperq
  (  ch  )
{
    var A = 65;
    var Z = 90;
    return ((A <= ch) && (ch <= Z));
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_char_isdigit
  (  ch  )
{
    return ((48 <= ch) && (ch <= 57));
}
function
XATS2JS_sint_isdigit
  (  ch  )
{
    return ((48 <= ch) && (ch <= 57));
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_char_isalpha
  (  ch  )
{
    return (XATS2JS_char_lowerq(ch) || XATS2JS_char_upperq(ch));
}
function
XATS2JS_sint_isalpha
  (  ch  )
{
    return (XATS2JS_sint_lowerq(ch) || XATS2JS_sint_upperq(ch));
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_char_isalnum
  (  ch  )
{
    return (XATS2JS_char_isalpha(ch) || XATS2JS_char_isdigit(ch));
}
function
XATS2JS_sint_isalnum
  (  ch  )
{
    return (XATS2JS_sint_isalpha(ch) || XATS2JS_sint_isdigit(ch));
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_char_lohexq
  (  ch  )
{
    var a = 97;
    var f = 102;
    return ((a <= ch) && (ch <= f));
}
function
XATS2JS_sint_lohexq
  (  ch  )
{
    var a = 97;
    var f = 102;
    return ((a <= ch) && (ch <= f));
}
//
function
XATS2JS_char_uphexq
  (  ch  )
{
    var A = 65;
    var F = 70;
    return ((A <= ch) && (ch <= F));
}
function
XATS2JS_sint_lohexq
  (  ch  )
{
    var A = 65;
    var F = 70;
    return ((A <= ch) && (ch <= F));
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_char_isxdigit
  (  ch  )
{
  return (XATS2JS_char_isdigit(ch) || XATS2JS_char_lohexq(ch) || XATS2JS_char_uphexq(ch));
}
function
XATS2JS_sint_isxdigit
  (  ch  )
{
  return (XATS2JS_sint_isdigit(ch) || XATS2JS_sint_lohexq(ch) || XATS2JS_sint_uphexq(ch));
}
//
////////////////////////////////////////////////////////////////
//
/* ****** ****** */
//
//prelude/gint000.sats
//
/* ****** ****** */
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_neg$sint
  (  x0  )
{
    return (-x0); // neg
}
//
function
XATS2JS_gint_abs$sint
  (  x0  )
{
    if (x0 >= 0)
	return ( x0); // abs
    else
	return (-x0); // abs
    // end of [if]
}
//
////////////////////////////////////////////////////////////////
//
/*
HX-2025-09-27:
For ATS3/prelude
Sat Sep 27 01:56:11
*/
//
function
XATS2JS_sint_suc
  (  i0  )
{
    return (i0 + 1); // +1
}
function
XATS2JS_uint_suc
  (  u0  )
{
    return (u0 + 1); // +1
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_suc$sint
  (  x0  )
{
    return (x0 + 1); // +1
}
function
XATS2JS_gint_suc$uint
  (  x0  )
{
    return (x0 + 1); // +1
}
//
function
XATS2JS_gint_pre$sint
  (  x0  )
{
    return (x0 - 1); // -1
}
function
XATS2JS_gint_pre$uint
  (  x0  )
{
    return (x0 - 1); // -1
}
//
////////////////////////////////////////////////////////////////
//
/*
HX-2025-09-27:
For ATS3/prelude
Sat Sep 27 01:56:11
*/
function
XATS2JS_uint_lnot
  (  x0  )
{
  return (~x0); // lnot
}
//
function
XATS2JS_uint_ladd
  (x0, y0)
{
  return (x0|y0); // ladd
}
//
function
XATS2JS_uint_lmul
  (x0, y0)
{
  return (x0&y0); // lmul
}
//
function
XATS2JS_uint_lneq
  (x0, y0)
{
  return (x0^y0); // lneq
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_lnot$uint
  (  x0  )
{
  return (~x0); // lnot
}
function
XATS2JS_gint_lor2$uint
  (x0, y0)
{
  return (x0|y0); // lor2
}
function
XATS2JS_gint_l2or$uint
  (x0, y0)
{
  return (x0|y0); // l2or
}
function
XATS2JS_gint_land$uint
  (x0, y0)
{
  return (x0&y0); // land
}
function
XATS2JS_gint_lxor$uint
  (x0, y0)
{
  return (x0^y0); // lxor
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_asrn$sint
  (x0, n0)
{
    return (x0>>n0); // asrn
}
function
XATS2JS_gint_lsln$uint
  (x0, n0)
{
    return (x0<<n0); // lsln
}
function
XATS2JS_gint_lsrn$uint
  (x0, n0)
{
    return (x0>>>n0); // lsrn
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_lt$sint$sint
  (x1, x2)
{
    return (x1 < x2); // lt
}
function
XATS2JS_gint_lt$uint$uint
  (x1, x2)
{
    return (x1 < x2); // lt
}
/* ****** ****** */
function
XATS2JS_gint_gt$sint$sint
  (x1, x2)
{
    return (x1 > x2); // gt
}
function
XATS2JS_gint_gt$uint$uint
  (x1, x2)
{
    return (x1 > x2); // gt
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_eq$sint$sint
  (x1, x2)
{
    return (x1 === x2); // eq
}
function
XATS2JS_gint_eq$uint$uint
  (x1, x2)
{
    return (x1 === x2); // eq
}
//
/* ****** ****** */
//
function
XATS2JS_gint_lte$sint$sint
  (x1, x2)
{
    return (x1 <= x2); // lte
}
function
XATS2JS_gint_lte$uint$uint
  (x1, x2)
{
    return (x1 <= x2); // lte
}
//
/* ****** ****** */
//
function
XATS2JS_gint_gte$sint$sint
  (x1, x2)
{
    return (x1 >= x2); // gte
}
function
XATS2JS_gint_gte$uint$uint
  (x1, x2)
{
    return (x1 >= x2); // gte
}
//
/* ****** ****** */
//
function
XATS2JS_gint_neq$sint$sint
  (x1, x2)
{
    return (x1 !== x2); // neq
}
function
XATS2JS_gint_neq$uint$uint
  (x1, x2)
{
    return (x1 !== x2); // neq
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_cmp$sint$sint
  (x1, x2)
{
    if (x1 < x2)
	return (-1);
    else
	return (x1 <= x2 ? 0 : 1);
    // end of [if]
}
function
XATS2JS_gint_cmp$uint$uint
  (x1, x2)
{
    if (x1 < x2)
	return (-1);
    else
	return (x1 <= x2 ? 0 : 1);
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_add$sint$sint
  (x1, x2)
{
    return (x1 + x2); // add
}
/* ****** ****** */
function
XATS2JS_gint_sub$sint$sint
  (x1, x2)
{
    return (x1 - x2); // sub
}
/* ****** ****** */
function
XATS2JS_gint_mul$sint$sint
  (x1, x2)
{
    return (x1 * x2); // mul
}
/* ****** ****** */
function
XATS2JS_gint_mod$sint$sint
  (x1, x2)
{
    return (x1 % x2); // mod
}
/* ****** ****** */
//
function
XATS2JS_gint_div$sint$sint
  (x1, x2)
{ 
//
    var q0 = x1 / x2;
//
    if (q0 >= 0)
	return Math.floor( q0 );
    else
	return Math.ceil(  q0  );
    // end of [if]
//
}
//
////////////////////////////////////////////////////////////////
//
// HX-2025-01-20:
//
function
XATS2JS_gint_add$uint$uint
  (x1, x2)
{
    return (x1 + x2); // add
}
//
function
XATS2JS_gint_sub$uint$uint
  (x1, x2)
{
    return (x1 - x2); // sub
}
//
////////////////////////////////////////////////////////////////
//
/* ****** ****** */
//
/*
HX-2025-09-27:
For ATS3/prelude!
Sat Sep 27 02:03:53
*/
//
function
XATS2JS_sint_to$uint(x0){return x0;}
function
XATS2JS_uint_to$sint(x0){return x0;}
//
// HX-2022-06-06:
//
function
XATS2JS_gint_sint2uint(x0){return x0;}
function
XATS2JS_gint_uint2sint(x0){return x0;}
//
/* ****** ****** */
//
////////////////////////////////////////////////////////////////
//
// HX-2022-06-16:
//
function
XATS2JS_gint_parse_sint(rep)
{
    var exn = 0;
    var bas = 10;
    var res = parseInt(rep, bas);
    return ( isNaN(res) ? exn : res );
}
function
XATS2JS_gint_parse_uint(rep)
{
    var exn = 0;
    var res = XATS2JS_gint_parse_sint(rep);
    return ( (res >= 0) ? res : exn );
}
//
////////////////////////////////////////////////////////////////
//
/* ****** ****** */
//
//prelude/gflt000.sats
//
/* ****** ****** */
function
XATS2JS_gflt_si_dflt
  (  x0  )
{
    return x0 ; // sint
}
/* ****** ****** */
function
XATS2JS_gflt_neg_dflt
  (  x0  )
{
    return (-x0); // neg
}
/* ****** ****** */
//
function
XATS2JS_gflt_abs_dflt
  (  x0  )
{
    if (x0 >= 0.0)
	return ( x0); // abs
    else
	return (-x0); // abs
    // end of [if]
}
//
/* ****** ****** */
//
function
XATS2JS_gflt_suc_dflt
  (  x0  )
{
    return (x0 + 1); // +1
}
function
XATS2JS_gflt_pre_dflt
  (  x0  )
{
    return (x0 - 1); // -1
}
//
/* ****** ****** */
//
function
XATS2JS_gflt_lt_dflt_dflt
  (x1, x2)
{
return (x1 < x2); // lt
}
function
XATS2JS_gflt_gt_dflt_dflt
  (x1, x2)
{
    return (x1 > x2); // gt
}
function
XATS2JS_gflt_eq_dflt_dflt
  (x1, x2)
{
    return (x1 === x2); // eq
}
function
XATS2JS_gflt_lte_dflt_dflt
  (x1, x2)
{
    return (x1 <= x2); // lte
}
function
XATS2JS_gflt_gte_dflt_dflt
  (x1, x2)
{
    return (x1 >= x2); // gte
}
function
XATS2JS_gflt_neq_dflt_dflt
  (x1, x2)
{
    return (x1 !== x2); // neq
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_gflt_cmp_dflt_dflt
  (x1, x2)
{
    if (x1 < x2)
	return (-1);
    else
	return (x1 <= x2 ? 0 : 1);
    // end of [if]
}
/* ****** ****** */
function
XATS2JS_gflt_add_dflt_dflt
  (x1, x2)
{
    return (x1 + x2); // add
}
/* ****** ****** */
function
XATS2JS_gflt_sub_dflt_dflt
  (x1, x2)
{
    return (x1 - x2); // sub
}
/* ****** ****** */
function
XATS2JS_gflt_mul_dflt_dflt
  (x1, x2)
{
    return (x1 * x2); // mul
}
/* ****** ****** */
function
XATS2JS_gflt_div_dflt_dflt
  (x1, x2)
{
    return (x1 / x2); // div
}
//
////////////////////////////////////////////////////////////////
//
/* ****** ****** */
//
//prelude/strn000.sats
//
/* ****** ****** */
//
// HX-2020-09-28:
// Please note that:
// A (strn)-val is a JS-string
// A (lstrn)-val is a JS-array
//
/* ****** ****** */
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_strn_vt2t
  (  cs  )
{
    cs.pop(); // pop the last '\0'
    var res = // from array to string
	String.fromCharCode.apply(null, cs);
    return res; // [XATS2JS_strn_vt2t]
}
/* ****** ****** */
//
function
XATS2JS_strn_nilq
  (  cs  )
{
    return(0===cs.length);
}
function
XATS2JS_strn_consq
  (  cs  )
{
    return(0!==cs.length);
}
/* ****** ****** */
//
function
XATS2JS_stropt_nilq
  (  opt  )
{
    return(opt===null); // stropt_noneq
}
function
XATS2JS_stropt_consq
  (  opt  )
{
    return(opt!==null); // stropt_someq
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_strn_lt
  (x1, x2)
{
    return (x1 < x2);
}
function
XATS2JS_strn_gt
  (x1, x2)
{
    return (x1 > x2);
}
function
XATS2JS_strn_eq
  (x1, x2)
{
    return (x1===x2);
}
function
XATS2JS_strn_lte
  (x1, x2)
{
    return (x1 <= x2);
}
function
XATS2JS_strn_gte
  (x1, x2)
{
    return (x1 >= x2);
}
function
XATS2JS_strn_neq
  (x1, x2)
{
    return (x1 !== x2);
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_strn_cmp
  (x1, x2)
{
    if (x1 < x2)
	return -1;
    else
	return (x1===x2 ? 0 : 1);
    // end of [if]
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_strn_head$raw
  (  cs  )
{
    return cs.charCodeAt(0);
}
//
function
XATS2JS_strn_head$opt
  (  cs  )
{
    if (cs.length <= 0)
	return 0; // none
    else
	return cs.charCodeAt(0);
    // end of [if]
}
//
function
XATS2JS_strn_tail$raw
  (  cs  )
{
    return cs.slice(1);//tail
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_strn_length
  (  cs  )
{
    return (cs.length);
}
//
function
XATS2JS_strn_vt_length0
  (  cs  )
{
    // HX: skipping
    // the ending null char
    return (cs.length - 1);
}
function
XATS2JS_strn_vt_length1
  (  cs  )
{
    // HX: skipping
    // the ending null char
    return (cs.length - 1);
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_strn_get$at
  (cs, i0)
{
    return cs.charCodeAt(i0);
}
//
/* ****** ****** */
//
function
XATS2JS_strn_vt_get$at
  (cs, i0)
{
    return cs[i0];
    //HX: cs:JS_array(char)
}
function
XATS2JS_strn_vt_set$at
  (cs, i0, c0)
{
    return (cs[i0] = c0);
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_strtmp_vt_alloc
  (bsz)
{
    var cs =
	new Array(bsz+1);
    return (cs[bsz] = 0, cs);
}
//
function
XATS2JS_strtmp_vt_set$at
  (cs, i0, c0)
{
    return (cs[i0] = c0);
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_strn_forall$f1un
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
    return res; // strn_forall$f1un
}
//
/* ****** ****** */
//
function
XATS2JS_strn_rforall$f1un
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
    return res; // strn_rforall$f1un
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_strn_vt_forall$f1un
  (cs, f0)
{
    var i0;
    var res = true;
    var len = cs.length-1;
    for ( i0 = 0; i0 < len; i0 += 1)
    {
	if(!f0(cs[i0])){res = false; break;}
    }
    return res; // strn_vt_forall$f1un
}
//
/* ****** ****** */
//
function
XATS2JS_strn_vt_rforall$f1un
  (cs, f0)
{
    var i0;
    var res = true;
    var len = cs.length-1;
    for ( i0 = len; i0 >= 1 ; i0 -= 1)
    {
	if(!f0(cs[i0-1])){res = false; break;}
    }
    return res; // strn_vt_rforall$f1un
}
//
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
/*
HX-2025-04-11:
For bridging [srcgen1] and [srcgen2]
*/
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
function
XATS2JS_sint_neg
  (  x0  )
{
    return XATS2JS_gint_neg$sint(x0);
}
function
XATS2JS_sint_abs
  (  x0  )
{
    return XATS2JS_gint_abs$sint(x0);
}
//
function
XATS2JS_sint_lt$sint
  (x0, y0)
{
  return XATS2JS_gint_lt$sint$sint(x0, y0);
}
function
XATS2JS_sint_gt$sint
  (x0, y0)
{
  return XATS2JS_gint_gt$sint$sint(x0, y0);
}
function
XATS2JS_sint_eq$sint
  (x0, y0)
{
  return XATS2JS_gint_eq$sint$sint(x0, y0);
}
//
function
XATS2JS_sint_lte$sint
  (x0, y0)
{
  return XATS2JS_gint_lte$sint$sint(x0, y0);
}
function
XATS2JS_sint_gte$sint
  (x0, y0)
{
  return XATS2JS_gint_gte$sint$sint(x0, y0);
}
function
XATS2JS_sint_neq$sint
  (x0, y0)
{
  return XATS2JS_gint_neq$sint$sint(x0, y0);
}
//
function
XATS2JS_sint_add$sint
  (x0, y0)
{
  return XATS2JS_gint_add$sint$sint(x0, y0);
}
function
XATS2JS_sint_sub$sint
  (x0, y0)
{
  return XATS2JS_gint_sub$sint$sint(x0, y0);
}
function
XATS2JS_sint_mul$sint
  (x0, y0)
{
  return XATS2JS_gint_mul$sint$sint(x0, y0);
}
function
XATS2JS_sint_div$sint
  (x0, y0)
{
  return XATS2JS_gint_div$sint$sint(x0, y0);
}
//
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
/* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_basics1.cats] */
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
