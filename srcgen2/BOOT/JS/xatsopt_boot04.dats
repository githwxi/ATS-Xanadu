(* ****** ****** *)
(*
HX-2023-11-01:
A long journey of
bootstrapping ATS3/Xanadu!!!
*)
(* ****** ****** *)
#include
"./../..\
/HATS/xatsopt_sats.hats"
#include
"./../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
#staload
"./../../SATS/locinfo.sats"
(* ****** ****** *)
#staload
"./../../SATS/trans12.sats"
#staload
"./../../SATS/tread12.sats"
(* ****** ****** *)
#staload
"./../../SATS/xglobal.sats"
(* ****** ****** *)
//
val ret =
the_fxtyenv_pvsload()
val (  ) =
prerrln("the_fxtyenv_pvsload() = ", ret)
//
val ret =
the_tr12env_pvsload()
val (  ) =
prerrln("the_tr12env_pvsload() = ", ret)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
xbasics_sats =
(
d2parsed_of_tread12(dpar)
) where
{
val
dpar = d2parsed_from_fpath
(0(*sta*), "./../../SATS/xbasics.sats")}
val ((*void*)) =
d2parsed_fpemsg(g_stderr(), xbasics_sats)
////
val
xbasics_dats =
(
d2parsed_of_tread12(dpar)
) where
{
val
dpar = d2parsed_from_fpath
(1(*dyn*), "./../../DATS/xbasics.dats")}
val ((*void*)) =
d2parsed_fpemsg(g_stderr(), xbasics_dats)
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [(* end of [ATS3/XATSOPT_BOOT_JS_xatsopt_boot04.dats] *)
