(*
HX-2022-07-09:
Sat Jul  9 10:43:23 EDT 2022
*)
(* ****** ****** *)
(*
traverse ::
Applicative f =>
(a -> f b) -> t a -> f (t b)
*)
(* ****** ****** *)
#typedef
cfr1(a1:t0,r0:vt) = (a1)-<cfr>r0
(* ****** ****** *)
//
(*
mapM ::
Monad m => (a -> m b) -> t a -> m (t b)
*)
//
fun
<f0:
t0->t0>
<f1:
t0->t0>
<x0:t0>
<y0:t0>
mapM
(cfr1(x0, f0(y0)), f1(x0)): f0(f1(y0))
//
(* ****** ****** *)
//
fun
<f0:
t0->t0>
<f1:
t0->t0>
<x0:t0>
<y0:t0>
traverse
(cfr1(x0, f0(y0)), f1(x0)): f0(f1(y0))
//
(* ****** ****** *)

(* end of [ATS3_xatslib_haskell_traversable.sats] *)
