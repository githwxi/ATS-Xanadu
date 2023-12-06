(* ****** ****** *)
(*
HX-2023-11-29:
Testing [xinterp]
as way to test [xatsopt]
*)
(* ****** ****** *)
#include
"./../../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#include
"./../../HATS/libxinterp.hats"
(* ****** ****** *)
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
mytest01_dats =
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
(1(*dyn*), "./DATA/mytest01.dats") }
//
val ((*void*)) =
(
println
("parsed(3b) = ", mytest01_dats.parsed()))
//
val ((*void*)) =
fperr33_d3parsed(g_stderr(), mytest01_dats)
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_TEST_JS_test01_xintrep.dats] *)
