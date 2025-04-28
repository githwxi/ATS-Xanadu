(* ****** ****** *)
(*
HX-2025-04-28:
For testing prelude/PY!
Mon Apr 28 12:20:00 AM EDT 2025
*)
(* ****** ****** *)
(* ****** ****** *)
#staload _ =
"prelude/DATS/gdbg000.dats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"prelude/HATS/prelude_dats.hats"
#include
"prelude/HATS/prelude_PY_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
val () =
try
(*
  $raise ErrorExn();
*)
  $raise ErrmsgExn("ErrmsgExn")
with ErrmsgExn(msg) => prints("msg = ", msg, "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
tree(a:type) =
//
|
tree_nil of ((*nil*))
//
|
tree_cons of
(tree(a), a, tree(a))
//
(* ****** ****** *)
//
fun
abs(x:int): int =
(
if
x >= 0 then x else -x)
//
fun
max
( x:int
, y:int): int =
(
if x >= y then x else y)
//
(* ****** ****** *)
//
#extern
fun
<a:type>
tree_AVLq(xs: tree(a)): bool
//
(* ****** ****** *)
//
#impltmp
{a:type}
tree_AVLq<a>(xs) =
(
try
let
val _ =
auxlst(xs) in true
end
with
~NotAVL() => false)
where
{
//
excptcon NotAVL
//
fun
auxlst(xs) =
(
case+ xs of
|tree_nil
((*void*)) => 0
|tree_cons
(xs1, _, xs3) =>
let
val h1 = auxlst(xs1)
and h3 = auxlst(xs3)
in//let
if
abs(h1-h3) <= 1
then
1+max(h1,h3) else $raise NotAVL()
end//let//end-of-[tree_cons]
)
//
} (*where*) // end of [tree_AVLq(xs)]
//
(* ****** ****** *)

val t0 = tree_nil()
val t1 = tree_cons(t0, 1, t0)
val t2 = tree_cons(t0, 1, t1)
val t3 = tree_cons(t0, 1, t2)

(* ****** ****** *)

val ans1 = tree_AVLq<sint>(t1)
val ans2 = tree_AVLq<sint>(t2)
val ans3 = tree_AVLq<sint>(t3)

(* ****** ****** *)
(* ****** ****** *)
//
val (  ) =
(g_print("ans1 = "); g_print(ans1); g_print("\n"))
val (  ) =
(g_print("ans2 = "); g_print(ans2); g_print("\n"))
val (  ) =
(g_print("ans3 = "); g_print(ans3); g_print("\n"))
//
(* ****** ****** *)
(* ****** ****** *)
//
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_TEST_CATS_PY_test10_xcptn00.dats] *)
