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
"prelude/HATS/prelude_dats.hats"
(* ****** ****** *)
//
#include
"prelude/HATS/prelude_JS_dats.hats"
#include
"prelude/HATS/prelude_NODE_dats.hats"
//
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
val () = printsln("fact1(10) = ", fact1(10))
val () = printsln("fact2(10) = ", fact2(10))
val () = printsln("fact3(10) = ", fact3(10))
val () = printsln("fact4(10) = ", fact4(10))
val () = printsln("fact5(10) = ", fact5(10))
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS-XANADU/PGROUND/proj001@250109/srcgen1/TEST/CATS/JS/test01_misc001.dats] *)
