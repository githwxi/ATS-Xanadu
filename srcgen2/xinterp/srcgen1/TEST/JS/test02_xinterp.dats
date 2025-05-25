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
(*
#include
"./../../../..\
/HATS/xatsopt_dats.hats"
*)
#include
"./../../../..\
/HATS/xatsopt_dpre.hats"
(* ****** ****** *)
#include
"./../../HATS/libxatsopt.hats"
(* ****** ****** *)
//
val ret =
the_fxtyenv_pvsload()
val (  ) = prerrsln
("the_fxtyenv_pvsload() = ", ret)
//
val ret =
the_tr12env_pvsl00d()
val (  ) = prerrsln
("the_tr12env_pvsl00d() = ", ret)
//
(* ****** ****** *)
(*
#staload
"./../../SATS/intrep0.sats"
#staload
"./../../SATS/xinterp.sats"
*)
#staload _ =
"./../../DATS/xinterp_tmplib.dats"
(* ****** ****** *)
//
#include
"./../../DATS/intrep0.dats"
#include
"./../../DATS/intrep0_print0.dats"
#include
"./../../DATS/intrep0_myenv0.dats"
#include
"./../../DATS/intrep0_dynexp.dats"
#include
"./../../DATS/intrep0_decl00.dats"
//
(* ****** ****** *)
//
#include
"./../../DATS/xinterp.dats"
#include
"./../../DATS/xinterp_print0.dats"
#include
"./../../DATS/xinterp_myenv0.dats"
#include
"./../../DATS/xinterp_inits0.dats"
#include
"./../../DATS/xinterp_utils0.dats"
#include
"./../../DATS/xinterp_dynexp.dats"
#include
"./../../DATS/xinterp_decl00.dats"
//
(* ****** ****** *)
//
val
mytest02_dats =
(
irparsed_of_trxd3ir(dpar)
) where
{
//
val
dpar =
d3parsed_of_trans3a(dpar)
val
dpar =
d3parsed_of_tread3a(dpar)
//
val
dpar =
d3parsed_of_trtmp3b(dpar)
val
dpar =
d3parsed_of_trtmp3c(dpar)
//
val ( ) =
prerrsln
("FPERR30_D3PARSED(30):")
val out = g_stderr((*0*))
val ( ) =
fperr30_d3parsed(out, dpar)
//
} where
{
val dpar =
  d3parsed_of_fildats
  ( "./DATA/mytest02.dats" ) }
//
val ( ) =
xinterp_irparsed(mytest02_dats) where
{
val ((*0*)) =
(
printsln
("parsed(ir) = ", mytest02_dats.parsed()))
} (*where*) // end of [xinterp_irparsed(...)]
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_TEST_JS_test02_xinterp.dats] *)
