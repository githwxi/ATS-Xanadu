(* ****** ****** *)
(*
HX-2026-03-23:
For testing xats2cc!
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
val x = 1000
val y = ( x + x )
(* ****** ****** *)
(* ****** ****** *)
//
val foo =
lam(w:sint) =>
lam(z:sint) => w + x + y + z
//
val bar =
lam(w:sint) =>
fix f00
(z:sint): sint => f00(w+x+y+z)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fact(n: nint): nint =
(
  loop(0, 1)) where
{
fun
loop
(i: nint, r: nint): nint =
if (i >= n)
then (r) else
let
val i1 = i+1 in loop(i1, i1*r)
end//let
}
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fact(n: nint): nint =
(
  loop(0, 1)) where
{
val loop =
fix loop
(i: nint, r: nint): nint =>
if (i >= n)
then (r) else
let
val i = suc(i) in loop(i, i*r)
end//let
}
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
isevn(n: nint): bool =
if n = 0 then true else isodd(n-1)
and
isodd(n: nint): bool =
if n = 0 then false else isevn(n-1)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
fact(n0: nint): nint
#implfun
fact(n0) =
if(
n0 > 0)
then n0 * fact(n0-1) else 1
//
(* ****** ****** *)
//
#extern
fun fact2
(n0: nint, r0: nint): nint
#implfun
fact2(n0, r0) =
if(
n0 > 0)
then fact2(n0-1, n0*r0) else r0
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_TEST_test01_xats2cc.dats] *)
(***********************************************************************)
