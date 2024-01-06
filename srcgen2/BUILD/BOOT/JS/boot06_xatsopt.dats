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
"./../../../SATS/trans23.sats"
#staload
"./../../../SATS/tread23.sats"
(* ****** ****** *)
#staload
"./../../../SATS/trans3a.sats"
#staload
"./../../../SATS/trtmp3b.sats"
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
unsafex_dats =
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
(
1(*dyn*),
"./../../../\
prelude/DATS/CATS/JS/unsafex.dats")}
val ((*void*)) =
fperr33_d3parsed(g_stderr(), unsafex_dats)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
xbasics_dats =
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
(1(*dyn*), "./../../DATS/xbasics.dats")}
val ((*void*)) =
fperr33_d3parsed(g_stderr(), xbasics_dats)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
staexp0_dats =
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
(1(*dyn*), "./../../DATS/staexp0.dats")}
val ((*void*)) =
fperr33_d3parsed(g_stderr(), staexp0_dats)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
dynexp0_dats =
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
(1(*dyn*), "./../../DATS/dynexp0.dats")}
val ((*void*)) =
fperr33_d3parsed(g_stderr(), dynexp0_dats)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
staexp1_dats =
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
(1(*dyn*), "./../../DATS/staexp1.dats")}
val ((*void*)) =
fperr33_d3parsed(g_stderr(), staexp1_dats)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
dynexp1_dats =
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
(1(*dyn*), "./../../DATS/dynexp1.dats")}
val ((*void*)) =
fperr33_d3parsed(g_stderr(), dynexp1_dats)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
staexp2_dats =
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
(1(*dyn*), "./../../DATS/staexp2.dats")}
val ((*void*)) =
fperr33_d3parsed(g_stderr(), staexp2_dats)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
statyp2_dats =
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
(1(*dyn*), "./../../DATS/statyp2.dats")}
val ((*void*)) =
fperr33_d3parsed(g_stderr(), statyp2_dats)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
dynexp2_dats =
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
(1(*dyn*), "./../../DATS/dynexp2.dats")}
val ((*void*)) =
fperr33_d3parsed(g_stderr(), dynexp2_dats)
//
(* ****** ****** *)
(* ****** ****** *)
//
val
dynexp3_dats =
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
(1(*dyn*), "./../../DATS/dynexp3.dats")}
val ((*void*)) =
fperr33_d3parsed(g_stderr(), dynexp3_dats)
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [(* end of [ATS3/XATSOPT_BOOT_JS_boot06_xatsopt.dats] *)
