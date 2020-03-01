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

(* end of [unsafe.dats] *)
