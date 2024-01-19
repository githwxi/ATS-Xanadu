(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
//
#include
"prelude/HATS/prelude_dats.hats"
//
#include
"prelude\
/HATS/CATS/Xint/prelude_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)

#abstbox board_tbox
#typedef board = board_tbox

(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
board_nil
((*void*)): board = RaiseErrorExn()
#extern
fun
board_cons
( x0: sint
, xs: board): board = RaiseErrorExn()
//
#extern
fun
board_forall
  (xs: board): bool = RaiseErrorExn()
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XINTERP_TEST_JS_DATA_queens01.dats] *)
