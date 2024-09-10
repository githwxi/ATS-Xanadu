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
//
#typedef
row = a1sz(strn)
//
fun
myrow_make
(row: row): myobj =
myobj_fmake_fwork
(
lam(work) =>
(
work
("Date"    , f0_strn(row[0]));
work
("Volume"  , f0_sint(row[6]));
work
("AdjClose", f0_dflt(row[5])))
) where
{
fun
f0_strn
(rep: strn): dtval = DTVstrn(rep)
fun
f0_sint
(rep: strn): dtval =
(
DTVsint(sint)
) where{ val sint=g_parse<sint>(rep) }
fun
f0_dflt
(rep: strn): dtval =
(
  DTVdflt(dflt)
) where{ val dflt=g_parse<dflt>(rep) }
}
//
(* ****** ****** *)
//
fun
myrows_opts$make
( opts
: strm_vt(
  optn_vt(row))): a1sz(myobj) =
a1sz_fmake_fwork(
lam(work) =>
strm_vt_foritm0_f1un
(
opts,
lam(opt) =>
(
case+ opt of
| ~
optn_vt_nil() => ()
| ~
optn_vt_cons(row) => work(myrow_make(row)))))
//
(* ****** ****** *)
(* ****** ****** *)
//
val rows = myrows_opts$make(opts)
val (  ) =
prints("|rows| = ", length(rows), "\n")
//
val (  ) = prints("rows[0] = ", rows[0], "\n")
val (  ) = prints("rows[1] = ", rows[1], "\n")
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
