absimpl
$FOO.foo(x:int): type = bar

fun
:rec
foo(xs: list(int)): int =
(
case+ xs of
| nil() => 0
| cons(x, xs) => (x) + foo(xs)
)

val
:rec
fact =
lam(x: int): int =<ntm>
if x >= 1 then x * fact(x-1) else x

val f =
lam(x, y) =>
if x > y then x else y endif endlam

(*
#symintr
#symelim
*)

////
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [test_syntax.dats] *)
