(* ****** ****** *)
//
(*
HX-2022-01-22:
Please note that
the name [n0] is environmental,
which is declared in fact2.dats.
*)
//
fun
loop
(i1: int, r2: int): int =
if
i1 < n0
then loop(i1+1, (i1+1)*r2) else r2
//
(* ****** ****** *)

(* end of [fbody.dats] *)
