(* ****** ****** *)
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
val fact = 
fix
f(x: sint): sint =>
if x > 0 then x * f(x-1) else 1
//
val (   ) = println("fact(10) = ", fact(10))
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATS2JS_TEST_JS_DATA_mytest11.dats] *)
