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
//
#include
"prelude/HATS/prelude_dats.hats"
#include
"prelude/HATS/prelude_CM_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload ref
with a0rf_make_1val of 1000
//
(* ****** ****** *)
//
val A0 = ref(0)
val () =
prints("A0(", type(A0), ") = ", A0, "\n")
//
(* ****** ****** *)
//
val x0 = get(A0)
val () =
prints("x0(", type(x0), ") = ", x0, "\n")
//
val () = set(A0, 10)
val () =
prints("A0(", type(A0), ") = ", A0, "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_TEST_CATS_CM_test01_a0rf000.dats] *)
(***********************************************************************)
