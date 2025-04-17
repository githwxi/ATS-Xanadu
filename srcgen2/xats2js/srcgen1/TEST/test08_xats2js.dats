(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"srcgen2\
/prelude/HATS/prelude_dats.hats"
#include
"srcgen2\
/prelude/HATS/prelude_JS_dats.hats"
#include
"srcgen2\
/xatslib/HATS/xatslib_JS_dats.hats"
#include
"srcgen2\
/prelude/HATS/prelude_NODE_dats.hats"
//
(* ****** ****** *)
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
(* ****** ****** *)
//
val A =
jsarray_3val(1, 3, 2)
val () =
(
  prints("A = ", A, "\n"))
//
val () = A.sortref()
val () =
(
  prints("A = ", A, "\n"))
//
(* ****** ****** *)
//
val () =
A.foritm(
lam(x:nint) => prints(x, "\n"))
//
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
< r0 > < x0 >
(r0, i0, x0) = r0 + (i0+1)*x0
}
//
val () =
(
  prints("iA = ", iA, "\n"))
//
(* ****** ****** *)
(* ****** ****** *)
//
val B =
jsarray
(
map_lstrm(10,lam(i:nint)=>i+1))
val () = prints("B = ", B, "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
cube(x1: sint): sint =
let
  val x2 = x1 * x1 in x1 * x2
end // let // end-of(cube(x1))
//
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
  sum0(tail0(nint_strmize(x+1))))
//
(* ****** ****** *)
//
fun
fact1_prod_tail
  (x: sint): sint =
(
  prod0(tail0(nint_strmize(x+1))))
//
(* ****** ****** *)
(* ****** ****** *)
//
val () = prints
("mytest12:nsum0_tail(10)=",nsum0_tail(10),"\n")
val () = prints
("mytest12:fact1_prod_tail(10)=",fact1_prod_tail(10),"\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
val xs1 = list_pair(1, 2)
val xs2 = list_pair(3, 4)
val ( ) = prints("xs1 = ", xs1, "\n")
val ( ) = prints("xs2 = ", xs2, "\n")
val ( ) = prints("|xs1| = ", length(xs1), "\n")
val ( ) = prints("|xs2| = ", length(xs2), "\n")
//
val xs3 = append(xs1, xs2)
val ( ) = prints("xs3 = ", xs3, "\n")
val ( ) = prints("|xs3| = ", length(xs3), "\n")
//
val xs4 = reverse(  xs3  )
val ( ) = prints("xs4 = ", xs4, "\n")
val ( ) = prints("|xs4| = ", length(xs4), "\n")
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_xats2js_srcgen1_TEST_test08_xats2js.dats] *)
