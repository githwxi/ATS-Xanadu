(* ****** ****** *)
(*
HX-2024-06-22:
Sat 22 Jun 2024 07:51:23 PM EDT
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
"./../../HATS/libxats2js.hats"
(* ****** ****** *)
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
(* ****** ****** *)
//
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
#staload
"./../../SATS/js1emit.sats"
//
#staload _ =
"./../../DATS/xats2js_tmplib.dats"
//
(* ****** ****** *)
(* ****** ****** *)
//
val
mytest10_dats =
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
println
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
prerrln
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
d3parsed_of_tread33(dpar)
//
// (*
val ( ) =
prerrln
("d3parsed(33) = ", dpar)
// *)
//
val
out = g_stderr((*0*))
//
val ( ) =
prerrln
("FPERR33_D3PARSED(4):")
val ( ) =
fperr33_d3parsed(out, dpar)
//
} where
{
val dpar = d3parsed_from_fpath
(1(*dyn*), "./DATA/mytest10.dats") }
//
(* ****** ****** *)
(* ****** ****** *)
//
val () =
let
val filr = g_stdout<>() in
js1emit_i1parsed(filr, mytest10_dats) end
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_TEST_JS_test10_xats2js.dats] *)
