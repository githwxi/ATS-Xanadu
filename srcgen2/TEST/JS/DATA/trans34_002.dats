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
#abstype T0 <= sint
#absvwtp VT <= sint
(* ****** ****** *)
(* ****** ****** *)

(*
fun
foo0(x: &T0): T0 = x
fun
foo1(x: &VT >> ?VT): VT = x
*)

fun
swap
(x: &VT, y: &VT): void = x := y

(* ****** ****** *)
(* ****** ****** *)
////
(*
//
fun
length
(xs: list(T0)): sint =
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
(xs: ~list_vt(T0)): sint =
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
(xs: !list_vt(T0)): sint =
case+ xs of
|list_vt_nil() => 0
|list_vt_cons(_, xs) => 1+length1_vt(xs)
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [DATA/trans34_002.dats] *)
