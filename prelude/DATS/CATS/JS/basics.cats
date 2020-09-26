/* ****** ****** */
/*
Basics for Xats2js
*/
/* ****** ****** */
var
XATS2JS_top = null
var
XATS2JS_none = null
var
XATS2JS_void = null
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
  var
  offs = lvl0.offs;
  return lvl0.root[offs];
}
function
XATS2JS_lval_set
  (lvl0, obj1)
{
//
  var prev = null;
  var root = null;
  var offs = lvl0.offs;
//
  if
  (
  lvl0.hasOwnProperty('prev')
  )
  { // flat tuple
    root = lvl0.root;
    lvl0.root = root.slice();
    lvl0.root[ offs ] = obj1;
    XATS2JS_lval_set
    ( lvl0.prev, lvl0.root );
  }
  else
  { // boxed tuple
    lvl0.root[ offs ] = obj1;
  }
  return; // XATS2JS_lval_set
}
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
//
function
XATS2JS_g_print(obj)
{
var
rep = obj.toString();
process.stdout.write(rep);
return; // XATS2JS_g_print
}
//
/* ****** ****** */
//
// prelude/bool.sats
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
return ; // XATS2JS_bool_print
}
/* ****** ****** */
//
// prelude/char.sats
//
/* ****** ****** */
function
XATS2JS_char_print
  (c0)
{
  XATS2JS_g_print(c0);
  return; // char_print
}
/* ****** ****** */
//
// prelude/gint.sats
//
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
XATS2JS_gint_neg_sint
  (x0)
{ return (-x0); }
/* ****** ****** */
function
XATS2JS_gint_succ_sint
  (x0)
{ return (x0 + 1); }
function
XATS2JS_gint_pred_sint
  (x0)
{ return (x0 - 1); }
/* ****** ****** */
function
XATS2JS_gint_lt_sint_sint
  (x1, x2)
{ return (x1 < x2); }
function
XATS2JS_gint_gt_sint_sint
  (x1, x2)
{ return (x1 > x2); }
function
XATS2JS_gint_eq_sint_sint
  (x1, x2)
{ return (x1 === x2); }
function
XATS2JS_gint_lte_sint_sint
  (x1, x2)
{ return (x1 <= x2); }
function
XATS2JS_gint_gte_sint_sint
  (x1, x2)
{ return (x1 >= x2); }
function
XATS2JS_gint_neq_sint_sint
  (x1, x2)
{ return (x1 !== x2); }
/* ****** ****** */
function
XATS2JS_gint_add_sint_sint
  (x1, x2)
{ return ( x1 + x2 ); }
/* ****** ****** */
function
XATS2JS_gint_sub_sint_sint
  (x1, x2)
{ return ( x1 - x2 ); }
/* ****** ****** */
function
XATS2JS_gint_mul_sint_sint
  (x1, x2)
{ return ( x1 * x2 ); }
/* ****** ****** */
function
XATS2JS_gint_mod_sint_sint
  (x1, x2)
{ return ( x1 % x2 ); }
/* ****** ****** */
function
XATS2JS_gint_div_sint_sint
  (x1, x2)
{ 
  var q0 = x1 / x2;
  if
  (q0 >= 0)
  {
    return Math.floor(q0);
  }
  else
  {
    return Math.ceil( q0 );
  }
}
/* ****** ****** */
//
// prelude/string.sats
//
/* ****** ****** */
function
XATS2JS_string_print
  (x0)
{
  XATS2JS_g_print(x0); return;
}
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

/* end of [XATS2JS_basics.cats] */
