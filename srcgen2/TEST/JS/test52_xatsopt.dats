(* ****** ****** *)
(*
HX-2024-01-22:
Testing [trans34]
*)
(* ****** ****** *)
#include
"./../..\
/HATS/xatsopt_sats.hats"
(*
#include
"./../..\
/HATS/xatsopt_dats.hats"
*)
#include
"./../..\
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
the_tr12env_pvsload()
val (  ) = prerrsln
("the_tr12env_pvsload() = ", ret)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
mytest
(fpath: string): void =
let
//
(*
val dpar =
  d3parsed_of_trtmp3b(dpar)
val dpar =
  d3parsed_of_trtmp3c(dpar)
val dpar =
  d3parsed_of_tread30(dpar)
*)
//
val dpar =
  d4parsed_of_trans34(dpar)
//
val (  ) =
(
  prerrsln("dpar(34) = ", dpar))
//
in//let
//
fperr40_d4parsed
(g_stderr((*tmp*)), dpar) end where
{
val dpar = d3parsed_of_fildats(fpath)
}
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
#typedef
argv = jsa1sz(strn)
#extern
fun
XATS2JS_NODE_argv$get
  ((*void*)): argv = $extnam()
//
in//local
//
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
  XATS2JS_NODE_argv$get()
  val (  ) = prerrsln("argv = ", argv)
} (*where*)//end-of-[ mymain((*void*)) ]
//
}
//
end(*local*)//end-of-[ val () = mymain() ]
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_TEST_JS_test52_xatsopt.dats] *)
