(* ****** ****** *)
(* ****** ****** *)
#include
"./../..\
/xshared/xats2js_prelude.hats"
(* ****** ****** *)
#staload _ =
"srcgen1\
/prelude\
/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)
(* ****** ****** *)
//
datatype
tree(a:type) =
//
| tree_nil of ()
//
| tree_cons of
  (tree(a), a, tree(a))
//
(* ****** ****** *)

#extern
fun<a:type>
isAVL(xs: tree(a)): bool

(* ****** ****** *)
//
fun
abs(x:int): int =
if x >= 0 then x else 0-x
//
fun
max
( x:int
, y:int): int =
  if x >= y then x else y
//
(* ****** ****** *)

#implmnt
{a:type}
isAVL<a>(xs) =
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
|
tree_nil
((*void*)) => 0
|
tree_cons
(xs1, _, xs3) =>
let
val h1 = auxlst(xs1)
val h3 = auxlst(xs3)
in//let
if
abs(h1-h3) <= 1
then 1 + max(h1, h3) else $raise NotAVL()
end
)
//
} (* end of [isAVL] *)

(* ****** ****** *)

val t0 = tree_nil()
val t1 = tree_cons(t0, 1, t0)
val t2 = tree_cons(t0, 1, t1)
val t3 = tree_cons(t0, 1, t2)

(* ****** ****** *)

val ans1 = isAVL(t1)
val ans2 = isAVL(t2)
val ans3 = isAVL(t3)

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

(* end of [ATS3-Xanadu/srcgen1/xats2js/srcgen1/TEST/prelude_isAVL.dats] *)
