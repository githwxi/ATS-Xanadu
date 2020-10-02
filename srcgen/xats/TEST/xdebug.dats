(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS\
/Xint/basics.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gint.dats"
#staload
"prelude/DATS/gnum.dats"
#staload
"prelude/DATS/gord.dats"
(* ****** ****** *)
#staload "./xdebug.sats"
(* ****** ****** *)

#extern
fun
length(xs: list(int)): int =
(
case+ xs of
|
list_nil() => 0 + 0
|
list_cons{n}(_, xs) => 1 + length(xs)
)

(* ****** ****** *)
////
fun<>
fact(x: int): int =
if x > 0 then x * fact(x-1) else 1

(* ****** ****** *)
////
fun
<a:type>
foo( x: a ) = (x, x)

(* ****** ****** *)
////
#extern
fun
foo
( x: int
, y: string): string

(* ****** ****** *)

val
x = 0
val
y = "0"
val:prf
z =
let
val z = foo(x, foo(x, y)) in z; 1
end

(* ****** ****** *)

val f1 = lam(x: int) => foo(x, y)
val f2 = fix f(x: int) => foo(x, f(x))

(* ****** ****** *)
////
val x = A[0]

(* ****** ****** *)
////
val x = 10: bool

(* ****** ****** *)
////
abstype xyz(a:i0)
absimpl xyz(a:i0) = sint(a)

(* ****** ****** *)
////
(*
val x1 = foo1<_>(10)
*)
val x2 = foo2<>{sint}(10, 10, 10)

(* ****** ****** *)
////
fun
foo
{a0:tx}
(x0:a0) = x0
val foo10 = foo(10)

(* ****** ****** *)
////
(* ****** ****** *)
#staload _ =
"prelude/DATS/gbas.dats"
(* ****** ****** *)
abstype T0
absvtype VT
(* ****** ****** *)
fun
foo_t0(x0: T0): void = g_free(x0)
(*
fun
foo_vt(x0: VT): void = g_free(x0)
*)
(* ****** ****** *)
////
impltmp
{a:t0}
rand<list(a)>() =
list_vt2t(rand_list<a>())

(* ****** ****** *)
////
impltmp
<a:t0>
foo(x) = ( x:a )

impltmp
{a:vt}
foo<a>(x, y) = ( x, y )

(* ****** ****** *)
////
impltmp
{a:t0}
foo<a,a>(x) = x
////
impltmp
{a:vt}
foo<a,a>(x) = x
////
absvtype vt
vtypedef vts = list_vt(vt)
////
fun
foo(xs: list(int)) = length<int>(xs)

(* ****** ****** *)

(* end of [xdebug.dats] *
