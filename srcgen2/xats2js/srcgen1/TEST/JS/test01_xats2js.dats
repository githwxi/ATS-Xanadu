(* ****** ****** *)
(*
HX-2024-03-25:
Testing [xats2js]
as way to test [xatsopt]
//
Mon 25 Mar 2024 06:06:45 PM EDT
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
"./../../HATS/libxats2js.hats"
(* ****** ****** *)
//
val ret =
the_fxtyenv_pvsload()
val (  ) = prerrln
("the_fxtyenv_pvsload() = ", ret)
//
val ret =
the_tr12env_pvsload()
val (  ) = prerrln
("the_tr12env_pvsload() = ", ret)
//
(* ****** ****** *)
(*
#staload
"./../../SATS/intrep0.sats"
#staload
"./../../SATS/trxd3i0.sats"
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
(* ****** ****** *)
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
(* ****** ****** *)
//
val
mytest01_dats =
(
i0parsed_of_trxd3i0(dpar)
) where
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
d3parsed_of_tread33(dpar)
//
val ( ) =
println("dpar = ", dpar)
//
val ( ) =
prerrln
("FPERR33_D3PARSED(33):")
val out = g_stderr((*0*))
val ( ) =
fperr33_d3parsed(out, dpar)
//
} where
{
val dpar = d3parsed_from_fpath
(1(*dyn*), "./DATA/mytest01.dats") }
//
(* ****** ****** *)
//
val () = () where
{
val ((*0*)) =
(
println
("parsed(i0) = ", mytest01_dats.parsed()))
} (*where*) // end of [xinterp_i0parsed(...)]
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_TEST_JS_test01_xats2js.dats] *)
