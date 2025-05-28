(* ****** ****** *)
(*
HX-2025-04-27:
For testing prelude/PY!
*)
(* ****** ****** *)
(* ****** ****** *)
#staload _ =
"prelude/DATS/gdbg000.dats"
(* ****** ****** *)
(* ****** ****** *)
#include
"prelude/HATS/prelude_dats.hats"
#include
"prelude/HATS/prelude_PY_dats.hats"
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
gasz_length
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
gasz_length<a1rf(x0)><x0>(A1) = (N)
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
gasz_length<a1rf(x0)><x0>(A) = n }
//
val () =
(
  printsln("fact(10) = ", fact(10)))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_TEST_CATS_PY_test02_a1rf000.dats] *)
(***********************************************************************)
