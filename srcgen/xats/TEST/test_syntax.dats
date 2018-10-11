var
foo: sexp with pf = 123

#symload
[] with $BAR.bar of 100
#symload
foo with $BAR.bar of 100
#symload
.foo with $BAR$BAZ.bar of 100

absimpl
$FOO.foo(x:int): type = bar

fun
foo(xs: list(int)): int =
(
case+ xs of
| nil() => 0
| cons(x, xs) => (x) + foo(xs)
)

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
