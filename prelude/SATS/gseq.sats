(* ****** ****** *)
(*
** for g-sequences
*)
(* ****** ****** *)

fun
<xs:tflt
,x0:tflt>
g_forall(xs): bool

(* ****** ****** *)
//
fun
<xs:tflt
,x0:tflt>
g_streamize
  (xs: xs): stream_vt(x0)
//
(* ****** ****** *)

fun
<xs:tflt
,x0:tflt>
<y0:vtflt>
g_map_list(xs): list_vt(y0)

(* ****** ****** *)

fun
<xs:tflt
,x0:tflt>
<y0:vtflt>
g_maprev_list(xs): list_vt(y0)

(* ****** ****** *)

(* end of [gseq.sats] *)
