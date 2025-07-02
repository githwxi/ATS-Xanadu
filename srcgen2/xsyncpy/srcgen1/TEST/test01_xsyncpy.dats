(* ****** ****** *)
(*
HX-2025-06-19:
For testing xsyncpy!
*)
(* ****** ****** *)
(* ****** ****** *)
#include
"prelude/HATS/prelude_dats.hats"
(* ****** ****** *)
#include
"prelude/HATS/prelude_JS_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
val N = 10
var N = 10
//
(* ****** ****** *)
//
fun
fact
(n: sint): sint =
(
if n <= 0
then 1 else n * fact(n-1))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fibo =
fix f(x:sint): sint =>
(
if x >= 2
then f(x-1)+f(x-2) else x)
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload nil with list_nil
#symload cons with list_cons
//
fun
<x0:t0>
length(xs: list(x0)): sint =
(
case+ xs of
| nil() => 0
| cons(_, xs) => 1 + length(xs)
)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
square = lam(x:sint) => x + x
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
assign
( x: &bool
, y: !bool): void = (x := y)
fun
exchng
( x: &sint
, y: &sint): void =
let val t = x in x := y; y := t end
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef T = $tup(sint, sint)
//
fun
fdebug(x0: T): list(T) = list@(x0, x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_TEST_test01_xsyncpy.dats] *)
(***********************************************************************)
