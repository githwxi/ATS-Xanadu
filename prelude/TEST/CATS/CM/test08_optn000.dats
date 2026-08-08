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
val ns = optn_cons(10)
//
val () =
prints("ns = ", ns, "\n")
val () = prints
("|ns| = ", length(ns), "\n")
val () = prints
("head(ns) = ", head(ns), "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_TEST_CATS_CM_test08_optn000.dats] *)
(***********************************************************************)
