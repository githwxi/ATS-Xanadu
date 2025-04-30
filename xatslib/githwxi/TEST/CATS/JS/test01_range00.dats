(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-09-05:
Thu 05 Sep 2024 05:36:54 PM EDT
*)
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
#staload _ =
"prelude/DATS/gdbg000.dats"
(* ****** ****** *)
(* ****** ****** *)
#include
"prelude/HATS/prelude_dats.hats"
(*
#include
"prelude/HATS/prelude_NODE_dats.hats"
*)
#include
"xatslib/githwxi/HATS/githwxi_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#include
"prelude/HATS/prelude_JS_dats.hats"
#include
"xatslib/xbasics/HATS/xbasics_JS_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
val xs = range_ibtw(1, 10)
val () = prints("xs = ", xs, "\n")
val xs = vt2t(GASZ(xs).listize())
val () = print1s("xs = ", xs, "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
val () = console_log(the_print_store_flush())
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_JS_githwxi_TEST_test01_range00.dats] *)
