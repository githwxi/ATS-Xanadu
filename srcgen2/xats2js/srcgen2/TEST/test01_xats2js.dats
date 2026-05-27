(* ****** ****** *)
(*
HX-2026-04-29:
For testing xats2js!
Wed Apr 29 06:59:33 PM EDT 2026
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
fact1(n: nint): nint =
(
  auxlp(0, 1)) where
{
fun
auxlp
(i: nint, r: nint): nint =
(
if
(i < n) then
auxlp(i+1, (i+1)*r) else (r))
}
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fact2(n: nint): nint =
(
  auxlp(0, 1)) where
{
fun
auxlp
(i: nint, r: nint): nint =
(
case+
(i >= n) of
|true => (r)
|false => auxlp(i+1, (i+1)*r))
}
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fact3
(x: sint): sint =
(
case+ x of _
when(x>0) => x*fact3(x-1) | _ => 1)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fact4
(x: sint): sint =
(
auxlp(x, r); r) where
{
//
var x: sint = x
var r: sint = 1
//
fun
auxlp
(x: &sint, r: &sint): void =
(
if (x > 0) then (
r := x * r; x := x - 1; auxlp(x, r)))
//
}(*where*)//end-of-[fact4(x:sint):sint]
//
(* ****** ****** *)
(* ****** ****** *)
//
val () =
prints("\
fact1(10) = ", fact1(10), "\n")
//
(* ****** ****** *)
//
val () =
prints("\
fact2(10) = ", fact2(10), "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
val () =
prints("\
fact3(10) = ", fact3(10), "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
val () =
prints("\
fact4(10) = ", fact4(10), "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
val () = the_print_store_log( (*void*) )
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen2_TEST_test01_xats2js.dats] *)
(***********************************************************************)
