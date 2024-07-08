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

fun
fact
(n0: int): int =
loop(0, 1)
where { #include"./fbody.dats" }

(* ****** ****** *)
//
val () =
( g_print("fact10 = ");
  g_print(fact(10)); g_print("\n") )
//
(* ****** ****** *)

(* end of [ATS3-Xanadu/srcgen1/xats2js/srcgen1/TEST/prelude_fact2.dats] *)
