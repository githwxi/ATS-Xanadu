(* ****** ****** *)
(* ****** ****** *)
(*
HX-2026-09-22:
For testing prelude/RB!
Tue Sep 22 12:30:52 AM EDT 2026
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
"./../../../..\
/prelude/HATS/prelude_RB_dats.hats"
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
(*)
end of [
ATS3-XANADU/
srcgen2/xats2rb/srcgen1/prelude/TEST/CATS/RB/test08_optn000.dats] *)
(***********************************************************************)
(***********************************************************************)
