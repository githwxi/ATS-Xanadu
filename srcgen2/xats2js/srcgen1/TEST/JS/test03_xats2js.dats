(* ****** ****** *)
(*
HX-2024-05-06:
Testing [xats2js]
as a way to test [xatsopt]
//
Mon 06 May 2024 11:42:43 PM EDT
//
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
"./../../HATS/libxatsopt.hats"
(* ****** ****** *)
//
val ret =
the_fxtyenv_pvsload()
val (  ) = prerrsln
("the_fxtyenv_pvsload() = ", ret)
//
val ret =
the_tr12env_pvsload()
val (  ) = prerrsln
("the_tr12env_pvsload() = ", ret)
//
(* ****** ****** *)
(*
#staload
"./../../SATS/intrep0.sats"
#staload
"./../../SATS/intrep1.sats"
#staload
"./../../SATS/trxd3i0.sats"
#staload
"./../../SATS/trxi0i1.sats"
#staload
"./../../SATS/xats2js.sats"
*)
#staload _ =
"./../../DATS/xats2js_tmplib.dats"
(* ****** ****** *)
//
#include
"./../../DATS/intrep0.dats"
#include
"./../../DATS/intrep0_print0.dats"
//
#include
"./../../DATS/trxd3i0.dats"
#include
"./../../DATS/trxd3i0_myenv0.dats"
#include
"./../../DATS/trxd3i0_dynexp.dats"
#include
"./../../DATS/trxd3i0_decl00.dats"
//
(* ****** ****** *)
//
#include
"./../../DATS/intrep1.dats"
#include
"./../../DATS/intrep1_print0.dats"
//
#include
"./../../DATS/trxi0i1.dats"
#include
"./../../DATS/trxi0i1_myenv0.dats"
#include
"./../../DATS/trxi0i1_dynexp.dats"
#include
"./../../DATS/trxi0i1_decl00.dats"
//
(* ****** ****** *)
#include
"./../../DATS/xats2js.dats"
#include
"./../../DATS/xats2js_myenv0.dats"
#include
"./../../DATS/xats2js_dynexp.dats"
#include
"./../../DATS/xats2js_decl00.dats"
(* ****** ****** *)
(* ****** ****** *)
//
val
mytest03_dats =
(
i1parsed_of_trxi0i1(ipar)
) where
{
//
val
ipar =
i0parsed_of_trxd3i0(dpar)
val
(  ) =
printsln
("i0parsed(i0) = ", ipar)
//
} where
{
//
val
dpar =
d3parsed_of_trans3a(dpar)
val
dpar =
d3parsed_of_trtmp3b(dpar)
val
dpar =
d3parsed_of_trtmp3c(dpar)
val
dpar =
d3parsed_of_tread30(dpar)
//
val ( ) =
(
printsln("dpar = ", dpar))
//
val ( ) =
prerrsln
("FPERR30_D3PARSED(33):")
val out = g_stderr((*0*))
val ( ) =
fperr30_d3parsed(out, dpar)
//
} where
{
val dpar = trans03_from_fpath
(1(*dyn*), "./DATA/mytest03.dats") }
//
(* ****** ****** *)
(* ****** ****** *)
val () =
let
val filr = g_stdout<>() in
xats2js_i1parsed(filr, mytest03_dats) end
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_TEST_JS_test03_xats2js.dats] *)
