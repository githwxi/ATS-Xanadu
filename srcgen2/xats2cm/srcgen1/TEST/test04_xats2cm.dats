(* ****** ****** *)
(* ****** ****** *)
(*
HX-2026-07-30:
Thu Jul 30:
12:34:41 PM EDT 2026
*)
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"prelude/HATS/prelude_dats.hats"
//
#include
"prelude/HATS/prelude_CM_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<a:t0>
list_btw_vt
(s1: sint, f2: sint): list_vt(a)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp<a>
list_btw_vt(s1,f2) =
let
//
#vwtpdef tres = list_vt(a)
//
fnx
loop(i0: sint, r0: tres): tres =
if (i0 = f2)
then
  r0
else
  loop(i0+1, r0) where
  {
    val x0 = g_si<a>(i0)
    val r0 = list_vt_cons(x0, r0) }
endif // if (i0 = f0)
//
in//let
  if s1 > f2
  then
    list_vt_nil()
  else
    list_vt_reverse0<a>(loop(s1,list_vt_nil))
  //endof(if(s1>f2))
end//let//end(list_btw_vt<a>(s1,f2):list_vt(a))
//
(* ****** ****** *)
val list_btw_vt_sint = list_btw_vt<sint>(*void*)
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cm_srcgen1_TEST_test04_xats2cm.dats] *)
(***********************************************************************)
