(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
//
#include
"prelude/HATS/prelude_dats.hats"
//
#include
"prelude/HATS/CATS/JS/prelude_dats.hats"
//
(* ****** ****** *)
//
#impltmpr
<a:t0>
list_length(xs) =
(
case+ xs of
| list_nil() => 0
| list_cons(_, xs) => list_length<a>(xs))
//
(* ****** ****** *)

fun
mylist_length
(xs: list(char)): sint = list_length<char>(xs)

(* ****** ****** *)

(* end of [(* end of [ATS3/XATSOPT_BOOT_JS_DATA_mytest04.dats] *)
