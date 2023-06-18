(* ****** ****** *)
#staload "./myfact.dats"
(* ****** ****** *)
fun
fact21(x: sint): sint =
if x > 0 then x * fact2(x-1) else 1
(* ****** ****** *)

(* end of [DATA/myfact2.dats] *)
