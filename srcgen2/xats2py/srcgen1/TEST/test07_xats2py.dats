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
/prelude/HATS/prelude_PY_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
val fact = 
fix
f(x: sint): sint =>
if x > 0 then x * f(x-1) else 1
//
val (   ) = println("fact(10) = ", fact(10))
//
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
tree(a:type+) =
|
tree_nil of ()
|
tree_cons of
(tree(a), a, tree(a))
//
#extern
fun
<a:type>
tree_isAVL
(xs: tree(a)): bool
//
#impltmp
<a:type>
tree_isAVL(xs) =
(
try
let
val _ =
auxlst(xs) in true
end
with ~NotAVL() => false)
where
{
//
excptcon NotAVL
//
fun
max
( x: sint
, y: sint): sint =
(if x >= y then x else y)
//
fun
auxlst(xs) =
(
case+ xs of
|
tree_nil
((*void*)) => 0
|
tree_cons
(xs1, _, xs3) =>
let
val h1 = auxlst(xs1)
val h3 = auxlst(xs3)
in
  if
  abs(h1-h3) <= 1
  then 1 + max(h1, h3) else $raise NotAVL()
end
)
//
} (*where*) // end of [tree_isAVL(xs)]

(* ****** ****** *)
(* ****** ****** *)
//
val t0 = tree_nil()
val t1 = tree_cons(t0, 1, t0)
val t2 = tree_cons(t0, 2, t0)
val t3 = tree_cons(t0, 3, t1)
val t4 = tree_cons(t0, 4, t2)
val t5 = tree_cons(t3, 5, t4)
val t6 = tree_cons(t2, 6, t5)
//
val () = prints("isAVL(t5) = ", tree_isAVL(t5), "\n")
val () = prints("isAVL(t6) = ", tree_isAVL(t6), "\n")
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_xats2py_srcgen1_TEST_test07_xats2py.dats] *)
