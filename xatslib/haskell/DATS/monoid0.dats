(* ****** ****** *)
(*
HX-2022-70-08:
Fri Jul  8 09:27:17 EDT 2022
*)
(* ****** ****** *)
(*
class Monoid m where
mempty  :: m
mappend :: m -> m -> m
mconcat :: [m] -> m
mconcat = foldr mappend mempty
*)
(* ****** ****** *)
//
#staload
"./../SATS/monoid0.sats"
//
(* ****** ****** *)

#impltmp
<m0:t0>
mconcat
(  xs  ) =
list_foldr<m0><m0>
(xs, mempty<m0>()) where
{
#impltmp
foldr$fopr<m0><m0> = mappend<m0>
} (*where*) // end of [mconcat(xs)]

(* ****** ****** *)
//
#impltmp
{x0:t0}
mempty
<list(x0)>
((*void*)) = list_nil(*void*)
//
#impltmp
{x0:t0}
mappend<list(x0)> = list_append<x0>
//
(* ****** ****** *)

(* end of [ATS3_xatslib_haskell_monoid0.dats] *)
