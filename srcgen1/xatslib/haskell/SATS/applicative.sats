(* ****** ****** *)
(*
HX-2022-07-08:
Sat Jul  9 10:23:44 EDT 2022
*)
(* ****** ****** *)
(*
class Applicative t where
pure   :: a -> f a
(<*>)  :: f (a -> b) -> f a -> f b
*)
(* ****** ****** *)
#infixl <*> of ++
(* ****** ****** *)
#typedef
c1fr(a1:t0,r0:vt) = (a1)-<cfr>r0
(* ****** ****** *)
//
fun
<f0:
t0->t0>
<x0:t0>
pure(x0: x0): f0(x0)
//
(* ****** ****** *)
//
fun
<f0:
t0->t0>
<x0:t0>
<m0:t0>
fappl(f0(c1fr(x0, m0)), f0(x0)): f0(m0)
//
fun
<f0:
t0->t0>
<x0:t0>
<m0:t0>
fappr(f0(x0), f0(c1fr(x0, m0))): f0(m0)
//
(* ****** ****** *)
//
(*
#symload <*> with fappl; #symload <*> with fappr
*)
//
(* ****** ****** *)

(* end of [ATS3_xatslib_haskell_applicative.sats] *)
