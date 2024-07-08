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
fun
fact1(x) =
if
x > 0
then
x*fact1(x-1) else 1
withtype ( int ) -> int
//
(* ****** ****** *)
//
val
fact1_10 = fact1(10)
val () =
(
g_print
("fact1_10 = ");
g_print(fact1_10); g_print("\n"))
//
(* ****** ****** *)
//
fun
fact2
{n}(x) =
if
x > 0
then
x*fact2(x-1) else 1
withtype {n:int}(int(n)) -> int
//
(* ****** ****** *)
//
val
fact2_10 = fact2(10)
val () =
(
g_print
("fact2_10 = ");
g_print(fact2_10); g_print("\n"))
//
(* ****** ****** *)

(* end of [ATS3-Xanadu/srcgen1/xats2js/srcgen1/TEST/prelude_wtype.dats] *)
