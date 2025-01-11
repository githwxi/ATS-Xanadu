(* ****** ****** *)
(* ****** ****** *)
(*
HX-2025-01-10:
Fri Jan 10 10:58:08 PM EST 2025
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
val () =
prints("Hello from [test01.dats]\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
#include "./../../../DATS/misc001.dats"
//
(* ****** ****** *)
(* ****** ****** *)
//
val () = prints("fact1(10) = ", fact1(10), "\n")
val () = prints("fact2(10) = ", fact2(10), "\n")
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS-XANADU/PGROUND/proj001@250109/srcgen1/TEST/CATS/JS/test01_misc001.dats] *)
