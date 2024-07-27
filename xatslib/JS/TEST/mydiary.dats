(* ****** ****** *)
(*
HX-2024-07-21:
For testing xatslib/JS!
*)
(* ****** ****** *)
(*
HX-2024-07-21:
Sun 21 Jul 2024 11:06:11 PM EDT
*)
//
#staload "./../SATS/Array.sats"
#staload _ =
(*TEMP*) "./../DATS/Array.dats"
//
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
val xs = listize(An)
//
val () = prints("xs = ", xs, '\n')
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
