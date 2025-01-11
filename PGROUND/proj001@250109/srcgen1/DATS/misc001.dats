(* ****** ****** *)
(* ****** ****** *)

fun
fact1(n: sint): sint =
if n >= 1 then n * fact1(n-1) else 1

(* ****** ****** *)
(* ****** ****** *)

fun
fact2(n: sint): sint =
loop(0, 1) where {
  fun loop(i, r) =
  if i < n then loop(i+1, r*(i+1)) else r
}

(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS-Xanadu/PGROUND/proj001@250109/srcgen1/DATS/misc001.dats] *)
