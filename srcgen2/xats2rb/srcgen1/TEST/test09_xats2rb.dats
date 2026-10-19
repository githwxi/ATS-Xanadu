(* ****** ****** *)
(* ****** ****** *)
(*
HX-2026-09-05:
For testing xats2rb!
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
"./../prelude/HATS/prelude_RB_dats.hats"
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
(* end of [ATS3/XANADU_srcgen2_xats2rb_srcgen1_TEST_test09_xats2rb.dats] *)
(***********************************************************************)
