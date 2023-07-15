(* ****** ****** *)
fun
fact1(x: sint): sint =
if x > 0 then x * fact1(x-1) else 1
(* ****** ****** *)

(* end of [DATA/myfact.hats] *)
