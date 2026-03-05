(* ****** ****** *)
(*
HX-2026-03-01:
For testing xsyncpy!
Sun Mar  1 02:12:30 PM EST 2026
*)
(* ****** ****** *)
(* ****** ****** *)
#include
"prelude/HATS/prelude_dats.hats"
(* ****** ****** *)
#include
"prelude/HATS/prelude_JS_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
fun
acker
(m: nint)
(n: nint): nint =
if m = 0 then n+1
else if n = 0 then acker (m-1) 1 else acker (m-1) (acker m (n-1))
////
(* ****** ****** *)
//
fun
foo(x, y, z) =
(
bar2(z)) where
{
fun bar1(a) = x + a
and bar2(b) =
let
val () = g_void(x) in y + bar1(b)
end
}
//
(*
fun
foo(x, y, z) =
(
bar2(z; x, y))
where
{
fun bar1(a; x) = x + a
and bar2(b; x, y) = y + bar1(b; x)
}
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_TEST_test07_xsyncpy.dats] *)
(***********************************************************************)
