(* ****** ****** *)

#include
"./../../../prelude/DATS/gnum.dats"
#include
"./../../../prelude/DATS/gord.dats"
#include
"./../../../prelude/DATS/gint.dats"

(* ****** ****** *)

val x = g_succ(1)

(* ****** ****** *)

////

(*

HX-2019-12-01:
This one is not yet supported.
Should it be supported?

*)

fun f =
fix g(x: int): int =>
if x >= 2 then f(x-1) + g(x-2) else x

val f10 = f(10)

////

fun
<ans:type>
kfact
( n: int
, k: int -> ans): ans =
if n = 0
then k(1)
else
kfact(n-1, lam(r) => k(n*r))
val
fact10 = kfact<int>(10, lam r => r)

////

fun
fact2
( nr
: @(int, int)): int =
if
nr.0 = 0
then nr.1
else
let
val @(n, r) = nr
in fact2(@(n-1, n*r)) end

val fact10 = fact2(@(10, 1))

////

#extern
fun fact : int -> int
implement
fact(x) =
if x > 0 then x * fact(x-1) else 1

val fact10 = fact(10)

////

fun
fact =
lam(x) =>
(
fix f(x) =>
if x > 0
then x * fact(x-1) else 1)(x)
val fact10 = fact(10)

////

fun
isevn(x: int): int =
if x > 0
then isodd(x-1) else 1
and
isodd(x: int): int =
if x > 0
then isevn(x-1) else 0

val isevn10 = isevn(10)
val isodd10 = isodd(10)

////

#extern
fun<>
fact : int -> int
implement
fact<> =
fix f(x) =>
if x > 0 then x * f(x-1) else 1

val
fact10 = fact(10)

////

fun
fact2
( nr
: $(int, int)): int =
if
nr.0 = 0
then nr.1
else
let
val $(n, r) = nr
in fact2($(n-1, n*r)) end

val fact10 = fact2($(10, 1))

(* ****** ****** *)
////
val xy = @(1,2)
val xy_0 = xy.0
val xy = $(1,2)
val xy_1 = xy.1

(* ****** ****** *)
////
val
fact =
fix f(x:int):int =>
if
x > 0
then x*f(x-1) else 1
//
(* ****** ****** *)
////

(* ****** ****** *)

fun
from(n: int): list(int) =
if
(n > 0)
then
cons(n, from(n-1)) else nil()

(* ****** ****** *)

fun
list_mul
( xs
: list(int)): int =
case+ xs of
| nil() => 1
| cons(x0, xs) => x0*list_mul(xs)

(* ****** ****** *)

fun
fact(n) =
list_mul(from(n))

(* ****** ****** *)

val fact10 = fact(10)

(* ****** ****** *)
////
(* ****** ****** *)

fun
tally
( xs
: list(int)): int =
case+ xs of
| nil() => 0
| cons(x0, xs) => x0+tally(xs)

(* ****** ****** *)

val x0 = nil()
val x1 = cons(1,x0)
val x2 = cons(2,x1)
val x3 = cons(3,x2)
val sum = tally(x3)

(* ****** ****** *)

////
(* ****** ****** *)

val
fact10 = fact(10) where
{
fun
fact(x: int): int =
if x > 0 then x * fact(x-1) else 1
}

(* ****** ****** *)
////
val
isevn =
fix f(x:int): bool =>
(
if x > 0 then g(x-1) else true
) where
{
val g =
lam(x) =>
if x > 0 then f(x-1) else false
}
val isevn100 = isevn(100)
val isevn101 = isevn(101)
////
(* ****** ****** *)

// (*
val x = 10
val y = 20
val f1 = lam(x:int) => x + x
val x2 = f(x)
val f2 = lam(x:int)(y:int) => x * y
val xy = f2(x)(y)
// *)
//
(* ****** ****** *)

(* end of [test01.dats] *)
