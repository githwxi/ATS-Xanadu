;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
;; Basics3 for XATS2CM
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
;; HX-2026-08-04:
;; Native array for XATS2CM
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
#|
def XATS2CM_cma1sz_size(xs): return len(xs)
def XATS2CM_cma1sz_length(xs): return len(xs)
|#
;;
(define
(XATS2CM_cma1sz_size xs) (vector-length xs))
(define
(XATS2CM_cma1sz_length xs) (vector-length xs))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
#|
def XATS2CM_cma1sz_get_at(xs, i0):
  return xs[i0] ;; endof(cma1sz_get_at)
def XATS2CM_cma1sz_set_at(xs, i0, x0):
  xs[i0] = x0; return ;; endof(cma1sz_set_at)
|#
;;
(define
(XATS2CM_cma1sz_get_at xs i0) (vector-ref xs i0))
(define
(XATS2CM_cma1sz_set_at xs i0 x0) (vector-set! xs i0 x0))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
;; HX-2026-08-04:
;; An object is a hashtable
#|
def XATS2CM_cmobj_get_at(obj, key):
  return obj[key] ;; endof(cmobj_get_at)
def XATS2CM_cmobj_set_at(obj, key, itm):
  obj[key] = itm; return ;; endof(cmobj_set_at)
|#
(define
(XATS2CM_cmobj_get_at obj key) (hashtable-ref obj key #f))
(define
(XATS2CM_cmobj_set_at obj key itm) (hashtable-set! obj key itm))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
;; HX-2020-11-28:
;; Native hashmap for XATS2CM
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
#|
def XATS2CM_cmhmap_make_nil(): return {}
|#
(define
(XATS2CM_cmhmap_make_nil) (make-eqv-hashtable))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
;; HX: listizing a view
#|
def XATS2CM_cmhmap_keyq(dct, key):
  if (dct == 0):
    return False ;; for null map
  else:
    return (  key in dct  ) ;; endof(cmhmap_keyq)
|#
;;
(define
(XATS2CM_cmhmap_keyq dct key)
  (if (zero? dct) #f (hashtable-contains? dct key)))
;;
#|
def XATS2CM_cmhmap_get_keys( dct ):
  if (dct == 0):
    return list()
  else:
    return list(dct.keys()) ;; endof(cmhmap_get_keys)
|#
;;
(define
(XATS2CM_cmhmap_get_keys dct)
  (if (zero? dct) (make-vector 0) (hashtable-keys dct)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
#|
def XATS2CM_cmhmap_search_opt(dct, key):
  if (dct == 0):
    return XATS2CM_optn_vt_nil() ;; null map
  if (key in dct):
    return XATS2CM_optn_vt_cons(dct[key])
  else:
    return XATS2CM_optn_vt_nil() ;; not found
|#
;;
(define
(XATS2CM_cmhmap_search_opt dct key)
  (if (zero? dct)
      (XATS2CM_optn_vt_nil)
      (if (hashtable-contains? dct key)
          (XATS2CM_optn_vt_cons
	   (hashtable-ref dct key #f)) (XATS2CM_optn_vt_nil))))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
#|
def XATS2CM_cmhmap_insert_any(dct, key, itm):
  dct[key] = itm ;; end of [cmhmap_insert_any(dct,...)]
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;; end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_CM_basics3.cats]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
