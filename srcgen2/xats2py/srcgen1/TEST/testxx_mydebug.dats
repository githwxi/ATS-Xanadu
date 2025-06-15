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
//
#include
"srcgen2\
/prelude/HATS/prelude_PY_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
val xs as
list_cons
( x1, _ ) = list_sing(1)
//
val-list_cons(x2, _) = xs
//
val (   ) = printsln("x1 = ", x1)
val (   ) = printsln("x2 = ", x2)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
footmp(x: a): a = x
//
fun
foofun((*0*)): sint = footmp<sint>(0)
//
val x0 = foofun()
val () = printsln("x0 = ", x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_TEST_testxx_mydebug.dats] *)
(***********************************************************************)
