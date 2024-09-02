(* ****** ****** *)
(*
HX-2024-08-09:
For testing xatslib/JS!
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
#include
"srcgen2\
/prelude/HATS/prelude_NODE_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#symload arrsz
with a1sz_make_nfun of 1000
//
(* ****** ****** *)
//
val N = 10
val A0 =
arrsz
(N, lam(i:sint) => (i+1))
val () =
prints
("A0(", type(A0), ") = ", A0, "\n")
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
prints("fact(10) = ", fact(10), "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_TEST_CATS_JS_test03_a1sz000.dats] *)
