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
//
fun
fact(x: nint): nint =
if x > 0 then x*fact(x-1) else 1
//
(* ****** ****** *)
(*
//
#absvwtp VT
//
fun
foo
(x: VT): @(VT, VT) = @(x, x)
//
*)
(* ****** ****** *)
////
(* ****** ****** *)
//
val x0 = 0
val x1 = 1
val x2 = x0 + x1
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
foo1(x: int): int = x + 1
//
fun
foo2
(x: &int >> int): int = x + 1
//
(* ****** ****** *)
////
(* ****** ****** *)

val () = g_free<(?int)>(100)

(* ****** ****** *)
(* ****** ****** *)
//
fun
fact(n: int): int =
glseq_mul0(strm_vt_range_lte(1, n))
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [DATA/trans34_001.dats] *)
