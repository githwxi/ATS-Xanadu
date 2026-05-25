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
fact(n: nint): nint =
(
  auxlp(0, 1)) where
{
fun
auxlp
(i: nint, r: nint): nint =
(
if i < n
then
auxlp(i+1, (i+1)*r) else r)
}
//
(* ****** ****** *)
(* ****** ****** *)
//
val () =
prints("\
fact(10) = ", fact(10), "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
val () = the_print_store_log( (*void*) )
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen2_TEST_test01_xats2js.dats] *)
(***********************************************************************)
