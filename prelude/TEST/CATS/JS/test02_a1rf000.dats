(* ****** ****** *)
(*
HX-2024-08-09:
For testing prelude/JS!
*)
(* ****** ****** *)
(* ****** ****** *)
#staload _ =
"prelude/DATS/gdbg000.dats"
(* ****** ****** *)
(* ****** ****** *)
#include
"srcgen2\
/prelude/HATS/prelude_dats.hats"
(* ****** ****** *)
#include
"srcgen2\
/prelude/HATS/prelude_JS_dats.hats"
(* ****** ****** *)
(*
#include
"srcgen2\
/prelude/HATS/prelude_NODE_dats.hats"
*)
(* ****** ****** *)
(* ****** ****** *)
//
val A0 =
array(10, 1)
val () =
(
prints("A0 = ", A0, "\n"))
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
prints
("A1(",type(A1),") = ",A1,"\n")
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
prints("fact(10) = ", fact(10), "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
val () = console_log(the_print_store_flush())
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_TEST_CATS_JS_test02_a1rf000.dats] *)
