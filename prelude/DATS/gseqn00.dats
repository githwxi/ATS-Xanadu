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

#impltmp
<xs><x0><ln>
gseqn_nilq(xs) =
let
val ln =
gseqn_length
<xs><x0><ln>(xs) in ln = 0
endlet // end of [gseqn_nilq]

(* ****** ****** *)

#impltmp
<xs><x0><ln>
gseqn_consq(xs) =
bool_neg<>
(gseqn_nilq<xs><x0><ln>(xs))

(* ****** ****** *)
//
#impltmp
<xs><x0><ln>
gseqn_unlist(xs) =
gseqn_unlist_vt
<xs><x0><ln>(list_copy_vt<x0>(xs))
//
#impltmp
<xs><x0><ln>
gseqn_unrlist(xs) =
gseqn_unrlist_vt
<xs><x0><ln>(list_copy_vt<x0>(xs))
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gseqn00.dats] *)
