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
fact(xs: sint): sint =
(
  if xs >= 1
  then xs * fact(xs-1) else 1)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_TEST_test02_xsyncpy.dats] *)
(***********************************************************************)
