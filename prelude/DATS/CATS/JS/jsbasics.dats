(* ****** ****** *)
(*
HX-2020-11-09:
Native arrays for Xats2js
*)
(* ****** ****** *)
//
abstype
jsarray_type(a:vt)
typedef
jsarray(a:vt) = jsarray_type(a)
//
(* ****** ****** *)
(*
HX-2020-11-23:
Hashmaps for Xats2js
based on the native JS objmaps 
*)
(* ****** ****** *)
#staload _ = "./basics.dats"
(* ****** ****** *)
//
abstype
jsobjmap_type
(k0: t0, x0:vt)
//
typedef
jsobjmap
( k0: t0
, x0: vt) = jsobjmap_type(k0, x0)
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
, i0: nint(*index*)): a = $exname()
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
XATS2JS_jsarray_streamize
{a:t0}
( xs
: jsarray(a)): stream_vt(a) = $exname()
//
(*
#symload streamize
with XATS2JS_jsarray_streamize of 1000
*)
//
(* ****** ****** *)
impltmp
{a:t0}
gseq_streamize
<jsarray(a)><a> =
XATS2JS_jsarray_streamize
(* ****** ****** *)
//
implfun
XATS2JS_jsarray_streamize
{a}(xs) = auxmain(0) where
{
//
  val n0 = length(xs)
//
  fun
  auxmain
  (i0: sint): stream_vt(a) =
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
} (* end of [XATS2JS_jsarray_streamize] *)
//
(* ****** ****** *)
//
// XATS2JS/jsobjmap:
//
(* ****** ****** *)
typedef int = sint
typedef str = string
(* ****** ****** *)
#extern
fun
<k0:t0>
XATS2JS_jsobjmap_keys
{x0:vt}
( map
: jsobjmap(k0, x0)): jsarray(k0)
(* ****** ****** *)
impltmp
XATS2JS_jsobjmap_keys
<int> =
XATS2JS_jsobjmap_keys where
{
typedef k0 = int
#extern
fun
XATS2JS_jsobjmap_keys
{x0:vt}
( map
: jsobjmap(k0, x0)): jsarray(k0) = $exname()
}
impltmp
XATS2JS_jsobjmap_keys
<str> =
XATS2JS_jsobjmap_keys where
{
typedef k0 = str
#extern
fun
XATS2JS_jsobjmap_keys
{x0:vt}
( map
: jsobjmap(k0, x0)): jsarray(k0) = $exname()
}
(* ****** ****** *)
#extern
fun
<k0:t0>
XATS2JS_jsobjmap_mapped
{x0:vt}
( map
: jsobjmap(k0, x0), key: k0): bool
(* ****** ****** *)
//
impltmp
XATS2JS_jsobjmap_mapped
<int> =
XATS2JS_jsobjmap_mapped where
{
typedef k0 = int
fun
XATS2JS_jsobjmap_mapped
{x0:vt}
( map
: jsobjmap(k0, x0), key: k0): bool = $exname()
}
//
impltmp
XATS2JS_jsobjmap_mapped
<str> =
XATS2JS_jsobjmap_mapped where
{
typedef k0 = str
fun
XATS2JS_jsobjmap_mapped
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
{x0:t0}((*void*)): jsobjmap(k0, x0)
(* ****** ****** *)
impltmp
XATS2JS_jsobjmap_make_nil
<int> =
XATS2JS_jsobjmap_make_nil where
{
typedef k0 = int
#extern
fun
XATS2JS_jsobjmap_make_nil
{x0:t0}((*void*)): jsobjmap(k0, x0) = $exname()
}
impltmp
XATS2JS_jsobjmap_make_nil
<str> =
XATS2JS_jsobjmap_make_nil where
{
typedef k0 = str
#extern
fun
XATS2JS_jsobjmap_make_nil
{x0:t0}((*void*)): jsobjmap(k0, x0) = $exname()
}
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
impltmp
XATS2JS_jsobjmap_search_opt
<int> =
XATS2JS_jsobjmap_search_opt where
{
typedef k0 = int
#extern
fun
XATS2JS_jsobjmap_search_opt
{x0:t0}
( map
: jsobjmap(k0, x0), key: k0): optn_vt(x0) = $exname()
}
//
impltmp
XATS2JS_jsobjmap_search_opt
<str> =
XATS2JS_jsobjmap_search_opt where
{
typedef k0 = str
#extern
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
XATS2JS_jsobjmap_remove_opt
{x0:vt}
( map
: jsobjmap(k0, x0), key: k0): optn_vt(x0)
//
(* ****** ****** *)
//
impltmp
XATS2JS_jsobjmap_remove_opt
<int> =
XATS2JS_jsobjmap_remove_opt where
{
typedef k0 = int
#extern
fun
XATS2JS_jsobjmap_remove_opt
{x0:t0}
( map
: jsobjmap(k0, x0), key: k0): optn_vt(x0) = $exname()
}
//
impltmp
XATS2JS_jsobjmap_remove_opt
<str> =
XATS2JS_jsobjmap_remove_opt where
{
typedef k0 = str
#extern
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
XATS2JS_jsobjmap_insert_opt
{x0:vt}
( map
: jsobjmap(k0, x0), key: k0, itm: x0): optn_vt(x0)
//
(* ****** ****** *)
//
impltmp
XATS2JS_jsobjmap_insert_opt
<int> =
XATS2JS_jsobjmap_insert_opt where
{
typedef k0 = int
#extern
fun
XATS2JS_jsobjmap_insert_opt
{x0:t0}
( map
: jsobjmap(k0, x0), key: k0, itm: x0): optn_vt(x0) = $exname()
}
//
impltmp
XATS2JS_jsobjmap_insert_opt
<str> =
XATS2JS_jsobjmap_insert_opt where
{
typedef k0 = str
#extern
fun
XATS2JS_jsobjmap_insert_opt
{x0:t0}
( map
: jsobjmap(k0, x0), key: k0, itm: x0): optn_vt(x0) = $exname()
}
//
(* ****** ****** *)

(* end of [XATS2JS_jsbasics.dats] *)
