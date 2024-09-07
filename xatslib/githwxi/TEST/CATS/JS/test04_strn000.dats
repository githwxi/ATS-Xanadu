(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-09-06:
Fri 06 Sep 2024 10:18:54 PM EDT
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
//
#include
"srcgen2\
/prelude/HATS/prelude_dats.hats"
#include
"xatslib\
/githwxi/HATS/githwxi_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#include
"srcgen2\
/prelude/HATS/prelude_JS_dats.hats"
#include
"xatslib/HATS/xatslib_JS_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#include
"srcgen2\
/prelude/HATS/prelude_NODE_dats.hats"
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
val cs = "a; bc; def; ghij;"
val cz = strn_word$strmize(cs)
val cz =
filter0(cz, lam(cs) => cs != "")
val () = print0s("cz = ", cz, "\n")
//
(* ****** ****** *)
//
val cs = "a\nbc\n\ndef\nghij\n"
val cz = strn_line$strmize(cs)
val () = print0s("cz = ", cz, "\n")
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

(* end of [ATS3/XANADU_xatslib_JS_githwxi_TEST_test04_strn000.dats] *)
