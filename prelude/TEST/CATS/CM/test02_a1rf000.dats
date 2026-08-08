(* ****** ****** *)
(*
HX-2026-08-07:
For testing prelude/CM!
Fri Aug  7 06:22:31 PM EDT 2026
*)
(* ****** ****** *)
(* ****** ****** *)
#staload _ =
"prelude/DATS/gdbg000.dats"
(* ****** ****** *)
(* ****** ****** *)
#symload
array with a1rf_make_ncpy
#symload
array with a1rf_make_nfun
(* ****** ****** *)
(* ****** ****** *)
#include
"prelude/HATS/prelude_dats.hats"
#include
"prelude/HATS/prelude_CM_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
val A0 =
array(10, 1)
val () =
(
  printsln("A0 = ", A0))
where
{
#impltmp
{ x0:t0 }
gasq_length
<a1rf(x0)><x0>(A) = ( 10 ) }
//
(* ****** ****** *)
(* ****** ****** *)
//
val N = 10
val A1 =
array
(N, lam(i:sint) => (i+1))
val () =
printsln
("A1(", type(A1), ") = ", A1)
where
{
#impltmp
{ x0:t0 }
gasq_length<a1rf(x0)><x0>(A1) = (N)
}
//
(* ****** ****** *)
//
fun
fact(n: nint) =
GSEQ
(
array
(n, lam(i:sint) => i+1)).prod()
where
{
#impltmp
{ x0:t0 }
gasq_length<a1rf(x0)><x0>(A) = n }
//
val () =
(
  printsln("fact(10) = ", fact(10)))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_TEST_CATS_CM_test02_a1rf000.dats] *)
(***********************************************************************)
