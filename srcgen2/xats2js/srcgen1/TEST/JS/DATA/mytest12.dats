(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
//
#include
"srcgen1\
/prelude/HATS/prelude_dats.hats"
#include
"srcgen2\
/prelude/HATS/prelude_dats.hats"
(* ****** ****** *)
//
#include
"srcgen1\
/prelude/HATS/CATS/JS/prelude_dats.hats"
//
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
length1(xs: list(sint)): sint =
(
case+ xs of
| list_nil() => 0
| list_cons(_, xs) => 1 + length1(xs)
)
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
//
fun
length3
(xs
:list(sint)): sint = list_length<sint>(xs)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
length4
(xs: list(sint)): sint =
(
list_foldl<x0><r0>(xs, 0))
where
{ #typedef x0 = sint
  #typedef r0 = sint
  #impltmp foldl$fopr<x0><r0>(r0, x0) = r0+1 }//where
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fact2
( n0: sint): sint =
let
fun
loop
(i0: sint, res: &sint >> _): void =
if
(i0 < n0) then
let
val () =
(
res :=
(i0+1) * res) in loop(i0+1, res) end
in//let
let
var
res: sint = 1 in loop(0, res); res end
end//let
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-01-03:
More than 10 template layers!
*)
fun
fact1_prod_tail
  (x: sint): sint =
(
  prod0(tail0(strmize(x+1))))//fun
//
(* ****** ****** *)
(* ****** ****** *)
val () = println
("mytest12:fact1_prod_tail(10)=",fact1_prod_tail(10))
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATS2JS_TEST_JS_DATA_mytest12.dats] *)
