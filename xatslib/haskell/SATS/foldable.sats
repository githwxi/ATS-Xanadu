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
cfr1(a1:t0,r0:vt) = (a1)-<cfr>r0
#typedef
cfr2(a1:t0,a2:t0,r0:vt) = (a1,a2)-<cfr>r0
(* ****** ****** *)
//
fun
<f0:
t0->t0>
<x0:t0>
<y0:t0>
foldr(cfr2(x0, y0, y0), y0, f0(x0)): y0
//
fun
<f0:
t0->t0>
<x0:t0>
<m0:t0>
foldMap(fx: cfr1(x0, m0), xs: f0(x0)): m0
//
(* ****** ****** *)

(* end of [ATS3_xatslib_haskell_foldable.sats] *)
