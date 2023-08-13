(* ****** ****** *)
(*
Hongwei Xi
email: gmhwxi@gmail.com
Sun Aug 13 12:32:58 EDT 2023
*)
(* ****** ****** *)
(*
** for combined gseq-operations
*)
(* ****** ****** *)
#staload
"./../SATS/gseq001.sats"
(* ****** ****** *)
//
#staload UN =
"prelude/SATS/unsafex.sats"
//
(* ****** ****** *)
//
#impltmp
<xz><xs><x0>
gseq_concat_forall
  (xss) =
gseq_forall<xz><xs>(xss) where
{
#impltmp
forall$test<xs> = gseq_forall<xs><x0>
}
//where//end-of-[gseq_concat_forall(...)]
//
(* ****** ****** *)
//
#impltmp
<xz><xs><x0>
gseq_concat_foreach
  (xss) =
gseq_foreach<xz><xs>(xss) where
{
#impltmp
foreach$work<xs> = gseq_foreach<xs><x0>
}
//where//end-of-[gseq_concat_foreach(...)]
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gseq001.dats] *)
