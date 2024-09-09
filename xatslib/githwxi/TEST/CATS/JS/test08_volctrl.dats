(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-09-09:
Mon 09 Sep 2024 11:18:07 AM EDT
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
#include
"xatslib\
/githwxi/HATS/githwxi_JS_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"srcgen2\
/prelude/HATS/prelude_NODE_dats.hats"
#include
"xatslib\
/githwxi/HATS/githwxi_NODE_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
val opt0 =
mycsv00$fpath_csv$parse$opt_lstrm
  (      "./DATA/QQQ.csv"      )
//
val opts = opts
where{
  val-optn_vt_cons(opts) = opt0 }
//
val (  ) = prints
("type(opts) = ", type(opts), "\n")
//
val opts = !opts
val-
strmcon_vt_cons(hdr0, opts) = (opts)
//
val-
optn_vt_cons(hdr0) = hdr0
val (  ) = prints("hdr0 = ", hdr0, "\n")
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

(* end of [ATS3/XANADU_xatslib_JS_githwxi_TEST_test08_volctrl.dats] *)
