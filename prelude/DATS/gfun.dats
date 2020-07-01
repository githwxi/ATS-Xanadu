(* ****** ****** *)
(*
** For function ops
*)
(* ****** ****** *)
//
(*
#staload
"./../SATS/gfun.sats"
*)
//
(* ****** ****** *)
//
impltmp
<a1>
gfun_not_fnp1
  (f0) =
lam(x1) => not(f0(x1))
impltmp
<a1>
gfun_not_cfr1
  (f0) =
lam(x1) => not(f0(x1))
//
(* ****** ****** *)

impltmp
<x0,xs>
gfun_memq_gseq(xs) =
lam(x0) =>
gseq_indexof<x0,xs>(xs, x0) >= 0

(* ****** ****** *)

(* end of [gfun.dats] *)
