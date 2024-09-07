(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-09-06:
Fri 06 Sep 2024 11:15:23 PM EDT
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
#include
"srcgen2\
/prelude/HATS/prelude_NODE_dats.hats"
//
(* ****** ****** *)
//
#include
"xatslib\
/githwxi/HATS/githwxi_NODE_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
val opt =
myfil00$fpath_readall$opt
( "./test05_myfil00.dats" )
//
val lines =
strn_line$strmize(cs)
where{
val-optn_vt_cons(cs) = opt }
//
val () = print0s("lines = ", lines, "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
val () = console_log(the_print_store_flush())
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_JS_githwxi_TEST_test05_myfil00.dats] *)
