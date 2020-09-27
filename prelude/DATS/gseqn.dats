(* ****** ****** *)
//
(*
#staload
"./../SATS/gseqn.sats"
*)
//
(* ****** ****** *)

#staload
"prelude/SATS/gseqn.sats"
#staload
UN =
"prelude/SATS/unsafe.sats"

(* ****** ****** *)

impltmp
<xs><x0><ln>
gseqn_nilq(xs) =
let
val ln =
gseqn_length
<xs><x0><ln>(xs) in ln = 0
end // end of [gseqn_nilq]

(* ****** ****** *)

impltmp
<xs><x0><ln>
gseqn_consq(xs) =
bool_neg<>
(gseqn_nilq<xs><x0><ln>(xs))

(* ****** ****** *)

(* end of [gseqn.dats] *)
