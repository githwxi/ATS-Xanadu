(* ****** ****** *)

fun
proj0(ci: @(char, sint)) = ci.0
fun
proj1(ci: @(char, sint)) = ci.1
fun
proj2(ci: @(char, sint)) = ci.2

(* ****** ****** *)

fun
proj3
(fi: @((sint) -> sint, sint)) = fi.0(123)

(* ****** ****** *)

(* end of [DATA/myt1up.dats] *)
