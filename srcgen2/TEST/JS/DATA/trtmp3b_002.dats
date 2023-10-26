(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
//
#staload "./trtmp3b_lib.dats"
//
(* ****** ****** *)
//
val x1 = 1
and x2 = 2
val x12 = (1 + 2)
//
(* ****** ****** *)
//
(*
fun
fact(x: int): int = 
if x > 0 then x * fact(x-1) else 1
*)
//
(* ****** ****** *)

fun
fact(x: int): int =
foldl(x, 1) where
{
#typedef x0 = sint
#typedef r0 = sint
#impltmp
foldl$fopr
<x0><r0>(res, i) = (i+1)*res }

(* ****** ****** *)

fun
fact(n: int): int =
glseq_mul0(strm_vt_range_lte(1, n))

(* ****** ****** *)

fun
fibo(x: int): int =
let
val (r0, r1) =
foldl(x, (0, 1)) in r0 end
where{
#typedef x0 = sint
#typedef r0 = (sint, sint)
#impltmp
foldl$fopr
<x0><r0>((r0, r1), i) = (r1, r0+r1) }

(* ****** ****** *)

(* end of [DATA/trtmp3b_002.dats] *)
