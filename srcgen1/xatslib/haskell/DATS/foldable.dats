(* ****** ****** *)
(*
HX-2022-07-08:
Fri Jul  8 11:06:54 EDT 2022
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
//
#staload
"./../SATS/monoid0.sats"
#staload
"./../SATS/foldable.sats"
//
(* ****** ****** *)
//
#impltmp
<f0:
t0->t0>
<m0:t0>
fold(xs) =
foldr<f0><m0>
(
lam(x0, r0) =>
mappend<m0>(x0,r0),mempty<m0>(),xs)
//
(* ****** ****** *)
//
#impltmp
<f0:
t0->t0>
<x0:t0>
<m0:t0>
foldMap(fx, xs) =
foldr<f0><x0><m0>
(
lam(x0, r0) =>
mappend<m0>(fx(x0),r0),mempty<m0>(),xs)
//
(* ****** ****** *)

#impltmp
{x0:t0}
{r0:t0}
foldr<list><x0><r0>(fx, r0, xs) =
(
  list_foldr<x0><r0>(xs, r0)) where
{
  #impltmp
  foldr$fopr<x0><r0>(x0, r0) = fx(x0, r0)
} (*where*) // end-of-[ foldr(fx, r0, xs) ]

(* ****** ****** *)

(* end of [ATS3_xatslib_haskell_foldable.dats] *)
