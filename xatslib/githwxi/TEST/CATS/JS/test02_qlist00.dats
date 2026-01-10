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
#include
"xatslib/githwxi/HATS/githwxi_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"prelude/HATS/prelude_JS_dats.hats"
(*
#include
"prelude/HATS/prelude_NODE_dats.hats"
*)
#include
"xatslib/xbasics/HATS/xbasics_JS_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
val xs = 
GSEQ(list@(1,2,3,4,5)).folditm
( qlist_nil()
, lam(r0, x0) => qlist_snoc(r0, x0))
//
val () =
prints("xs(type) = ", type(xs), "\n")
//
val () = prints("xs(value) = ", xs, "\n")
//
val () = prints("sum(xs) = ", sum(GSEQ(xs)), "\n")
val () = prints("prod(xs) = ", prod(GSEQ(xs)), "\n")
val () = print1s("listize(xs) = ", listize(GSEQ(xs)), "\n")
val () = print1s("rlistize(xs) = ", rlistize(GSEQ(xs)), "\n")
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

(* end of [ATS3/XANADU_xatslib_JS_githwxi_TEST_test02_qlist00.dats] *)
