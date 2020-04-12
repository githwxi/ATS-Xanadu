(* ****** ****** *)
(*
** for gl-sequences
*)
(* ****** ****** *)

#staload
UN =
"prelude/SATS/unsafe.sats"

(* ****** ****** *)
//
(*
impltmp
{x0:t0
;xs:t0}
glseq_length0<x0,xs> = gseq_length<x0,xs>
impltmp
{x0:t0
;xs:t0}
glseq_length1<x0,xs> = gseq_length<x0,xs>
*)
//
impltmp
<x0,xs>
glseq_length0(xs) =
let
val
len = glseq_length1(xs) in g_free<xs>(xs); len
end // end of [glseq_length0]
//
(* ****** ****** *)

(* end of [gseq_vt.dats] *)
