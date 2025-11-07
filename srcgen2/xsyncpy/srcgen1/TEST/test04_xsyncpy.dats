(* ****** ****** *)
(*
HX-2025-10-31:
For testing xsyncpy!
Fri Oct 31 02:17:03 AM EDT 2025
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
local
in//local
val xyz = 1
val xyz = 2
end // local

val abc = xyz

////
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a:t0 }
g_copy<a>(x0) = x0
//
#impltmp
{ a:vt }
g_copy<a>(x0) = x0
//
(* ****** ****** *)
////
(* ****** ****** *)
//
//
#impltmp
bool_neg<>(tf) =
if tf then false else true
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_TEST_test04_xsyncpy.dats] *)
(***********************************************************************)
