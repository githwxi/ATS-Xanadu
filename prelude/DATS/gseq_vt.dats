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
(* ****** ****** *)
//
(*
impltmp
<x0,xs>
glseq_drop0(xs) =
let
val
res = glseq_drop1(xs) in g_free<xs>(xs); res
end // end of [glseq_drop0]
*)
//
(* ****** ****** *)
//
impltmp
<x0,xs>
glseq_listize0(xs) =
stream_vt_listize<x0>
(glseq_streamize0<x0,xs>(xs))
impltmp
<x0,xs>
glseq_rlistize0(xs) =
stream_vt_rlistize<x0>
(glseq_streamize0<x0,xs>(xs))
//
(* ****** ****** *)

(* end of [gseq_vt.dats] *)
