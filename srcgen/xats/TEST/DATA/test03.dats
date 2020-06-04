(* ****** ****** *)
#staload
"prelude\
/DATS/CATS\
/Xint/runtime.dats"
(* ****** ****** *)

(*
fun K(): int = true
*)

(* ****** ****** *)

fun
fact(n0: int): int =
if
(n0 > 0)
then n0 * fact(pred(n0)) else 1

(* ****** ****** *)

fun
<a:type>
length(xs: list(a)): nint =
case+ xs of
| list_nil() => 0
| list_cons(x0, xs) => 1 + length(xs)

(* ****** ****** *)

(* end of [test03.dats] *)
