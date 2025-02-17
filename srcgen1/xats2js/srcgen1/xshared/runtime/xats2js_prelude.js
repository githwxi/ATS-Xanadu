/* ****** ****** */
// XATS2JS_PRELUDE
/* ****** ****** */

'use strict';

////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
/*
Basics0 for Xats2js
*/
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////

/* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_basics0.cats] */
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
/*
Basics1 for Xats2js
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

/* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_basics1.cats] */
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
/*
Basics2 for Xats2js
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

/* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_basics2.cats] */
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
/*
Basics3 for Xats2js
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

/* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_basics3.cats] */
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
// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(78(line=8,offs=1)--155(line=13,offs=24))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(164(line=15,offs=1)--245(line=20,offs=27))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(254(line=22,offs=1)--337(line=27,offs=27))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(341(line=29,offs=1)--388(line=30,offs=39))
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


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(389(line=31,offs=1)--438(line=32,offs=41))
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


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(439(line=33,offs=1)--490(line=34,offs=43))
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


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(572(line=43,offs=1)--622(line=45,offs=30))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(631(line=47,offs=1)--687(line=49,offs=35))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(691(line=51,offs=1)--731(line=52,offs=32))
function
XATS2JS_optn_nil()
{
  let xtmp14
  {
    xtmp14 = [1]
  }
  return xtmp14
} // function // XATS2JS_optn_nil(3)


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(732(line=53,offs=1)--778(line=54,offs=38))
function
XATS2JS_optn_cons(a1x1)
{
  let xtmp16
  {
    xtmp16 = [2, a1x1]
  }
  return xtmp16
} // function // XATS2JS_optn_cons(4)


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(813(line=59,offs=1)--925(line=65,offs=36))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(926(line=66,offs=1)--1043(line=72,offs=9))
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


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(1165(line=81,offs=1)--1226(line=84,offs=34))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(1235(line=86,offs=1)--1307(line=90,offs=36))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(1311(line=92,offs=1)--1359(line=93,offs=40))
function
XATS2JS_list_nil()
{
  let xtmp23
  {
    xtmp23 = [1]
  }
  return xtmp23
} // function // XATS2JS_list_nil(6)


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(1360(line=94,offs=1)--1414(line=95,offs=46))
function
XATS2JS_list_cons(a1x1, a1x2)
{
  let xtmp26
  {
    xtmp26 = [2, a1x1, a1x2]
  }
  return xtmp26
} // function // XATS2JS_list_cons(7)


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(1446(line=99,offs=1)--1574(line=107,offs=40))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(1575(line=108,offs=1)--1700(line=114,offs=9))
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


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(1822(line=122,offs=1)--1889(line=125,offs=37))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(1898(line=127,offs=1)--1976(line=131,offs=39))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(1980(line=133,offs=1)--2034(line=134,offs=46))
function
XATS2JS_strmcon_nil()
{
  let xtmp34
  {
    xtmp34 = [1]
  }
  return xtmp34
} // function // XATS2JS_strmcon_nil(9)


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(2035(line=135,offs=1)--2095(line=136,offs=52))
function
XATS2JS_strmcon_cons(a1x1, a1x2)
{
  let xtmp37
  {
    xtmp37 = [2, a1x1, a1x2]
  }
  return xtmp37
} // function // XATS2JS_strmcon_cons(10)


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(2417(line=161,offs=1)--2545(line=169,offs=40))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(2546(line=170,offs=1)--2686(line=176,offs=9))
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


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(2755(line=179,offs=1)--2865(line=185,offs=42))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(2866(line=186,offs=1)--2970(line=191,offs=9))
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


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(3094(line=199,offs=1)--3150(line=201,offs=33))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(3159(line=203,offs=1)--3221(line=205,offs=38))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(3225(line=207,offs=1)--3271(line=208,offs=38))
function
XATS2JS_optn_vt_nil()
{
  let xtmp53
  {
    xtmp53 = [1]
  }
  return xtmp53
} // function // XATS2JS_optn_vt_nil(13)


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(3272(line=209,offs=1)--3324(line=210,offs=44))
function
XATS2JS_optn_vt_cons(a1x1)
{
  let xtmp55
  {
    xtmp55 = [2, a1x1]
  }
  return xtmp55
} // function // XATS2JS_optn_vt_cons(14)


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(3359(line=215,offs=1)--3473(line=221,offs=34))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(3477(line=223,offs=1)--3605(line=229,offs=9))
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


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(3733(line=238,offs=1)--3800(line=241,offs=37))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(3809(line=243,offs=1)--3890(line=247,offs=42))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(3894(line=249,offs=1)--3948(line=250,offs=46))
function
XATS2JS_list_vt_nil()
{
  let xtmp62
  {
    xtmp62 = [1]
  }
  return xtmp62
} // function // XATS2JS_list_vt_nil(16)


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(3949(line=251,offs=1)--4009(line=252,offs=52))
function
XATS2JS_list_vt_cons(a1x1, a1x2)
{
  let xtmp65
  {
    xtmp65 = [2, a1x1, a1x2]
  }
  return xtmp65
} // function // XATS2JS_list_vt_cons(17)


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(4044(line=257,offs=1)--4179(line=265,offs=41))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(4183(line=267,offs=1)--4319(line=273,offs=9))
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


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(4764(line=303,offs=1)--4837(line=306,offs=40))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(4846(line=308,offs=1)--4933(line=312,offs=45))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(4937(line=314,offs=1)--4997(line=315,offs=52))
function
XATS2JS_strmcon_vt_nil()
{
  let xtmp73
  {
    xtmp73 = [1]
  }
  return xtmp73
} // function // XATS2JS_strmcon_vt_nil(19)


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(4998(line=316,offs=1)--5064(line=317,offs=58))
function
XATS2JS_strmcon_vt_cons(a1x1, a1x2)
{
  let xtmp76
  {
    xtmp76 = [2, a1x1, a1x2]
  }
  return xtmp76
} // function // XATS2JS_strmcon_vt_cons(20)


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(5099(line=322,offs=1)--5234(line=330,offs=41))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(5238(line=332,offs=1)--5389(line=338,offs=9))
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


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(5467(line=343,offs=1)--5584(line=349,offs=43))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(5588(line=351,offs=1)--5699(line=356,offs=9))
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


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(5799(line=362,offs=1)--5907(line=367,offs=45))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(5919(line=370,offs=1)--6022(line=374,offs=45))


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(6069(line=379,offs=1)--6385(line=402,offs=15))
function
XATS2JS_strm_vt_map0$f1un(a1x1, a1x2)
{
  let xtmp105
// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(6156(line=387,offs=1)--6348(line=401,offs=8))
  function
  auxmain_6159_(a2x1)
  {
    let xtmp95
    let xtmp103
    let xtmp104
    xtmp103 = function () {
      let xtmp96
      let xtmp97
      let xtmp98
      let xtmp99
      let xtmp100
      let xtmp101
      let xtmp102
      xtmp97 = XATS2JS_llazy_eval(a2x1)
      {
        xtmp98 = 0;
        do {
        do {
          if(1!==XATS2JS_ctag(xtmp97)) break;
          xtmp98 = 1;
        } while(false);
        if(xtmp98 > 0) break;
        do {
          if(2!==XATS2JS_ctag(xtmp97)) break;
          //L1PCKany();
          //L1PCKany();
          xtmp98 = 2;
        } while(false);
        if(xtmp98 > 0) break;
        } while(false);
      } // case-patck0
      switch(xtmp98) {
        case 1:
        {
          xtmp96 = [1]
        }
        break;
        case 2:
        xtmp99 = xtmp97[1]
        xtmp100 = xtmp97[2]
        {
          {
            xtmp101 = a1x2(xtmp99)
          }
          {
            xtmp102 = auxmain_6159_(xtmp100)
          }
          xtmp96 = [2, xtmp101, xtmp102]
        }
        break;
        default: XATS2JS_matcherr0();
      } // case-switch
      return xtmp96 // lam-fun
    } // lam-function
    xtmp104 = function () {
      let xtmp96
      let xtmp97
      let xtmp98
      let xtmp99
      let xtmp100
      let xtmp101
      let xtmp102
    } // lam-function
    xtmp95 = XATS2JS_new_llazy(xtmp103,xtmp104)
    return xtmp95
  } // function // auxmain(25)
  {
    xtmp105 = auxmain_6159_(a1x1)
  }
  return xtmp105
} // function // XATS2JS_strm_vt_map0$f1un(23)


// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(6453(line=406,offs=1)--6866(line=440,offs=15))
function
XATS2JS_strm_vt_filter0$f1un(a1x1, a1x2)
{
  let xtmp121
// ./../../../.././prelude/DATS/CATS/JS/basics0.dats@(6535(line=413,offs=1)--6829(line=439,offs=8))
  function
  auxmain_6538_(a2x1)
  {
    let a2y1;
    let xtmp109
    let xtmp111
    let xtmp112
    do {
    xtmp111 = function () {
      let xtmp110
      {
        xtmp110 = auxloop_6615_(a2x1)
      }
      return xtmp110 // lam-fun
    } // lam-function
    xtmp112 = function () {
      let xtmp110
    } // lam-function
    xtmp109 = XATS2JS_new_llazy(xtmp111,xtmp112)
    break;//return
    } while( true );
    return xtmp109
  } // function // auxmain(26)
  function
  auxloop_6615_(a2x1)
  {
    let a2y1;
    let xtmp114
    let xtmp115
    let xtmp116
    let xtmp117
    let xtmp118
    let xtmp119
    let xtmp120
    do {
    xtmp115 = XATS2JS_llazy_eval(a2x1)
    {
      xtmp116 = 0;
      do {
      do {
        if(1!==XATS2JS_ctag(xtmp115)) break;
        xtmp116 = 1;
      } while(false);
      if(xtmp116 > 0) break;
      do {
        if(2!==XATS2JS_ctag(xtmp115)) break;
        //L1PCKany();
        //L1PCKany();
        xtmp116 = 2;
      } while(false);
      if(xtmp116 > 0) break;
      } while(false);
    } // case-patck0
    switch(xtmp116) {
      case 1:
      {
        xtmp114 = [1]
      }
      break;
      case 2:
      xtmp117 = xtmp115[1]
      xtmp118 = xtmp115[2]
      {
        xtmp119 = a1x2(xtmp117)
      }
      if (xtmp119)
      { // then
        {
          {
            xtmp120 = auxmain_6538_(xtmp118)
          }
          xtmp114 = [2, xtmp117, xtmp120]
        }
} // if-then
      else
      { // else
        {
          // tail-recursion:
          // L1CMDapp(tmp(114); L1VALfcst(auxloop(27)); L1VALtmp(tmp(118)));
          a2y1 = xtmp118; a2x1 = a2y1; continue
        }
      } // if-else
      break;
      default: XATS2JS_matcherr0();
    } // case-switch
    break;//return
    } while( true );
    return xtmp114
  } // function // auxloop(27)
  {
    xtmp121 = auxmain_6538_(a1x1)
  }
  return xtmp121
} // function // XATS2JS_strm_vt_filter0$f1un(24)


