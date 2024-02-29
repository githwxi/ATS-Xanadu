(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
//
#include
"prelude/HATS/prelude_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)

fun
foo1(x: &sint): sint = x + 1

(* ****** ****** *)
////
(* ****** ****** *)
#abstype VT <= sint
(* ****** ****** *)
(*
//
fun
length
(xs: list(VT)): sint =
case+ xs of
| list_nil() => 0
| list_cons(_, xs) => 1+length(xs)
//
*)
(* ****** ****** *)
//
(*
fun
length0_vt
(xs: ~list_vt(VT)): sint =
case+ xs of
| ~
list_vt_nil() => 0
| ~
list_vt_cons(_, xs) => 1+length0_vt(xs)
*)
//
(* ****** ****** *)
//
fun
length1_vt
(xs: !list_vt(VT)): sint =
case+ xs of
|list_vt_nil() => 0
|list_vt_cons(_, xs) => 1+length1_vt(xs)
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [DATA/trans34_002.dats] *)
