(* ****** ****** *)
(* ****** ****** *)
(*
HX-2025-03-31:
Tue Mar 31 01:22:40 PM EDT 2026
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
Hello from [test07_lsrtset]!\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../../../SATS/funset.sats"
#staload "./../../../SATS/funmap.sats"
//
(* ****** ****** *)
//
#staload "./../../../DATS/funset.dats"
#staload "./../../../DATS/funmap.dats"
#staload "./../../../DATS/funset_fmap000.dats"
#staload "./../../../DATS/funmap_lsrt000.dats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef itm = sint
//
(* ****** ****** *)
(* ****** ****** *)
//
val set1 =
  funset_nil{itm}()
val (  ) = printsln("set1 = ", set1)
val set2 =
  funset_nil{itm}()
val (  ) = printsln("set2 = ", set1)
//
(* ****** ****** *)
//
val set1 =
  funset_insert$new(set1, 1)
val set1 =
  funset_insert$new(set1, 2)
val set1 =
  funset_insert$new(set1, 3)
val (  ) = printsln("set1 = ", set1)
//
val set2 =
  funset_insert$new(set2, 11)
val set2 =
  funset_insert$new(set2, 21)
val set2 =
  funset_insert$new(set2, 31)
val (  ) = printsln("set2 = ", set2)
//
(* ****** ****** *)
//
val set1 =
  funset_remove$old(set1, 1)
val (  ) = printsln("set1 = ", set1)
val set2 =
  funset_remove$old(set2, 11)
val (  ) = printsln("set2 = ", set2)
//
(* ****** ****** *)
(* ****** ****** *)
//
val set1u2 =
  funset_union(set1, set2)
val (   ) = printsln("set1u2 = ", set1u2)
//
val set1i2 =
  funset_inter(set1, set2)
val (   ) = printsln("set1i2 = ", set1i2)
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
(* end of [ATS3/XANADU_xatslib_JS_githwxi_ATS2_TEST_test07_lsrtset.dats] *)
(***********************************************************************)
