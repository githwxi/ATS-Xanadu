(* ****** ****** *)
(*
HX-2022-07-08:
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
(*
HX: for strn-monoid
Fri Jul  8 10:24:19 EDT 2022
*)
#impltmp
mempty<strn>() = ""
#impltmp
mappend<strn> = strn_append<>
//
(* ****** ****** *)
//
(*
HX: for list-monoid
Fri Jul  8 10:23:56 EDT 2022
*)
//
#impltmp
{x0:t0}
mempty<list(x0)>
(   (*void*)   ) = list_nil()
//
#impltmp
{x0:t0}
mappend<list(x0)> = list_append<x0>
//
(* ****** ****** *)
//
(*
HX: for strm-monoid
Fri Jul  8 10:23:56 EDT 2022
*)
//
#impltmp
{x0:t0}
mempty<strm(x0)>
(   (*void*)   ) = strm_nil<x0>()
//
#impltmp
{x0:t0}
mappend<strm(x0)> = strm_append<x0>
//
(* ****** ****** *)
//
(*
HX: for t0up2-monoid
Fri Jul  8 10:37:31 EDT 2022
*)
//
#impltmp
{m0:t0
,m1:t0}
mempty
<(m0,m1)>() = (mempty<m0>(), mempty<m1>())
#impltmp
{m0:t0
,m1:t0}
mappend
<(m0,m1)>(xx, yy) =
(mappend<m0>(xx.0,yy.0),mappend<m1>(xx.1,yy.1))
//
(* ****** ****** *)
//
(*
HX: for optn-monoid:
monoid(a) => monoid(optn(a))
Fri Jul  8 10:44:50 EDT 2022
*)
//
#impltmp
{x0:t0}
mempty<optn(x0)>
(   (*void*)   ) = optn_nil()
//
#impltmp
{x0:t0}
mappend<optn(x0)>(xs, ys) =
(
case+ xs of
|
optn_nil() => ys
|
optn_cons(x1) =>
(
case+ ys of
| optn_nil() => xs
| optn_cons(y1) =>
  optn_cons(mappend<x0>(x1, y1)))
) (*case*) // end of [mappend<optn(x0)>]
//
(* ****** ****** *)

(* end of [ATS3_xatslib_haskell_monoid0.dats] *)
