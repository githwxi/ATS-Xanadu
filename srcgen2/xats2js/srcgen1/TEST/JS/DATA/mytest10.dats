(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
//
#include
"srcgen1\
/prelude/HATS/prelude_dats.hats"
//
#include
"srcgen1\
/prelude/HATS/CATS/JS/prelude_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)

fun
cube(x1: sint): sint =
let
val x2 = x1 * x1 in x1 * x2
end // let // end (cube(x1))

(* ****** ****** *)
(* ****** ****** *)
//
fun
fact(n: sint): sint = 
(
  loop(0); res ) where
{
var res: sint = 1
fun loop(i: sint): void =
if i < n then
(res := res * (i+1); loop(i+1))
}
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
length2(xs: list(sint)): sint =
(
case+ xs of
|
list_nil() => 0
|
list_cons
(_, list_nil()) => 1
|
list_cons
(_, list_cons(_, xs)) => 2 + length2(xs)
)
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATS2JS_TEST_JS_DATA_mytest10.dats] *)
