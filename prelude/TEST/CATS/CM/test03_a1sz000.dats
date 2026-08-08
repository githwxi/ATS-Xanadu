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
#include
"prelude/HATS/prelude_dats.hats"
#include
"prelude/HATS/prelude_CM_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
val A0 =
arrsz(10, 1)
val () =
(
  printsln("A0 = ", A0))
//
(* ****** ****** *)
//
val N = 10
val A0 =
arrsz
(N, lam(i:sint) => (i+1))
val () =
printsln
("A0(", type(A0), ") = ", A0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fact(n: nint) =
GSEQ
(
arrsz
(n, lam(i:sint) => i+1)).prod()
//
val () =
printsln("fact(10) = ", fact(10))
//
(* ****** ****** *)
(* ****** ****** *)
//
val xs =
list
(10, lam(i:nint) => i*i)
val ys = a1sz_make_list(xs)
val () =
printsln("ys(", type(ys), ") = ", ys)
val () =
(
GSEQ(ys).foritm
  (lam(x) => print( x )); printsln())
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_TEST_CATS_CM_test03_a1sz000.dats] *)
(***********************************************************************)
