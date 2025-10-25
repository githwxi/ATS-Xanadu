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
var N: sint = 10
val () = N := N + 1
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fact0(xs: sint): sint =
(
if xs >= 1
then xs * fact0(xs-1) else 1)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fact1(xs0: sint): sint =
let
val xs1 = xs0 - 1
in//let
(
if xs1 >= 0
then xs0 * fact0(xs1) else 1)
end//let//end-of-[fact1(xs0:sint)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_TEST_test02_xsyncpy.dats] *)
(***********************************************************************)
