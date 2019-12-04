(* ****** ****** *)

impltmp
{a:type}
g_eq<a>(x, y) =
(g_cmp<a>(x, y) = 0)
impltmp
{a:type}
g_lt<a>(x, y) =
(g_cmp<a>(x, y) < 0)
impltmp
{a:type}
g_gt<a>(x, y) =
(g_cmp<a>(x, y) > 0)
impltmp
{a:type}
g_lte<a>(x, y) =
(g_cmp<a>(x, y) <= 0)
impltmp
{a:type}
g_gte<a>(x, y) =
(g_cmp<a>(x, y) >= 0)
impltmp
{a:type}
g_neq<a>(x, y) =
(g_cmp<a>(x, y) != 0)

(* ****** ****** *)
//
impltmp
{a:type}
g_ltz<a>(x) = (g_cmpz(x) < 0)
impltmp
{a:type}
g_gtz<a>(x) = (g_cmpz(x) > 0)
impltmp
{a:type}
g_eqz<a>(x) = (g_cmpz(x) = 0)
//
impltmp
{a:type}
g_ltez<a>(x) = (g_cmpz(x) <= 0)
impltmp
{a:type}
g_gtez<a>(x) = (g_cmpz(x) >= 0)
impltmp
{a:type}
g_neqz<a>(x) = (g_cmpz(x) != 0)

(* ****** ****** *)
//
impltmp
{a:type}
g_cmpz<a>(x) = (g_cmp(x, g_0()))
//
(* ****** ****** *)

impltmp
{a:type}
g_max<a>(x, y) =
if g_gte<a>(x, y) then (x) else (y)
impltmp
{a:type}
g_min<a>(x, y) =
if g_lte<a>(x, y) then (x) else (y)

(* ****** ****** *)

impltmp
{a:type}
g_succ<a>(x) = g_add(x, g_1())
impltmp
{a:type}
g_pred<a>(x) = g_sub(x, g_1())

(* ****** ****** *)

impltmp
g_lt<sint> = gint_lt_sint_sint
impltmp
g_gt<sint> = gint_gt_sint_sint
impltmp
g_eq<sint> = gint_eq_sint_sint
impltmp
g_lte<sint> = gint_lte_sint_sint
impltmp
g_gte<sint> = gint_gte_sint_sint
impltmp
g_neq<sint> = gint_neq_sint_sint

(* ****** ****** *)

impltmp
g_cmp<sint> = gint_cmp_sint_sint

(* ****** ****** *)

impltmp
g_add<sint> = gint_add_sint_sint
impltmp
g_sub<sint> = gint_sub_sint_sint
impltmp
g_mul<sint> = gint_mul_sint_sint
impltmp
g_div<sint> = gint_div_sint_sint

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
