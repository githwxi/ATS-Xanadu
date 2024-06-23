(* ****** ****** *)
(*
HX-2024-06-23:
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
//
} where
{
val dpar = d3parsed_from_fpath
(1(*dyn*), "./DATA/mytest10.dats") }
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
mytest
(fpath: string): void =
let
//
val dpar =
  d3parsed_of_trtmp3b(dpar)
val dpar =
  d3parsed_of_trtmp3c(dpar)
val dpar =
  d3parsed_of_tread33(dpar)
//
val (  ) =
(
 prerrln
 ("d3parsed(33) = ", dpar)
)
//
val (  ) =
let
val
out = g_stderr((*0*))
in//let
//
prerrln
("FPERR33_D3PARSED:");
fperr33_d3parsed(out, dpar)
end//let
//
val ipar =
(
  i0parsed_of_trxd3i0(dpar))
//
val ipar =
(
  i1parsed_of_trxi0i1(ipar))
//
in//let
//
let
val
filr = g_stdout<>()
in//let
(
  js1emit_i1parsed(filr, ipar))
end//let
//
end where
{
val dpar = d3parsed_of_fildats(fpath)
}
//
(* ****** ****** *)
(* ****** ****** *)
#staload
"\
srcgen1\
/prelude\
/DATS/CATS/JS/basics1.dats"
(* ****** ****** *)
#staload
"\
srcgen1\
/prelude\
/DATS/CATS/JS/Node/process.dats"
(* ****** ****** *)
val () =
mymain() where
{
//
fun
mymain((*void*)) =
(
mytest(argv[2])) where
{
  val argv =
  XATS2JS_NODE_argv_get()
  val (  ) = prerrln("argv = ", argv)
} (*where*)//end-of-[ mymain((*void*)) ]
//
}
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_TEST_JS_test10_xats2js.dats] *)
