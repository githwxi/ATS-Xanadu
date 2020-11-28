(* ****** ****** *)
(*
HX-2020-11-23:
Native mapstrs for Xats2js
*)
(* ****** ****** *)
//
abstype
jsmapstr_type(a:vt)
typedef
jsmapstr
(x0 : vt) =
jsmapstr_type( x0 )
sexpdef map = jsmapstr
//
(* ****** ****** *)
#extern
fun
XATS2JS_jsmapstr_mapped
{x0:vt}
( map: map(x0)
, key: string): bool = $exname()
(* ****** ****** *)
#extern
fun
XATS2JS_jsmapstr_search_opt
{x0:t0}
( map: map(x0)
, key: string): optn_vt(x0) = $exname()
(* ****** ****** *)
#extern
fun
XATS2JS_jsmapstr_remove
{x0:vt}
( map: map(x0)
, key: string): bool = $exname()
#extern
fun
XATS2JS_jsmapstr_remove_opt
{x0:vt}
( map: map(x0)
, key: string): optn_vt(x0) = $exname()
(* ****** ****** *)
#extern
fun
XATS2JS_jsmapstr_insert
{x0:vt}
( map: map(x0)
, key: string, itm: x0): bool = $exname()
#extern
fun
XATS2JS_jsmapstr_insert_opt
{x0:vt}
( map: map(x0)
, key: string, itm: x0): optn_vt(x0) = $exname()
(* ****** ****** *)

(* end of [XATS2JS_map.dats] *)
