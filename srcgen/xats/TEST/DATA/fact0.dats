(* ****** ****** *)

(*
#staload
"prelude/DATS/gnum.dats"
#staload
"prelude/DATS/gord.dats"
#staload
"prelude/DATS/gint.dats"
*)

(* ****** ****** *)

val
fact10 =
fact(10) where
{
fun
fact(x: int) =
if x >= 1 then x * fact(x-1) else 1
} (* end-of-val *)

(* ****** ****** *)

(* end of [fact0.dats] *)
