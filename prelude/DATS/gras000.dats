(* ****** ****** *)
(*
** for gras-sequences
*)
(* ****** ****** *)

#impltmp
<xs><x0>
gras_get_at
  (xs, i0) =
(
case- opt of
| ~
optn_vt_cons(x0) => x0) where
{
val opt =
gras_get_at_opt<xs><x0>(xs, i0)
} (*where*) // end of [gras_get_at]

(* ****** ****** *)
//
#impltmp
<xs><x0>
gras_listize = gseq_listize<xs><x0>
#impltmp
<xs><x0>
gras_strmize = gseq_strmize<xs><x0>
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gras000.dats] *)
