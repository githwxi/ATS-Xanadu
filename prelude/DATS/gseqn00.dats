(* ****** ****** *)
//
(*
#staload
"./../SATS/gseqn.sats"
*)
//
(* ****** ****** *)
#staload
"prelude/SATS/gseqn00.sats"
(* ****** ****** *)
//
#staload UN =
"prelude/SATS/unsafex.sats"
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseqn_nilq(xs) =
(
  ln = 0 ) where
{ val
  ln = gseqn_length<xs><x0>(xs) }
(*where*) // end of [gseqn_nilq(xs)]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseqn_consq(xs) =
(
  bool_neg<>(gseqn_nilq<xs><x0>(xs)))
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseqn_listize(xs) =
strq_vt_listize0(gseqn_strqize<xs><x0>(xs))
//
#impltmp
<xs><x0>
gseqn_rlistize(xs) =
list_vt_reverse0(gseqn_listize<xs><x0>(xs))
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseqn_unlist(xs) =
gseqn_unlist_vt<xs><x0>(list_copy_vt<x0>(xs))
//
#impltmp
<xs><x0>
gseqn_unrlist(xs) =
gseqn_unrlist_vt<xs><x0>(list_copy_vt<x0>(xs))
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gseqn00.dats] *)
