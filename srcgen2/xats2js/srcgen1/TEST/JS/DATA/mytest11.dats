* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"srcgen2\
/prelude\
/HATS/prelude_dats.hats"
#include
"srcgen2\
/prelude\
/HATS/prelude_JS_dats.hats"
#include
"srcgen2\
/prelude\
/HATS/prelude_NODE_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#include
"xatslib/HATS/xatslib_JS_dats.hats"
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
| tree_nil of ()
| tree_cons of (tree(a), a, tree(a))
//
fun
<a:type>
tree_isAVL
(xs: tree(a)): bool =
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

(* end of [ATS3/XATS2JS_TEST_JS_DATA_mytest11.dats] *)
