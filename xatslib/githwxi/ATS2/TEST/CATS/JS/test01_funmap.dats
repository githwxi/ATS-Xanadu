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
prints("\
Hello from [test01_funmap]!\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../../../SATS/funmap.sats"
//
(* ****** ****** *)
//
#staload "./../../../DATS/funmap.dats"
#staload "./../../../DATS/funmap_lsrt000.dats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef key = strn
#typedef itm = sint
#typedef fmap = fmap(key, itm)
//
(* ****** ****** *)
(* ****** ****** *)
//
val map1 = funmap_nil()
//
val map1 =
funmap_insert$new(map1, "a", 0)
val map1 =
funmap_insert$new(map1, "b", 1)
val map1 =
funmap_insert$new(map1, "c", 2)
val map1 =
funmap_insert$new(map1, "d", 3)
//
val (  ) =
printsln("map1 = ", map1)
val (  ) =
printsln("\
size(map1) = ", map1.size())
//
val map1 =
funmap_remove$old(map1, "d")
val (  ) =
printsln("map1 = ", map1)
val (  ) =
printsln("\
size(map1) = ", map1.size())
//
val map1 =
funmap_insert$new(map1, "d", 4)
//
val-
true = funmap_search$tst(map1, "d")
val-
false = funmap_search$tst(map1, "e")
//
val (  ) = printsln("map1 = ", map1)
val (  ) =
printsln("size(map1) = ", map1.size())
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
