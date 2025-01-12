(* ****** ****** *)
(* ****** ****** *)

fun
fact1(n: sint): sint =
if n >= 1 then n * fact1(n-1) else 1

(* ****** ****** *)
(* ****** ****** *)

fun
fact2(n: sint): sint =
let
#typedef x0 = sint
#typedef r0 = sint
in//let
nint_folditm$f2un<r0>
(n, 1, lam(r: r0, i: x0) => r*(i+1))
end//let

(* ****** ****** *)
(* ****** ****** *)

fun
fact3(n: sint): sint =
(
  loop(0, 1) ) where
{
fun loop(i, r) =
if i < n then loop(i+1, r*(i+1)) else r
}

(* ****** ****** *)
(* ****** ****** *)

fun
fact4(n: sint): sint =
gseq_folditm0
<xs><x0>< r0 >
(nint_strmize(n), 1(*r*)) where
{
#typedef x0 = sint
#typedef r0 = sint
#vwtpdef xs = strm_vt(x0)
#impltmp
folditm$fopr0<sint><sint>(r, x) = r * (x+1)
}

(* ****** ****** *)
(* ****** ****** *)

(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS-Xanadu/PGROUND/proj001@250109/srcgen1/DATS/misc001.dats] *)
