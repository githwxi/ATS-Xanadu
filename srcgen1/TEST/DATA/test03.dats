(* ****** ****** *)
#staload
"prelude\
/DATS/CATS\
/Xats/basics.dats"
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
fact1(n0: int): int =
(
  loop(0(*i0*),1(*r0*))
) where
{
fun
loop(i0: int,r0: int): int =
if i0 <= n0 then loop(i0+1,r0*i0) else r0
}

(* ****** ****** *)

fun
fact2(n0: int): int =
(
  loop(0(*i0*))(1(*r0*))
) where
{
fun
loop(i0: int)(r0: int): int =
if i0 <= n0 then loop(i0+1)(r0*i0) else r0
}

(* ****** ****** *)

fun
<a:type>
length(xs: list(a)): nint =
case+ xs of
| list_nil() => 0
| list_cons(x0, xs) => 1 + length(xs)

(* ****** ****** *)

(* end of [test03.dats] *)
