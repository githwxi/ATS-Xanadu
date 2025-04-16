(* ****** ****** *)
(* ****** ****** *)
//
#include
"srcgen2\
/prelude/HATS/prelude_dats.hats"
#include
"srcgen2\
/prelude/HATS/prelude_PY_dats.hats"
//
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
fact2
(x: sint): sint =
(
  loop(x, 1)) where
{
fun
loop
(x: sint, r: sint): sint =
if (x > 0)
then loop(x-1, x*r) else (r)
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
loop@{
x=x, rr=$tpl(0, 1)}) where
{
fun
loop
(xrr:
@{x=sint
 ,rr=$tpl(sint, sint)}) =
if
xrr.x >= 2
then // if-then
(
loop
@{
x=
(xrr.x)-1,
rr=
$tpl(
xrr.rr.1, xrr.rr.0+xrr.rr.1)})
else // if-else
(
if
xrr.x >= 1
then (xrr.rr.1) else (xrr.rr.0))
}
//
(* ****** ****** *)
(* ****** ****** *)
val () =
(
  prints("fibo4(10) = ", fibo4(10), "\n"))
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_xats2py_srcgen1_TEST_test05_xats2py.dats] *)
