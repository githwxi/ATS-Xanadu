(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-09-07:
Sat 07 Sep 2024 02:40:27 PM EDT
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
(        "./DATA/QQQ.csv"        )
//
val opts = opts
where{val-optn_vt_cons(opts) = opt0}
//
(* ****** ****** *)
(*
val () =
g_void(
strm_vt_iforall0_f2un
(
opts,
lam(i, x) =>
if (i >= 10)
then false else
(print0s("x = ", x, "\n"); true)))
*)
//
local
//
#vwtpdef
x0 = optn_vt(a1sz(strn))
#vwtpdef xs = strm_vt(x0)
//
#impltmp
gseq_sep<xs><x0>() = "\n"
#impltmp
gseq_end<xs><x0>() = "\n)"
#impltmp
gseq_beg<xs><x0>() = "strm_vt(\n"
//
#impltmp
gseq_prlen<xs><x0>() = (20)
//
in//local
val () = print0s("opts = ", opts, "\n")
end//local
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

(* end of [ATS3/XANADU_xatslib_JS_githwxi_TEST_test06_mycsv00.dats] *)
