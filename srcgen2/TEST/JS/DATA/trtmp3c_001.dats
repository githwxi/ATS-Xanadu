(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
//
(*
#include
"prelude/HATS/prelude_dats.hats"
*)
//
(* ****** ****** *)
//
fun
fact(n: int): int =
glseq_mul0(strm_vt_range_lte(1, n))
//
(* ****** ****** *)
//
fun
fibo(x: int): int =
let
val (r0, r1) =
foldl(x, (0, 1)) in r0 end
where{
#typedef x0 = sint
#typedef rr = (sint, sint)
#impltmp
foldl$fopr<x0><rr>((r0, r1), i) = (r1, r0+r1) }
//
(* ****** ****** *)

(* end of [DATA/trtmp3c_001.dats] *)
