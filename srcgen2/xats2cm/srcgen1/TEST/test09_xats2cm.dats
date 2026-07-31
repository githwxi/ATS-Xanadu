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
#include
"prelude/HATS/prelude_CM_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)

#abstbox board_tbox
#typedef board = board_tbox

(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
raiseErrorExn
  ( (*0*) ): a = $raise ErrorExn()
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
board_nil
((*void*)): board = raiseErrorExn()
#extern
fun
board_cons
( x0: sint
, xs: board): board = raiseErrorExn()
//
#extern
fun
board_forall
  (xs: board): bool = raiseErrorExn()
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cm_srcgen1_TEST_test09_xats2cm.dats] *)
(***********************************************************************)
