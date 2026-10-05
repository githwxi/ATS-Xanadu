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
fact(x: sint): sint =
if x >= 1 then x * fact(x-1) else 1
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_TEST_test01_xats2cc.dats] *)
(***********************************************************************)
