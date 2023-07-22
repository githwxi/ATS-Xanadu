(* ****** ****** *)
#staload
"prelude/SATS/gflt000.sats"
(* ****** ****** *)

fun
fact1(x: dflt) =
if x > 0
then x * fact1(x-1) else 1.0

(* ****** ****** *)

(* end of [DATA/mygflt.dats] *)
