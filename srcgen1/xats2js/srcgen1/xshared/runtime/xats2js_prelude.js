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
XATS2JS_a0ptr_make0_1val
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
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
//
// prelude/unsafex.sats
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
XATS2JS_gint_print$sint
  (x0)
{
XATS2JS_g_print(x0);
return; // gint_print$sint
}
function
XATS2JS_gint_print$uint
  (x0)
{
XATS2JS_g_print(x0);
return; // gint_print$uint
}
/* ****** ****** */
function
XATS2JS_gflt_print$sflt
  (x0)
{
XATS2JS_g_print(x0);
return; // gint_print$sflt
}
function
XATS2JS_gflt_print$dflt
  (x0)
{
XATS2JS_g_print(x0);
return; // gint_print$dflt
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
XATS2JS_jsobj_get$at
  (obj, key)
{
  return obj[ key ];
}
function
XATS2JS_jsobj_set$at
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
XATS2JS_jsarray_get$at
  (xs, i0)
{
  return xs[i0];
}
function
XATS2JS_jsarray_set$at
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
XATS2JS_jsobjmap_search$opt
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
} // [ XATS2JS_jsobjmap_search$opt ]

/* ****** ****** */

function
XATS2JS_jsobjmap_insert$any
   (obj, key, itm1)
{
  obj[key] = itm1; return;
} // [XATS2JS_jsobjmap_insert$any]

function
XATS2JS_jsobjmap_remove$any
   (obj, key)
{
  delete object[key]; return ;
} // [XATS2JS_jsobjmap_remove$any]

/* ****** ****** */

function
XATS2JS_jsobjmap_insert$opt
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
} // [ XATS2JS_jsobjmap_insert$opt ]

function
XATS2JS_jsobjmap_remove$opt
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
} // [ XATS2JS_jsobjmap_remove$opt ]

////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////

/* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_basics1.cats] */
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
/*
HX-2024-08-08:
JS code for xatsopt
Thu 08 Aug 2024 10:42:49 PM EDT
*/
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
//
function
XATSOPT_strn_append_uint
  (name, stmp)
{
  return name + stmp.toString();
}
//
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
//end-of-[ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_xatsopt.cats]
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////  
// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(108(line=9,offs=1)--174(line=12,offs=28))
// L1DCLnone1(...)


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(263(line=21,offs=1)--335(line=27,offs=24))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(339(line=29,offs=1)--377(line=30,offs=30))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(412(line=35,offs=1)--505(line=43,offs=26))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(514(line=45,offs=1)--607(line=53,offs=26))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(611(line=55,offs=1)--649(line=56,offs=30))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(650(line=57,offs=1)--688(line=58,offs=30))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(808(line=70,offs=1)--858(line=72,offs=30))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(862(line=74,offs=1)--917(line=76,offs=30))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(918(line=77,offs=1)--973(line=79,offs=30))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(974(line=80,offs=1)--1029(line=82,offs=30))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(1074(line=87,offs=1)--1129(line=89,offs=30))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(1161(line=93,offs=1)--1222(line=96,offs=30))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(1223(line=97,offs=1)--1261(line=98,offs=30))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(1290(line=101,offs=1)--1339(line=103,offs=29))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(1340(line=104,offs=1)--1378(line=105,offs=30))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(1387(line=107,offs=1)--1437(line=109,offs=29))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(1438(line=110,offs=1)--1478(line=111,offs=32))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(1507(line=114,offs=1)--1570(line=117,offs=30))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(1571(line=118,offs=1)--1613(line=119,offs=34))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(1622(line=121,offs=1)--1685(line=124,offs=30))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(1686(line=125,offs=1)--1728(line=126,offs=34))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(1760(line=130,offs=1)--1815(line=132,offs=31))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(1824(line=134,offs=1)--1879(line=136,offs=31))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(1883(line=138,offs=1)--1929(line=139,offs=38))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(1930(line=140,offs=1)--1976(line=141,offs=38))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(2011(line=146,offs=1)--2066(line=148,offs=31))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(2075(line=150,offs=1)--2130(line=152,offs=31))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(2134(line=154,offs=1)--2180(line=155,offs=38))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(2181(line=156,offs=1)--2227(line=157,offs=38))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(2262(line=162,offs=1)--2317(line=164,offs=31))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(2326(line=166,offs=1)--2381(line=168,offs=31))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(2385(line=170,offs=1)--2431(line=171,offs=38))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(2432(line=172,offs=1)--2478(line=173,offs=38))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(2513(line=178,offs=1)--2569(line=180,offs=31))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(2578(line=182,offs=1)--2634(line=184,offs=31))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(2638(line=186,offs=1)--2686(line=187,offs=40))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(2687(line=188,offs=1)--2735(line=189,offs=40))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(2824(line=198,offs=1)--2883(line=200,offs=33))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(2892(line=202,offs=1)--2951(line=204,offs=33))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(2955(line=206,offs=1)--3005(line=208,offs=23))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(3020(line=209,offs=1)--3070(line=211,offs=23))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(3119(line=216,offs=1)--3179(line=218,offs=33))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(3188(line=220,offs=1)--3248(line=222,offs=33))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(3252(line=224,offs=1)--3304(line=225,offs=44))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(3305(line=226,offs=1)--3357(line=227,offs=44))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(3392(line=232,offs=1)--3463(line=236,offs=33))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(3464(line=237,offs=1)--3512(line=238,offs=40))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(3547(line=243,offs=1)--3622(line=247,offs=37))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(3623(line=248,offs=1)--3671(line=249,offs=40))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(3706(line=254,offs=1)--3778(line=258,offs=34))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(3787(line=260,offs=1)--3859(line=264,offs=34))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(3860(line=265,offs=1)--3908(line=266,offs=40))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(3909(line=267,offs=1)--3957(line=268,offs=40))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(3992(line=273,offs=1)--4064(line=277,offs=34))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(4073(line=279,offs=1)--4149(line=283,offs=34))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(4150(line=284,offs=1)--4198(line=285,offs=40))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(4199(line=286,offs=1)--4247(line=287,offs=40))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(4282(line=292,offs=1)--4342(line=294,offs=34))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(4351(line=296,offs=1)--4411(line=298,offs=34))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(4420(line=300,offs=1)--4480(line=302,offs=34))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(4489(line=304,offs=1)--4549(line=306,offs=34))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(4553(line=308,offs=1)--4603(line=309,offs=42))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(4604(line=310,offs=1)--4654(line=311,offs=42))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(4655(line=312,offs=1)--4705(line=313,offs=42))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(4706(line=314,offs=1)--4756(line=315,offs=42))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(4791(line=320,offs=1)--4853(line=322,offs=36))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(4862(line=324,offs=1)--4924(line=326,offs=36))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(4933(line=328,offs=1)--4995(line=330,offs=36))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(4999(line=332,offs=1)--5049(line=333,offs=42))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(5050(line=334,offs=1)--5100(line=335,offs=42))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(5101(line=336,offs=1)--5151(line=337,offs=42))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(5186(line=342,offs=1)--5277(line=348,offs=34))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(5278(line=349,offs=1)--5334(line=350,offs=48))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(5343(line=352,offs=1)--5434(line=358,offs=34))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(5435(line=359,offs=1)--5491(line=360,offs=48))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(5526(line=365,offs=1)--5617(line=371,offs=34))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(5618(line=372,offs=1)--5674(line=373,offs=48))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(5683(line=375,offs=1)--5774(line=381,offs=34))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(5775(line=382,offs=1)--5831(line=383,offs=48))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(5866(line=388,offs=1)--5957(line=394,offs=34))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(5958(line=395,offs=1)--6014(line=396,offs=48))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(6023(line=398,offs=1)--6114(line=404,offs=34))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(6115(line=405,offs=1)--6171(line=406,offs=48))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(6206(line=411,offs=1)--6299(line=417,offs=35))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(6300(line=418,offs=1)--6358(line=419,offs=50))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(6367(line=421,offs=1)--6460(line=427,offs=35))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(6461(line=428,offs=1)--6519(line=429,offs=50))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(6554(line=434,offs=1)--6647(line=440,offs=35))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(6648(line=441,offs=1)--6706(line=442,offs=50))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(6715(line=444,offs=1)--6808(line=450,offs=35))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(6809(line=451,offs=1)--6867(line=452,offs=50))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(6902(line=457,offs=1)--6995(line=463,offs=35))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(6996(line=464,offs=1)--7054(line=465,offs=50))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(7063(line=467,offs=1)--7156(line=473,offs=35))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(7157(line=474,offs=1)--7215(line=475,offs=50))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(7248(line=480,offs=1)--7354(line=487,offs=37))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(7355(line=488,offs=1)--7413(line=489,offs=50))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(7423(line=492,offs=1)--7529(line=499,offs=37))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(7530(line=500,offs=1)--7588(line=501,offs=50))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(7621(line=506,offs=1)--7715(line=512,offs=36))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(7716(line=513,offs=1)--7774(line=514,offs=50))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(7783(line=516,offs=1)--7877(line=522,offs=36))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(7878(line=523,offs=1)--7936(line=524,offs=50))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(7948(line=527,offs=1)--8042(line=533,offs=36))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(8043(line=534,offs=1)--8101(line=535,offs=50))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(8110(line=537,offs=1)--8204(line=543,offs=36))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(8205(line=544,offs=1)--8263(line=545,offs=50))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(8272(line=547,offs=1)--8369(line=553,offs=39))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(8370(line=554,offs=1)--8428(line=555,offs=50))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(8463(line=560,offs=1)--8557(line=566,offs=36))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(8558(line=567,offs=1)--8616(line=568,offs=50))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(8625(line=570,offs=1)--8728(line=576,offs=36))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(8729(line=577,offs=1)--8787(line=578,offs=50))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(8877(line=587,offs=1)--8932(line=589,offs=31))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(8933(line=590,offs=1)--8979(line=591,offs=38))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(9014(line=596,offs=1)--9072(line=598,offs=33))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(9073(line=599,offs=1)--9121(line=600,offs=40))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(9133(line=603,offs=1)--9191(line=605,offs=33))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(9192(line=606,offs=1)--9240(line=607,offs=40))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(9275(line=612,offs=1)--9333(line=614,offs=33))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(9334(line=615,offs=1)--9382(line=616,offs=40))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(9391(line=618,offs=1)--9449(line=620,offs=33))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(9450(line=621,offs=1)--9498(line=622,offs=40))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(9533(line=627,offs=1)--9603(line=629,offs=41))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(9612(line=631,offs=1)--9682(line=633,offs=41))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(9691(line=635,offs=1)--9761(line=637,offs=41))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(9770(line=639,offs=1)--9841(line=641,offs=41))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(9850(line=643,offs=1)--9921(line=645,offs=41))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(9930(line=647,offs=1)--10001(line=649,offs=41))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(10005(line=651,offs=1)--10061(line=652,offs=48))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(10062(line=653,offs=1)--10118(line=654,offs=48))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(10119(line=655,offs=1)--10175(line=656,offs=48))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(10176(line=657,offs=1)--10234(line=658,offs=50))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(10235(line=659,offs=1)--10293(line=660,offs=50))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(10294(line=661,offs=1)--10352(line=662,offs=50))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(10387(line=667,offs=1)--10458(line=669,offs=41))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(10459(line=670,offs=1)--10517(line=671,offs=50))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(10552(line=676,offs=1)--10623(line=678,offs=41))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(10632(line=680,offs=1)--10703(line=682,offs=41))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(10712(line=684,offs=1)--10783(line=686,offs=41))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(10792(line=688,offs=1)--10863(line=690,offs=41))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(10867(line=692,offs=1)--10925(line=693,offs=50))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(10926(line=694,offs=1)--10984(line=695,offs=50))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(10985(line=696,offs=1)--11043(line=697,offs=50))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(11044(line=698,offs=1)--11102(line=699,offs=50))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(11189(line=709,offs=1)--11300(line=719,offs=18))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(11324(line=722,offs=1)--11442(line=731,offs=20))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(11443(line=732,offs=1)--11564(line=741,offs=21))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(11591(line=745,offs=1)--11704(line=755,offs=16))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(11705(line=756,offs=1)--11818(line=766,offs=16))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(11819(line=767,offs=1)--11932(line=777,offs=16))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(11959(line=781,offs=1)--12075(line=791,offs=17))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(12076(line=792,offs=1)--12192(line=802,offs=17))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(12193(line=803,offs=1)--12309(line=813,offs=17))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(12333(line=816,offs=1)--12449(line=826,offs=17))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(12493(line=830,offs=1)--12626(line=840,offs=22))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(12630(line=842,offs=1)--12763(line=852,offs=22))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(12810(line=857,offs=1)--12944(line=868,offs=20))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(12971(line=872,offs=1)--13092(line=881,offs=22))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(13119(line=885,offs=1)--13236(line=894,offs=20))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(13263(line=898,offs=1)--13478(line=913,offs=9))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(13558(line=918,offs=1)--13690(line=927,offs=24))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(13717(line=931,offs=1)--13863(line=942,offs=23))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(13890(line=946,offs=1)--14036(line=956,offs=23))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(14063(line=960,offs=1)--14217(line=970,offs=25))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(14264(line=975,offs=1)--14397(line=984,offs=24))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(14398(line=985,offs=1)--14531(line=994,offs=24))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(14578(line=999,offs=1)--14790(line=1012,offs=28))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(14855(line=1016,offs=1)--15067(line=1029,offs=28))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(15132(line=1033,offs=1)--15348(line=1046,offs=29))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(15414(line=1050,offs=1)--15630(line=1063,offs=29))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(91(line=8,offs=1)--110(line=9,offs=11))
// L1DCLnone1(...)


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(119(line=10,offs=1)--146(line=11,offs=19))
// L1DCLnone1(...)


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(173(line=15,offs=1)--201(line=16,offs=20))
// L1DCLnone1(...)


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(202(line=17,offs=1)--233(line=18,offs=23))
// L1DCLnone1(...)


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(354(line=28,offs=1)--391(line=30,offs=15))
// L1DCLnone1(...)


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(395(line=32,offs=1)--428(line=33,offs=25))
// L1DCLnone1(...)


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(519(line=42,offs=1)--548(line=42,offs=30))
// L1DCLnone1(...)


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(623(line=50,offs=1)--696(line=55,offs=29))


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(705(line=57,offs=1)--790(line=63,offs=32))


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(794(line=65,offs=1)--831(line=66,offs=29))
// L1DCLnone1(...)


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(832(line=67,offs=1)--869(line=68,offs=29))
// L1DCLnone1(...)


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(870(line=69,offs=1)--911(line=70,offs=33))
// L1DCLnone1(...)


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(912(line=71,offs=1)--953(line=72,offs=33))
// L1DCLnone1(...)


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(1031(line=80,offs=1)--1103(line=84,offs=33))


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(1132(line=87,offs=1)--1220(line=92,offs=35))


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(1229(line=94,offs=1)--1322(line=99,offs=38))


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(1343(line=101,offs=1)--1392(line=102,offs=36))
// L1DCLnone1(...)


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(1393(line=103,offs=1)--1444(line=104,offs=36))
// L1DCLnone1(...)


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(1465(line=106,offs=1)--1512(line=107,offs=36))
// L1DCLnone1(...)


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(1513(line=108,offs=1)--1560(line=109,offs=36))
// L1DCLnone1(...)


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(1581(line=111,offs=1)--1632(line=112,offs=36))
// L1DCLnone1(...)


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(1633(line=113,offs=1)--1684(line=114,offs=36))
// L1DCLnone1(...)


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(1716(line=118,offs=1)--1796(line=122,offs=40))


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(1883(line=130,offs=1)--1960(line=135,offs=22))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(1981(line=137,offs=1)--2062(line=141,offs=28))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(2086(line=144,offs=1)--2471(line=173,offs=14))
function
XATS2JS_jsarray_strmize(a1x1)
{
  let xtmp1
  let xtmp12
// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(2167(line=152,offs=3)--2186(line=152,offs=22))
  {
    {
      xtmp1 = XATS2JS_jsarray_length(a1x1)
    }
  } // val(H0Pvar(n0(11)))
// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(2192(line=154,offs=3)--2443(line=171,offs=10))
  function
  auxmain_2197_(a2x1)
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
// ./../../../../prelude/DATS/CATS/JS/./basics0.dats@(6648(line=441,offs=1)--6706(line=442,offs=50))
        // { // val-implmnt
        // } // val-implmnt
        var // const // implval/fun
        gint_gte$sint$sint_978453_3667_ = XATS2JS_gint_gte$sint$sint
        xtmp5 = XATS2JS_gint_gte$sint$sint(a2x1, xtmp1)
      }
      if (xtmp5)
      { // then
        {
          xtmp4 = [1]
        }
      } // if-then
      else
      { // else
// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(2344(line=167,offs=7)--2366(line=167,offs=29))
        {
          {
            xtmp6 = XATS2JS_jsarray_get$at(a1x1, a2x1)
          }
        } // val(H0Pvar(x0(14)))
        {
          {
            {
// ./../../../../prelude/DATS/CATS/JS/./basics0.dats@(7716(line=513,offs=1)--7774(line=514,offs=50))
              // { // val-implmnt
              // } // val-implmnt
              var // const // implval/fun
              gint_add$sint$sint_978453_4862_ = XATS2JS_gint_add$sint$sint
              xtmp9 = XATS2JS_gint_add$sint$sint(a2x1, 1)
            }
            xtmp8 = auxmain_2197_(xtmp9)
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
    xtmp12 = auxmain_2197_(0)
  }
  return xtmp12
} // function // XATS2JS_jsarray_strmize(5)


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(2581(line=180,offs=1)--2601(line=180,offs=21))
// L1DCLnone1(...)


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(2630(line=183,offs=1)--2710(line=188,offs=33))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(2734(line=191,offs=1)--2915(line=204,offs=22))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(2916(line=205,offs=1)--3097(line=218,offs=22))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(3132(line=223,offs=1)--3214(line=228,offs=35))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(3241(line=232,offs=1)--3424(line=245,offs=22))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(3425(line=246,offs=1)--3608(line=259,offs=22))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(3640(line=263,offs=1)--3714(line=267,offs=29))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(3735(line=269,offs=1)--3918(line=281,offs=26))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(3919(line=282,offs=1)--4105(line=295,offs=26))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(4175(line=298,offs=1)--4270(line=303,offs=42))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(4294(line=306,offs=1)--4502(line=319,offs=28))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(4503(line=320,offs=1)--4711(line=333,offs=28))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(4848(line=348,offs=1)--4936(line=353,offs=35))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(4945(line=355,offs=1)--5040(line=360,offs=42))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(5067(line=364,offs=1)--5268(line=377,offs=28))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(5269(line=378,offs=1)--5470(line=391,offs=28))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(5474(line=393,offs=1)--5682(line=406,offs=28))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(5683(line=407,offs=1)--5891(line=420,offs=28))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(6034(line=434,offs=1)--6131(line=439,offs=44))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(6140(line=441,offs=1)--6244(line=446,offs=51))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(6271(line=450,offs=1)--6481(line=463,offs=28))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(6482(line=464,offs=1)--6692(line=477,offs=28))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(6696(line=479,offs=1)--6913(line=492,offs=28))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(6914(line=493,offs=1)--7131(line=506,offs=28))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(7155(line=509,offs=1)--7254(line=515,offs=31))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(7278(line=518,offs=1)--7543(line=535,offs=13))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/basics1.dats@(7608(line=538,offs=1)--7737(line=544,offs=53))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(67(line=6,offs=1)--133(line=9,offs=28))
// L1DCLnone1(...)


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(154(line=11,offs=1)--205(line=13,offs=28))
// L1DCLnone1(...)


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(206(line=14,offs=1)--263(line=16,offs=34))
// L1DCLnone1(...)


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(427(line=28,offs=1)--504(line=33,offs=24))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(513(line=35,offs=1)--594(line=40,offs=27))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(603(line=42,offs=1)--686(line=47,offs=27))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(690(line=49,offs=1)--737(line=50,offs=39))
function
XATS2JS_lazy_f0un(a1x1)
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
} // function // XATS2JS_lazy_f0un(0)


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(738(line=51,offs=1)--787(line=52,offs=41))
function
XATS2JS_llazy_f0un(a1x1)
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
} // function // XATS2JS_llazy_f0un(1)


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(788(line=53,offs=1)--839(line=54,offs=43))
function
XATS2JS_lazy_vt_f0un(a1x1)
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
} // function // XATS2JS_lazy_vt_f0un(2)


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(921(line=63,offs=1)--971(line=65,offs=30))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(980(line=67,offs=1)--1036(line=69,offs=35))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(1040(line=71,offs=1)--1080(line=72,offs=32))
function
XATS2JS_optn_nil()
{
  let xtmp14
  {
    xtmp14 = [1]
  }
  return xtmp14
} // function // XATS2JS_optn_nil(3)


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(1081(line=73,offs=1)--1127(line=74,offs=38))
function
XATS2JS_optn_cons(a1x1)
{
  let xtmp16
  {
    xtmp16 = [2, a1x1]
  }
  return xtmp16
} // function // XATS2JS_optn_cons(4)


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(1162(line=79,offs=1)--1274(line=85,offs=36))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(1275(line=86,offs=1)--1392(line=92,offs=9))
function
XATS2JS_optn_uncons_funs(a1x1, a1x2, a1x3)
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
} // function // XATS2JS_optn_uncons_funs(5)


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(1514(line=101,offs=1)--1575(line=104,offs=34))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(1584(line=106,offs=1)--1656(line=110,offs=36))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(1660(line=112,offs=1)--1708(line=113,offs=40))
function
XATS2JS_list_nil()
{
  let xtmp23
  {
    xtmp23 = [1]
  }
  return xtmp23
} // function // XATS2JS_list_nil(6)


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(1709(line=114,offs=1)--1763(line=115,offs=46))
function
XATS2JS_list_cons(a1x1, a1x2)
{
  let xtmp26
  {
    xtmp26 = [2, a1x1, a1x2]
  }
  return xtmp26
} // function // XATS2JS_list_cons(7)


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(1795(line=119,offs=1)--1923(line=127,offs=40))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(1924(line=128,offs=1)--2049(line=134,offs=9))
function
XATS2JS_list_uncons_funs(a1x1, a1x2, a1x3)
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
} // function // XATS2JS_list_uncons_funs(8)


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(2171(line=142,offs=1)--2238(line=145,offs=37))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(2247(line=147,offs=1)--2325(line=151,offs=39))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(2329(line=153,offs=1)--2383(line=154,offs=46))
function
XATS2JS_strmcon_nil()
{
  let xtmp34
  {
    xtmp34 = [1]
  }
  return xtmp34
} // function // XATS2JS_strmcon_nil(9)


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(2384(line=155,offs=1)--2444(line=156,offs=52))
function
XATS2JS_strmcon_cons(a1x1, a1x2)
{
  let xtmp37
  {
    xtmp37 = [2, a1x1, a1x2]
  }
  return xtmp37
} // function // XATS2JS_strmcon_cons(10)


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(2766(line=181,offs=1)--2894(line=189,offs=40))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(2895(line=190,offs=1)--3035(line=196,offs=9))
function
XATS2JS_strm_uncons_funs(a1x1, a1x2, a1x3)
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
} // function // XATS2JS_strm_uncons_funs(11)


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(3104(line=199,offs=1)--3214(line=205,offs=42))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(3215(line=206,offs=1)--3319(line=211,offs=9))
function
XATS2JS_streax_uncons_funs(a1x1, a1x2)
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
} // function // XATS2JS_streax_uncons_funs(12)


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(3443(line=219,offs=1)--3499(line=221,offs=33))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(3508(line=223,offs=1)--3570(line=225,offs=38))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(3574(line=227,offs=1)--3620(line=228,offs=38))
function
XATS2JS_optn_vt_nil()
{
  let xtmp53
  {
    xtmp53 = [1]
  }
  return xtmp53
} // function // XATS2JS_optn_vt_nil(13)


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(3621(line=229,offs=1)--3673(line=230,offs=44))
function
XATS2JS_optn_vt_cons(a1x1)
{
  let xtmp55
  {
    xtmp55 = [2, a1x1]
  }
  return xtmp55
} // function // XATS2JS_optn_vt_cons(14)


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(3708(line=235,offs=1)--3822(line=241,offs=34))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(3826(line=243,offs=1)--3954(line=249,offs=9))
function
XATS2JS_optn_vt_uncons_funs(a1x1, a1x2, a1x3)
{
  let xtmp59
  let xtmp60
  let xtmp61
  {
    xtmp60 = 0;
    do {
    do {
      if(1!==XATS2JS_ctag(a1x1)) break;
      xtmp60 = 1;
    } while(false);
    if(xtmp60 > 0) break;
    do {
      if(2!==XATS2JS_ctag(a1x1)) break;
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
    xtmp61 = a1x1[1]
    {
      xtmp59 = a1x3(xtmp61)
    }
    break;
    default: XATS2JS_matcherr0();
  } // case-switch
  return xtmp59
} // function // XATS2JS_optn_vt_uncons_funs(15)


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(4082(line=258,offs=1)--4149(line=261,offs=37))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(4158(line=263,offs=1)--4239(line=267,offs=42))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(4243(line=269,offs=1)--4297(line=270,offs=46))
function
XATS2JS_list_vt_nil()
{
  let xtmp62
  {
    xtmp62 = [1]
  }
  return xtmp62
} // function // XATS2JS_list_vt_nil(16)


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(4298(line=271,offs=1)--4358(line=272,offs=52))
function
XATS2JS_list_vt_cons(a1x1, a1x2)
{
  let xtmp65
  {
    xtmp65 = [2, a1x1, a1x2]
  }
  return xtmp65
} // function // XATS2JS_list_vt_cons(17)


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(4393(line=277,offs=1)--4528(line=285,offs=41))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(4532(line=287,offs=1)--4668(line=293,offs=9))
function
XATS2JS_list_vt_uncons_funs(a1x1, a1x2, a1x3)
{
  let xtmp69
  let xtmp70
  let xtmp71
  let xtmp72
  {
    xtmp70 = 0;
    do {
    do {
      if(1!==XATS2JS_ctag(a1x1)) break;
      xtmp70 = 1;
    } while(false);
    if(xtmp70 > 0) break;
    do {
      if(2!==XATS2JS_ctag(a1x1)) break;
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
    xtmp71 = a1x1[1]
    xtmp72 = a1x1[2]
    {
      xtmp69 = a1x3(xtmp71, xtmp72)
    }
    break;
    default: XATS2JS_matcherr0();
  } // case-switch
  return xtmp69
} // function // XATS2JS_list_vt_uncons_funs(18)


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(5113(line=323,offs=1)--5186(line=326,offs=40))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(5195(line=328,offs=1)--5282(line=332,offs=45))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(5286(line=334,offs=1)--5346(line=335,offs=52))
function
XATS2JS_strmcon_vt_nil()
{
  let xtmp73
  {
    xtmp73 = [1]
  }
  return xtmp73
} // function // XATS2JS_strmcon_vt_nil(19)


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(5347(line=336,offs=1)--5413(line=337,offs=58))
function
XATS2JS_strmcon_vt_cons(a1x1, a1x2)
{
  let xtmp76
  {
    xtmp76 = [2, a1x1, a1x2]
  }
  return xtmp76
} // function // XATS2JS_strmcon_vt_cons(20)


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(5448(line=342,offs=1)--5583(line=350,offs=41))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(5587(line=352,offs=1)--5738(line=358,offs=9))
function
XATS2JS_strm_vt_uncons_funs(a1x1, a1x2, a1x3)
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
} // function // XATS2JS_strm_vt_uncons_funs(21)


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(5816(line=363,offs=1)--5933(line=369,offs=43))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(5937(line=371,offs=1)--6048(line=376,offs=9))
function
XATS2JS_streax_vt_uncons_funs(a1x1, a1x2)
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
} // function // XATS2JS_streax_vt_uncons_funs(22)


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(6128(line=381,offs=1)--6236(line=386,offs=45))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(6240(line=388,offs=1)--6373(line=397,offs=9))
function
XATS2JS_strm_vt_map0$f1un(a1x1, a1x2)
{
  let xtmp94
// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(6332(line=396,offs=1)--6371(line=396,offs=40))
// L1DCLnone0()
  {
// /home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats@(9674(line=747,offs=1)--10055(line=779,offs=9))
    function
    strm_vt_map0_978453_4814_(a2x1)
    {
      let xtmp112
// /home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats@(9740(line=755,offs=1)--10019(line=778,offs=12))
      function
      auxmain_9743_(a3x1)
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
// /home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats@(9915(line=773,offs=3)--9947(line=774,offs=24))
            {
              {
// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(6332(line=396,offs=1)--6371(line=396,offs=40))
                function
                map$fopr0_978453_3142_(a5x1)
                {
                  let xtmp105
                  {
                    xtmp105 = a1x2(a5x1)
                  }
                  return xtmp105
                } // function // map$fopr0(24)
                xtmp103 = map$fopr0_978453_3142_(xtmp101)
              }
            } // val(H0Pvar(y0(95)))
            {
              {
                xtmp107 = auxmain_9743_(xtmp102)
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
// /home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats@(25294(line=1963,offs=1)--25346(line=1965,offs=37))
            // { // val-implmnt
// /home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats@(1817(line=153,offs=1)--1867(line=155,offs=31))
            function
            strm_vt_free_978453_2269_(a5x1)
            {
              return XATS2JS_llazy_free(a5x1)
            } // function // strm_vt_free(28)
            // } // val-implmnt
            var // const // implval/fun
            g_free_978453_1680_ = strm_vt_free_978453_2269_
            xtmp108 = strm_vt_free_978453_2269_(a3x1)
          }
        } // lam-function
        xtmp97 = XATS2JS_new_llazy(xtmp110,xtmp111)
        return xtmp97
      } // function // auxmain(26)
      {
        xtmp112 = auxmain_9743_(a2x1)
      }
      return xtmp112
    } // function // strm_vt_map0(25)
    xtmp94 = strm_vt_map0_978453_4814_(a1x1)
  }
  return xtmp94
} // function // XATS2JS_strm_vt_map0$f1un(23)


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(6449(line=402,offs=1)--6552(line=406,offs=45))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(6556(line=408,offs=1)--6738(line=421,offs=9))
function
XATS2JS_strm_vt_filter0$f1un(a1x1, a1x2)
{
  let xtmp115
// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(6650(line=416,offs=3)--6680(line=417,offs=22))
// L1DCLnone0()
// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(6695(line=419,offs=3)--6733(line=419,offs=41))
// L1DCLnone0()
  {
// /home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats@(10119(line=783,offs=1)--10601(line=826,offs=13))
    function
    strm_vt_filter0_978453_5002_(a2x1)
    {
      let xtmp138
// /home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats@(10191(line=791,offs=1)--10596(line=824,offs=8))
      function
      auxmain_10194_(a3x1)
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
            xtmp119 = auxloop_10279_(a3x1)
          }
          return xtmp119 // lam-fun
        } // lam-function
        xtmp123 = function () {
          let xtmp119
          let xtmp120
          {
// /home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats@(25294(line=1963,offs=1)--25346(line=1965,offs=37))
            // { // val-implmnt
// /home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats@(1817(line=153,offs=1)--1867(line=155,offs=31))
            function
            strm_vt_free_978453_2269_(a5x1)
            {
              return XATS2JS_llazy_free(a5x1)
            } // function // strm_vt_free(28)
            // } // val-implmnt
            var // const // implval/fun
            g_free_978453_1680_ = strm_vt_free_978453_2269_
            xtmp120 = strm_vt_free_978453_2269_(a3x1)
          }
        } // lam-function
        xtmp118 = XATS2JS_new_llazy(xtmp122,xtmp123)
        break;//return
        } while( true );
        return xtmp118
      } // function // auxmain(32)
      function
      auxloop_10279_(a3x1)
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
// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(6695(line=419,offs=3)--6733(line=419,offs=41))
            function
            filter$test1_978453_4117_(a4x1)
            {
              let xtmp132
              {
                xtmp132 = a1x2(a4x1)
              }
              return xtmp132
            } // function // filter$test1(30)
            xtmp130 = filter$test1_978453_4117_(xtmp128)
          }
          if (xtmp130)
          { // then
            {
              {
                xtmp133 = auxmain_10194_(xtmp129)
              }
              xtmp125 = [2, xtmp128, xtmp133]
            }
} // if-then
          else
          { // else
// /home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats@(10506(line=821,offs=3)--10525(line=821,offs=22))
            {
              {
// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(6650(line=416,offs=3)--6680(line=417,offs=22))
                function
                g_free_978453_1680_(a4x1)
                {
                  let xtmp136
                  {
                    xtmp136 = [-1]
                  }
                  return xtmp136
                } // function // g_free(27)
                xtmp134 = g_free_978453_1680_(xtmp128)
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
        xtmp138 = auxmain_10194_(a2x1)
      }
      return xtmp138
    } // function // strm_vt_filter0(31)
    xtmp115 = strm_vt_filter0_978453_5002_(a1x1)
  }
  return xtmp115
} // function // XATS2JS_strm_vt_filter0$f1un(29)


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(7076(line=448,offs=1)--7116(line=450,offs=23))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(7151(line=455,offs=1)--7215(line=459,offs=31))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(7216(line=460,offs=1)--7266(line=462,offs=33))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(7301(line=467,offs=1)--7376(line=472,offs=31))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(7377(line=473,offs=1)--7427(line=475,offs=33))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(7454(line=479,offs=1)--7593(line=490,offs=20))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(7597(line=492,offs=1)--7744(line=503,offs=20))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(7796(line=508,offs=1)--7865(line=513,offs=26))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(7866(line=514,offs=1)--7918(line=516,offs=37))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(7953(line=521,offs=1)--8021(line=526,offs=25))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(8022(line=527,offs=1)--8086(line=529,offs=47))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(8180(line=538,offs=1)--8224(line=540,offs=27))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(8234(line=542,offs=1)--8280(line=544,offs=29))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(8287(line=545,offs=1)--8333(line=547,offs=29))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(8371(line=551,offs=1)--8460(line=557,offs=35))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(8461(line=558,offs=1)--8515(line=560,offs=37))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(8547(line=564,offs=1)--8637(line=570,offs=32))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(8638(line=571,offs=1)--8694(line=573,offs=39))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(8706(line=576,offs=1)--8797(line=582,offs=32))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(8798(line=583,offs=1)--8856(line=585,offs=41))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(8891(line=590,offs=1)--8999(line=597,offs=34))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(9000(line=598,offs=1)--9056(line=600,offs=39))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(9068(line=603,offs=1)--9177(line=610,offs=34))


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(9178(line=611,offs=1)--9236(line=613,offs=41))
// L1DCLnone0()


// ./../../../.././prelude/DATS/CATS/JS/prelude.dats@(9482(line=634,offs=1)--9654(line=647,offs=23))
// L1DCLnone0()


