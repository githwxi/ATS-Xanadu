(* ****** ****** *)
(*
HX-2023-11-29:
Testing [xinterp]
as way to test [xatsopt]
*)
(* ****** ****** *)
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
mytest04_dats =
(
i1parsed_of_trxi0i1(ipar)
) where
{
//
val
ipar =
i0parsed_of_trxd3i0(dpar)
(*
val
(  ) =
printsln
("i0parsed(i0) = ", ipar)
*)
//
} where
{
//
val
dpar =
d3parsed_of_trans3a(dpar)
//
(*
val ( ) =
prerrsln
("d3parsed(3a) = ", dpar)
*)
//
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
(*
val ( ) =
prerrsln
("d3parsed(33) = ", dpar)
*)
//
//
val
out = g_stderr((*0*))
//
val ( ) =
prerrsln
("FPERR30_D3PARSED(4):")
val ( ) =
fperr30_d3parsed(out, dpar)
//
} where
{
val dpar = trans03_from_fpath
(1(*dyn*), "./DATA/mytest04.dats") }
//
(* ****** ****** *)
(* ****** ****** *)
//
val () =
let
val filr = g_stdout<>() in
xats2js_i1parsed(filr, mytest04_dats) end
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_TEST_JS_test04_xats2js.dats] *)
