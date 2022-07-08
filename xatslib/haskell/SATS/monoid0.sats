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

fun<m:t0> mempty(): m
fun<m:t0> mappend(m, m): m
fun<m:t0> mconcat(list(m)): m

(* ****** ****** *)

(* end of [ATS3_xatslib_haskell_monoid0.sats] *)
