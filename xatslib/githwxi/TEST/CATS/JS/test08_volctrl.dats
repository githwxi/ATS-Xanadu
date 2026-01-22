(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-09-09:
Mon 09 Sep 2024 11:18:07 AM EDT
*)
(* ****** ****** *)
(* ****** ****** *)
//
#include
"prelude/HATS/prelude_dats.hats"
#include
"xatslib/libcats/HATS/libcats_dats.hats"
#include
"xatslib/githwxi/HATS/githwxi_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#include
"prelude/HATS/prelude_JS_dats.hats"
#include
"xatslib/xbasics/HATS/xbasics_JS_dats.hats"
#include
"xatslib/libcats/HATS/libcats_JS_dats.hats"
#include
"xatslib/githwxi/HATS/githwxi_JS_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#include
"prelude/HATS/prelude_NODE_dats.hats"
#include
"xatslib/libcats/HATS/libcats_NODE_dats.hats"
#include
"xatslib/githwxi/HATS/githwxi_NODE_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
#include
"xatslib/githwxi/HATS/githwxi_DETMP_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
val opt0 =
mycsv00$fpath_csv$parse$opt_lstrm
(       "./DATA/QQQ.csv"        )
//
val opts = opts where
{
  val-optn_vt_cons(opts) = opt0 }
//
val (  ) =
prints("\
type(opts) = ", type(opts), "\n")
//
val opts = !opts
val-
strmcon_vt_cons(opt1, opts) = opts
//
val (  ) =
printsln("hdr0 = ", hdr0)
where{val-optn_vt_cons(hdr0) = opt1}
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
) where{val sint=g_parse<sint>(rep)}
fun
f0_dflt
(rep: strn): dtval =
(
  DTVdflt(dflt)
) where{val dflt=g_parse<dflt>(rep)}
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
strm_vt_foritm0$f1un
(
opts,
lam(opt) =>
(
case+ opt of
| ~
optn_vt_nil() => ()
| ~
optn_vt_cons
(    row    ) => work(myrow_make(row)))))
//a1sz_fmake_fwork//end(myrows_opts$make)
//
(* ****** ****** *)
(* ****** ****** *)
//
val rows = myrows_opts$make(opts)
val (  ) =
printsln("|rows| = ", length(rows))
//
val (  ) = printsln("rows[0] = ", rows[0])
val (  ) = printsln("rows[1] = ", rows[1])
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
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_JS_githwxi_TEST_test08_volctrl.dats] *)
(***********************************************************************)
