(* ****** ****** *)
(*
HX-2024-11-30:
For testing xats2js!
*)
(* ****** ****** *)
(* ****** ****** *)
#staload _ =
"prelude/DATS/gdbg000.dats"
(* ****** ****** *)
(* ****** ****** *)
#include
"prelude/HATS/prelude_dats.hats"
(* ****** ****** *)
#include
"prelude/HATS/prelude_JS_dats.hats"
(* ****** ****** *)
(*
#include
"prelude/HATS/prelude_NODE_dats.hats"
*)
(* ****** ****** *)
(* ****** ****** *)
fun
fact2
(n: sint): sint =
let
#typedef x0 = sint
#typedef r0 = sint
in//let
folditm
(n, 1, lam(r: r0, i: x0) => r*(i+1))
end//let//end-of-[fact2(n)]
(* ****** ****** *)
////
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
val () = the_print_store_log( (*void*) )
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_TEST_testxx_mydebug.dats] *)
(***********************************************************************)
