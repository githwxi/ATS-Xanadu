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
(* ****** ****** *)
//
#impltmp
g_print
<unit>(ut) = strn_print("unit")
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
s1wap_cbrf
(xx: &(x0, x0)): void =
let
val tt = xx.0 in
(
  xx.0 := xx.1; xx.1 := tt )
end//let//end-of-[s1wap_cbrf(xx)]
//
(* ****** ****** *)
//
fun
<x0:vt>
s11wap_cbrf
( x_xx
: &(x0,(x0, x0))): void =
let
val tt = (x_xx.1).0 in
(
(x_xx.1).0
:=
(x_xx.1).1; (x_xx.1).1 := tt )
end//let//end-of-[s11wap_cbrf(x_xx)]
//
(* ****** ****** *)
//
fun
<x0:vt>
s2wap_cbrf
(x1: &x0, x2: &x0): void =
let
val tt = x1 in x1 := x2; x2 := tt
end//let//end-of-[s2wap_cbrf(x1,x2)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_TEST_test04_xsyncpy.dats] *)
(***********************************************************************)
