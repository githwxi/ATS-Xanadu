(* ****** ****** *)
(*
** HX-2020-02:
** for unsafe functions
*)
(* ****** ****** *)

#staload
UN =
"prelude/SATS/unsafe.sats"

(* ****** ****** *)
//
impltmp
<a>(*tmp*)
$UN.p2tr_get
(p0) = $eval(p0)
impltmp
<a>(*tmp*)
$UN.p2tr_set
(p0, x0) = $eval(p0) := x0
//
impltmp
<a>(*tmp*)
$UN.p2tr_ret
(p0, x0) =
let
val x0 = $UN.delinear(x0) in ()
end
//
(* ****** ****** *)

(* end of [unsafe.dats] *)
