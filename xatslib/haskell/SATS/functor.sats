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
c1fr
(a1:t0,r0:vt) = (a1)-<cfr>r0
(* ****** ****** *)
//
fun
<f0:
t0->t0>
<x0:t0>
<y0:t0>
fmap(c1fr(x0, y0), f0(x0)): f0(y0)
//
// This is not supported as '$' is
// #symload <$> with fmap // special in ATS
//
(* ****** ****** *)

(* end of [ATS3_xatslib_haskell_functor.sats] *)
