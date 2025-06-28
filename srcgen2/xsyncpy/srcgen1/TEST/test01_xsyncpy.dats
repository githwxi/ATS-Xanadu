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
fact(n: sint): sint =
if n <= 0 then 1 else n * fact(n-1)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
length(xs: list(x0)): sint =
(
case+ xs of
| list_nil() => 0
| list_cons(_, xs) => 1 + length(xs)
)
//
(* ****** ****** *)
(* ****** ****** *)
//
val square = lam(x:sint) => x + x
//
(* ****** ****** *)
(* ****** ****** *)
//
fun assign
(x: &bool, y: bool): void = (x := y)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_TEST_test01_xsyncpy.dats] *)
(***********************************************************************)
