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
