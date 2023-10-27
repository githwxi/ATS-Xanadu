(* ****** ****** *)
#include
"./xats2js_test.hats"
(* ****** ****** *)
#extern
fun<> foo(): int
(* ****** ****** *)
#impltmp foo<>() = 0
#impltmp foo<>() = foo<>()
(* ****** ****** *)
val test = foo() // looping
(* ****** ****** *)

(* end of [ATS3/xatslib/TEST/test01_looping.dats] *)
