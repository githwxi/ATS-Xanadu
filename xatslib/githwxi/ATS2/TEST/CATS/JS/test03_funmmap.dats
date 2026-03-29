(* ****** ****** *)
(* ****** ****** *)
(*
HX-2026-03-29:
Sun Mar 29 07:12:56 PM EDT 2026
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
"prelude/HATS/prelude_dats.hats"
(*
#include
"xatslib\
/githwxi/HATS/githwxi_dats.hats"
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"prelude/HATS/prelude_JS_dats.hats"
#include
"xatslib\
/xbasics/HATS/xbasics_JS_dats.hats"
//
(*
#include
"prelude/HATS/prelude_NODE_dats.hats"
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
val () =
prints("Hello from [test03_funmmap]!\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../../../SATS/funmmap.sats"
//
(* ****** ****** *)
//
#staload "./../../../DATS/funmap.dats"
#staload "./../../../DATS/funmmap.dats"
#staload "./../../../DATS/funmap_lsrt000.dats"
#staload "./../../../DATS/funmmap_fmaplst.dats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef key = strn
#typedef itm = sint
#typedef fmmap = fmmap(key, itm)
//
(* ****** ****** *)
(* ****** ****** *)
//
val map1 = funmmap_nil()
//
val map1 =
funmmap_insert$any(map1, "a", 0)
val map1 =
funmmap_insert$any(map1, "a", 0)
val map1 =
funmmap_insert$any(map1, "b", 1)
val map1 =
funmmap_insert$any(map1, "c", 2)
val map1 =
funmmap_insert$any(map1, "d", 3)
//
val (  ) =
printsln("map1 = ", map1)
val (  ) =
printsln
("size(map1) = ", map1.size())
//
val map1 =
funmmap_remove$any(map1, "a")
val (  ) = printsln("map1 = ", map1)
val-
(map1, true) =
funmmap_remove$opt(map1, "a")
val (  ) = printsln("map1 = ", map1)
val-
(map1, false) =
funmmap_remove$opt(map1, "a")
val (  ) = printsln("map1 = ", map1)
//
val-
false =
funmmap_search$tst(map1, "a")
val (  ) = printsln("map1 = ", map1)
val-
(true) =
funmmap_search$tst(map1, "b")
val (  ) = printsln("map1 = ", map1)
val-
(true) =
funmmap_search$tst(map1, "c")
val (  ) = printsln("map1 = ", map1)
//
(* ****** ****** *)
(* ****** ****** *)
//
val () = console_log(the_print_store_flush())
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_JS_githwxi_ATS2_TEST_test03_funmmap.dats] *)
(***********************************************************************)
