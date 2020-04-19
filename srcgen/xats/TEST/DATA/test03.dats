(* ****** ****** *)
#staload
"prelude\
/DATS/CATS\
/Xint/runtime.dats"
(* ****** ****** *)

fun
fact(n0: int): int =
if n0 > 0 then n0 * fact(pred(n0)) else 1

(* ****** ****** *)

(* end of [test03.dats] *)
