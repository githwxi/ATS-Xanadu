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
prints("Hello from [test01_funmmap]!\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../../../SATS/funmmap.sats"
//
(* ****** ****** *)
//
#staload "./../../../DATS/funmmap.dats"
#staload "./../../../DATS/funmmap_list000.dats"
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
val (  ) = printsln("map1 = ", map1)
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
(* end of [ATS3/XANADU_xatslib_JS_githwxi_ATS2_TEST_test01_funmmap.dats] *)
(***********************************************************************)
