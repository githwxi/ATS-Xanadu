(* ****** ****** *)
(*
HX-2026-03-23:
For testing xats2xc!
*)
(* ****** ****** *)
(* ****** ****** *)
#include
"prelude\
/HATS/prelude_dats.hats"
(* ****** ****** *)
#include
"prelude\
/HATS/prelude_XC_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#typedef
sintsint_t = @(sint, sint)
#vwtpdef
sintsint_x = #(?sint, ?!sint)
//
(* ****** ****** *)
(* ****** ****** *)
//
val N1 = 10
val N2 = N1 + N1
val N3 = N1 * N2
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fact1(x: sint): sint =
if x >= 1 then x * fact1(x-1) else 1
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fact2
(n: sint): sint =
(
loop(0, 1)) where
{
fun
loop
(i: sint, r: sint): sint =
if//if
(i < n) then loop(i+1, (i+1)*r) else r
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern0
fun
factloop
(n: nint, r: nint): nint
#implfun
factloop(n, r) =
if//if
(n > 0) then factloop(n-1, n*r) else r
////
val () =
prints("\
factloop(10, 1) = ", factloop(10, 1), "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3-XANADU/srcgen2/xats2xc/srcgen1/TEST/test01_xats2xc.dats] *)
(***********************************************************************)
(***********************************************************************)
