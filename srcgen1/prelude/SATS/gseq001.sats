(* ****** ****** *)
(*
Hongwei Xi
email: gmhwxi@gmail.com
Sun Aug 13 12:28:16 EDT 2023
*)
(* ****** ****** *)
(*
** For combined gseq-operations
*)
(* ****** ****** *)
//
fun
<xz:t0>
<xs:t0>
<x0:t0>
gseq_concat_forall
( xss : xz ): bool // xz=[xs]
fun
<xz:t0>
<xs:t0>
<x0:t0>
gseq_concat_foreach
( xss : xz ): void // xz=[xs]
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_uncons_forall(xs): bool
fun
<xs:t0>
<x0:t0>
gseq_uncons_foreach(xs): void
//
fun
<xs:t0>
<x0:t0>
gseq_uncons_strmize
( xs : xs ): strm_vt(@(x0, xs))
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_2choose_forall(xs): bool
fun
<xs:t0>
<x0:t0>
gseq_2choose_foreach(xs): void
//
fun
<xs:t0>
<x0:t0>
gseq_2choose_strmize
( xs : xs ): strm_vt(@(x0, x0))
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gseq001.sats] *)
