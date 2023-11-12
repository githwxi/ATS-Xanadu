/* ****** ****** */
// XATS2JS_PRELUDE
/* ****** ****** */

'use strict';

/* ****** ****** */
/*
Basics for Xats2js
*/
/* ****** ****** */
//
//prelude/bool000.sats
//
/* ****** ****** */
function
XATS2JS_bool_neg
  (b0)
{ return !b0 ; }
/* ****** ****** */
function
XATS2JS_bool_add
  (b1, b2)
{ return (b1 || b2); }
function
XATS2JS_bool_mul
  (b1, b2)
{ return (b1 && b2); }
/* ****** ****** */
//
//prelude/char000.sats
//
/* ****** ****** */
function
XATS2JS_char_cmp
  (c1, c2)
{
if
(c1 < c2)
return (-1);
else
return (c1 <= c2 ? 0 : 1);
}
/* ****** ****** */
function
XATS2JS_char_eqz
  (c0)
{
return (0===c0); // eqz
}
function
XATS2JS_char_neqz
  (c0)
{
return (0!==c0); // neqz
}
/* ****** ****** */
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
/* ****** ****** */
//
function
XATS2JS_char_lowerq
  (  ch  )
{
  let a = 97;
  let z = 122;
  return ((a <= ch) && (ch <= z));
}
function
XATS2JS_sint_lowerq
  (  ch  )
{
  let a = 97;
  let z = 122;
  return ((a <= ch) && (ch <= z));
}
function
XATS2JS_char_upperq
  (  ch  )
{
  let A = 65;
  let Z = 90;
  return ((A <= ch) && (ch <= Z));
}
function
XATS2JS_sint_upperq
  (  ch  )
{
  return ((A <= ch) && (ch <= Z));
}
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
/* ****** ****** */
//
function
XATS2JS_char_lohexq
  (  ch  )
{
  let a = 97;
  let f = 102;
  return ((a <= ch) && (ch <= f));
}
function
XATS2JS_sint_lohexq
  (  ch  )
{
  let a = 97;
  let f = 102;
  return ((a <= ch) && (ch <= f));
}
//
function
XATS2JS_char_uphexq
  (  ch  )
{
  let A = 65;
  let F = 70;
  return ((A <= ch) && (ch <= F));
}
function
XATS2JS_sint_lohexq
  (  ch  )
{
  let A = 65;
  let F = 70;
  return ((A <= ch) && (ch <= F));
}
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
/* ****** ****** */
//
//prelude/gint000.sats
//
/* ****** ****** */
function
XATS2JS_gint_neg_sint
  (x0)
{
  return (-x0); // neg
}
/* ****** ****** */
function
XATS2JS_gint_abs_sint
  (x0)
{
if
(x0 >= 0)
{
  return ( x0); // abs
}
else
{
  return (-x0); // abs
}
}
/* ****** ****** */
function
XATS2JS_gint_succ_sint
  (x0)
{
return (x0 + 1); // +1
}
function
XATS2JS_gint_succ_uint
  (x0)
{
return (x0 + 1); // +1
}
/* ****** ****** */
function
XATS2JS_gint_pred_sint
  (x0)
{
return (x0 - 1); // -1
}
function
XATS2JS_gint_pred_uint
  (x0)
{
return (x0 - 1); // -1
}
/* ****** ****** */
function
XATS2JS_gint_lnot_uint
  (x0)
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
/* ****** ****** */
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
/* ****** ****** */
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
/* ****** ****** */
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
/* ****** ****** */
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
/* ****** ****** */
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
/* ****** ****** */
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
/* ****** ****** */
function
XATS2JS_gint_cmp_sint_sint
  (x1, x2)
{
if
(x1 < x2)
return (-1);
else
return (x1 <= x2 ? 0 : 1);
}
function
XATS2JS_gint_cmp_uint_uint
  (x1, x2)
{
if
(x1 < x2)
return (-1);
else
return (x1 <= x2 ? 0 : 1);
}
/* ****** ****** */
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
function
XATS2JS_gint_div_sint_sint
  (x1, x2)
{ 
//
let q0 = x1 / x2;
//
if
(q0 >= 0)
{
  return Math.floor( q0 );
}
else
{
  return Math.ceil(  q0  );
}
}
/* ****** ****** */
//
// HX-2022-06-06:
//
function
XATS2JS_gint_sint2uint(x0)
{       return x0;       }
function
XATS2JS_gint_uint2sint(x0)
{       return x0;       }
//
/* ****** ****** */
//
// HX-2022-06-16:
//
function
XATS2JS_gint_parse_sint(rep)
{
  const exn = 0;
  const bas = 10;
  const res = parseInt(rep, bas);
  return ( isNaN(res) ? exn : res );
}
function
XATS2JS_gint_parse_uint(rep)
{
  const exn = 0;
  const res =
  XATS2JS_gint_parse_sint(rep);
  return ( (res >= 0) ? res : exn );
}
//
/* ****** ****** */
//
//prelude/gflt000.sats
//
/* ****** ****** */
function
XATS2JS_gflt_si_dflt
  (x0)
{
  return x0 ; // sint
}
/* ****** ****** */
function
XATS2JS_gflt_neg_dflt
  (x0)
{
  return (-x0); // neg
}
/* ****** ****** */
function
XATS2JS_gflt_abs_dflt
  (x0)
{
if
(x0 >= 0.0)
{
  return ( x0); // abs
}
else
{
  return (-x0); // abs
}
}
/* ****** ****** */
function
XATS2JS_gflt_succ_dflt
  (x0)
{
return (x0 + 1); // +1
}
function
XATS2JS_gflt_pred_dflt
  (x0)
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
/* ****** ****** */
function
XATS2JS_gflt_cmp_dflt_dflt
  (x1, x2)
{
if
(x1 < x2)
return (-1);
else
return (x1 <= x2 ? 0 : 1);
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
/* ****** ****** */
//
//prelude/strn000.sats
//
/* ****** ****** */
//
// HX-2020-09-28:
// Please note that:
// A (strn)-val is a JS-string
// A (strn_vt)-val is a JS-array
//
/* ****** ****** */
function
XATS2JS_strn_vt2t
  (cs)
{
cs.pop(); // pop the last '\0'
let res = // from array to string
String.fromCharCode.apply(null, cs);
return res; // [XATS2JS_strn_vt2t]
}
/* ****** ****** */
//
function
XATS2JS_strn_nilq
  (opt)
{
return(opt==="");
}
function
XATS2JS_strn_consq
  (opt)
{
return(opt!=="");
}
/* ****** ****** */
//
function
XATS2JS_stropt_nilq
  (opt)
{
return(opt===null);
}
function
XATS2JS_stropt_consq
  (opt)
{
return(opt!==null);
}
//
/* ****** ****** */
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
/* ****** ****** */
function
XATS2JS_strn_cmp
  (x1, x2)
{
if(x1 < x2)
{
  return -1;
} else
{
  return (x1===x2 ? 0 : 1);
} // end of [if]
}
/* ****** ****** */
function
XATS2JS_strn_head_opt
  (cs)
{
if
(cs.length <= 0)
{
  return 0; // none
}
return cs.charCodeAt(0);
}
/* ****** ****** */
function
XATS2JS_strn_head_raw
  (cs)
{
return cs.charCodeAt(0);
}
/* ****** ****** */
function
XATS2JS_strn_tail_raw
  (cs)
{
return cs.slice(1);//tail
}
/* ****** ****** */
function
XATS2JS_strn_length
  (cs)
{
  return (cs.length);
}
//
function
XATS2JS_strn_vt_length0
  (cs)
{
// HX: skipping
// the ending null char
  return (cs.length - 1);
}
function
XATS2JS_strn_vt_length1
  (cs)
{
// HX: skipping
// the ending null char
  return (cs.length - 1);
}
//
/* ****** ****** */
function
XATS2JS_strn_get_at
  (cs, i0)
{
return cs.charCodeAt(i0);
}
/* ****** ****** */
function
XATS2JS_strn_vt_get_at
  (cs, i0)
{
  return cs[i0];
  //cs:JS_array(char)
}
function
XATS2JS_strn_vt_set_at
  (cs, i0, c0)
{
  return (cs[i0] = c0);
}
/* ****** ****** */
function
XATS2JS_strtmp_vt_alloc
  (bsz)
{
let
cs =
new Array(bsz+1);
cs[bsz] = 0; return cs; }
function
XATS2JS_strtmp_vt_set_at
  (cs, i0, c0)
{ return (cs[i0] = c0); }
/* ****** ****** */
function
XATS2JS_strn_forall_cfr
  (cs, f0)
{
let i0;
let res = true;
let len = cs.length;
for
( i0 = 0
; i0 < len; i0 += 1)
{
let c0 = cs.charCodeAt(i0);
if
(!f0(c0)){res = false; break;}
}
return res; // strn_forall_cfr
}
/* ****** ****** */
function
XATS2JS_strn_rforall_cfr
  (cs, f0)
{
let i0;
let
res = true;
let
len = cs.length
for
( i0 = len
; i0 >= 1 ; i0 -= 1)
{
let c0 = cs.charCodeAt(i0-1);
if
(!f0(c0)){res = false; break;}
}
return res; // strn_rforall_cfr
}
/* ****** ****** */
function
XATS2JS_strn_vt_forall_cfr
  (cs, f0)
{
let i0;
let
res = true;
let
len = cs.length-1;
for
( i0 = 0
; i0 < len; i0 += 1)
{
  if
  (!f0(cs[i0]))
  {res = false; break;}
}
return res; // strn_vt_forall_cfr
}
/* ****** ****** */
function
XATS2JS_strn_vt_rforall_cfr
  (cs, f0)
{
let i0;
let
res = true;
let
len = cs.length-1;
for
( i0 = len
; i0 >= 1 ; i0 -= 1)
{
  if
  (!f0(cs[i0-1]))
  {res = false; break;}
}
return res; // strn_vt_rforall_cfr
}
/* ****** ****** */

/* end of [ATS3/XANADU_prelude_DATS_CATS_JS_basics0.cats] */
/* ****** ****** */
/*
Runtime for Xats2js
*/
/* ****** ****** */
const
XATS2JS_nil = null
const
XATS2JS_top = null
const
XATS2JS_none = null
const
XATS2JS_null = null
const
XATS2JS_void = null
/* ****** ****** */
function
XATS2JS_fnull
  (    )
{
throw new Error();
}
/* ****** ****** */
var // global
XATS2JS_excbas = 0
var // global
XATS2JS_exctag = 0
function
XATS2JS_new_exctag
  (    )
{
let bas0 =
XATS2JS_excbas;
let tag1 =
XATS2JS_exctag + 1;
XATS2JS_exctag = tag1;
return ( bas0 + tag1 );
}
/* ****** ****** */
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
/* ****** ****** */
function
XATS2JS_fcast
  ( x0 )
{
return x0; //obj: object
}  
/* ****** ****** */
//
function
XATS2JS_raise
  ( exn )
{
  throw exn;//no return!
}
function
XATS2JS_reraise
  ( exn )
{
  throw exn;//no return!
}
/* ****** ****** */
//
function
XATS2JS_assert
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
XATS2JS_assertloc
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
XATS2JS_assertmsg
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
XATS2JS_lval_err
  (loc)
{
  // non-left-val!
  throw new Error(loc);
}
/* ****** ****** */
function
XATS2JS_lval_get
  (lvl0)
{
//
let
root = lvl0.root;
let
offs = lvl0.offs;
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
/* ****** ****** */
function
XATS2JS_lval_set
  (lvl0, obj1)
{
//
let root = null;
let offs = lvl0.offs;
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
/* ****** ****** */
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
/* ****** ****** */
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
/* ****** ****** */
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
let
con1 =
XATS2JS_lval_get(lvl1);
return {root:con1, offs:idx2}; 
}
function
XATS2JS_new_tptr
  (lvl1, idx2)
{
let
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
/* ****** ****** */

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

function
XATS2JS_lazy_eval
  (lzobj)
{
//
let lzres;
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

/* ****** ****** */

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

/* ****** ****** */

/* end of [ATS3/XANADU_prelude_DATS_CATS_JS_runtime.cats] */
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

/* end of [ATS3/XANADU_prelude_DATS_CATS_JS_prelude.cats] *//* ****** ****** */
/*
G_eqref for Xats2js
*/
/* ****** ****** */

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

/* ****** ****** */

/* end of [ATS3/XANADU_prelude_DATS_CATS_JS_g_eqref.cats] */
/* ****** ****** */
/*
G_print for Xats2js
*/
/* ****** ****** */
//
var
XATS2JS_the_print_store = [];
//
/* ****** ****** */

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

/* ****** ****** */

/* end of [ATS3/XANADU_prelude_DATS_CATS_JS_g_print.cats] *//* ****** ****** */
/*
JSBasics for Xats2js
*/
/* ****** ****** */
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
let itm0 = obj[key];
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
let itm0 = obj[key];
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
let itm0 = obj[key];
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

/* ****** ****** */

/* end of [ATS3/XANADU_prelude_DATS_CATS_JS_basics1.cats] */
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(105(line=8,offs=1)--161(line=10,offs=28))
// L1DCLnone1(...)

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(247(line=18,offs=1)--319(line=24,offs=24))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(323(line=26,offs=1)--361(line=27,offs=30))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(396(line=32,offs=1)--489(line=40,offs=26))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(498(line=42,offs=1)--591(line=50,offs=26))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(595(line=52,offs=1)--633(line=53,offs=30))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(634(line=54,offs=1)--672(line=55,offs=30))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(792(line=67,offs=1)--842(line=69,offs=30))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(846(line=71,offs=1)--901(line=73,offs=30))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(902(line=74,offs=1)--957(line=76,offs=30))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(958(line=77,offs=1)--1013(line=79,offs=30))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(1058(line=84,offs=1)--1113(line=86,offs=30))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(1145(line=90,offs=1)--1206(line=93,offs=30))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(1207(line=94,offs=1)--1245(line=95,offs=30))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(1274(line=98,offs=1)--1323(line=100,offs=29))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(1324(line=101,offs=1)--1362(line=102,offs=30))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(1371(line=104,offs=1)--1421(line=106,offs=29))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(1422(line=107,offs=1)--1462(line=108,offs=32))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(1491(line=111,offs=1)--1554(line=114,offs=30))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(1555(line=115,offs=1)--1597(line=116,offs=34))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(1606(line=118,offs=1)--1669(line=121,offs=30))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(1670(line=122,offs=1)--1712(line=123,offs=34))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(1744(line=127,offs=1)--1799(line=129,offs=31))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(1808(line=131,offs=1)--1863(line=133,offs=31))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(1867(line=135,offs=1)--1913(line=136,offs=38))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(1914(line=137,offs=1)--1960(line=138,offs=38))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(1995(line=143,offs=1)--2050(line=145,offs=31))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(2059(line=147,offs=1)--2114(line=149,offs=31))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(2118(line=151,offs=1)--2164(line=152,offs=38))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(2165(line=153,offs=1)--2211(line=154,offs=38))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(2246(line=159,offs=1)--2301(line=161,offs=31))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(2310(line=163,offs=1)--2365(line=165,offs=31))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(2369(line=167,offs=1)--2415(line=168,offs=38))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(2416(line=169,offs=1)--2462(line=170,offs=38))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(2497(line=175,offs=1)--2553(line=177,offs=31))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(2562(line=179,offs=1)--2618(line=181,offs=31))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(2622(line=183,offs=1)--2670(line=184,offs=40))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(2671(line=185,offs=1)--2719(line=186,offs=40))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(2808(line=195,offs=1)--2867(line=197,offs=33))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(2876(line=199,offs=1)--2935(line=201,offs=33))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(2939(line=203,offs=1)--2989(line=205,offs=23))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(3004(line=206,offs=1)--3054(line=208,offs=23))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(3103(line=213,offs=1)--3163(line=215,offs=33))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(3172(line=217,offs=1)--3232(line=219,offs=33))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(3236(line=221,offs=1)--3288(line=222,offs=44))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(3289(line=223,offs=1)--3341(line=224,offs=44))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(3376(line=229,offs=1)--3447(line=233,offs=33))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(3448(line=234,offs=1)--3496(line=235,offs=40))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(3531(line=240,offs=1)--3606(line=244,offs=37))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(3607(line=245,offs=1)--3655(line=246,offs=40))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(3690(line=251,offs=1)--3763(line=255,offs=34))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(3772(line=257,offs=1)--3845(line=261,offs=34))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(3846(line=262,offs=1)--3896(line=263,offs=42))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(3897(line=264,offs=1)--3947(line=265,offs=42))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(3982(line=270,offs=1)--4055(line=274,offs=34))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(4064(line=276,offs=1)--4141(line=280,offs=34))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(4142(line=281,offs=1)--4192(line=282,offs=42))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(4193(line=283,offs=1)--4243(line=284,offs=42))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(4278(line=289,offs=1)--4338(line=291,offs=34))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(4347(line=293,offs=1)--4407(line=295,offs=34))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(4416(line=297,offs=1)--4476(line=299,offs=34))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(4485(line=301,offs=1)--4545(line=303,offs=34))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(4549(line=305,offs=1)--4599(line=306,offs=42))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(4600(line=307,offs=1)--4650(line=308,offs=42))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(4651(line=309,offs=1)--4701(line=310,offs=42))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(4702(line=311,offs=1)--4752(line=312,offs=42))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(4787(line=317,offs=1)--4847(line=319,offs=34))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(4856(line=321,offs=1)--4916(line=323,offs=34))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(4925(line=325,offs=1)--4985(line=327,offs=34))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(4989(line=329,offs=1)--5039(line=330,offs=42))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(5040(line=331,offs=1)--5090(line=332,offs=42))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(5091(line=333,offs=1)--5141(line=334,offs=42))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(5176(line=339,offs=1)--5267(line=345,offs=34))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(5268(line=346,offs=1)--5324(line=347,offs=48))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(5333(line=349,offs=1)--5424(line=355,offs=34))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(5425(line=356,offs=1)--5481(line=357,offs=48))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(5516(line=362,offs=1)--5607(line=368,offs=34))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(5608(line=369,offs=1)--5664(line=370,offs=48))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(5673(line=372,offs=1)--5764(line=378,offs=34))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(5765(line=379,offs=1)--5821(line=380,offs=48))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(5856(line=385,offs=1)--5947(line=391,offs=34))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(5948(line=392,offs=1)--6004(line=393,offs=48))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(6013(line=395,offs=1)--6104(line=401,offs=34))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(6105(line=402,offs=1)--6161(line=403,offs=48))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(6196(line=408,offs=1)--6289(line=414,offs=35))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(6290(line=415,offs=1)--6348(line=416,offs=50))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(6357(line=418,offs=1)--6450(line=424,offs=35))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(6451(line=425,offs=1)--6509(line=426,offs=50))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(6544(line=431,offs=1)--6637(line=437,offs=35))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(6638(line=438,offs=1)--6696(line=439,offs=50))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(6705(line=441,offs=1)--6798(line=447,offs=35))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(6799(line=448,offs=1)--6857(line=449,offs=50))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(6892(line=454,offs=1)--6985(line=460,offs=35))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(6986(line=461,offs=1)--7044(line=462,offs=50))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(7053(line=464,offs=1)--7146(line=470,offs=35))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(7147(line=471,offs=1)--7205(line=472,offs=50))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(7238(line=477,offs=1)--7344(line=484,offs=37))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(7345(line=485,offs=1)--7403(line=486,offs=50))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(7413(line=489,offs=1)--7519(line=496,offs=37))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(7520(line=497,offs=1)--7578(line=498,offs=50))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(7611(line=503,offs=1)--7705(line=509,offs=36))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(7706(line=510,offs=1)--7764(line=511,offs=50))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(7773(line=513,offs=1)--7867(line=519,offs=36))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(7868(line=520,offs=1)--7926(line=521,offs=50))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(7938(line=524,offs=1)--8032(line=530,offs=36))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(8033(line=531,offs=1)--8091(line=532,offs=50))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(8100(line=534,offs=1)--8194(line=540,offs=36))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(8195(line=541,offs=1)--8253(line=542,offs=50))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(8262(line=544,offs=1)--8359(line=550,offs=39))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(8360(line=551,offs=1)--8418(line=552,offs=50))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(8508(line=561,offs=1)--8563(line=563,offs=31))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(8564(line=564,offs=1)--8610(line=565,offs=38))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(8645(line=570,offs=1)--8703(line=572,offs=33))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(8704(line=573,offs=1)--8752(line=574,offs=40))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(8764(line=577,offs=1)--8822(line=579,offs=33))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(8823(line=580,offs=1)--8871(line=581,offs=40))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(8906(line=586,offs=1)--8965(line=588,offs=33))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(8966(line=589,offs=1)--9016(line=590,offs=42))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(9025(line=592,offs=1)--9084(line=594,offs=33))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(9085(line=595,offs=1)--9135(line=596,offs=42))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(9170(line=601,offs=1)--9240(line=603,offs=41))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(9249(line=605,offs=1)--9319(line=607,offs=41))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(9328(line=609,offs=1)--9398(line=611,offs=41))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(9407(line=613,offs=1)--9478(line=615,offs=41))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(9487(line=617,offs=1)--9558(line=619,offs=41))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(9567(line=621,offs=1)--9638(line=623,offs=41))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(9642(line=625,offs=1)--9698(line=626,offs=48))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(9699(line=627,offs=1)--9755(line=628,offs=48))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(9756(line=629,offs=1)--9812(line=630,offs=48))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(9813(line=631,offs=1)--9871(line=632,offs=50))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(9872(line=633,offs=1)--9930(line=634,offs=50))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(9931(line=635,offs=1)--9989(line=636,offs=50))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(10024(line=641,offs=1)--10095(line=643,offs=41))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(10096(line=644,offs=1)--10154(line=645,offs=50))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(10189(line=650,offs=1)--10260(line=652,offs=41))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(10269(line=654,offs=1)--10340(line=656,offs=41))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(10349(line=658,offs=1)--10420(line=660,offs=41))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(10429(line=662,offs=1)--10500(line=664,offs=41))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(10504(line=666,offs=1)--10562(line=667,offs=50))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(10563(line=668,offs=1)--10621(line=669,offs=50))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(10622(line=670,offs=1)--10680(line=671,offs=50))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(10681(line=672,offs=1)--10739(line=673,offs=50))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(10823(line=682,offs=1)--10934(line=692,offs=18))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(10956(line=695,offs=1)--11074(line=704,offs=20))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(11075(line=705,offs=1)--11196(line=714,offs=21))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(11218(line=717,offs=1)--11331(line=727,offs=16))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(11332(line=728,offs=1)--11445(line=738,offs=16))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(11446(line=739,offs=1)--11559(line=749,offs=16))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(11580(line=751,offs=1)--11696(line=761,offs=17))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(11697(line=762,offs=1)--11813(line=772,offs=17))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(11814(line=773,offs=1)--11930(line=783,offs=17))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(11951(line=785,offs=1)--12067(line=795,offs=17))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(12088(line=797,offs=1)--12209(line=806,offs=22))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(12230(line=808,offs=1)--12351(line=817,offs=22))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(12372(line=819,offs=1)--12493(line=828,offs=22))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(12514(line=830,offs=1)--12631(line=839,offs=20))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(12635(line=841,offs=1)--12768(line=850,offs=24))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(12769(line=851,offs=1)--12902(line=860,offs=24))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(12926(line=863,offs=1)--13061(line=874,offs=20))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(13082(line=876,offs=1)--13291(line=891,offs=9))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(13336(line=893,offs=1)--13468(line=902,offs=24))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(13489(line=904,offs=1)--13635(line=915,offs=23))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(13656(line=917,offs=1)--13802(line=927,offs=23))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(13823(line=929,offs=1)--13977(line=939,offs=25))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(13998(line=941,offs=1)--14210(line=953,offs=27))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(14269(line=955,offs=1)--14481(line=967,offs=27))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(14540(line=969,offs=1)--14756(line=981,offs=28))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics0.dats@(14816(line=983,offs=1)--15032(line=995,offs=28))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(91(line=8,offs=1)--110(line=9,offs=11))
// L1DCLnone1(...)

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(119(line=10,offs=1)--146(line=11,offs=19))
// L1DCLnone1(...)

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(173(line=15,offs=1)--201(line=16,offs=20))
// L1DCLnone1(...)

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(202(line=17,offs=1)--233(line=18,offs=23))
// L1DCLnone1(...)

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(354(line=28,offs=1)--391(line=30,offs=15))
// L1DCLnone1(...)

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(395(line=32,offs=1)--428(line=33,offs=25))
// L1DCLnone1(...)

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(519(line=42,offs=1)--548(line=42,offs=30))
// L1DCLnone1(...)

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(620(line=49,offs=1)--693(line=54,offs=29))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(702(line=56,offs=1)--787(line=62,offs=32))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(791(line=64,offs=1)--828(line=65,offs=29))
// L1DCLnone1(...)

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(829(line=66,offs=1)--866(line=67,offs=29))
// L1DCLnone1(...)

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(867(line=68,offs=1)--908(line=69,offs=33))
// L1DCLnone1(...)

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(909(line=70,offs=1)--950(line=71,offs=33))
// L1DCLnone1(...)

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(1028(line=79,offs=1)--1100(line=83,offs=33))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(1129(line=86,offs=1)--1217(line=91,offs=35))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(1226(line=93,offs=1)--1319(line=98,offs=38))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(1340(line=100,offs=1)--1389(line=101,offs=36))
// L1DCLnone1(...)

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(1390(line=102,offs=1)--1441(line=103,offs=36))
// L1DCLnone1(...)

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(1462(line=105,offs=1)--1509(line=106,offs=36))
// L1DCLnone1(...)

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(1510(line=107,offs=1)--1557(line=108,offs=36))
// L1DCLnone1(...)

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(1578(line=110,offs=1)--1629(line=111,offs=36))
// L1DCLnone1(...)

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(1630(line=112,offs=1)--1681(line=113,offs=36))
// L1DCLnone1(...)

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(1713(line=117,offs=1)--1793(line=121,offs=40))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(1880(line=129,offs=1)--1957(line=134,offs=22))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(1978(line=136,offs=1)--2059(line=140,offs=28))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(2083(line=143,offs=1)--2455(line=169,offs=22))
function
XATS2JS_jsarray_strmize(a1x1)
{
let xtmp1;
let xtmp12;
;
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(2151(line=148,offs=3)--2170(line=148,offs=22))
{
{
xtmp1 = XATS2JS_jsarray_length(a1x1);
}
;
;
} // val(H0Pvar(n0(11)))
;
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(2176(line=150,offs=3)--2427(line=167,offs=10))
function
auxmain_2181_(a2x1)
{
let xtmp3;
let xtmp10;
let xtmp11;
;
xtmp10 =
function()
{
let xtmp4;
let xtmp5;
let xtmp6;
let xtmp7;
let xtmp8;
let xtmp9;
{
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/./basics0.dats@(6638(line=438,offs=1)--6696(line=439,offs=50))
// { // val-implmnt
// } // val-implmnt
const // implval/fun
gint_gte_sint_sint_523218_3042_ = XATS2JS_gint_gte_sint_sint
;
xtmp5 = XATS2JS_gint_gte_sint_sint(a2x1, xtmp1);
}
;
if
(xtmp5)
// then
{
{
xtmp4 = [1];
}
;
} // if-then
else
{
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(2328(line=163,offs=7)--2350(line=163,offs=29))
{
{
xtmp6 = XATS2JS_jsarray_get_at(a1x1, a2x1);
}
;
;
} // val(H0Pvar(x0(14)))
;
{
{
{
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/./basics0.dats@(7706(line=510,offs=1)--7764(line=511,offs=50))
// { // val-implmnt
// } // val-implmnt
const // implval/fun
gint_add_sint_sint_523218_3989_ = XATS2JS_gint_add_sint_sint
;
xtmp9 = XATS2JS_gint_add_sint_sint(a2x1, 1);
}
;
xtmp8 = auxmain_2181_(xtmp9);
}
;
xtmp7 = [2, xtmp6, xtmp8];
}
;
xtmp4 = xtmp7;
} // if-else
;
return xtmp4;
} // lam-function
;
xtmp11 =
function()
{
let xtmp4;
let xtmp5;
let xtmp6;
let xtmp7;
let xtmp8;
let xtmp9;
} // lam-function
;
xtmp3 = XATS2JS_new_llazy(xtmp10,xtmp11);
return xtmp3;
} // function // auxmain(9)
;
{
xtmp12 = auxmain_2181_(0);
}
;
return xtmp12;
} // function // XATS2JS_jsarray_strmize(5)


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(2565(line=176,offs=1)--2585(line=176,offs=21))
// L1DCLnone1(...)

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(2614(line=179,offs=1)--2694(line=184,offs=33))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(2718(line=187,offs=1)--2899(line=200,offs=22))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(2900(line=201,offs=1)--3081(line=214,offs=22))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(3113(line=218,offs=1)--3195(line=223,offs=35))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(3219(line=226,offs=1)--3402(line=239,offs=22))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(3403(line=240,offs=1)--3586(line=253,offs=22))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(3618(line=257,offs=1)--3692(line=261,offs=29))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(3713(line=263,offs=1)--3896(line=275,offs=26))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(3897(line=276,offs=1)--4083(line=289,offs=26))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(4153(line=292,offs=1)--4248(line=297,offs=42))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(4272(line=300,offs=1)--4480(line=313,offs=28))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(4481(line=314,offs=1)--4689(line=327,offs=28))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(4826(line=342,offs=1)--4914(line=347,offs=35))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(4923(line=349,offs=1)--5018(line=354,offs=42))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(5045(line=358,offs=1)--5246(line=371,offs=28))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(5247(line=372,offs=1)--5448(line=385,offs=28))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(5452(line=387,offs=1)--5660(line=400,offs=28))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(5661(line=401,offs=1)--5869(line=414,offs=28))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(6012(line=428,offs=1)--6109(line=433,offs=44))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(6118(line=435,offs=1)--6222(line=440,offs=51))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(6249(line=444,offs=1)--6459(line=457,offs=28))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(6460(line=458,offs=1)--6670(line=471,offs=28))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(6674(line=473,offs=1)--6891(line=486,offs=28))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(6892(line=487,offs=1)--7109(line=500,offs=28))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(7133(line=503,offs=1)--7231(line=509,offs=30))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(7255(line=512,offs=1)--7518(line=529,offs=13))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/basics1.dats@(7582(line=532,offs=1)--7710(line=538,offs=53))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(67(line=6,offs=1)--123(line=8,offs=28))
// L1DCLnone1(...)

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(144(line=10,offs=1)--185(line=11,offs=28))
// L1DCLnone1(...)

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(186(line=12,offs=1)--233(line=13,offs=34))
// L1DCLnone1(...)

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(397(line=25,offs=1)--465(line=30,offs=24))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(474(line=32,offs=1)--546(line=37,offs=27))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(555(line=39,offs=1)--629(line=44,offs=27))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(633(line=46,offs=1)--679(line=47,offs=38))
function
XATS2JS_lazy_cfr(a1x1)
{
let xtmp1;
let xtmp3;
;
xtmp3 =
function()
{
let xtmp2;
{
xtmp2 = a1x1();
}
;
return xtmp2;
} // lam-function
;
xtmp1 = XATS2JS_new_lazy(xtmp3);
return xtmp1;
} // function // XATS2JS_lazy_cfr(0)


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(680(line=48,offs=1)--728(line=49,offs=40))
function
XATS2JS_llazy_cfr(a1x1)
{
let xtmp5;
let xtmp7;
let xtmp8;
;
xtmp7 =
function()
{
let xtmp6;
{
xtmp6 = a1x1();
}
;
return xtmp6;
} // lam-function
;
xtmp8 =
function()
{
let xtmp6;
} // lam-function
;
xtmp5 = XATS2JS_new_llazy(xtmp7,xtmp8);
return xtmp5;
} // function // XATS2JS_llazy_cfr(1)


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(729(line=50,offs=1)--779(line=51,offs=42))
function
XATS2JS_lazy_vt_cfr(a1x1)
{
let xtmp10;
let xtmp12;
let xtmp13;
;
xtmp12 =
function()
{
let xtmp11;
{
xtmp11 = a1x1();
}
;
return xtmp11;
} // lam-function
;
xtmp13 =
function()
{
let xtmp11;
} // lam-function
;
xtmp10 = XATS2JS_new_llazy(xtmp12,xtmp13);
return xtmp10;
} // function // XATS2JS_lazy_vt_cfr(2)


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(861(line=60,offs=1)--911(line=62,offs=30))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(920(line=64,offs=1)--976(line=66,offs=35))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(980(line=68,offs=1)--1020(line=69,offs=32))
function
XATS2JS_optn_nil()
{
let xtmp14;
{
xtmp14 = [1];
}
;
return xtmp14;
} // function // XATS2JS_optn_nil(3)


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(1021(line=70,offs=1)--1067(line=71,offs=38))
function
XATS2JS_optn_cons(a1x1)
{
let xtmp16;
;
{
xtmp16 = [2, a1x1];
}
;
return xtmp16;
} // function // XATS2JS_optn_cons(4)


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(1099(line=75,offs=1)--1210(line=81,offs=36))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(1211(line=82,offs=1)--1328(line=88,offs=9))
function
XATS2JS_optn_uncons_cfr(a1x1, a1x2, a1x3)
{
let xtmp20;
let xtmp21;
let xtmp22;
;
;
;
{
xtmp21 = 0;
do {
do {
if(1!==XATS2JS_ctag(L1VALeval0(L1VALtmp(arg[1](17))))) break;
xtmp21 = 1;
} while(false);
if(xtmp21 > 0) break;
do {
if(2!==XATS2JS_ctag(L1VALeval0(L1VALtmp(arg[1](17))))) break;
//L1PCKany();
xtmp21 = 2;
} while(false);
if(xtmp21 > 0) break;
} while(false);
} // case-patck0
switch
(xtmp21) {
case 1:
{
xtmp20 = a1x2();
}
;
break;
case 2:
xtmp22 = L1VALeval0(L1VALtmp(arg[1](17)))[1];
{
xtmp20 = a1x3(xtmp22);
}
;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp20;
} // function // XATS2JS_optn_uncons_cfr(5)


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(1446(line=96,offs=1)--1507(line=99,offs=34))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(1516(line=101,offs=1)--1588(line=105,offs=36))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(1592(line=107,offs=1)--1640(line=108,offs=40))
function
XATS2JS_list_nil()
{
let xtmp23;
{
xtmp23 = [1];
}
;
return xtmp23;
} // function // XATS2JS_list_nil(6)


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(1641(line=109,offs=1)--1695(line=110,offs=46))
function
XATS2JS_list_cons(a1x1, a1x2)
{
let xtmp26;
;
;
{
xtmp26 = [2, a1x1, a1x2];
}
;
return xtmp26;
} // function // XATS2JS_list_cons(7)


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(1727(line=114,offs=1)--1858(line=122,offs=42))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(1859(line=123,offs=1)--1984(line=129,offs=9))
function
XATS2JS_list_uncons_cfr(a1x1, a1x2, a1x3)
{
let xtmp30;
let xtmp31;
let xtmp32;
let xtmp33;
;
;
;
{
xtmp31 = 0;
do {
do {
if(1!==XATS2JS_ctag(L1VALeval0(L1VALtmp(arg[1](27))))) break;
xtmp31 = 1;
} while(false);
if(xtmp31 > 0) break;
do {
if(2!==XATS2JS_ctag(L1VALeval0(L1VALtmp(arg[1](27))))) break;
//L1PCKany();
//L1PCKany();
xtmp31 = 2;
} while(false);
if(xtmp31 > 0) break;
} while(false);
} // case-patck0
switch
(xtmp31) {
case 1:
{
xtmp30 = a1x2();
}
;
break;
case 2:
xtmp32 = L1VALeval0(L1VALtmp(arg[1](27)))[1];
xtmp33 = L1VALeval0(L1VALtmp(arg[1](27)))[2];
{
xtmp30 = a1x3(xtmp32, xtmp33);
}
;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp30;
} // function // XATS2JS_list_uncons_cfr(8)


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(2105(line=137,offs=1)--2172(line=140,offs=37))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(2181(line=142,offs=1)--2259(line=146,offs=39))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(2263(line=148,offs=1)--2317(line=149,offs=46))
function
XATS2JS_strmcon_nil()
{
let xtmp34;
{
xtmp34 = [1];
}
;
return xtmp34;
} // function // XATS2JS_strmcon_nil(9)


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(2318(line=150,offs=1)--2378(line=151,offs=52))
function
XATS2JS_strmcon_cons(a1x1, a1x2)
{
let xtmp37;
;
;
{
xtmp37 = [2, a1x1, a1x2];
}
;
return xtmp37;
} // function // XATS2JS_strmcon_cons(10)


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(2700(line=176,offs=1)--2831(line=184,offs=42))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(2832(line=185,offs=1)--2971(line=191,offs=9))
function
XATS2JS_strm_uncons_cfr(a1x1, a1x2, a1x3)
{
let xtmp41;
let xtmp42;
let xtmp43;
let xtmp44;
let xtmp45;
;
;
;
xtmp42 = XATS2JS_lazy_eval(a1x1);
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
switch
(xtmp43) {
case 1:
{
xtmp41 = a1x2();
}
;
break;
case 2:
xtmp44 = xtmp42[1];
xtmp45 = xtmp42[2];
{
xtmp41 = a1x3(xtmp44, xtmp45);
}
;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp41;
} // function // XATS2JS_strm_uncons_cfr(11)


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(3039(line=194,offs=1)--3150(line=200,offs=44))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(3151(line=201,offs=1)--3254(line=206,offs=9))
function
XATS2JS_streax_uncons_cfr(a1x1, a1x2)
{
let xtmp48;
let xtmp49;
let xtmp50;
let xtmp51;
let xtmp52;
;
;
xtmp49 = XATS2JS_lazy_eval(a1x1);
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
switch
(xtmp50) {
case 1:
xtmp51 = xtmp49[1];
xtmp52 = xtmp49[2];
{
xtmp48 = a1x2(xtmp51, xtmp52);
}
;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp48;
} // function // XATS2JS_streax_uncons_cfr(12)


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(3377(line=214,offs=1)--3433(line=216,offs=33))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(3442(line=218,offs=1)--3504(line=220,offs=38))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(3508(line=222,offs=1)--3554(line=223,offs=38))
function
XATS2JS_optn_vt_nil()
{
let xtmp53;
{
xtmp53 = [1];
}
;
return xtmp53;
} // function // XATS2JS_optn_vt_nil(13)


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(3555(line=224,offs=1)--3607(line=225,offs=44))
function
XATS2JS_optn_vt_cons(a1x1)
{
let xtmp55;
;
{
xtmp55 = [2, a1x1];
}
;
return xtmp55;
} // function // XATS2JS_optn_vt_cons(14)


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(3639(line=229,offs=1)--3756(line=235,offs=36))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(3757(line=236,offs=1)--3885(line=242,offs=9))
function
XATS2JS_optn_vt_uncons_cfr(a1x1, a1x2, a1x3)
{
let xtmp59;
let xtmp60;
let xtmp61;
;
;
;
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
switch
(xtmp60) {
case 1:
{
xtmp59 = a1x2();
}
;
break;
case 2:
xtmp61 = L1VALeval0(L1VALtmp(arg[1](56)))[1];
{
xtmp59 = a1x3(xtmp61);
}
;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp59;
} // function // XATS2JS_optn_vt_uncons_cfr(15)


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(4009(line=250,offs=1)--4076(line=253,offs=37))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(4085(line=255,offs=1)--4166(line=259,offs=42))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(4170(line=261,offs=1)--4224(line=262,offs=46))
function
XATS2JS_list_vt_nil()
{
let xtmp62;
{
xtmp62 = [1];
}
;
return xtmp62;
} // function // XATS2JS_list_vt_nil(16)


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(4225(line=263,offs=1)--4285(line=264,offs=52))
function
XATS2JS_list_vt_cons(a1x1, a1x2)
{
let xtmp65;
;
;
{
xtmp65 = [2, a1x1, a1x2];
}
;
return xtmp65;
} // function // XATS2JS_list_vt_cons(17)


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(4317(line=268,offs=1)--4457(line=276,offs=45))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(4458(line=277,offs=1)--4594(line=283,offs=9))
function
XATS2JS_list_vt_uncons_cfr(a1x1, a1x2, a1x3)
{
let xtmp69;
let xtmp70;
let xtmp71;
let xtmp72;
;
;
;
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
switch
(xtmp70) {
case 1:
{
xtmp69 = a1x2();
}
;
break;
case 2:
xtmp71 = L1VALeval0(L1VALtmp(arg[1](66)))[1];
xtmp72 = L1VALeval0(L1VALtmp(arg[1](66)))[2];
{
xtmp69 = a1x3(xtmp71, xtmp72);
}
;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp69;
} // function // XATS2JS_list_vt_uncons_cfr(18)


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(5035(line=312,offs=1)--5108(line=315,offs=40))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(5117(line=317,offs=1)--5204(line=321,offs=45))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(5208(line=323,offs=1)--5268(line=324,offs=52))
function
XATS2JS_strmcon_vt_nil()
{
let xtmp73;
{
xtmp73 = [1];
}
;
return xtmp73;
} // function // XATS2JS_strmcon_vt_nil(19)


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(5269(line=325,offs=1)--5335(line=326,offs=58))
function
XATS2JS_strmcon_vt_cons(a1x1, a1x2)
{
let xtmp76;
;
;
{
xtmp76 = [2, a1x1, a1x2];
}
;
return xtmp76;
} // function // XATS2JS_strmcon_vt_cons(20)


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(5367(line=330,offs=1)--5507(line=338,offs=45))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(5508(line=339,offs=1)--5658(line=345,offs=9))
function
XATS2JS_strm_vt_uncons_cfr(a1x1, a1x2, a1x3)
{
let xtmp80;
let xtmp81;
let xtmp82;
let xtmp83;
let xtmp84;
;
;
;
xtmp81 = XATS2JS_llazy_eval(a1x1);
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
switch
(xtmp82) {
case 1:
{
xtmp80 = a1x2();
}
;
break;
case 2:
xtmp83 = xtmp81[1];
xtmp84 = xtmp81[2];
{
xtmp80 = a1x3(xtmp83, xtmp84);
}
;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp80;
} // function // XATS2JS_strm_vt_uncons_cfr(21)


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(5729(line=348,offs=1)--5849(line=354,offs=47))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(5850(line=355,offs=1)--5960(line=360,offs=9))
function
XATS2JS_streax_vt_uncons_cfr(a1x1, a1x2)
{
let xtmp87;
let xtmp88;
let xtmp89;
let xtmp90;
let xtmp91;
;
;
xtmp88 = XATS2JS_llazy_eval(a1x1);
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
switch
(xtmp89) {
case 1:
xtmp90 = xtmp88[1];
xtmp91 = xtmp88[2];
{
xtmp87 = a1x2(xtmp90, xtmp91);
}
;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp87;
} // function // XATS2JS_streax_vt_uncons_cfr(22)


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(6034(line=364,offs=1)--6143(line=369,offs=47))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(6144(line=370,offs=1)--6276(line=379,offs=9))
function
XATS2JS_strm_vt_map0_cfr(a1x1, a1x2)
{
let xtmp94;
;
;
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(6235(line=378,offs=1)--6274(line=378,offs=40))
// L1DCLnone0();
{
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/VT/strm000_vt.dats@(10270(line=785,offs=1)--10651(line=817,offs=9))
function
strm_vt_map0_823218_5181_(a2x1)
{
let xtmp112;
;
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/VT/strm000_vt.dats@(10336(line=793,offs=1)--10615(line=816,offs=12))
function
auxmain_10339_(a3x1)
{
let xtmp97;
let xtmp110;
let xtmp111;
;
xtmp110 =
function()
{
let xtmp98;
let xtmp99;
let xtmp100;
let xtmp101;
let xtmp102;
let xtmp103;
let xtmp106;
let xtmp107;
let xtmp108;
xtmp99 = XATS2JS_llazy_eval(a3x1);
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
switch
(xtmp100) {
case 1:
{
xtmp98 = [1];
}
;
break;
case 2:
xtmp101 = xtmp99[1];
xtmp102 = xtmp99[2];
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/VT/strm000_vt.dats@(10511(line=811,offs=3)--10543(line=812,offs=24))
{
{
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(6235(line=378,offs=1)--6274(line=378,offs=40))
function
map0$fopr_823218_2940_(a5x1)
{
let xtmp105;
;
{
xtmp105 = a1x2(a5x1);
}
;
return xtmp105;
} // function // map0$fopr(24)
;
xtmp103 = map0$fopr_823218_2940_(xtmp101);
}
;
;
} // val(H0Pvar(y0(95)))
;
{
{
xtmp107 = auxmain_10339_(xtmp102);
}
;
xtmp106 = [2, xtmp103, xtmp107];
}
;
xtmp98 = xtmp106;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
return xtmp98;
} // lam-function
;
xtmp111 =
function()
{
let xtmp98;
let xtmp99;
let xtmp100;
let xtmp101;
let xtmp102;
let xtmp103;
let xtmp106;
let xtmp107;
let xtmp108;
{
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/VT/strm000_vt.dats@(2325(line=183,offs=1)--2377(line=185,offs=37))
// { // val-implmnt
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/VT/strm000_vt.dats@(2224(line=176,offs=1)--2272(line=178,offs=29))
function
strm_vt_free_823218_2656_(a5x1)
{
;
return XATS2JS_llazy_free(a5x1);
} // function // strm_vt_free(28)
;
// } // val-implmnt
const // implval/fun
g_free_823218_1640_ = strm_vt_free_823218_2656_
;
xtmp108 = strm_vt_free_823218_2656_(a3x1);
}
;
} // lam-function
;
xtmp97 = XATS2JS_new_llazy(xtmp110,xtmp111);
return xtmp97;
} // function // auxmain(26)
;
{
xtmp112 = auxmain_10339_(a2x1);
}
;
return xtmp112;
} // function // strm_vt_map0(25)
;
xtmp94 = strm_vt_map0_823218_5181_(a1x1);
}
;
return xtmp94;
} // function // XATS2JS_strm_vt_map0_cfr(23)


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(6347(line=384,offs=1)--6453(line=388,offs=49))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(6454(line=389,offs=1)--6635(line=402,offs=9))
function
XATS2JS_strm_vt_filter0_cfr(a1x1, a1x2)
{
let xtmp115;
;
;
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(6547(line=397,offs=3)--6577(line=398,offs=22))
// L1DCLnone0();
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(6592(line=400,offs=3)--6630(line=400,offs=41))
// L1DCLnone0();
{
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/VT/strm000_vt.dats@(11077(line=854,offs=1)--11559(line=897,offs=13))
function
strm_vt_filter0_823218_5369_(a2x1)
{
let xtmp138;
;
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/VT/strm000_vt.dats@(11149(line=862,offs=1)--11554(line=895,offs=8))
function
auxmain_11152_(a3x1)
{
let a3y1;
let xtmp118;
let xtmp122;
let xtmp123;
do {
;
xtmp122 =
function()
{
let xtmp119;
let xtmp120;
{
xtmp119 = auxloop_11237_(a3x1);
}
;
return xtmp119;
} // lam-function
;
xtmp123 =
function()
{
let xtmp119;
let xtmp120;
{
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/VT/strm000_vt.dats@(2325(line=183,offs=1)--2377(line=185,offs=37))
// { // val-implmnt
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/VT/strm000_vt.dats@(2224(line=176,offs=1)--2272(line=178,offs=29))
function
strm_vt_free_823218_2656_(a5x1)
{
;
return XATS2JS_llazy_free(a5x1);
} // function // strm_vt_free(28)
;
// } // val-implmnt
const // implval/fun
g_free_823218_1640_ = strm_vt_free_823218_2656_
;
xtmp120 = strm_vt_free_823218_2656_(a3x1);
}
;
} // lam-function
;
xtmp118 = XATS2JS_new_llazy(xtmp122,xtmp123);
break;//return
} while( true );
return xtmp118;
} // function // auxmain(32)
function
auxloop_11237_(a3x1)
{
let a3y1;
let xtmp125;
let xtmp126;
let xtmp127;
let xtmp128;
let xtmp129;
let xtmp130;
let xtmp133;
let xtmp134;
let xtmp137;
do {
;
xtmp126 = XATS2JS_llazy_eval(a3x1);
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
switch
(xtmp127) {
case 1:
{
xtmp125 = [1];
}
;
break;
case 2:
xtmp128 = xtmp126[1];
xtmp129 = xtmp126[2];
{
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(6592(line=400,offs=3)--6630(line=400,offs=41))
function
filter0$test_823218_3813_(a4x1)
{
let xtmp132;
;
{
xtmp132 = a1x2(a4x1);
}
;
return xtmp132;
} // function // filter0$test(30)
;
xtmp130 = filter0$test_823218_3813_(xtmp128);
}
;
if
(xtmp130)
// then
{
{
{
xtmp133 = auxmain_11152_(xtmp129);
}
;
xtmp125 = [2, xtmp128, xtmp133];
}
;
} // if-then
else
{
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/VT/strm000_vt.dats@(11464(line=892,offs=3)--11483(line=892,offs=22))
{
{
// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(6547(line=397,offs=3)--6577(line=398,offs=22))
function
g_free_823218_1640_(a4x1)
{
let xtmp136;
;
{
xtmp136 = [-1];
}
;
return xtmp136;
} // function // g_free(27)
;
xtmp134 = g_free_823218_1640_(xtmp128);
}
;
//L1PCKxpat(H0Pnil(); L1VALtmp(tmp(134)));
//L1CMDmatch(H0Pnil(); L1VALtmp(tmp(134)));
} // val(H0Pnil())
;
{
// tail-recursion:
// L1CMDapp(tmp(137); L1VALfcst(auxloop(33)); L1VALtmp(tmp(129)))
a3y1 = xtmp129; a3x1 = a3y1; continue;
}
;
xtmp125 = xtmp137;
} // if-else
;
break;
default: XATS2JS_matcherr0();
} // case-switch
;
break;//return
} while( true );
return xtmp125;
} // function // auxloop(33)
;
{
xtmp138 = auxmain_11152_(a2x1);
}
;
return xtmp138;
} // function // strm_vt_filter0(31)
;
xtmp115 = strm_vt_filter0_823218_5369_(a1x1);
}
;
return xtmp115;
} // function // XATS2JS_strm_vt_filter0_cfr(29)


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(6927(line=426,offs=1)--6967(line=428,offs=23))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(6996(line=431,offs=1)--7060(line=435,offs=31))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(7061(line=436,offs=1)--7111(line=438,offs=33))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(7140(line=441,offs=1)--7215(line=446,offs=31))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(7216(line=447,offs=1)--7266(line=449,offs=33))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(7295(line=452,offs=1)--7359(line=456,offs=30))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(7360(line=457,offs=1)--7412(line=459,offs=35))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(7441(line=462,offs=1)--7510(line=467,offs=26))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(7511(line=468,offs=1)--7563(line=470,offs=37))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(7592(line=473,offs=1)--7659(line=478,offs=25))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(7660(line=479,offs=1)--7722(line=481,offs=45))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(7793(line=488,offs=1)--7837(line=490,offs=27))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(7847(line=492,offs=1)--7892(line=494,offs=28))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(7899(line=495,offs=1)--7944(line=497,offs=28))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(7982(line=501,offs=1)--8071(line=507,offs=35))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(8072(line=508,offs=1)--8126(line=510,offs=37))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(8158(line=514,offs=1)--8248(line=520,offs=32))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(8249(line=521,offs=1)--8305(line=523,offs=39))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(8317(line=526,offs=1)--8407(line=532,offs=32))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(8408(line=533,offs=1)--8464(line=535,offs=39))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(8499(line=540,offs=1)--8607(line=547,offs=34))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(8608(line=548,offs=1)--8664(line=550,offs=39))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(8676(line=553,offs=1)--8784(line=560,offs=34))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(8785(line=561,offs=1)--8841(line=563,offs=39))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(8876(line=568,offs=1)--8989(line=575,offs=34))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(8990(line=576,offs=1)--9054(line=578,offs=47))
// L1DCLnone0()

// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(9089(line=583,offs=1)--9181(line=589,offs=33))


// /home/hwxi/Research/ATS-Xanadu/prelude/DATS/CATS/JS/prelude.dats@(9182(line=590,offs=1)--9240(line=592,offs=41))
// L1DCLnone0()

