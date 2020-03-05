(* ****** ****** *)
(*
** HX-2020-02:
** for unsafe functions
*)
(* ****** ****** *)

#staload
// UN =
"prelude/SATS/unsafe.sats"

(* ****** ****** *)
//
impltmp
<a>(*tmp*)
p2tr_get(p0) = $eval(p0)
impltmp
<a>(*tmp*)
p2tr_set
  (p0, x0) = $eval(p0) := x0
//
(* ****** ****** *)
//
impltmp
<x0,xs>
gseq_head(xs) =
let
var xs = xs in gseq_uncons(xs)
end // end of [gseq_head]
impltmp
<x0,xs>
gseq_tail(xs) =
let
var xs = xs
val x0 = gseq_uncons(xs) in xs
end // end of [gseq_tail]
//
(* ****** ****** *)

(* end of [unsafe.dats] *)
