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

(* end of [ATS3/XANADU_prelude_gseqn00.dats] *)
