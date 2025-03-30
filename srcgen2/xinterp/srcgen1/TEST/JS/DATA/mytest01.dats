(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"srcgen1\
/prelude/HATS/prelude_dats.hats"
//
#include
"srcgen1\
/prelude/HATS/CATS/Xint/prelude_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
val N1 = 5
val N2 = (N1+N1)
val N3 = (N1*N2)
(* ****** ****** *)
(* ****** ****** *)
//
fun
fact1
(x: sint): sint =
if (x > 0)
then x * fact1(x-1) else 1
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fibo1
(x: sint): sint =
if (x >= 2)
then
fibo1(x-2)+fibo1(x-1) else x
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fact2
(x: sint): sint =
(
  loop@(x, 1)) where
{
fun
loop
@(x: sint, r: sint): sint =
if (x > 0)
then loop@(x-1, x*r) else (r)
}
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fibo2
(x: sint): sint =
(
loop@(x, 0, 1)) where
{
fun
loop@(x, r1, r2) =
if (x >= 2)
then loop@(x-1, r2, r1+r2)
else (if x >= 1 then r2 else r1)
}
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fibo3
(x: sint): sint =
(
loop@(x, 0, 1)) where
{
fun
loop
(xrr:
@(sint, sint, sint)) =
if
xrr.0 >= 2
then
(
loop@(
(xrr.0)-1, xrr.2, xrr.1+xrr.2))
else
(
if
xrr.0 >= 1 then xrr.2 else xrr.1)
}
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fibo4
(x: sint): sint =
(
loop@{x=x, rr=(0, 1)}) where
{
fun
loop
(xrr:
@{x=sint, rr=(sint, sint)}) =
if
xrr.x >= 2
then // if-then
(
loop
@{
x=
(xrr.x)-1,
rr=
(xrr.rr.1, xrr.rr.0+xrr.rr.1)})
else // if-else
(
if
xrr.x >= 1
then (xrr.rr.1) else (xrr.rr.0))
}
//
(* ****** ****** *)
(* ****** ****** *)
val fact1_10 = fact1(10)//end-of-val
(* ****** ****** *)
val fibo1_10 = fibo1(10)//end-of-val
(* ****** ****** *)
val fact2_10 = fact2(10)//end-of-val
(* ****** ****** *)
val fibo2_10 = fibo2(10)//end-of-val
(* ****** ****** *)
val fibo3_10 = fibo3(10)//end-of-val
(* ****** ****** *)
val fibo4_10 = fibo4(10)//end-of-val
(* ****** ****** *)
(* ****** ****** *)
//
fun
foo
( x0:
& (?int) >> int): void = (x0 := 100)
//
var myint: int
//
val ((*0*)) = foo(myint)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3-XANADU/srcgen2/xinterp/srcgen1/TEST/JS/DATA/mytest01.dats] *)
