(* ****** ****** *)
(*
HX-2025-09-28:
For testing xsyncpy!
Sun Sep 28 03:27:13 PM EDT 2025
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
<x0:vt>
identity0
(x0: x0): x0 = x0
fun
<x0:vt>
identity1
(x0: !x0): x0 = x0
fun
<x0:vt>
identity2
(x0: !x0): x0 =
if true then x0 else x0
//
fun
<x0:vt>
identity3
(x0: !x0): x0 =
let
val x1 = x0
in//let
if true then x1 else x1
end//let//end-of-[identity3]
//
fun
<x0:vt>
identity4
(x0: !x0 >> x0): x0 = identity3(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
duplicity0
(x0: x0): (x0, x0) = (x0, x0)
fun
<x0:vt>
duplicity1 // HX: well-typed!
(x0: x0): (x0, x0) = (g_copy(x0), x0)
fun
<x0:vt>
duplicity2 // HX: well-typed, too!
(x0: x0): (x0, x0) = (x0, g_copy(x0))
fun
<x0:vt>
duplicity3
(x0: !x0): (x0, x0) = (g_copy(x0), g_copy(x0))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_TEST_test03_xsyncpy.dats] *)
(***********************************************************************)
