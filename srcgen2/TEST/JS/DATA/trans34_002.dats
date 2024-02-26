(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
//
#include
"prelude/HATS/prelude_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#abstype VT <= sint
(* ****** ****** *)
//
fun
length
(xs: list(VT)): int =
case+ xs of
| list_nil() => 0
| list_cons(_, xs) => 1+length(xs)
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [DATA/trans34_002.dats] *)
