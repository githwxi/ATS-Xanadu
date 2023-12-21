(* ****** ****** *)
(*
#staload
"prelude/SATS/gseqn00.sats"
*)
(* ****** ****** *)
//
#staload UN =
"prelude/SATS/unsafex.sats"
//
(* ****** ****** *)
//
#impltmp
<xs>
<x0><ln>
gseqn_nilq(xs) =
(
  ln = 0 ) where
{ val
  ln =
  gseqn_length<xs><x0><ln>(xs) }
(*where*) // end of [gseqn_nilq(xs)]
//
(* ****** ****** *)
//
#impltmp
<xs>
<x0><ln>
gseqn_consq(xs) =
(
  bool_neg<>
  (gseqn_nilq<xs><x0><ln>(xs)))
//
(* ****** ****** *)
//
#impltmp
<xs>
<x0><ln>
gseqn_listize(xs) =
strq_vt_listize0<x0>
(gseqn_strqize<xs><x0><ln>(xs))
//
#impltmp
<xs>
<x0><ln>
gseqn_rlistize(xs) =
list_vt_reverse0<x0>
(gseqn_listize<xs><x0><ln>(xs))
//
(* ****** ****** *)
//
(*
//
// HX-2023-12-23:
// This does not seem to be useful!
//
#impltmp
<xs>
<x0><ln>
gseqn_unlist(xs) =
gseqn_unlist_vt
< xs >< x0 >< ln >(list_copy_vt<x0>(xs))
*)
//
(*
//
// HX-2023-12-23:
// This does not seem to be useful!
//
#impltmp
<xs>
<x0><ln>
gseqn_unrlist(xs) =
gseqn_unrlist_vt
< xs >< x0 >< ln >(list_copy_vt<x0>(xs))
*)
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gseqn00.dats] *)
