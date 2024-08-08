(* ****** ****** *)
(*
** for gras-sequences
*)
(* ****** ****** *)

#impltmp
<xs><x0>
gras_get$at
  (xs, i0) =
(
case+ opt of
| ~
optn_vt_nil() =>
gras_get$at$exn
<xs><x0>(xs, i0)//cont
| ~
optn_vt_cons(x0) => x0) where
{
val opt =
gras_get$at$opt<xs><x0>(xs, i0)
} (*where*) // end of [gras_get$at]

(* ****** ****** *)
(*
#impltmp
<xs><x0>
gras_rstrmize = gseq_rstrmize<xs><x0>
*)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_DATS_gras000.dats] *)
