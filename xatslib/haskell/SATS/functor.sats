(* ****** ****** *)
(*
HX-2022-07-08:
Fri Jul  8 11:07:31 EDT 2022
*)
(* ****** ****** *)
(*
class Functor f where
fmap :: (a -> b) -> (f a -> f b)
*)
(* ****** ****** *)
#typedef
cfr1
(a1:t0,r0:vt) = (a1)-<cfr>r0
(* ****** ****** *)
//
fun
<f0:
t0->t0>
<x0:t0
,y0:t0>
fmap(fx: cfr1(x0, y0)): cfr1(f0(x0), f0(y0))
//
(* ****** ****** *)

(* end of [ATS3_xatslib_haskell_functor.sats] *)
