(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"srcgen2\
/prelude/HATS/prelude_dats.hats"
#include
"srcgen2\
/prelude/HATS/prelude_PY_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload sum0 with gseq_sum0
#symload prod0 with gseq_prod0
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-01-03:
More than 10 template layers!
*)
(* ****** ****** *)
(* ****** ****** *)
//
val fact =
fix f(x:nint): nint =>
(
if
(x > 0)
then x * f(x-1) else 1)
val (  ) =
prints
("fact(10) = ", fact(10), "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
nsum0_tail
  (x: sint): sint =
(
  sum0(tail0(nint_strmize(x+1))))
//
(* ****** ****** *)
//
fun
fact1_prod_tail
  (x: sint): sint =
(
  prod0(tail0(nint_strmize(x+1))))
//
(* ****** ****** *)
(* ****** ****** *)
//
val () = prints
("nsum0_tail(10)=",nsum0_tail(10),"\n")
val () = prints
("fact1_prod_tail(10)=",fact1_prod_tail(10),"\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xats2js_srcgen1_TEST_test08_xats2js.dats] *)
