(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)

val x1 = 1
and x2 = 2
val x12 = (1 + 2)

(* ****** ****** *)

fun
fact(x: int): int = 
if x > 0 then x * fact(x-1) else 1

(* ****** ****** *)

(* end of [DATA/trtmp3b.dats] *)
