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
//
#include
"prelude/HATS/prelude_dats.hats"
#include
"prelude/HATS/prelude_PY_dats.hats"
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
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_TEST_CATS_PY_test01_a0rf000.dats] *)
