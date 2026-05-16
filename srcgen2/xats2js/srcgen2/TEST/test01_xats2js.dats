(* ****** ****** *)
(*
HX-2026-04-29:
For testing xats2js!
Wed Apr 29 06:59:33 PM EDT 2026
*)
(* ****** ****** *)
(* ****** ****** *)
#staload _ =
"prelude/DATS/gdbg000.dats"
(* ****** ****** *)
(* ****** ****** *)
#include
"prelude/HATS/prelude_dats.hats"
(* ****** ****** *)
#include
"prelude/HATS/prelude_JS_dats.hats"
(* ****** ****** *)
(*
#include
"prelude/HATS/prelude_NODE_dats.hats"
*)
(* ****** ****** *)
(* ****** ****** *)
//
fun
fac(n: nint): nint =
(
  loop(0, 1)) where
{
fun
loop
(i: nint, r: nint): nint =
(
if i < n
then loop(i+1, (i+1)*r) else r)
}
//
(* ****** ****** *)
////
(* ****** ****** *)
//
fun
f00(tf: bool): sint =
(
  if tf then 10 else f00(not(tf)))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f01
(tf: bool):
() -> sint = lam() =>
(
  if tf then 10 else f01(not(tf))())
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen2_TEST_test01_xats2js.dats] *)
(***********************************************************************)
