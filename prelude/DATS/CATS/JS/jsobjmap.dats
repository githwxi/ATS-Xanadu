(* ****** ****** *)
(*
HX-2020-11-23:
Hashmaps for Xats2js
based on the native JS objmaps 
*)
(* ****** ****** *)
//
abstype
jsobjmap_type
(k0: t0, x0:vt)
//
typedef
jsobjmap
(k0: t0, x0: vt) =
jsobjmap_type(k0, x0)
sexpdef map = jsobjmap
//
(* ****** ****** *)
#extern
fun
<k0:t0>
XATS2JS_jsobjmap_mapped
{x0:vt}
( map
: map(k0, x0), key: k0): bool = $exname()
(* ****** ****** *)
#extern
fun
<k0:t0>
XATS2JS_jsobjmap_search_opt
{x0:t0}
( map
: map(k0, x0), key: k0): optn_vt(x0) = $exname()
(* ****** ****** *)
#extern
fun
<k0:t0>
XATS2JS_jsobjmap_remove
{x0:vt}
( map
: map(k0, x0), key: k0): bool = $exname()
#extern
fun
<k0:t0>
XATS2JS_jsobjmap_remove_opt
{x0:vt}
( map
: map(k0, x0), key: k0): optn_vt(x0) = $exname()
(* ****** ****** *)
#extern
fun
<k0:t0>
XATS2JS_jsobjmap_insert
{x0:vt}
( map
: map(k0, x0), key: k0, itm: x0): bool = $exname()
#extern
fun
<k0:t0>
XATS2JS_jsobjmap_insert_opt
{x0:vt}
( map
: map(k0, x0), key: k0, itm: x0): optn_vt(x0) = $exname()
(* ****** ****** *)

(* end of [XATS2JS_jsobjmap.dats] *)
