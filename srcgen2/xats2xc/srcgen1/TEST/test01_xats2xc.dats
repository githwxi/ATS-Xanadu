(* ****** ****** *)
(*
HX-2026-03-23:
For testing xats2xc!
*)
(* ****** ****** *)
(* ****** ****** *)
#staload _ =
"prelude/DATS/gdbg000.dats"
(* ****** ****** *)
(* ****** ****** *)
#include
"prelude\
/HATS/prelude_dats.hats"
(* ****** ****** *)
#include
"prelude\
/HATS/prelude_JS_dats.hats"
(* ****** ****** *)
(*
#include
"prelude/HATS/prelude_NODE_dats.hats"
*)
(* ****** ****** *)
(* ****** ****** *)
//
#typedef
sintsint_t = @(sint, sint)
#vwtpdef
sintsint_x = #(?sint, ?!sint)
//
(* ****** ****** *)
(* ****** ****** *)
//
val N1 = 10
val N2 = N1 + N1
val N3 = N1 * N2
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fact1(x: sint): sint =
if x >= 1 then x * fact1(x-1) else 1
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fact2
(n: sint): sint =
(
loop(0, 1)) where
{
fun
loop
(i: sint, r: sint): sint =
if i < n then loop(i+1, (i+1)*r) else r
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3-XANADU/srcgen2/xats2xc/srcgen1/TEST/test01_xats2xc.dats] *)
(***********************************************************************)
