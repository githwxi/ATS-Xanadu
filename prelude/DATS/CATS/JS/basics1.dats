(* ****** ****** *)
(*
HX-2020-11-09:
Native arrays for Xats2js
*)
(* ****** ****** *)
//
#abstbox
jsobj_tbox(*void*)
#typedef
jsobj = jsobj_tbox
//
(* ****** ****** *)
//
#abstbox
jsarray_tbox(x0:vt)
#sexpdef
jsarray = jsarray_tbox
//
(* ****** ****** *)
(*
HX-2020-11-23:
Hashmaps for Xats2js
based on the native JS objmaps 
*)
(* ****** ****** *)
//
#abstbox
jsobjmap_tbox
(k0:t0, x0:vt)
//
#sexpdef
jsobjmap = jsobjmap_tbox
(*
#typedef
jsobjmap
( k0: t0
, x0: vt) = jsobjmap_tbox(k0, x0)
*)
//
(* ****** ****** *)
#staload _ = "./basics0.dats"
(* ****** ****** *)
//
// XATS2JS/jsobj
//
(* ****** ****** *)
#extern
fun
XATS2JS_jsobj_get_at
( obj
: jsobj
, key
: string): jsobj = $extnam()
#extern
fun
XATS2JS_jsobj_set_at
( obj
: jsobj
, key
: string
, itm: jsobj): void = $extnam()
//
#symload
[] with XATS2JS_jsobj_get_at
#symload
[] with XATS2JS_jsobj_set_at
#symload
get_at with XATS2JS_jsobj_get_at
#symload
set_at with XATS2JS_jsobj_set_at
//
(* ****** ****** *)
//
// XATS2JS/jsarray:
//
(* ****** ****** *)
#extern
fun
XATS2JS_jsarray_length
{x0:t0}
( xs
: jsarray(x0)): nint = $extnam()
(* ****** ****** *)
#extern
fun
XATS2JS_jsarray_get_at
{x0:t0}
( xs
: jsarray(x0)
, i0: nint(*ind*)): x0 = $extnam()
#extern
fun
XATS2JS_jsarray_set_at
  {x0:t0}
( xs
: jsarray(x0)
, i0: nint, x0: x0): void = $extnam()
(* ****** ****** *)
#symload size
with XATS2JS_jsarray_length of 1000
#symload length
with XATS2JS_jsarray_length of 1000
(* ****** ****** *)
#symload []
with XATS2JS_jsarray_get_at of 1000
#symload []
with XATS2JS_jsarray_set_at of 1000
(* ****** ****** *)
#symload get_at
with XATS2JS_jsarray_get_at of 1000
#symload set_at
with XATS2JS_jsarray_set_at of 1000
(* ****** ****** *)
//
#extern
fun
XATS2JS_jsarray_strmize
{x0:t0}
( xs
: jsarray(x0)): strm_vt(x0) = $extnam()
//
(*
#symload strmize
with XATS2JS_jsarray_strmize of 1000
*)
//
(* ****** ****** *)
#impltmp
{x0:t0}
g_print
<jsarray(x0)>(xs) =
gseq_print
<jsarray(x0)><x0>(xs)
(* ****** ****** *)
#impltmp
{x0:t0}
gseq_strmize
<jsarray(x0)><x0>(xs) =
XATS2JS_jsarray_strmize(xs)
(* ****** ****** *)
//
#implfun
XATS2JS_jsarray_strmize
{x0}(xs) = auxmain(0) where
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
      strmcon_vt_nil((*void*))
    )
    else
    let
      val x0 = xs.get_at(i0)
    in
      strmcon_vt_cons(x0, auxmain(i0+1))
    end // end of [else]
  ) (* end of [auxmain] *)
//
} (* end of [XATS2JS_jsarray_strmize] *)
//
(* ****** ****** *)
//
// XATS2JS/jsobjmap:
//
(* ****** ****** *)
#typedef int0 = sint
(* ****** ****** *)
#extern
fun
<k0:t0>
XATS2JS_jsobjmap_keys
{x0:vt}
( map
: jsobjmap(k0, x0)): jsarray(k0)
(* ****** ****** *)
//
#impltmp
XATS2JS_jsobjmap_keys
<int0> =
XATS2JS_jsobjmap_keys where
{
//
#typedef k0 = int0
//
fun
XATS2JS_jsobjmap_keys
{x0:vt}
( map
: jsobjmap(k0, x0)): jsarray(k0) = $extnam()
}
#impltmp
XATS2JS_jsobjmap_keys
<strn> =
XATS2JS_jsobjmap_keys where
{
//
#typedef k0 = strn
//
fun
XATS2JS_jsobjmap_keys
{x0:vt}
( map
: jsobjmap(k0, x0)): jsarray(k0) = $extnam()
}
//
(* ****** ****** *)
#extern
fun
<k0:t0>
XATS2JS_jsobjmap_keyq
{x0:vt}
( map
: jsobjmap(k0, x0), key: k0): bool
(* ****** ****** *)
//
#impltmp
XATS2JS_jsobjmap_keyq
<int0> =
XATS2JS_jsobjmap_keyq where
{
//
#typedef k0 = int0
//
fun
XATS2JS_jsobjmap_keyq
{x0:vt}
( map
: jsobjmap(k0, x0), key: k0): bool = $extnam()
}
#impltmp
XATS2JS_jsobjmap_keyq
<strn> =
XATS2JS_jsobjmap_keyq where
{
//
#typedef k0 = strn
//
fun
XATS2JS_jsobjmap_keyq
{x0:vt}
( map
: jsobjmap(k0, x0), key: k0): bool = $extnam()
}
//
(* ****** ****** *)
#extern
fun
<k0:t0>
XATS2JS_jsobjmap_make_nil
{x0:t0}
((*void*)): jsobjmap(k0, x0)
(* ****** ****** *)
#impltmp
XATS2JS_jsobjmap_make_nil
<int0> =
XATS2JS_jsobjmap_make_nil where
{
//
#typedef k0 = int0
//
fun
XATS2JS_jsobjmap_make_nil
{x0:t0}
((*void*)): jsobjmap(k0, x0) = $extnam()
}
#impltmp
XATS2JS_jsobjmap_make_nil
<strn> =
XATS2JS_jsobjmap_make_nil where
{
//
#typedef k0 = strn
//
fun
XATS2JS_jsobjmap_make_nil
{x0:t0}
((*void*)): jsobjmap(k0, x0) = $extnam()
//
} (*where*) // [XATS2JS_jsobjmap_make_nil]
(* ****** ****** *)
#extern
fun
<k0:t0>
XATS2JS_jsobjmap_search_opt
{x0:t0}
( map
: jsobjmap(k0, x0), key: k0): optn_vt(x0)
(* ****** ****** *)
//
#impltmp
XATS2JS_jsobjmap_search_opt
<int0> =
XATS2JS_jsobjmap_search_opt where
{
//
#typedef k0 = int0
//
fun
XATS2JS_jsobjmap_search_opt
{x0:t0}
( map
: jsobjmap(k0, x0), key: k0): optn_vt(x0) = $extnam()
}
#impltmp
XATS2JS_jsobjmap_search_opt
<strn> =
XATS2JS_jsobjmap_search_opt where
{
//
#typedef k0 = strn
//
fun
XATS2JS_jsobjmap_search_opt
{x0:t0}
( map
: jsobjmap(k0, x0), key: k0): optn_vt(x0) = $extnam()
}
//
(* ****** ****** *)
//
(*
#extern
fun
<k0:t0>
XATS2JS_jsobjmap_remove
{x0:vt}
( map
: jsobjmap(k0, x0), key: k0): bool
*)
//
#extern
fun
<k0:t0>
XATS2JS_jsobjmap_remove_any
{x0:vt}
( map
: jsobjmap(k0, x0), key: k0): void
#extern
fun
<k0:t0>
XATS2JS_jsobjmap_remove_opt
{x0:vt}
( map
: jsobjmap(k0, x0), key: k0): optn_vt(x0)
//
(* ****** ****** *)
//
#impltmp
XATS2JS_jsobjmap_remove_any
<int0> =
XATS2JS_jsobjmap_remove_any where
{
//
#typedef k0 = int0
//
fun
XATS2JS_jsobjmap_remove_any
{x0:t0}
( map
: jsobjmap(k0, x0), key: k0): void = $extnam()
}
#impltmp
XATS2JS_jsobjmap_remove_any
<strn> =
XATS2JS_jsobjmap_remove_any where
{
//
#typedef k0 = strn
//
fun
XATS2JS_jsobjmap_remove_any
{x0:t0}
( map
: jsobjmap(k0, x0), key: k0): void = $extnam()
}
//
#impltmp
XATS2JS_jsobjmap_remove_opt
<int0> =
XATS2JS_jsobjmap_remove_opt where
{
//
#typedef k0 = int0
//
fun
XATS2JS_jsobjmap_remove_opt
{x0:t0}
( map
: jsobjmap(k0, x0), key: k0): optn_vt(x0) = $extnam()
}
#impltmp
XATS2JS_jsobjmap_remove_opt
<strn> =
XATS2JS_jsobjmap_remove_opt where
{
//
#typedef k0 = strn
//
fun
XATS2JS_jsobjmap_remove_opt
{x0:t0}
( map
: jsobjmap(k0, x0), key: k0): optn_vt(x0) = $extnam()
}
//
(* ****** ****** *)
(*
#extern
fun
<k0:t0>
XATS2JS_jsobjmap_insert
{x0:vt}
( map
: jsobjmap(k0, x0), key: k0, itm: x0): bool
*)
//
#extern
fun
<k0:t0>
XATS2JS_jsobjmap_insert_any
{x0:vt}
( map
: jsobjmap(k0, x0), key: k0, itm: x0): void
#extern
fun
<k0:t0>
XATS2JS_jsobjmap_insert_opt
{x0:vt}
( map
: jsobjmap(k0, x0), key: k0, itm: x0): optn_vt(x0)
//
(* ****** ****** *)
//
#impltmp
XATS2JS_jsobjmap_insert_any
<int0> =
XATS2JS_jsobjmap_insert_any where
{
//
#typedef k0 = int0
//
fun
XATS2JS_jsobjmap_insert_any
{x0:t0}
( map
: jsobjmap(k0, x0), key: k0, itm: x0): void = $extnam()
}
#impltmp
XATS2JS_jsobjmap_insert_any
<strn> =
XATS2JS_jsobjmap_insert_any where
{
//
#typedef k0 = strn
//
fun
XATS2JS_jsobjmap_insert_any
{x0:t0}
( map
: jsobjmap(k0, x0), key: k0, itm: x0): void = $extnam()
}
//
#impltmp
XATS2JS_jsobjmap_insert_opt
<int0> =
XATS2JS_jsobjmap_insert_opt where
{
//
#typedef k0 = int0
//
fun
XATS2JS_jsobjmap_insert_opt
{x0:t0}
( map
: jsobjmap(k0, x0), key: k0, itm: x0): optn_vt(x0) = $extnam()
}
#impltmp
XATS2JS_jsobjmap_insert_opt
<strn> =
XATS2JS_jsobjmap_insert_opt where
{
//
#typedef k0 = strn
//
fun
XATS2JS_jsobjmap_insert_opt
{x0:t0}
( map
: jsobjmap(k0, x0), key: k0, itm: x0): optn_vt(x0) = $extnam()
}
//
(* ****** ****** *)
#impltmp
{k0:t0}
{x0:t0}
g_print
<jsobjmap(k0,x0)>(kxs) =
gmap_print
<jsobjmap(k0,x0)><k0,x0>(kxs)
(* ****** ****** *)
//
#impltmp
{k0:t0}
{x0:t0}
gmap_strmize
<jsobjmap(k0,x0)><k0,x0>(kxs) =
strm_vt_map0
(
gmap_strmize_key
<jsobjmap(k0,x0)><k0,x0>(kxs)
) where
{
#impltmp map0$fopr<k0><(k0,x0)>(k0) =
let
val-
~optn_vt_cons(x0) =
XATS2JS_jsobjmap_search_opt(kxs, k0) in (k0, x0)
end
} (*where*)
// end(gmap_strmize<jsobjmap(k0,x0)><k0,x0>(kxs))
//
#impltmp
{k0:t0}
{x0:t0}
gmap_strmize_key
<jsobjmap(k0,x0)><k0,x0>(kxs) =
(
XATS2JS_jsarray_strmize(XATS2JS_jsobjmap_keys(kxs)))
//end-of(gmap_strmize_key<jsobjmap(k0,x0)><k0,x0>(kxs))
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_CATS_JS_basics1.dats] *)
