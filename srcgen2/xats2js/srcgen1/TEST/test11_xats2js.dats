(* ****** ****** *)
(* ****** ****** *)
(*
HX-2026-08-08:
Sat Aug  8:
10:47:19 AM EDT 2026
*)
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"prelude/HATS/prelude_dats.hats"
#include
"prelude/HATS/prelude_JS_dats.hats"
#include
"prelude/HATS/prelude_NODE_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
isevn(n: nint): bool =
if n <= 0 then true else isodd(n-1)
and
isodd(n: nint): bool =
if n <= 0 then false else isevn(n-1)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun my_isevn(n: nint) = isevn<>(n)
fun my_isodd(n: nint) = isodd<>(n)
//
(* ****** ****** *)
(* ****** ****** *)
//
val () = printsln("my_isevn(10) = ", my_isevn(10))
val () = printsln("my_isodd(10) = ", my_isodd(10))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_TEST_test11_xats2js.dats] *)
(***********************************************************************)
