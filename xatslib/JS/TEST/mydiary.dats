(* ****** ****** *)
(*
HX-2024-07-21:
For testing xatslib/JS!
*)
(* ****** ****** *)
(* ****** ****** *)
#staload
"prelude/SATS/gsyn000.sats"
(* ****** ****** *)
#staload _ =
"prelude/DATS/gsyn000.dats"
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-07-21:
Sun 21 Jul 2024 11:06:11 PM EDT
*)
//
#staload "xatslib/JS/SATS/Array.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#include
"srcgen1/prelude/HATS/prelude_dats.hats"
#include
"srcgen2/prelude/HATS/prelude_dats.hats"
(* ****** ****** *)
#staload _ = "xatslib/JS/DATS/Array00.dats"
#staload _ = "xatslib/JS/DATS/Array01.dats"
(* ****** ****** *)
#include
"srcgen1/prelude/HATS/CATS/JS/prelude_dats.hats"
(* ****** ****** *)
#staload _ =
"srcgen1/prelude/DATS/CATS/JS/Node/g_print.dats"
(* ****** ****** *)
(* ****** ****** *)
//
val A1 = jsarray(1)
val A2 = jsarray('1', '2')
val A3 = jsarray("1", "2", "3")
//
val An = jsarray_make_nval(10, -1(*init*))
//
val () = prints("An = ", An, '\n')
//
(*
val xs = listize(An)
val () = prints("xs = ", xs, '\n')
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
