(* ****** ****** *)
(* ****** ****** *)
(*
HX-2025-04-01:
Wed Apr  1 04:51:55 PM EDT 2026
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
Hello from [test09_funmset]!\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../../../SATS/funmset.sats"
#staload "./../../../SATS/funmmap.sats"
//
(* ****** ****** *)
//
#staload "./../../../DATS/funmset.dats"
#staload "./../../../DATS/funmmap.dats"
#staload "./../../../DATS/funmset_fmmap00.dats"
#staload "./../../../DATS/funmmap_list000.dats"
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
  funmset_nil{itm}()
val (  ) = printsln("set1 = ", set1)
//
(* ****** ****** *)
//
val set1 =
  funmset_insert$any(set1, 1)
val set1 =
  funmset_insert$any(set1, 1)
val set1 =
  funmset_insert$any(set1, 2)
val set1 =
  funmset_insert$any(set1, 2)
val set1 =
  funmset_insert$any(set1, 3)
val set1 =
  funmset_insert$any(set1, 3)
//
val (  ) = printsln("set1 = ", set1)
//
(* ****** ****** *)
//
val set1 =
  funmset_remove$old(set1, 1)
val set1 =
  funmset_remove$old(set1, 2)
val set1 =
  funmset_remove$old(set1, 3)
val (  ) = printsln("set1 = ", set1)
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
(* end of [ATS3/XANADU_xatslib_JS_githwxi_ATS2_TEST_test09_funmset.dats] *)
(***********************************************************************)
