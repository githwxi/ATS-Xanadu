(* ****** ****** *)
//
#staload UN =
"prelude/SATS/unsafex.sats"
//
#staload _(*UN*) =
"prelude/DATS/unsafex.dats"
//
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
/prelude\
/HATS/CATS/JS/prelude_dats.hats"
//
(* ****** ****** *)
//
#staload _ =
"srcgen1\
/prelude\
/DATS/CATS/JS/Node/g_print.dats"
//
(* ****** ****** *)
#staload
"xatslib/JS/SATS/Array.sats"
#include
"xatslib/JS/HATS/xatslib_JS_dats.hats"
(* ****** ****** *)
//
(*
//
#extcode
"
var A = [1,2,3]
"(*end-of-[extcode]*)
val A =
$synext("A"):jsarray(sint,3)
//
*)
//
(* ****** ****** *)
//
val A =
jsarray(1, 3, 2)
val () =
(
println("A = ", A))
val () = A.sortref()
val () =
(
println("A = ", A))
//
(* ****** ****** *)
val () =
println
(
"false = ",
A.forall(lam x => x < 3)
)
(* ****** ****** *)
//
val iA =
gseq_ifolditm
<xs><x0><r0>(A, 0) where
{
#typedef r0 = sint
#typedef x0 = sint
#typedef xs = jsarray(sint)
#impltmp
ifolditm$fopr
<r0><x0>(r0, i0, x0) = r0 + (i0+1)*x0
}
//
val () =
(
  println("iA = ", iA))
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
{
#typedef x0 = sint
#typedef r0 = sint
#impltmp foldl$fopr<x0><r0>(r0, x0) = r0+1 }
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
#symload sum0 with gseq_sum0
#symload prod0 with gseq_prod0
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-01-03:
More than 10 template layers!
*)
(* ****** ****** *)
(* ****** ****** *)
//
fun
nsum0_tail
  (x: sint): sint =
(
  sum0(tail0(strmize(x+1))))//fun
//
(* ****** ****** *)
//
fun
fact1_prod_tail
  (x: sint): sint =
(
  prod0(tail0(strmize(x+1))))//fun
//
(* ****** ****** *)
(* ****** ****** *)
//
val () = println
(
"mytest12:nsum0_tail(10)=",nsum0_tail(10))
val () = println
(
"mytest12:fact1_prod_tail(10)=",fact1_prod_tail(10))
//
(* ****** ****** *)
(* ****** ****** *)
//
val xs1 = list_pair(1, 2)
val xs2 = list_pair(3, 4)
val ( ) = println("xs1 = ", xs1)
val ( ) = println("xs2 = ", xs2)
val ( ) = println("|xs1| = ", length(xs1))
val ( ) = println("|xs2| = ", length(xs2))
val xs3 = append(xs1, xs2)
val ( ) = println("xs3 = ", xs3)
val ( ) = println("|xs3| = ", length(xs3))
val xs4 = reverse(  xs3  )
val ( ) = println("xs4 = ", xs4)
val ( ) = println("|xs4| = ", length(xs4))
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATS2JS_TEST_JS_DATA_mytest12.dats] *)
