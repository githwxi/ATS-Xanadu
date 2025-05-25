(* ****** ****** *)
(* ****** ****** *)
//
#include
"srcgen2\
/prelude/HATS/prelude_dats.hats"
#include
"srcgen2\
/prelude/HATS/prelude_PY_dats.hats"
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
gseq_folditm
<xs><x0><r0>(xs, 0))
where
{ #typedef x0 = sint
  #typedef r0 = sint
  #typedef xs = list(sint)
  #impltmp folditm$fopr<x0><r0>(r0, x0) = r0+1 }//where
//
(* ****** ****** *)
(* ****** ****** *)

fun foo1(): void =
let
//
var xyz
//
val ( ) =
xyz := #(0,1,@(2,3))
//
val ( ) = xyz.1 := 10
//
val ( ) = (xyz.2).0 := 20
val ( ) = (xyz.2).1 := 30 endlet // end-of-[fun foo1]

fun foo2(): void =
let
//
var xyz
//
val ( ) =
xyz := @(0,1,#(2,3))
//
val ( ) = xyz.1 := 10
//
val ( ) = (xyz.2).0 := 20
val ( ) = (xyz.2).1 := 30 endlet // end-of-[fun foo2]

(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2py_srcgen1_TEST_test06_xats2py.dats] *)
(***********************************************************************)
