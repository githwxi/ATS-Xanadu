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
//
fun
<x0:vt>
mystrm_vt_sing
( x0
: x0 )
: strm_vt(x0) =
strm_vt_cons(x0, strm_vt_nil())
//
(* ****** ****** *)
(* ****** ****** *)
//
val xs =
mystrm_vt_sing(10)
val-
strmcon_vt_cons(x1, _) = !xs
val () = printsln("x1 = ", x1)
//
val fs =
mystrm_vt_sing
(*
<(sint)->sint>
*)
(
lam(x0: sint): sint => x0+1)
val-
strmcon_vt_cons(f1, _) = !fs
val () = printsln("f1(10) = ", f1(10))
//
val () = console_log(the_print_store_flush())
//
(* ****** ****** *)
(* ****** ****** *)
////
(* ****** ****** *)
//
val xs as
list_cons
( x1, _ ) = list_sing(1)
//
val-
list_cons(x2, _) = ( xs )
//
val (   ) =
(
  printsln( "x1 = ", x1 ) )
val (   ) =
(
  printsln( "x2 = ", x2 ) )
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
footmp
(x0: a): a = x0
//
fun
foofun
((*0*))
: sint = footmp<sint>(0)
//
val x0 = foofun()
val () = printsln("x0 = ", x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
val () = console_log(the_print_store_flush())
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_TEST_testxx_mydebug.dats] *)
(***********************************************************************)
