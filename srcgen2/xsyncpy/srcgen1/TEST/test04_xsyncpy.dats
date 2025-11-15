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
//
(*
#impltmp
{ a:t0 }
g_copy<a>(x0) = x0
*)
//
(*
#impltmp
{ a:vt }
g_copy<a>(x0) = x0
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
bool_neg<>(tf) =
if (tf)
then false else true
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
g_free<x0>(obj) = ( )
#impltmp
{ x0:t0 }
g_copy<x0>(obj) = obj
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<a:vt>
my_free(x0: a): (?a)
//
#impltmp
<a : vt>
my_free(x0) =
let
val
( ) = g_free(x0) in x0
end//let//end-of(my_free)
//
(* ****** ****** *)
////
(* ****** ****** *)
//
#impltmp
g_print
<unit>(ut) = strn_print("unit")
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_TEST_test04_xsyncpy.dats] *)
(***********************************************************************)
