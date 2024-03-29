(* ****** ****** *)
(*
HX-2022-07-08:
Fri Jul  8 11:07:31 EDT 2022
*)
(* ****** ****** *)
(*
class Foldable t where
foldr   ::
(a -> b -> b) -> b -> t a -> b
foldMap ::
Monoid m => (a -> m) -> t a -> m
*)
(* ****** ****** *)
#typedef
c1fr(a1:t0,r0:vt) = (a1)-<cfr>r0
#typedef
c2fr(a1:t0,a2:t0,r0:vt) = (a1,a2)-<cfr>r0
(* ****** ****** *)
//
fun
<f0:
t0->t0>
<m0:t0>
fold(xs: f0(m0)): m0
//
fun
<f0:
t0->t0>
<x0:t0>
<r0:t0>
foldr(c2fr(x0, r0, r0), r0, f0(x0)): r0
//
fun
<f0:
t0->t0>
<x0:t0>
<m0:t0>
foldMap(fx: c1fr(x0, m0), xs: f0(x0)): m0
//
(* ****** ****** *)

(* end of [ATS3_xatslib_haskell_foldable.sats] *)
