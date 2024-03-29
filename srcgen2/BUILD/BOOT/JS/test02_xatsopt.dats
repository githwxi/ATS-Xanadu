(* ****** ****** *)
(*
HX-2023-11-01:
A long journey of
bootstrapping ATS3/Xanadu!!!
*)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
#staload
"./../../../SATS/locinfo.sats"
(* ****** ****** *)
#staload
"./../../../SATS/dynexp3.sats"
(* ****** ****** *)
#staload
"./../../../SATS/trans23.sats"
#staload
"./../../../SATS/tread23.sats"
(* ****** ****** *)
#staload
"./../../../SATS/trans3a.sats"
#staload
"./../../../SATS/trtmp3b.sats"
(* ****** ****** *)
#staload
"./../../../SATS/tread33.sats"
#staload
"./../../../SATS/fperr33.sats"
(* ****** ****** *)
#staload
"./../../../SATS/xglobal.sats"
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
//
val
mytest02_dats =
(
d3parsed_of_tread33(dpar)
) where
{
val
dpar =
d3parsed_of_trans3a(dpar)
val
dpar =
d3parsed_of_trtmp3b(dpar)
} where
{
val
dpar = d3parsed_from_fpath
(1(*dyn*), "./DATA/mytest02.dats") }
//
val ((*void*)) =
(
println
("parsed(3b) = ", mytest02_dats.parsed()))
//
val ((*void*)) =
fperr33_d3parsed(g_stderr(), mytest02_dats)
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [(* end of [ATS3/XATSOPT_BOOT_JS_test02_xatsopt.dats] *)
