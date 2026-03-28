(* ****** ****** *)
(*
HX-2026-03-23:
For testing xats2cc!
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
fact(n: nint): nint =
(
  loop(0, 1)) where
{
fun loop
(i: nint, r: nint): nint =
if i < n
then loop(i+1, (i+1)*r) else r
}
//
(* ****** ****** *)
////
(* ****** ****** *)
val x = 1000
val y = ( x + x )
(* ****** ****** *)
(* ****** ****** *)
//
val foo =
lam(w:sint) =>
lam(z:sint) => w + x + y + z
val bar =
lam(w:sint) =>
fix f(z:sint): sint => f(w + x + y + z)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fact(n: nint): nint =
(
  loop(0, 1)) where
{
fun loop
(i: nint, r: nint): nint =
if i < n then loop(i+1, (i+1)*r) else r
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_TEST_test01_xats2cc.dats] *)
(***********************************************************************)
