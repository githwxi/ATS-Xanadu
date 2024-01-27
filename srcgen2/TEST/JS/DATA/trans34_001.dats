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

val x0 = 0
val x1 = 1
val x2 = x0 + x1

(* ****** ****** *)
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
