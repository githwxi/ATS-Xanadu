(* ****** ****** *)
(* ****** ****** *)
(*
HX-2025-02-10:
Some needed templates
are in [./basics1.dats]
*)
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox
jsobj_tbox(*void*)
#typedef jsobj = jsobj_tbox
//
(* ****** ****** *)
//
(*
HX-2020-11-09:
Native JS a1sz for XATS2JS
*)
//
#abstbox
jsa1sz_tbox(x0:vt)
#sexpdef jsa1sz = jsa1sz_tbox
//
(* ****** ****** *)
(*
HX-2020-11-23:
Basics3 for XATS2JS
based on the native JS hmaps 
*)
(* ****** ****** *)
//
#abstbox
jshmap_tbox(k0:t0, x0:vt)
//
#sexpdef jshmap = jshmap_tbox
(*
#typedef
jshmap
( k0: t0
, x0: vt) = jshmap_tbox(k0, x0)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
// XATS2JS/jsobj
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
XATS2JS_jsobj_get$at
( obj
: jsobj
, key
: string): jsobj
= $extnam() // end-of-[fun]
//
#extern
fun
XATS2JS_jsobj_set$at
( obj
: jsobj
, key
: string
, itm: jsobj): void
= $extnam() // end-of-[fun]
//
#symload
[] with
XATS2JS_jsobj_get$at of 1000
#symload
[] with
XATS2JS_jsobj_set$at of 1000
#symload
get$at with
XATS2JS_jsobj_get$at of 1000
#symload
set$at with
XATS2JS_jsobj_set$at of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
// XATS2JS/jsa1sz:
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
XATS2JS_jsa1sz_length
{x0:t0}
( xs
: jsa1sz(x0)): nint
= $extnam() // end-of-[fun]
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_jsa1sz_get$at
{x0:t0}
( xs
: jsa1sz(x0)
, i0: nint(*ind*)): x0
= $extnam() // end-of-[fun]
//
#extern
fun
XATS2JS_jsa1sz_set$at
  {x0:t0}
( xs
: jsa1sz(x0)
, i0: nint, x0: x0): void
= $extnam() // end-of-[fun]
//
(* ****** ****** *)
#symload
[] with
XATS2JS_jsa1sz_get$at of 1000
#symload
[] with
XATS2JS_jsa1sz_set$at of 1000
(* ****** ****** *)
#symload
size with
XATS2JS_jsa1sz_length of 1000
#symload
length with
XATS2JS_jsa1sz_length of 1000
(* ****** ****** *)
#symload
get$at with
XATS2JS_jsa1sz_get$at of 1000
#symload
set$at with
XATS2JS_jsa1sz_set$at of 1000
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<x0:t0>
XATS2JS_jsa1sz_strmize
(xs: jsa1sz(x0)): strm_vt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
#impltmp
{x0:t0}
g_print
<jsa1sz(x0)>(xs) =
gseq_print<jsa1sz(x0)><x0>(xs)
(* ****** ****** *)
#impltmp
{x0:t0}
gseq_strmize
<jsa1sz(x0)><x0>(xs) =
XATS2JS_jsa1sz_strmize<x0>(xs)
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{x0:t0}
XATS2JS_jsa1sz_strmize
<x0>(xs) =
(
  auxmain(0)) where
{
//
  val n0 = length(xs)
//
  fun
  auxmain
  (i0: sint): strm_vt(x0) =
  $llazy
  (
    if
    (i0 >= n0)
    then
    (
      strmcon_vt_nil((*0*))
    )
    else
    let
      val x0 = xs.get$at(i0)
    in//let
      strmcon_vt_cons(x0, auxmain(i0+1))
    end // let // end of [else]
  ) (* $llazy *) // end of [auxmain(...)]
//
} (* end of [XATS2JS_jsa1sz_strmize<x0>] *)
//
(* ****** ****** *)
(* ****** ****** *)
//
// XATS2JS/jshmap:
//
(* ****** ****** *)
(* ****** ****** *)
#typedef int0 = sint
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<k0:t0>
XATS2JS_jshmap_keys
{x0:vt}
( map
: jshmap
  (k0, x0)): jsa1sz(k0)
//
(* ****** ****** *)
//
#impltmp
XATS2JS_jshmap_keys
<int0>(map) =
XATS2JS_jshmap_keys(map)
where{
//
#typedef k0 = int0
//
#extern
fun
XATS2JS_jshmap_keys
{x0:vt}
( map
: jshmap
  (k0, x0)): jsa1sz(k0) = $extnam()
}(*where*)//end(XATS2JS_jshmap_keys<int0>]
//
#impltmp
XATS2JS_jshmap_keys
<strn>(map) =
XATS2JS_jshmap_keys(map)
where{
//
#typedef k0 = strn
//
#extern
fun
XATS2JS_jshmap_keys
{x0:vt}
( map
: jshmap
  (k0, x0)): jsa1sz(k0) = $extnam()
}(*where*)//end(XATS2JS_jshmap_keys<strn>]
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<k0:t0>
XATS2JS_jshmap_keyq
{x0:vt}
( map
: jshmap
  (k0, x0), key: k0): bool
//
(* ****** ****** *)
//
#impltmp
XATS2JS_jshmap_keyq
<int0>(map, key) =
XATS2JS_jshmap_keyq(map, key)
where{
//
#typedef k0 = int0
//
#extern
fun
XATS2JS_jshmap_keyq
{x0:vt}
( map
: jshmap
  (k0, x0), key: k0): bool = $extnam()
}(*where*)//end-of(XATS2JS_jshmap_keyq<int0>]
//
#impltmp
XATS2JS_jshmap_keyq
<strn>(map, key) =
XATS2JS_jshmap_keyq(map, key)
where{
//
#typedef k0 = strn
//
#extern
fun
XATS2JS_jshmap_keyq
{x0:vt}
( map
: jshmap
  (k0, x0), key: k0): bool = $extnam()
}(*where*)//end-of(XATS2JS_jshmap_keyq<strn>]
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<k0:t0>
XATS2JS_jshmap_make_nil
{x0:t0}
((*void*)): jshmap(k0, x0)
//
(* ****** ****** *)
//
#impltmp
XATS2JS_jshmap_make_nil
<int0>((*0*)) =
XATS2JS_jshmap_make_nil((*0*))
where
{
//
#typedef k0 = int0
//
#extern
fun
XATS2JS_jshmap_make_nil
{x0:t0}((*0*)): jshmap(k0, x0)
= $extnam() // end-of-[fun]
}
//
#impltmp
XATS2JS_jshmap_make_nil
<strn>((*0*)) =
XATS2JS_jshmap_make_nil((*0*))
where{
//
#typedef k0 = strn
//
#extern
fun
XATS2JS_jshmap_make_nil
{x0:t0}
((*0*)): jshmap(k0, x0)= $extnam()
//
}(*where*)//[XATS2JS_jshmap_make_nil]
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<k0:t0>
XATS2JS_jshmap_search$opt
{x0:t0}
( map
: jshmap(k0, x0), key: k0): optn_vt(x0)
//
(* ****** ****** *)
//
#impltmp
XATS2JS_jshmap_search$opt
<int0>(map, key) =
XATS2JS_jshmap_search$opt(map, key)
where {
//
#typedef k0 = int0
//
#extern
fun
XATS2JS_jshmap_search$opt
{x0:t0}
( map
: jshmap
  (k0, x0), key: k0): optn_vt(x0) = $extnam()
}(*where*)//end-[XATS2JS_jshmap_search$opt<int0>]
//
#impltmp
XATS2JS_jshmap_search$opt
<strn>(map, key) =
XATS2JS_jshmap_search$opt(map, key)
where {
//
#typedef k0 = strn
//
#extern
fun
XATS2JS_jshmap_search$opt
{x0:t0}
( map
: jshmap
  (k0, x0), key: k0): optn_vt(x0) = $extnam()
}(*where*)//end-[XATS2JS_jshmap_search$opt<strn>]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#extern
fun
<k0:t0>
XATS2JS_jshmap_remove
{x0:vt}
( map
: jshmap(k0, x0), key: k0): bool
*)
//
#extern
fun
<k0:t0>
XATS2JS_jshmap_remove$any
{x0:vt}
( map
: jshmap(k0, x0), key: k0): void
#extern
fun
<k0:t0>
XATS2JS_jshmap_remove$opt
{x0:vt}
( map
: jshmap(k0, x0), key: k0): optn_vt(x0)
//
(* ****** ****** *)
//
#impltmp
XATS2JS_jshmap_remove$any
<int0>(map, key) =
XATS2JS_jshmap_remove$any(map, key)
where
{
//
#typedef k0 = int0
//
#extern
fun
XATS2JS_jshmap_remove$any
{x0:vt}
( map
: jshmap(k0, x0), key: k0): void = $extnam()
}
//
#impltmp
XATS2JS_jshmap_remove$any
<strn>(map, key) =
XATS2JS_jshmap_remove$any(map, key)
where
{
//
#typedef k0 = strn
//
#extern
fun
XATS2JS_jshmap_remove$any
{x0:vt}
( map
: jshmap(k0, x0), key: k0): void = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
XATS2JS_jshmap_remove$opt
<int0>(map, key) =
XATS2JS_jshmap_remove$opt(map, key)
where
{
//
#typedef k0 = int0
//
#extern
fun
XATS2JS_jshmap_remove$opt
{x0:vt}
( map
: jshmap(k0, x0), key: k0): optn_vt(x0) = $extnam()
}
//
#impltmp
XATS2JS_jshmap_remove$opt
<strn>(map, key) =
XATS2JS_jshmap_remove$opt(map, key)
where
{
//
#typedef k0 = strn
//
#extern
fun
XATS2JS_jshmap_remove$opt
{x0:vt}
( map
: jshmap(k0, x0), key: k0): optn_vt(x0) = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
(*
#extern
fun
<k0:t0>
XATS2JS_jshmap_insert
{x0:vt}
( map
: jshmap(k0, x0), key: k0, itm: x0): bool
*)
//
#extern
fun
<k0:t0>
XATS2JS_jshmap_insert$any
{x0:vt}
( map
: jshmap(k0, x0), key: k0, itm: x0): void
#extern
fun
<k0:t0>
XATS2JS_jshmap_insert$opt
{x0:vt}
( map
: jshmap(k0, x0), key: k0, itm: x0): optn_vt(x0)
//
(* ****** ****** *)
//
#impltmp
XATS2JS_jshmap_insert$any
<int0>(map, key, itm) =
XATS2JS_jshmap_insert$any(map, key, itm)
where {
//
#typedef k0 = int0
//
#extern
fun
XATS2JS_jshmap_insert$any
{x0:t0}
( map
: jshmap
  (k0, x0), key: k0, itm: x0): void = $extnam()
}(*where*)//end-of-[XATS2JS_jshmap_insert$any<int0>]
//
#impltmp
XATS2JS_jshmap_insert$any
<strn>(map, key, itm) =
XATS2JS_jshmap_insert$any(map, key, itm)
where {
//
#typedef k0 = strn
//
#extern
fun
XATS2JS_jshmap_insert$any
{x0:t0}
( map
: jshmap
  (k0, x0), key: k0, itm: x0): void = $extnam()
}(*where*)//end-of-[XATS2JS_jshmap_insert$any<strn>]
//
(* ****** ****** *)
//
#impltmp
XATS2JS_jshmap_insert$opt
<int0>(map, key, itm) =
XATS2JS_jshmap_insert$opt(map, key, itm)
where
{
//
#typedef k0 = int0
//
#extern
fun
XATS2JS_jshmap_insert$opt
{x0:t0}
( map
: jshmap
  (k0, x0), key: k0, itm: x0): optn_vt(x0) = $extnam()
}
//
#impltmp
XATS2JS_jshmap_insert$opt
<strn>(map, key, itm) =
XATS2JS_jshmap_insert$opt(map, key, itm)
where
{
//
#typedef k0 = strn
//
#extern
fun
XATS2JS_jshmap_insert$opt
{x0:t0}
( map
: jshmap
  (k0, x0), key: k0, itm: x0): optn_vt(x0) = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{k0:t0}
{x0:t0}
g_print
<jshmap(k0,x0)>(kxs) =
gmap_print
<jshmap(k0,x0)><k0><x0>(kxs)
//
(* ****** ****** *)
//
#impltmp
{k0:t0}
{x0:t0}
gmap_strmize
<jshmap(k0,x0)><k0><x0>(kxs) =
strm_vt_map0
(
gmap_strmize_key
<jshmap(k0,x0)><k0><x0>(kxs)
) where
{
#impltmp map$fopr0<k0><(k0,x0)>(k0) =
let
val-
~optn_vt_cons(x0) =
XATS2JS_jshmap_search$opt(kxs, k0) in (k0, x0)
end//let
} (*where*)
// end(gmap_strmize<jshmap(k0,x0)><k0><x0>(kxs))
//
#impltmp
{k0:t0}
{x0:t0}
gmap_strmize_key
<jshmap(k0,x0)><k0><x0>(kxs) =
(
XATS2JS_jsa1sz_strmize(XATS2JS_jshmap_keys(kxs)))
//end-of(gmap_strmize_key<jshmap(k0,x0)><k0><x0>(kxs))
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_basics3.dats] *)
