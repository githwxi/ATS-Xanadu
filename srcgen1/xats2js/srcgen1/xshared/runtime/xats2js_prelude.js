/* ****** ****** */
// XATS2JS_PRELUDE
/* ****** ****** */

'use strict';

////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
/*
Basics for Xats2js
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
XATS2JS_gint_neg_sint
  (  x0  )
{
    return (-x0); // neg
}
//
function
XATS2JS_gint_abs_sint
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
function
XATS2JS_gint_succ_sint
  (  x0  )
{
    return (x0 + 1); // +1
}
function
XATS2JS_gint_succ_uint
  (  x0  )
{
    return (x0 + 1); // +1
}
//
function
XATS2JS_gint_pred_sint
  (  x0  )
{
    return (x0 - 1); // -1
}
function
XATS2JS_gint_pred_uint
  (  x0  )
{
    return (x0 - 1); // -1
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_lnot_uint
  (  x0  )
{
  return (~x0); // lnot
}
function
XATS2JS_gint_lor2_uint
  (x0, y0)
{
  return (x0|y0); // lor2
}
function
XATS2JS_gint_land_uint
  (x0, y0)
{
  return (x0&y0); // land
}
function
XATS2JS_gint_lxor_uint
  (x0, y0)
{
  return (x0^y0); // lxor
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_asrn_sint
  (x0, n0)
{
    return (x0>>n0); // asrn
}
function
XATS2JS_gint_lsln_uint
  (x0, n0)
{
    return (x0<<n0); // lsln
}
function
XATS2JS_gint_lsrn_uint
  (x0, n0)
{
    return (x0>>>n0); // lsrn
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_lt_sint_sint
  (x1, x2)
{
    return (x1 < x2); // lt
}
function
XATS2JS_gint_lt_uint_uint
  (x1, x2)
{
    return (x1 < x2); // lt
}
/* ****** ****** */
function
XATS2JS_gint_gt_sint_sint
  (x1, x2)
{
    return (x1 > x2); // gt
}
function
XATS2JS_gint_gt_uint_uint
  (x1, x2)
{
    return (x1 > x2); // gt
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_eq_sint_sint
  (x1, x2)
{
    return (x1 === x2); // eq
}
function
XATS2JS_gint_eq_uint_uint
  (x1, x2)
{
    return (x1 === x2); // eq
}
//
/* ****** ****** */
//
function
XATS2JS_gint_lte_sint_sint
  (x1, x2)
{
    return (x1 <= x2); // lte
}
function
XATS2JS_gint_lte_uint_uint
  (x1, x2)
{
    return (x1 <= x2); // lte
}
//
/* ****** ****** */
//
function
XATS2JS_gint_gte_sint_sint
  (x1, x2)
{
    return (x1 >= x2); // gte
}
function
XATS2JS_gint_gte_uint_uint
  (x1, x2)
{
    return (x1 >= x2); // gte
}
//
/* ****** ****** */
//
function
XATS2JS_gint_neq_sint_sint
  (x1, x2)
{
    return (x1 !== x2); // neq
}
function
XATS2JS_gint_neq_uint_uint
  (x1, x2)
{
    return (x1 !== x2); // neq
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_cmp_sint_sint
  (x1, x2)
{
    if (x1 < x2)
	return (-1);
    else
	return (x1 <= x2 ? 0 : 1);
    // end of [if]
}
function
XATS2JS_gint_cmp_uint_uint
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
XATS2JS_gint_add_sint_sint
  (x1, x2)
{
    return (x1 + x2); // add
}
/* ****** ****** */
function
XATS2JS_gint_sub_sint_sint
  (x1, x2)
{
    return (x1 - x2); // sub
}
/* ****** ****** */
function
XATS2JS_gint_mul_sint_sint
  (x1, x2)
{
    return (x1 * x2); // mul
}
/* ****** ****** */
function
XATS2JS_gint_mod_sint_sint
  (x1, x2)
{
    return (x1 % x2); // mod
}
/* ****** ****** */
//
function
XATS2JS_gint_div_sint_sint
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
/* ****** ****** */
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
function
XATS2JS_gflt_succ_dflt
  (  x0  )
{
    return (x0 + 1); // +1
}
function
XATS2JS_gflt_pred_dflt
  (  x0  )
{
    return (x0 - 1); // -1
}
/* ****** ****** */
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
  (  opt  )
{
    return(opt==="");
}
function
XATS2JS_strn_consq
  (  opt  )
{
    return(opt!=="");
}
/* ****** ****** */
//
function
XATS2JS_stropt_nilq
  (  opt  )
{
    return(opt===null);
}
function
XATS2JS_stropt_consq
  (  opt  )
{
    return(opt!==null);
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
XATS2JS_strn_head_raw
  (  cs  )
{
    return cs.charCodeAt(0);
}
//
function
XATS2JS_strn_head_opt
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
XATS2JS_strn_tail_raw
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
XATS2JS_strn_get_at
  (cs, i0)
{
    return cs.charCodeAt(i0);
}
//
/* ****** ****** */
//
function
XATS2JS_strn_vt_get_at
  (cs, i0)
{
    return cs[i0];
    //HX: cs:JS_array(char)
}
function
XATS2JS_strn_vt_set_at
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
XATS2JS_strtmp_vt_set_at
  (cs, i0, c0)
{
    return (cs[i0] = c0);
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_strn_forall_cfr
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
    return res; // strn_forall_cfr
}
//
/* ****** ****** */
//
function
XATS2JS_strn_rforall_cfr
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
    return res; // strn_rforall_cfr
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_strn_vt_forall_cfr
  (cs, f0)
{
    var i0;
    var res = true;
    var len = cs.length-1;
    for ( i0 = 0; i0 < len; i0 += 1)
    {
	if(!f0(cs[i0])){res = false; break;}
    }
    return res; // strn_vt_forall_cfr
}
//
/* ****** ****** */
//
function
XATS2JS_strn_vt_rforall_cfr
  (cs, f0)
{
    var i0;
    var res = true;
    var len = cs.length-1;
    for ( i0 = len; i0 >= 1 ; i0 -= 1)
    {
	if(!f0(cs[i0-1])){res = false; break;}
    }
    return res; // strn_vt_rforall_cfr
}
//
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////

/* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_basics0.cats] */
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
/*
Runtime for Xats2js
*/
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
//
var XATS2JS_nil = null
var XATS2JS_top = null
var XATS2JS_none = null
var XATS2JS_null = null
var XATS2JS_void = null
//
function
XATS2JS_fnull()
{
  throw new Error(); }
////////////////////////////////////////////////////////////////
//
var // global
XATS2JS_excbas = 0
var // global
XATS2JS_exctag = 0
//
function
XATS2JS_new_exctag
  (    )
{
var bas0 =
XATS2JS_excbas;
var tag1 =
XATS2JS_exctag + 1;
XATS2JS_exctag = tag1;
return ( bas0 + tag1 );
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_char
  ( cs )
{
// cs: singleton
return cs.charCodeAt(0);
}
function
XATS2JS_strn
  ( cs )
{
  return cs;//cs: JS_strn
}
//
/* ****** ****** */
//
function
XATS2JS_fcast
  ( x0 )
{
  return x0; //obj: object
}  
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_raise
  ( exn )
{
  throw exn; // no return!
}
function
XATS2JS_reraise
  ( exn )
{
  throw exn; // no return!
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_assert
  ( b0 )
{
  if (!b0)
  {
    // [b0] is false
    throw new Error();
  } // then // end-of-[if]
}
//
function
XATS2JS_assertloc
  ( b0, loc )
{
  if (!b0)
  {
    // [b0] is false
    throw new Error(loc);
  } // then // end-of-[if]
}
function
XATS2JS_assertmsg
  ( b0, msg )
{
  if (!b0)
  {
    // [b0] is false
    throw new Error(msg);
  } // then // end-of-[if]
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_lval_err
  (  loc  )
{
  // non-left-val!
  throw new Error( loc ); }
//
/* ****** ****** */
//
function
XATS2JS_lval_get
  (lvl0)
{
//
var root = lvl0.root;
var offs = lvl0.offs;
//
if
(
lvl0.hasOwnProperty('prev')
)
root =
XATS2JS_lval_get(lvl0.prev);
//  
return root[offs]; // JS_lval_get
}
//
/* ****** ****** */
function
XATS2JS_lval_set
  (lvl0, obj1)
{
//
var root = null;
var offs = lvl0.offs;
//
if
(
lvl0.hasOwnProperty('prev')
)
{ // flat tuple
root =
XATS2JS_lval_get(lvl0.prev);
root =
root.slice(); root[offs] = obj1;
XATS2JS_lval_set(lvl0.prev, root);
}
else
{
  lvl0.root[offs] = obj1; // boxed
}
return; // end of [XATS2JS_lval_set]
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_ctag
  (x0)
{ return x0[0]; }
//
function
XATS2JS_carg
  (x0, i0)
{ return x0[i0]; }
//
function
XATS2JS_targ
  (x0, i0)
{ return x0[i0]; }
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_patckerr0()
{
  throw new Error();
}
function
XATS2JS_patckerr1(loc)
{
  throw new Error(loc);
}
/* ****** ****** */
function
XATS2JS_matcherr0()
{
  throw new Error();
}
function
XATS2JS_matcherr1(loc)
{
  throw new Error(loc);
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_new_var0
  ()
{
return {root:[null], offs:0};
}
function
XATS2JS_new_var1
  (init)
{
return {root:[init], offs:0};
}
/* ****** ****** */
function
XATS2JS_new_cofs
  (lvl1, idx2)
{
return {root:lvl1, offs:idx2}; 
}
function
XATS2JS_new_tofs
  (lvl1, idx2)
{
return {root:lvl1, offs:idx2}; 
}
/* ****** ****** */
function
XATS2JS_new_cptr
  (lvl1, idx2)
{
var
con1 =
XATS2JS_lval_get(lvl1);
return {root:con1, offs:idx2}; 
}
function
XATS2JS_new_tptr
  (lvl1, idx2)
{
var
tup1 =
XATS2JS_lval_get(lvl1);
if
(tup1[0] >= 0)
return {
  root:tup1, offs:idx2
};
else
return {
  prev:lvl1,
  root:tup1, offs:idx2
}; // end of [XATS2JS_new_tptr]
}
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_new_lazy
  (thunk)
{
return {
  lztag: 0 // unused
, lzval: null // saved
, lzfun: thunk // for eval
}
} // end of [XATS2JS_new_lazy]
//
function
XATS2JS_lazy_eval
  (lzobj)
{
//
var lzres;
//
if
(lzobj.lztag===0)
{
lzres =
lzobj.lzfun();
lzobj.lztag = 1;
lzobj.lzval = lzres;
} else
{
//
// HX: tracking
//
  lzobj.lztag += 1;
  lzres = lzobj.lzval;
} ;
return lzres; // lazy_eval
} // end of [XATS2JS_lazy_eval]
//
////////////////////////////////////////////////////////////////
//
function
XATS2JS_new_llazy
  (thunk, frees)
{
return {
  lztag: false // unused
, lzfun: thunk // for eval
, lzfrs: frees // for frees
}
} // end of [XATS2JS_new_llazy]
//
function
XATS2JS_llazy_eval
  (lzobj)
{
//
if
(lzobj.lztag)
{
  throw new Error();
}
//
  lzobj.lztag = true; // used
  return lzobj.lzfun(); // eval
//
} // end of [XATS2JS_llazy_eval]
//
function
XATS2JS_llazy_free
  (lzobj)
{
//
if
(lzobj.lztag)
{
  throw new Error();
}
//
  lzobj.lztag = true; // used
  return lzobj.lzfrs(); // free
//
} // end of [XATS2JS_llazy_free]
//
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////

/* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_runtime.cats] */
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
/*
Basics for Xats2js
*/
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
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
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
//
/*
HX: 0-dimensional
*/
//
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
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
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
//
// HX: 1-dimensional
//
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
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
XATS2JS_a1ref_get_at
  (A0, i0)
{
    return A0[i0]; }
function
XATS2JS_a1ptr_get_at
  (A0, i0)
{
    return A0[i0]; }
//
/* ****** ****** */
//
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
//
/* ****** ****** */
//
function
XATS2JS_a1ref_get0_at
  (A0, i0)
{
    return A0[   i0   ]; }
function
XATS2JS_a1ref_cget_at
  (A0, i0)
{
    return A0[   i0   ]; }
//
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
//
// prelude/unsafe.sats
//
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
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
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////

/* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_prelude.cats] */
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
/*
G_eqref for Xats2js
*/
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
//
function
XATS2JS_g_eqref
  (x1, x2)
{
  return (x1 === x2); 
}
function
XATS2JS_g_neqrf
  (x1, x2)
{
  return (x1 !== x2); 
}
//
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////

/* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_g_eqref.cats] */
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
/*
G_print for Xats2js
*/
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
//
var
XATS2JS_the_print_store = [];
//
////////////////////////////////////////////////////////////////

function
XATS2JS_g_print(obj)
{
var
rep = obj.toString();
XATS2JS_the_print_store.push(rep);
return; // XATS2JS_g_print
}

/* ****** ****** */
function
XATS2JS_bool_print
  (b0)
{
if(b0)
{
XATS2JS_g_print("true");
}
else
{
XATS2JS_g_print("false");
}
return; // XATS2JS_bool_print
}
/* ****** ****** */
function
XATS2JS_char_print
  (c0)
{
// c0: number
XATS2JS_g_print
(String.fromCharCode(c0));
return; // XATS2JS_char_print
}
/* ****** ****** */
function
XATS2JS_gint_print_sint
  (x0)
{
XATS2JS_g_print(x0);
return; // gint_print_sint
}
function
XATS2JS_gint_print_uint
  (x0)
{
XATS2JS_g_print(x0);
return; // gint_print_uint
}
/* ****** ****** */
function
XATS2JS_gflt_print_sflt
  (x0)
{
XATS2JS_g_print(x0);
return; // gint_print_sflt
}
function
XATS2JS_gflt_print_dflt
  (x0)
{
XATS2JS_g_print(x0);
return; // gint_print_dflt
}
/* ****** ****** */
function
XATS2JS_strn_print(cs)
{
  return XATS2JS_g_print(cs);
}
/* ****** ****** */

function
XATS2JS_the_print_store_join()
{
var
rep =
XATS2JS_the_print_store.join("");
return rep;
} // XATS2JS_the_print_store_join

/* ****** ****** */

function
XATS2JS_the_print_store_clear()
{
XATS2JS_the_print_store = []; return;
} // XATS2JS_the_print_store_clear

////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////

/* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_g_print.cats] */
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
/*
JSBasics for Xats2js
*/
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
//
function
XATS2JS_jsobj_get_at
  (obj, key)
{
  return obj[ key ];
}
function
XATS2JS_jsobj_set_at
  (obj, key, itm)
{
  return (obj[key] = itm);
}
/* ****** ****** */
// HX-2020-11-09:
// Native arrays for Xats2js
/* ****** ****** */

function
XATS2JS_jsarray_size
  ( xs )
{
  return ( xs.length );
}
function
XATS2JS_jsarray_length
  ( xs )
{
  return ( xs.length );
}

/* ****** ****** */

function
XATS2JS_jsarray_get_at
  (xs, i0)
{
  return xs[i0];
}
function
XATS2JS_jsarray_set_at
  (xs, i0, x0)
{
  return ( xs[i0] = x0 );
}

/* ****** ****** */
//
// HX-2020-11-28:
// Native objmaps for Xats2js
//
/* ****** ****** */

function
XATS2JS_jsobjmap_keys
   (obj)
{
return Object.keys(obj);
} // XATS2JS_jsobjmap_keys

/* ****** ****** */

function
XATS2JS_jsobjmap_keyq
   (obj, key)
{
return obj.hasOwnProperty(key);
} // XATS2JS_jsobjmap_keyq

/* ****** ****** */

function
XATS2JS_jsobjmap_make_nil
  ()
{
  return {} ;
} // XATS2JS_jsobjmap_make_nil

/* ****** ****** */

function
XATS2JS_jsobjmap_search_opt
   (obj, key)
{
//
var itm0 = obj[key];
//
if(itm0===undefined)
{
  return XATS2JS_optn_vt_nil();
} else {
  return XATS2JS_optn_vt_cons(itm0);
} // end of [if]
//
} // [ XATS2JS_jsobjmap_search_opt ]

/* ****** ****** */

function
XATS2JS_jsobjmap_insert_any
   (obj, key, itm1)
{
  obj[key] = itm1; return;
} // [XATS2JS_jsobjmap_insert_any]

function
XATS2JS_jsobjmap_remove_any
   (obj, key)
{
  delete object[key]; return ;
} // [XATS2JS_jsobjmap_remove_any]

/* ****** ****** */

function
XATS2JS_jsobjmap_insert_opt
   (obj, key, itm1)
{
//
var itm0 = obj[key];
//
if(itm0===undefined)
{
  obj[key] = itm1;
  return XATS2JS_optn_vt_nil();
} else {
  obj[key] = itm1;
  return XATS2JS_optn_vt_cons(itm0);
} // end of [if]
//
} // [ XATS2JS_jsobjmap_insert_opt ]

function
XATS2JS_jsobjmap_remove_opt
   (obj, key)
{
//
var itm0 = obj[key];
//
if(itm0===undefined)
{
  return XATS2JS_optn_vt_nil();
} else {
  delete object[key];
  return XATS2JS_optn_vt_cons(itm0);
} // end of [if]
//
} // [ XATS2JS_jsobjmap_remove_opt ]

////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////

/* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_basics1.cats] */
// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(105(line=8,offs=1)--161(line=10,offs=28))
// L1DCLnone1(...)


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(247(line=18,offs=1)--319(line=24,offs=24))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(323(line=26,offs=1)--361(line=27,offs=30))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(396(line=32,offs=1)--489(line=40,offs=26))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(498(line=42,offs=1)--591(line=50,offs=26))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(595(line=52,offs=1)--633(line=53,offs=30))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(634(line=54,offs=1)--672(line=55,offs=30))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(792(line=67,offs=1)--842(line=69,offs=30))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(846(line=71,offs=1)--901(line=73,offs=30))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(902(line=74,offs=1)--957(line=76,offs=30))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(958(line=77,offs=1)--1013(line=79,offs=30))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(1058(line=84,offs=1)--1113(line=86,offs=30))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(1145(line=90,offs=1)--1206(line=93,offs=30))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(1207(line=94,offs=1)--1245(line=95,offs=30))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(1274(line=98,offs=1)--1323(line=100,offs=29))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(1324(line=101,offs=1)--1362(line=102,offs=30))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(1371(line=104,offs=1)--1421(line=106,offs=29))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(1422(line=107,offs=1)--1462(line=108,offs=32))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(1491(line=111,offs=1)--1554(line=114,offs=30))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(1555(line=115,offs=1)--1597(line=116,offs=34))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(1606(line=118,offs=1)--1669(line=121,offs=30))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(1670(line=122,offs=1)--1712(line=123,offs=34))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(1744(line=127,offs=1)--1799(line=129,offs=31))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(1808(line=131,offs=1)--1863(line=133,offs=31))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(1867(line=135,offs=1)--1913(line=136,offs=38))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(1914(line=137,offs=1)--1960(line=138,offs=38))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(1995(line=143,offs=1)--2050(line=145,offs=31))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(2059(line=147,offs=1)--2114(line=149,offs=31))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(2118(line=151,offs=1)--2164(line=152,offs=38))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(2165(line=153,offs=1)--2211(line=154,offs=38))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(2246(line=159,offs=1)--2301(line=161,offs=31))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(2310(line=163,offs=1)--2365(line=165,offs=31))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(2369(line=167,offs=1)--2415(line=168,offs=38))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(2416(line=169,offs=1)--2462(line=170,offs=38))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(2497(line=175,offs=1)--2553(line=177,offs=31))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(2562(line=179,offs=1)--2618(line=181,offs=31))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(2622(line=183,offs=1)--2670(line=184,offs=40))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(2671(line=185,offs=1)--2719(line=186,offs=40))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(2808(line=195,offs=1)--2867(line=197,offs=33))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(2876(line=199,offs=1)--2935(line=201,offs=33))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(2939(line=203,offs=1)--2989(line=205,offs=23))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(3004(line=206,offs=1)--3054(line=208,offs=23))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(3103(line=213,offs=1)--3163(line=215,offs=33))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(3172(line=217,offs=1)--3232(line=219,offs=33))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(3236(line=221,offs=1)--3288(line=222,offs=44))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(3289(line=223,offs=1)--3341(line=224,offs=44))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(3376(line=229,offs=1)--3447(line=233,offs=33))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(3448(line=234,offs=1)--3496(line=235,offs=40))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(3531(line=240,offs=1)--3606(line=244,offs=37))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(3607(line=245,offs=1)--3655(line=246,offs=40))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(3690(line=251,offs=1)--3763(line=255,offs=34))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(3772(line=257,offs=1)--3845(line=261,offs=34))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(3846(line=262,offs=1)--3896(line=263,offs=42))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(3897(line=264,offs=1)--3947(line=265,offs=42))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(3982(line=270,offs=1)--4055(line=274,offs=34))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(4064(line=276,offs=1)--4141(line=280,offs=34))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(4142(line=281,offs=1)--4192(line=282,offs=42))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(4193(line=283,offs=1)--4243(line=284,offs=42))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(4278(line=289,offs=1)--4338(line=291,offs=34))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(4347(line=293,offs=1)--4407(line=295,offs=34))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(4416(line=297,offs=1)--4476(line=299,offs=34))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(4485(line=301,offs=1)--4545(line=303,offs=34))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(4549(line=305,offs=1)--4599(line=306,offs=42))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(4600(line=307,offs=1)--4650(line=308,offs=42))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(4651(line=309,offs=1)--4701(line=310,offs=42))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(4702(line=311,offs=1)--4752(line=312,offs=42))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(4787(line=317,offs=1)--4847(line=319,offs=34))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(4856(line=321,offs=1)--4916(line=323,offs=34))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(4925(line=325,offs=1)--4985(line=327,offs=34))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(4989(line=329,offs=1)--5039(line=330,offs=42))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(5040(line=331,offs=1)--5090(line=332,offs=42))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(5091(line=333,offs=1)--5141(line=334,offs=42))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(5176(line=339,offs=1)--5267(line=345,offs=34))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(5268(line=346,offs=1)--5324(line=347,offs=48))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(5333(line=349,offs=1)--5424(line=355,offs=34))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(5425(line=356,offs=1)--5481(line=357,offs=48))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(5516(line=362,offs=1)--5607(line=368,offs=34))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(5608(line=369,offs=1)--5664(line=370,offs=48))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(5673(line=372,offs=1)--5764(line=378,offs=34))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(5765(line=379,offs=1)--5821(line=380,offs=48))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(5856(line=385,offs=1)--5947(line=391,offs=34))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(5948(line=392,offs=1)--6004(line=393,offs=48))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(6013(line=395,offs=1)--6104(line=401,offs=34))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(6105(line=402,offs=1)--6161(line=403,offs=48))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(6196(line=408,offs=1)--6289(line=414,offs=35))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(6290(line=415,offs=1)--6348(line=416,offs=50))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(6357(line=418,offs=1)--6450(line=424,offs=35))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(6451(line=425,offs=1)--6509(line=426,offs=50))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(6544(line=431,offs=1)--6637(line=437,offs=35))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(6638(line=438,offs=1)--6696(line=439,offs=50))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(6705(line=441,offs=1)--6798(line=447,offs=35))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(6799(line=448,offs=1)--6857(line=449,offs=50))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(6892(line=454,offs=1)--6985(line=460,offs=35))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(6986(line=461,offs=1)--7044(line=462,offs=50))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(7053(line=464,offs=1)--7146(line=470,offs=35))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(7147(line=471,offs=1)--7205(line=472,offs=50))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(7238(line=477,offs=1)--7344(line=484,offs=37))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(7345(line=485,offs=1)--7403(line=486,offs=50))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(7413(line=489,offs=1)--7519(line=496,offs=37))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(7520(line=497,offs=1)--7578(line=498,offs=50))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(7611(line=503,offs=1)--7705(line=509,offs=36))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(7706(line=510,offs=1)--7764(line=511,offs=50))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(7773(line=513,offs=1)--7867(line=519,offs=36))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(7868(line=520,offs=1)--7926(line=521,offs=50))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(7938(line=524,offs=1)--8032(line=530,offs=36))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(8033(line=531,offs=1)--8091(line=532,offs=50))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(8100(line=534,offs=1)--8194(line=540,offs=36))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(8195(line=541,offs=1)--8253(line=542,offs=50))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(8262(line=544,offs=1)--8359(line=550,offs=39))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(8360(line=551,offs=1)--8418(line=552,offs=50))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(8508(line=561,offs=1)--8563(line=563,offs=31))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(8564(line=564,offs=1)--8610(line=565,offs=38))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(8645(line=570,offs=1)--8703(line=572,offs=33))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(8704(line=573,offs=1)--8752(line=574,offs=40))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(8764(line=577,offs=1)--8822(line=579,offs=33))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(8823(line=580,offs=1)--8871(line=581,offs=40))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(8906(line=586,offs=1)--8965(line=588,offs=33))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(8966(line=589,offs=1)--9016(line=590,offs=42))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(9025(line=592,offs=1)--9084(line=594,offs=33))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(9085(line=595,offs=1)--9135(line=596,offs=42))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(9170(line=601,offs=1)--9240(line=603,offs=41))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(9249(line=605,offs=1)--9319(line=607,offs=41))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(9328(line=609,offs=1)--9398(line=611,offs=41))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(9407(line=613,offs=1)--9478(line=615,offs=41))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(9487(line=617,offs=1)--9558(line=619,offs=41))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(9567(line=621,offs=1)--9638(line=623,offs=41))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(9642(line=625,offs=1)--9698(line=626,offs=48))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(9699(line=627,offs=1)--9755(line=628,offs=48))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(9756(line=629,offs=1)--9812(line=630,offs=48))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(9813(line=631,offs=1)--9871(line=632,offs=50))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(9872(line=633,offs=1)--9930(line=634,offs=50))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(9931(line=635,offs=1)--9989(line=636,offs=50))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(10024(line=641,offs=1)--10095(line=643,offs=41))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(10096(line=644,offs=1)--10154(line=645,offs=50))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(10189(line=650,offs=1)--10260(line=652,offs=41))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(10269(line=654,offs=1)--10340(line=656,offs=41))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(10349(line=658,offs=1)--10420(line=660,offs=41))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(10429(line=662,offs=1)--10500(line=664,offs=41))


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(10504(line=666,offs=1)--10562(line=667,offs=50))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(10563(line=668,offs=1)--10621(line=669,offs=50))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(10622(line=670,offs=1)--10680(line=671,offs=50))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(10681(line=672,offs=1)--10739(line=673,offs=50))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(10823(line=682,offs=1)--10934(line=692,offs=18))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(10956(line=695,offs=1)--11074(line=704,offs=20))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(11075(line=705,offs=1)--11196(line=714,offs=21))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(11218(line=717,offs=1)--11331(line=727,offs=16))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(11332(line=728,offs=1)--11445(line=738,offs=16))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(11446(line=739,offs=1)--11559(line=749,offs=16))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(11580(line=751,offs=1)--11696(line=761,offs=17))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(11697(line=762,offs=1)--11813(line=772,offs=17))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(11814(line=773,offs=1)--11930(line=783,offs=17))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(11951(line=785,offs=1)--12067(line=795,offs=17))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(12088(line=797,offs=1)--12209(line=806,offs=22))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(12230(line=808,offs=1)--12351(line=817,offs=22))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(12372(line=819,offs=1)--12493(line=828,offs=22))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(12514(line=830,offs=1)--12631(line=839,offs=20))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(12635(line=841,offs=1)--12768(line=850,offs=24))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(12769(line=851,offs=1)--12902(line=860,offs=24))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(12929(line=864,offs=1)--13055(line=874,offs=20))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(13082(line=878,offs=1)--13299(line=893,offs=9))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(13359(line=897,offs=1)--13491(line=906,offs=24))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(13518(line=910,offs=1)--13664(line=921,offs=23))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(13691(line=925,offs=1)--13837(line=935,offs=23))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(13864(line=939,offs=1)--14018(line=949,offs=25))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(14045(line=953,offs=1)--14259(line=966,offs=27))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(14324(line=970,offs=1)--14538(line=983,offs=27))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(14603(line=987,offs=1)--14821(line=1000,offs=28))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics0.dats@(14887(line=1004,offs=1)--15105(line=1017,offs=28))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(91(line=8,offs=1)--110(line=9,offs=11))
// L1DCLnone1(...)


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(119(line=10,offs=1)--146(line=11,offs=19))
// L1DCLnone1(...)


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(173(line=15,offs=1)--201(line=16,offs=20))
// L1DCLnone1(...)


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(202(line=17,offs=1)--233(line=18,offs=23))
// L1DCLnone1(...)


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(354(line=28,offs=1)--391(line=30,offs=15))
// L1DCLnone1(...)


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(395(line=32,offs=1)--428(line=33,offs=25))
// L1DCLnone1(...)


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(519(line=42,offs=1)--548(line=42,offs=30))
// L1DCLnone1(...)


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(623(line=50,offs=1)--696(line=55,offs=29))


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(705(line=57,offs=1)--790(line=63,offs=32))


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(794(line=65,offs=1)--831(line=66,offs=29))
// L1DCLnone1(...)


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(832(line=67,offs=1)--869(line=68,offs=29))
// L1DCLnone1(...)


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(870(line=69,offs=1)--911(line=70,offs=33))
// L1DCLnone1(...)


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(912(line=71,offs=1)--953(line=72,offs=33))
// L1DCLnone1(...)


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(1031(line=80,offs=1)--1103(line=84,offs=33))


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(1132(line=87,offs=1)--1220(line=92,offs=35))


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(1229(line=94,offs=1)--1322(line=99,offs=38))


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(1343(line=101,offs=1)--1392(line=102,offs=36))
// L1DCLnone1(...)


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(1393(line=103,offs=1)--1444(line=104,offs=36))
// L1DCLnone1(...)


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(1465(line=106,offs=1)--1512(line=107,offs=36))
// L1DCLnone1(...)


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(1513(line=108,offs=1)--1560(line=109,offs=36))
// L1DCLnone1(...)


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(1581(line=111,offs=1)--1632(line=112,offs=36))
// L1DCLnone1(...)


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(1633(line=113,offs=1)--1684(line=114,offs=36))
// L1DCLnone1(...)


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(1716(line=118,offs=1)--1796(line=122,offs=40))


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(1883(line=130,offs=1)--1960(line=135,offs=22))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(1981(line=137,offs=1)--2062(line=141,offs=28))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(2086(line=144,offs=1)--2458(line=170,offs=22))
function
XATS2JS_jsarray_strmize(a1x1)
{
  let xtmp1
  let xtmp12
// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(2154(line=149,offs=3)--2173(line=149,offs=22))
  {
    {
      xtmp1 = XATS2JS_jsarray_length(a1x1)
    }
  } // val(H0Pvar(n0(11)))
// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(2179(line=151,offs=3)--2430(line=168,offs=10))
  function
  auxmain_2184_(a2x1)
  {
    let xtmp3
    let xtmp10
    let xtmp11
    xtmp10 = function () {
      let xtmp4
      let xtmp5
      let xtmp6
      let xtmp7
      let xtmp8
      let xtmp9
      {
// ./../../../../prelude/DATS/CATS/JS/./basics0.dats@(6638(line=438,offs=1)--6696(line=439,offs=50))
        // { // val-implmnt
        // } // val-implmnt
        var // const // implval/fun
        gint_gte_sint_sint_568183_3042_ = XATS2JS_gint_gte_sint_sint
        xtmp5 = XATS2JS_gint_gte_sint_sint(a2x1, xtmp1)
      }
      if (xtmp5)
      { // then
        {
          xtmp4 = [1]
        }
      } // if-then
      else
      { // else
// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(2331(line=164,offs=7)--2353(line=164,offs=29))
        {
          {
            xtmp6 = XATS2JS_jsarray_get_at(a1x1, a2x1)
          }
        } // val(H0Pvar(x0(14)))
        {
          {
            {
// ./../../../../prelude/DATS/CATS/JS/./basics0.dats@(7706(line=510,offs=1)--7764(line=511,offs=50))
              // { // val-implmnt
              // } // val-implmnt
              var // const // implval/fun
              gint_add_sint_sint_568183_3989_ = XATS2JS_gint_add_sint_sint
              xtmp9 = XATS2JS_gint_add_sint_sint(a2x1, 1)
            }
            xtmp8 = auxmain_2184_(xtmp9)
          }
          xtmp7 = [2, xtmp6, xtmp8]
        }
        xtmp4 = xtmp7
      } // if-else
      return xtmp4 // lam-fun
    } // lam-function
    xtmp11 = function () {
      let xtmp4
      let xtmp5
      let xtmp6
      let xtmp7
      let xtmp8
      let xtmp9
    } // lam-function
    xtmp3 = XATS2JS_new_llazy(xtmp10,xtmp11)
    return xtmp3
  } // function // auxmain(9)
  {
    xtmp12 = auxmain_2184_(0)
  }
  return xtmp12
} // function // XATS2JS_jsarray_strmize(5)


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(2568(line=177,offs=1)--2588(line=177,offs=21))
// L1DCLnone1(...)


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(2617(line=180,offs=1)--2697(line=185,offs=33))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(2721(line=188,offs=1)--2902(line=201,offs=22))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(2903(line=202,offs=1)--3084(line=215,offs=22))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(3116(line=219,offs=1)--3198(line=224,offs=35))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(3222(line=227,offs=1)--3405(line=240,offs=22))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(3406(line=241,offs=1)--3589(line=254,offs=22))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(3621(line=258,offs=1)--3695(line=262,offs=29))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(3716(line=264,offs=1)--3899(line=276,offs=26))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(3900(line=277,offs=1)--4086(line=290,offs=26))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(4156(line=293,offs=1)--4251(line=298,offs=42))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(4275(line=301,offs=1)--4483(line=314,offs=28))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(4484(line=315,offs=1)--4692(line=328,offs=28))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(4829(line=343,offs=1)--4917(line=348,offs=35))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(4926(line=350,offs=1)--5021(line=355,offs=42))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(5048(line=359,offs=1)--5249(line=372,offs=28))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(5250(line=373,offs=1)--5451(line=386,offs=28))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(5455(line=388,offs=1)--5663(line=401,offs=28))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(5664(line=402,offs=1)--5872(line=415,offs=28))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(6015(line=429,offs=1)--6112(line=434,offs=44))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(6121(line=436,offs=1)--6225(line=441,offs=51))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(6252(line=445,offs=1)--6462(line=458,offs=28))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(6463(line=459,offs=1)--6673(line=472,offs=28))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(6677(line=474,offs=1)--6894(line=487,offs=28))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(6895(line=488,offs=1)--7112(line=501,offs=28))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(7136(line=504,offs=1)--7234(line=510,offs=30))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(7258(line=513,offs=1)--7521(line=530,offs=13))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/basics1.dats@(7585(line=533,offs=1)--7713(line=539,offs=53))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(67(line=6,offs=1)--123(line=8,offs=28))
// L1DCLnone1(...)


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(144(line=10,offs=1)--195(line=12,offs=28))
// L1DCLnone1(...)


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(196(line=13,offs=1)--253(line=15,offs=34))
// L1DCLnone1(...)


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(417(line=27,offs=1)--485(line=32,offs=24))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(494(line=34,offs=1)--566(line=39,offs=27))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(575(line=41,offs=1)--649(line=46,offs=27))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(653(line=48,offs=1)--699(line=49,offs=38))
function
XATS2JS_lazy_cfr(a1x1)
{
  let xtmp1
  let xtmp3
  xtmp3 = function () {
    let xtmp2
    {
      xtmp2 = a1x1()
    }
    return xtmp2 // lam-fun
  } // lam-function
  xtmp1 = XATS2JS_new_lazy(xtmp3)
  return xtmp1
} // function // XATS2JS_lazy_cfr(0)


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(700(line=50,offs=1)--748(line=51,offs=40))
function
XATS2JS_llazy_cfr(a1x1)
{
  let xtmp5
  let xtmp7
  let xtmp8
  xtmp7 = function () {
    let xtmp6
    {
      xtmp6 = a1x1()
    }
    return xtmp6 // lam-fun
  } // lam-function
  xtmp8 = function () {
    let xtmp6
  } // lam-function
  xtmp5 = XATS2JS_new_llazy(xtmp7,xtmp8)
  return xtmp5
} // function // XATS2JS_llazy_cfr(1)


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(749(line=52,offs=1)--799(line=53,offs=42))
function
XATS2JS_lazy_vt_cfr(a1x1)
{
  let xtmp10
  let xtmp12
  let xtmp13
  xtmp12 = function () {
    let xtmp11
    {
      xtmp11 = a1x1()
    }
    return xtmp11 // lam-fun
  } // lam-function
  xtmp13 = function () {
    let xtmp11
  } // lam-function
  xtmp10 = XATS2JS_new_llazy(xtmp12,xtmp13)
  return xtmp10
} // function // XATS2JS_lazy_vt_cfr(2)


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(881(line=62,offs=1)--931(line=64,offs=30))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(940(line=66,offs=1)--996(line=68,offs=35))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(1000(line=70,offs=1)--1040(line=71,offs=32))
function
XATS2JS_optn_nil()
{
  let xtmp14
  {
    xtmp14 = [1]
  }
  return xtmp14
} // function // XATS2JS_optn_nil(3)


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(1041(line=72,offs=1)--1087(line=73,offs=38))
function
XATS2JS_optn_cons(a1x1)
{
  let xtmp16
  {
    xtmp16 = [2, a1x1]
  }
  return xtmp16
} // function // XATS2JS_optn_cons(4)


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(1119(line=77,offs=1)--1230(line=83,offs=36))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(1231(line=84,offs=1)--1347(line=90,offs=9))
function
XATS2JS_optn_uncons_cfr(a1x1, a1x2, a1x3)
{
  let xtmp20
  let xtmp21
  let xtmp22
  {
    xtmp21 = 0;
    do {
    do {
      if(1!==XATS2JS_ctag(a1x1)) break;
      xtmp21 = 1;
    } while(false);
    if(xtmp21 > 0) break;
    do {
      if(2!==XATS2JS_ctag(a1x1)) break;
      //L1PCKany();
      xtmp21 = 2;
    } while(false);
    if(xtmp21 > 0) break;
    } while(false);
  } // case-patck0
  switch(xtmp21) {
    case 1:
    {
      xtmp20 = a1x2()
    }
    break;
    case 2:
    xtmp22 = a1x1[1]
    {
      xtmp20 = a1x3(xtmp22)
    }
    break;
    default: XATS2JS_matcherr0();
  } // case-switch
  return xtmp20
} // function // XATS2JS_optn_uncons_cfr(5)


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(1465(line=98,offs=1)--1526(line=101,offs=34))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(1535(line=103,offs=1)--1607(line=107,offs=36))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(1611(line=109,offs=1)--1659(line=110,offs=40))
function
XATS2JS_list_nil()
{
  let xtmp23
  {
    xtmp23 = [1]
  }
  return xtmp23
} // function // XATS2JS_list_nil(6)


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(1660(line=111,offs=1)--1714(line=112,offs=46))
function
XATS2JS_list_cons(a1x1, a1x2)
{
  let xtmp26
  {
    xtmp26 = [2, a1x1, a1x2]
  }
  return xtmp26
} // function // XATS2JS_list_cons(7)


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(1746(line=116,offs=1)--1877(line=124,offs=42))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(1878(line=125,offs=1)--2002(line=131,offs=9))
function
XATS2JS_list_uncons_cfr(a1x1, a1x2, a1x3)
{
  let xtmp30
  let xtmp31
  let xtmp32
  let xtmp33
  {
    xtmp31 = 0;
    do {
    do {
      if(1!==XATS2JS_ctag(a1x1)) break;
      xtmp31 = 1;
    } while(false);
    if(xtmp31 > 0) break;
    do {
      if(2!==XATS2JS_ctag(a1x1)) break;
      //L1PCKany();
      //L1PCKany();
      xtmp31 = 2;
    } while(false);
    if(xtmp31 > 0) break;
    } while(false);
  } // case-patck0
  switch(xtmp31) {
    case 1:
    {
      xtmp30 = a1x2()
    }
    break;
    case 2:
    xtmp32 = a1x1[1]
    xtmp33 = a1x1[2]
    {
      xtmp30 = a1x3(xtmp32, xtmp33)
    }
    break;
    default: XATS2JS_matcherr0();
  } // case-switch
  return xtmp30
} // function // XATS2JS_list_uncons_cfr(8)


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(2123(line=139,offs=1)--2190(line=142,offs=37))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(2199(line=144,offs=1)--2277(line=148,offs=39))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(2281(line=150,offs=1)--2335(line=151,offs=46))
function
XATS2JS_strmcon_nil()
{
  let xtmp34
  {
    xtmp34 = [1]
  }
  return xtmp34
} // function // XATS2JS_strmcon_nil(9)


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(2336(line=152,offs=1)--2396(line=153,offs=52))
function
XATS2JS_strmcon_cons(a1x1, a1x2)
{
  let xtmp37
  {
    xtmp37 = [2, a1x1, a1x2]
  }
  return xtmp37
} // function // XATS2JS_strmcon_cons(10)


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(2718(line=178,offs=1)--2849(line=186,offs=42))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(2850(line=187,offs=1)--2989(line=193,offs=9))
function
XATS2JS_strm_uncons_cfr(a1x1, a1x2, a1x3)
{
  let xtmp41
  let xtmp42
  let xtmp43
  let xtmp44
  let xtmp45
  xtmp42 = XATS2JS_lazy_eval(a1x1)
  {
    xtmp43 = 0;
    do {
    do {
      if(1!==XATS2JS_ctag(xtmp42)) break;
      xtmp43 = 1;
    } while(false);
    if(xtmp43 > 0) break;
    do {
      if(2!==XATS2JS_ctag(xtmp42)) break;
      //L1PCKany();
      //L1PCKany();
      xtmp43 = 2;
    } while(false);
    if(xtmp43 > 0) break;
    } while(false);
  } // case-patck0
  switch(xtmp43) {
    case 1:
    {
      xtmp41 = a1x2()
    }
    break;
    case 2:
    xtmp44 = xtmp42[1]
    xtmp45 = xtmp42[2]
    {
      xtmp41 = a1x3(xtmp44, xtmp45)
    }
    break;
    default: XATS2JS_matcherr0();
  } // case-switch
  return xtmp41
} // function // XATS2JS_strm_uncons_cfr(11)


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(3057(line=196,offs=1)--3168(line=202,offs=44))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(3169(line=203,offs=1)--3272(line=208,offs=9))
function
XATS2JS_streax_uncons_cfr(a1x1, a1x2)
{
  let xtmp48
  let xtmp49
  let xtmp50
  let xtmp51
  let xtmp52
  xtmp49 = XATS2JS_lazy_eval(a1x1)
  {
    xtmp50 = 0;
    do {
    do {
      if(1!==XATS2JS_ctag(xtmp49)) break;
      //L1PCKany();
      //L1PCKany();
      xtmp50 = 1;
    } while(false);
    if(xtmp50 > 0) break;
    } while(false);
  } // case-patck0
  switch(xtmp50) {
    case 1:
    xtmp51 = xtmp49[1]
    xtmp52 = xtmp49[2]
    {
      xtmp48 = a1x2(xtmp51, xtmp52)
    }
    break;
    default: XATS2JS_matcherr0();
  } // case-switch
  return xtmp48
} // function // XATS2JS_streax_uncons_cfr(12)


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(3395(line=216,offs=1)--3451(line=218,offs=33))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(3460(line=220,offs=1)--3522(line=222,offs=38))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(3526(line=224,offs=1)--3572(line=225,offs=38))
function
XATS2JS_optn_vt_nil()
{
  let xtmp53
  {
    xtmp53 = [1]
  }
  return xtmp53
} // function // XATS2JS_optn_vt_nil(13)


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(3573(line=226,offs=1)--3625(line=227,offs=44))
function
XATS2JS_optn_vt_cons(a1x1)
{
  let xtmp55
  {
    xtmp55 = [2, a1x1]
  }
  return xtmp55
} // function // XATS2JS_optn_vt_cons(14)


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(3657(line=231,offs=1)--3774(line=237,offs=36))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(3775(line=238,offs=1)--3903(line=244,offs=9))
function
XATS2JS_optn_vt_uncons_cfr(a1x1, a1x2, a1x3)
{
  let xtmp59
  let xtmp60
  let xtmp61
  {
    xtmp60 = 0;
    do {
    do {
      if(1!==XATS2JS_ctag(L1VALeval0(L1VALtmp(arg[1](56))))) break;
      xtmp60 = 1;
    } while(false);
    if(xtmp60 > 0) break;
    do {
      if(2!==XATS2JS_ctag(L1VALeval0(L1VALtmp(arg[1](56))))) break;
      //L1PCKany();
      xtmp60 = 2;
    } while(false);
    if(xtmp60 > 0) break;
    } while(false);
  } // case-patck0
  switch(xtmp60) {
    case 1:
    {
      xtmp59 = a1x2()
    }
    break;
    case 2:
    xtmp61 = L1VALeval0(L1VALtmp(arg[1](56)))[1]
    {
      xtmp59 = a1x3(xtmp61)
    }
    break;
    default: XATS2JS_matcherr0();
  } // case-switch
  return xtmp59
} // function // XATS2JS_optn_vt_uncons_cfr(15)


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(4027(line=252,offs=1)--4094(line=255,offs=37))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(4103(line=257,offs=1)--4184(line=261,offs=42))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(4188(line=263,offs=1)--4242(line=264,offs=46))
function
XATS2JS_list_vt_nil()
{
  let xtmp62
  {
    xtmp62 = [1]
  }
  return xtmp62
} // function // XATS2JS_list_vt_nil(16)


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(4243(line=265,offs=1)--4303(line=266,offs=52))
function
XATS2JS_list_vt_cons(a1x1, a1x2)
{
  let xtmp65
  {
    xtmp65 = [2, a1x1, a1x2]
  }
  return xtmp65
} // function // XATS2JS_list_vt_cons(17)


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(4335(line=270,offs=1)--4475(line=278,offs=45))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(4476(line=279,offs=1)--4612(line=285,offs=9))
function
XATS2JS_list_vt_uncons_cfr(a1x1, a1x2, a1x3)
{
  let xtmp69
  let xtmp70
  let xtmp71
  let xtmp72
  {
    xtmp70 = 0;
    do {
    do {
      if(1!==XATS2JS_ctag(L1VALeval0(L1VALtmp(arg[1](66))))) break;
      xtmp70 = 1;
    } while(false);
    if(xtmp70 > 0) break;
    do {
      if(2!==XATS2JS_ctag(L1VALeval0(L1VALtmp(arg[1](66))))) break;
      //L1PCKany();
      //L1PCKany();
      xtmp70 = 2;
    } while(false);
    if(xtmp70 > 0) break;
    } while(false);
  } // case-patck0
  switch(xtmp70) {
    case 1:
    {
      xtmp69 = a1x2()
    }
    break;
    case 2:
    xtmp71 = L1VALeval0(L1VALtmp(arg[1](66)))[1]
    xtmp72 = L1VALeval0(L1VALtmp(arg[1](66)))[2]
    {
      xtmp69 = a1x3(xtmp71, xtmp72)
    }
    break;
    default: XATS2JS_matcherr0();
  } // case-switch
  return xtmp69
} // function // XATS2JS_list_vt_uncons_cfr(18)


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(5053(line=314,offs=1)--5126(line=317,offs=40))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(5135(line=319,offs=1)--5222(line=323,offs=45))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(5226(line=325,offs=1)--5286(line=326,offs=52))
function
XATS2JS_strmcon_vt_nil()
{
  let xtmp73
  {
    xtmp73 = [1]
  }
  return xtmp73
} // function // XATS2JS_strmcon_vt_nil(19)


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(5287(line=327,offs=1)--5353(line=328,offs=58))
function
XATS2JS_strmcon_vt_cons(a1x1, a1x2)
{
  let xtmp76
  {
    xtmp76 = [2, a1x1, a1x2]
  }
  return xtmp76
} // function // XATS2JS_strmcon_vt_cons(20)


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(5385(line=332,offs=1)--5525(line=340,offs=45))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(5526(line=341,offs=1)--5676(line=347,offs=9))
function
XATS2JS_strm_vt_uncons_cfr(a1x1, a1x2, a1x3)
{
  let xtmp80
  let xtmp81
  let xtmp82
  let xtmp83
  let xtmp84
  xtmp81 = XATS2JS_llazy_eval(a1x1)
  {
    xtmp82 = 0;
    do {
    do {
      if(1!==XATS2JS_ctag(xtmp81)) break;
      xtmp82 = 1;
    } while(false);
    if(xtmp82 > 0) break;
    do {
      if(2!==XATS2JS_ctag(xtmp81)) break;
      //L1PCKany();
      //L1PCKany();
      xtmp82 = 2;
    } while(false);
    if(xtmp82 > 0) break;
    } while(false);
  } // case-patck0
  switch(xtmp82) {
    case 1:
    {
      xtmp80 = a1x2()
    }
    break;
    case 2:
    xtmp83 = xtmp81[1]
    xtmp84 = xtmp81[2]
    {
      xtmp80 = a1x3(xtmp83, xtmp84)
    }
    break;
    default: XATS2JS_matcherr0();
  } // case-switch
  return xtmp80
} // function // XATS2JS_strm_vt_uncons_cfr(21)


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(5747(line=350,offs=1)--5867(line=356,offs=47))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(5868(line=357,offs=1)--5978(line=362,offs=9))
function
XATS2JS_streax_vt_uncons_cfr(a1x1, a1x2)
{
  let xtmp87
  let xtmp88
  let xtmp89
  let xtmp90
  let xtmp91
  xtmp88 = XATS2JS_llazy_eval(a1x1)
  {
    xtmp89 = 0;
    do {
    do {
      if(1!==XATS2JS_ctag(xtmp88)) break;
      //L1PCKany();
      //L1PCKany();
      xtmp89 = 1;
    } while(false);
    if(xtmp89 > 0) break;
    } while(false);
  } // case-patck0
  switch(xtmp89) {
    case 1:
    xtmp90 = xtmp88[1]
    xtmp91 = xtmp88[2]
    {
      xtmp87 = a1x2(xtmp90, xtmp91)
    }
    break;
    default: XATS2JS_matcherr0();
  } // case-switch
  return xtmp87
} // function // XATS2JS_streax_vt_uncons_cfr(22)


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(6052(line=366,offs=1)--6161(line=371,offs=47))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(6162(line=372,offs=1)--6294(line=381,offs=9))
function
XATS2JS_strm_vt_map0_cfr(a1x1, a1x2)
{
  let xtmp94
// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(6253(line=380,offs=1)--6292(line=380,offs=40))
// L1DCLnone0()
  {
// /home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats@(9660(line=744,offs=1)--10041(line=776,offs=9))
    function
    strm_vt_map0_568183_4616_(a2x1)
    {
      let xtmp112
// /home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats@(9726(line=752,offs=1)--10005(line=775,offs=12))
      function
      auxmain_9729_(a3x1)
      {
        let xtmp97
        let xtmp110
        let xtmp111
        xtmp110 = function () {
          let xtmp98
          let xtmp99
          let xtmp100
          let xtmp101
          let xtmp102
          let xtmp103
          let xtmp106
          let xtmp107
          let xtmp108
          xtmp99 = XATS2JS_llazy_eval(a3x1)
          {
            xtmp100 = 0;
            do {
            do {
              if(1!==XATS2JS_ctag(xtmp99)) break;
              xtmp100 = 1;
            } while(false);
            if(xtmp100 > 0) break;
            do {
              if(2!==XATS2JS_ctag(xtmp99)) break;
              //L1PCKany();
              //L1PCKany();
              xtmp100 = 2;
            } while(false);
            if(xtmp100 > 0) break;
            } while(false);
          } // case-patck0
          switch(xtmp100) {
            case 1:
            {
              xtmp98 = [1]
            }
            break;
            case 2:
            xtmp101 = xtmp99[1]
            xtmp102 = xtmp99[2]
// /home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats@(9901(line=770,offs=3)--9933(line=771,offs=24))
            {
              {
// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(6253(line=380,offs=1)--6292(line=380,offs=40))
                function
                map0$fopr_568183_2934_(a5x1)
                {
                  let xtmp105
                  {
                    xtmp105 = a1x2(a5x1)
                  }
                  return xtmp105
                } // function // map0$fopr(24)
                xtmp103 = map0$fopr_568183_2934_(xtmp101)
              }
            } // val(H0Pvar(y0(95)))
            {
              {
                xtmp107 = auxmain_9729_(xtmp102)
              }
              xtmp106 = [2, xtmp103, xtmp107]
            }
            xtmp98 = xtmp106
            break;
            default: XATS2JS_matcherr0();
          } // case-switch
          return xtmp98 // lam-fun
        } // lam-function
        xtmp111 = function () {
          let xtmp98
          let xtmp99
          let xtmp100
          let xtmp101
          let xtmp102
          let xtmp103
          let xtmp106
          let xtmp107
          let xtmp108
          {
// /home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats@(25288(line=1961,offs=1)--25340(line=1963,offs=37))
            // { // val-implmnt
// /home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats@(1792(line=150,offs=1)--1842(line=152,offs=31))
            function
            strm_vt_free_568183_2268_(a5x1)
            {
              return XATS2JS_llazy_free(a5x1)
            } // function // strm_vt_free(28)
            // } // val-implmnt
            var // const // implval/fun
            g_free_568183_1640_ = strm_vt_free_568183_2268_
            xtmp108 = strm_vt_free_568183_2268_(a3x1)
          }
        } // lam-function
        xtmp97 = XATS2JS_new_llazy(xtmp110,xtmp111)
        return xtmp97
      } // function // auxmain(26)
      {
        xtmp112 = auxmain_9729_(a2x1)
      }
      return xtmp112
    } // function // strm_vt_map0(25)
    xtmp94 = strm_vt_map0_568183_4616_(a1x1)
  }
  return xtmp94
} // function // XATS2JS_strm_vt_map0_cfr(23)


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(6365(line=386,offs=1)--6471(line=390,offs=49))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(6472(line=391,offs=1)--6653(line=404,offs=9))
function
XATS2JS_strm_vt_filter0_cfr(a1x1, a1x2)
{
  let xtmp115
// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(6565(line=399,offs=3)--6595(line=400,offs=22))
// L1DCLnone0()
// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(6610(line=402,offs=3)--6648(line=402,offs=41))
// L1DCLnone0()
  {
// /home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats@(10105(line=780,offs=1)--10587(line=823,offs=13))
    function
    strm_vt_filter0_568183_4738_(a2x1)
    {
      let xtmp138
// /home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats@(10177(line=788,offs=1)--10582(line=821,offs=8))
      function
      auxmain_10180_(a3x1)
      {
        let a3y1;
        let xtmp118
        let xtmp122
        let xtmp123
        do {
        xtmp122 = function () {
          let xtmp119
          let xtmp120
          {
            xtmp119 = auxloop_10265_(a3x1)
          }
          return xtmp119 // lam-fun
        } // lam-function
        xtmp123 = function () {
          let xtmp119
          let xtmp120
          {
// /home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats@(25288(line=1961,offs=1)--25340(line=1963,offs=37))
            // { // val-implmnt
// /home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats@(1792(line=150,offs=1)--1842(line=152,offs=31))
            function
            strm_vt_free_568183_2268_(a5x1)
            {
              return XATS2JS_llazy_free(a5x1)
            } // function // strm_vt_free(28)
            // } // val-implmnt
            var // const // implval/fun
            g_free_568183_1640_ = strm_vt_free_568183_2268_
            xtmp120 = strm_vt_free_568183_2268_(a3x1)
          }
        } // lam-function
        xtmp118 = XATS2JS_new_llazy(xtmp122,xtmp123)
        break;//return
        } while( true );
        return xtmp118
      } // function // auxmain(32)
      function
      auxloop_10265_(a3x1)
      {
        let a3y1;
        let xtmp125
        let xtmp126
        let xtmp127
        let xtmp128
        let xtmp129
        let xtmp130
        let xtmp133
        let xtmp134
        let xtmp137
        do {
        xtmp126 = XATS2JS_llazy_eval(a3x1)
        {
          xtmp127 = 0;
          do {
          do {
            if(1!==XATS2JS_ctag(xtmp126)) break;
            xtmp127 = 1;
          } while(false);
          if(xtmp127 > 0) break;
          do {
            if(2!==XATS2JS_ctag(xtmp126)) break;
            //L1PCKany();
            //L1PCKany();
            xtmp127 = 2;
          } while(false);
          if(xtmp127 > 0) break;
          } while(false);
        } // case-patck0
        switch(xtmp127) {
          case 1:
          {
            xtmp125 = [1]
          }
          break;
          case 2:
          xtmp128 = xtmp126[1]
          xtmp129 = xtmp126[2]
          {
// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(6610(line=402,offs=3)--6648(line=402,offs=41))
            function
            filter0$test_568183_3783_(a4x1)
            {
              let xtmp132
              {
                xtmp132 = a1x2(a4x1)
              }
              return xtmp132
            } // function // filter0$test(30)
            xtmp130 = filter0$test_568183_3783_(xtmp128)
          }
          if (xtmp130)
          { // then
            {
              {
                xtmp133 = auxmain_10180_(xtmp129)
              }
              xtmp125 = [2, xtmp128, xtmp133]
            }
} // if-then
          else
          { // else
// /home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats@(10492(line=818,offs=3)--10511(line=818,offs=22))
            {
              {
// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(6565(line=399,offs=3)--6595(line=400,offs=22))
                function
                g_free_568183_1640_(a4x1)
                {
                  let xtmp136
                  {
                    xtmp136 = [-1]
                  }
                  return xtmp136
                } // function // g_free(27)
                xtmp134 = g_free_568183_1640_(xtmp128)
              }
              //L1PCKxpat(H0Pnil(); L1VALtmp(tmp(134)));
              //L1CMDmatch(H0Pnil(); L1VALtmp(tmp(134)));
            } // val(H0Pnil())
            {
              // tail-recursion:
              // L1CMDapp(tmp(137); L1VALfcst(auxloop(33)); L1VALtmp(tmp(129)));
              a3y1 = xtmp129; a3x1 = a3y1; continue
            }
            xtmp125 = xtmp137
          } // if-else
          break;
          default: XATS2JS_matcherr0();
        } // case-switch
        break;//return
        } while( true );
        return xtmp125
      } // function // auxloop(33)
      {
        xtmp138 = auxmain_10180_(a2x1)
      }
      return xtmp138
    } // function // strm_vt_filter0(31)
    xtmp115 = strm_vt_filter0_568183_4738_(a1x1)
  }
  return xtmp115
} // function // XATS2JS_strm_vt_filter0_cfr(29)


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(6945(line=428,offs=1)--6985(line=430,offs=23))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(7014(line=433,offs=1)--7078(line=437,offs=31))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(7079(line=438,offs=1)--7129(line=440,offs=33))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(7158(line=443,offs=1)--7233(line=448,offs=31))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(7234(line=449,offs=1)--7284(line=451,offs=33))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(7313(line=454,offs=1)--7377(line=458,offs=30))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(7378(line=459,offs=1)--7430(line=461,offs=35))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(7459(line=464,offs=1)--7528(line=469,offs=26))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(7529(line=470,offs=1)--7581(line=472,offs=37))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(7610(line=475,offs=1)--7677(line=480,offs=25))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(7678(line=481,offs=1)--7740(line=483,offs=45))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(7811(line=490,offs=1)--7855(line=492,offs=27))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(7865(line=494,offs=1)--7910(line=496,offs=28))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(7917(line=497,offs=1)--7962(line=499,offs=28))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(8000(line=503,offs=1)--8089(line=509,offs=35))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(8090(line=510,offs=1)--8144(line=512,offs=37))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(8176(line=516,offs=1)--8266(line=522,offs=32))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(8267(line=523,offs=1)--8323(line=525,offs=39))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(8335(line=528,offs=1)--8425(line=534,offs=32))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(8426(line=535,offs=1)--8482(line=537,offs=39))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(8517(line=542,offs=1)--8625(line=549,offs=34))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(8626(line=550,offs=1)--8682(line=552,offs=39))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(8694(line=555,offs=1)--8802(line=562,offs=34))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(8803(line=563,offs=1)--8859(line=565,offs=39))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(8894(line=570,offs=1)--9007(line=577,offs=34))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(9008(line=578,offs=1)--9072(line=580,offs=47))
// L1DCLnone0()


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(9107(line=585,offs=1)--9199(line=591,offs=33))


// ./../../../../prelude/DATS/CATS/JS/prelude.dats@(9200(line=592,offs=1)--9258(line=594,offs=41))
// L1DCLnone0()


