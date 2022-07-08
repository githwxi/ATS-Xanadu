(* ****** ****** *)
(*
HX-2022-07-08:
Fri Jul  8 11:06:54 EDT 2022
*)
(* ****** ****** *)
(*
class Functor f where
fmap :: (a -> b) -> (f a -> f b)
*)
(* ****** ****** *)
//
#staload
"./../SATS/functor.sats"
//
(* ****** ****** *)
#impltmp
{x0:t0
,y0:t0}
fmap
<optn><x0,y0>
(     fx     ) =
let
#typedef xs = optn(x0)
#typedef ys = optn(y0)
in//let
lam(xs) =>
gseq_map_cfr1<xs><x0><ys><y0>(xs, fx)
end (*let*) // end of [ fmap<optn><x0><y0>(fx) ]
(* ****** ****** *)
#impltmp
{x0:t0
,y0:t0}
fmap
<list><x0,y0>
(     fx     ) =
let
#typedef xs = list(x0)
#typedef ys = list(y0)
in//let
lam(xs) =>
gseq_map_cfr1<xs><x0><ys><y0>(xs, fx)
end (*let*) // end of [ fmap<list><x0><y0>(fx) ]
(* ****** ****** *)
#impltmp
{x0:t0
,y0:t0}
fmap
<strm><x0,y0>
(     fx     ) =
let
#typedef xs = strm(x0)
#typedef ys = strm(y0)
in//let
lam(xs) =>
gseq_map_cfr1<xs><x0><ys><y0>(xs, fx)
end (*let*) // end of [ fmap<strm><x0><y0>(fx) ]
(* ****** ****** *)

(* end of [ATS3_xatslib_haskell_functor.dats] *)
