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
"prelude/HATS/prelude_JS_dats.hats"
#include
"prelude/HATS/prelude_NODE_dats.hats"
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
(* end of [ATS3-XANADU/srcgen2/xats2js/srcgen1/TEST/test09_xats2js.dats] *)
(***********************************************************************)
