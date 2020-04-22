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
impltmp
<x0,xs>
glseq_uncons_exn
  (xs) =
if
glseq_nilq1<x0,xs>(xs)
then let
val
() = g_free<xs>(xs)
in
$raise SubscriptExn()
end // end of [then]
else
glseq_uncons_raw<x0,xs>(xs)
//
impltmp
<x0,xs>
glseq_uncons_opt
  (xs) =
if
glseq_nilq1<x0,xs>(xs)
then
optn_none((*void*))
else
optn_some
(glseq_uncons_raw<x0,xs>(xs))
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
//
impltmp
<x0,xs>
glseq_forall0
  (xs) =
stream_vt_forall0<x0>
(glseq_streamize<x0,xs>(xs))
//
(* ****** ****** *)
//
impltmp
<x0,xs>
glseq_foreach0(xs) =
let
val
test =
glseq_forall0<x0,xs>(xs) where
{
impltmp
forall0$test<x0>(x0) =
let
val () = foreach0$work<x0>(x0) in true
end
}
in
  // nothing
end // end of [glseq_foreach0/forall0]
//
(* ****** ****** *)

(* end of [gseq_vt.dats] *)
