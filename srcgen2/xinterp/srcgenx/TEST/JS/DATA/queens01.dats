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

fun
board_nil(): board = ERROR()

(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XINTERP_TEST_JS_DATA_queens01.dats] *)
