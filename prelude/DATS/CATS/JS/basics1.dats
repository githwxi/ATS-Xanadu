(* ****** ****** *)
(*
HX-2020-11-09:
Native arrays for Xats2js
*)
(* ****** ****** *)
//
#abstype
jsobj_type(*void*)
#typedef
jsobj = jsobj_type
//
(* ****** ****** *)
//
#abstype
jsarray_type(a:vt)
#sexpdef
jsarray = jsarray_type
//
(* ****** ****** *)
(*
HX-2020-11-23:
Hashmaps for Xats2js
based on the native JS objmaps 
*)
(* ****** ****** *)
//
#abstype
jsobjmap_type
(k0:t0, x0:vt)
//
#sexpdef
jsobjmap = jsobjmap_type
(*
#typedef
jsobjmap
( k0: t0
, x0: vt) = jsobjmap_type(k0, x0)
*)
//
(* ****** ****** *)
#staload _ = "./basics.dats"
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
: string): jsobj = $exname()
#extern
fun
XATS2JS_jsobj_set_at
( obj
: jsobj
, key
: string
, itm: jsobj): void = $exname()
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
{a:t0}
( xs
: jsarray(a)): nint = $exname()
(* ****** ****** *)
#extern
fun
XATS2JS_jsarray_get_at
{a:t0}
( xs
: jsarray(a)
, i0: nint(*ind*)): a = $exname()
#extern
fun
XATS2JS_jsarray_set_at
  {a:t0}
( xs
: jsarray(a)
, i0: nint, x0: a): void = $exname()
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
{a:t0}
( xs
: jsarray(a)): strm_vt(a) = $exname()
//
(*
#symload strmize
with XATS2JS_jsarray_strmize of 1000
*)
//
(* ****** ****** *)
#impltmp
{a:t0}
gseq_strmize
<jsarray(a)><a> =
XATS2JS_jsarray_strmize
(* ****** ****** *)
//
#implfun
XATS2JS_jsarray_strmize
{a}(xs) = auxmain(0) where
{
//
  val n0 = length(xs)
//
  fun
  auxmain
  (i0: sint): strm_vt(a) =
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
#typedef str0 = string
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
: jsobjmap(k0, x0)): jsarray(k0) = $exname()
}
#impltmp
XATS2JS_jsobjmap_keys
<str0> =
XATS2JS_jsobjmap_keys where
{
//
#typedef k0 = str0
//
fun
XATS2JS_jsobjmap_keys
{x0:vt}
( map
: jsobjmap(k0, x0)): jsarray(k0) = $exname()
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
: jsobjmap(k0, x0), key: k0): bool = $exname()
}
#impltmp
XATS2JS_jsobjmap_keyq
<str0> =
XATS2JS_jsobjmap_keyq where
{
//
#typedef k0 = str0
//
fun
XATS2JS_jsobjmap_keyq
{x0:vt}
( map
: jsobjmap(k0, x0), key: k0): bool = $exname()
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
((*void*)): jsobjmap(k0, x0) = $exname()
}
#impltmp
XATS2JS_jsobjmap_make_nil
<str0> =
XATS2JS_jsobjmap_make_nil where
{
//
#typedef k0 = str0
//
fun
XATS2JS_jsobjmap_make_nil
{x0:t0}
((*void*)): jsobjmap(k0, x0) = $exname()
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
: jsobjmap(k0, x0), key: k0): optn_vt(x0) = $exname()
}
#impltmp
XATS2JS_jsobjmap_search_opt
<str0> =
XATS2JS_jsobjmap_search_opt where
{
//
#typedef k0 = str0
//
fun
XATS2JS_jsobjmap_search_opt
{x0:t0}
( map
: jsobjmap(k0, x0), key: k0): optn_vt(x0) = $exname()
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
: jsobjmap(k0, x0), key: k0): void = $exname()
}
#impltmp
XATS2JS_jsobjmap_remove_any
<str0> =
XATS2JS_jsobjmap_remove_any where
{
//
#typedef k0 = str0
//
fun
XATS2JS_jsobjmap_remove_any
{x0:t0}
( map
: jsobjmap(k0, x0), key: k0): void = $exname()
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
: jsobjmap(k0, x0), key: k0): optn_vt(x0) = $exname()
}
#impltmp
XATS2JS_jsobjmap_remove_opt
<str0> =
XATS2JS_jsobjmap_remove_opt where
{
//
#typedef k0 = str0
//
fun
XATS2JS_jsobjmap_remove_opt
{x0:t0}
( map
: jsobjmap(k0, x0), key: k0): optn_vt(x0) = $exname()
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
: jsobjmap(k0, x0), key: k0, itm: x0): void = $exname()
}
#impltmp
XATS2JS_jsobjmap_insert_any
<str0> =
XATS2JS_jsobjmap_insert_any where
{
//
#typedef k0 = str0
//
fun
XATS2JS_jsobjmap_insert_any
{x0:t0}
( map
: jsobjmap(k0, x0), key: k0, itm: x0): void = $exname()
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
: jsobjmap(k0, x0), key: k0, itm: x0): optn_vt(x0) = $exname()
}
#impltmp
XATS2JS_jsobjmap_insert_opt
<str0> =
XATS2JS_jsobjmap_insert_opt where
{
//
#typedef k0 = str0
//
fun
XATS2JS_jsobjmap_insert_opt
{x0:t0}
( map
: jsobjmap(k0, x0), key: k0, itm: x0): optn_vt(x0) = $exname()
}
//
(* ****** ****** *)
//
#impltmp
{k0:t0}
{x0:t0}
gmap_strmize
<jsobjmap(k0,x0)><k0><x0>(kxs) =
strm_vt_map0
(
gmap_strmize_key
<jsobjmap(k0,x0)><k0><x0>(kxs)
) where
{
#impltmp map0$fopr<k0><(k0,x0)>(k0) =
let
val-
~optn_vt_cons(x0) =
XATS2JS_jsobjmap_search_opt(kxs, k0) in (k0, x0)
end
}
//
#impltmp
{k0:t0}
{x0:t0}
gmap_strmize_key
<jsobjmap(k0,x0)><k0><x0>(kxs) =
(
XATS2JS_jsarray_strmize(XATS2JS_jsobjmap_keys(kxs))
)
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_CATS_JS_basics1.dats] *)
