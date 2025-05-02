##################################################################.
##################################################################.
##
## Basics3 for XATS2PY
##
##################################################################.
##################################################################.
##
def XATS2PY_pyobj_get_at(obj, key):
  return obj[key] ## endof(pyobj_get_at)
def XATS2PY_pyobj_set_at(obj, key, itm):
  obj[key] = itm; return ## endof(pyobj_set_at)
##
##################################################################.
##
## HX-2020-11-09:
## Native array for XATS2PY
##
##################################################################.
##
def XATS2PY_pya1sz_size(xs): return len(xs)
def XATS2PY_pya1sz_length(xs): return len(xs)
##
##################################################################.
##
def XATS2PY_pya1sz_get_at(xs, i0):
  return xs[i0] ## endof(pya1sz_get_at)
def XATS2PY_pya1sz_set_at(xs, i0, x0):
  xs[i0] = x0; return ## endof(pya1sz_set_at)
##
##################################################################.
##
## HX-2020-11-28:
## Native hashmap for XATS2PY
##
##################################################################.
##
## HX: listizing a view
def XATS2PY_pyhmap_keys(dct):
  return list(dct.keys()) ## endof(pyhmap_keys)
def XATS2PY_pyobjmap_keyq(dct, key):
  return (  key in dict  ) ## endof(pyhmap_keyq)
##
##################################################################.
##################################################################.
## end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_PY_basics3.cats]
##################################################################.
##################################################################.
