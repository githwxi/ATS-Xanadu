################################################################
################################################################
##
## Basics3 for XATS2PY
##
################################################################
################################################################
##
def XATS2PY_pyobj_get_at(obj, key):
  return obj[key] ## endof(pyobj_get_at)
def XATS2PY_pyobj_set_at(obj, key, itm):
  obj[key] = itm; return ## endof(pyobj_set_at)
##
################################################################
##
## HX-2020-11-09:
## Native arrays for Xats2py
##
################################################################
##
def XATS2PY_pyarray_size(xs): return len(xs)
def XATS2PY_pyarray_length(xs): return len(xs)
##
################################################################
##
def XATS2PY_pyarray_get_at(xs, i0):
  return xs[i0] ## endof(pyarray_get_at)
def XATS2PY_pyarray_set_at(xs, i0, x0):
  xs[i0] = x0; return ## endof(pyarray_set_at)
##
################################################################
##
## HX-2020-11-28:
## Native objmaps for Xats2py
##
################################################################

def XATS2PY_pyobjmap_keys(dct): return dct.keys()
def XATS2PY_pyobjmap_keyq(dct, key): return (key in dict)

################################################################

def
XATS2PY_pyobjmap_make_nil
  ()
{
  return {} ;
} ## XATS2PY_pyobjmap_make_nil

/* ****** ****** */

def
XATS2PY_pyobjmap_search_opt
   (obj, key)
{
##
var itm0 = obj[key];
##
if(itm0===undefined)
{
  return XATS2PY_optn_vt_nil();
} else {
  return XATS2PY_optn_vt_cons(itm0);
} ## end of [if]
##
} ## [ XATS2PY_pyobjmap_search_opt ]

/* ****** ****** */

def
XATS2PY_pyobjmap_insert_any
   (obj, key, itm1)
{
  obj[key] = itm1; return;
} ## [XATS2PY_pyobjmap_insert_any]

def
XATS2PY_pyobjmap_remove_any
   (obj, key)
{
  delete object[key]; return ;
} ## [XATS2PY_pyobjmap_remove_any]

/* ****** ****** */

def
XATS2PY_pyobjmap_insert_opt
   (obj, key, itm1)
{
##
var itm0 = obj[key];
##
if(itm0===undefined)
{
  obj[key] = itm1;
  return XATS2PY_optn_vt_nil();
} else {
  obj[key] = itm1;
  return XATS2PY_optn_vt_cons(itm0);
} ## end of [if]
##
} ## [ XATS2PY_pyobjmap_insert_opt ]

def
XATS2PY_pyobjmap_remove_opt
   (obj, key)
{
##
var itm0 = obj[key];
##
if(itm0===undefined)
{
  return XATS2PY_optn_vt_nil();
} else {
  delete object[key];
  return XATS2PY_optn_vt_cons(itm0);
} ## end of [if]
##
} ## [ XATS2PY_pyobjmap_remove_opt ]

################################################################
################################################################
## end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_PY_basics3.cats]
################################################################
################################################################
