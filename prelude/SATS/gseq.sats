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

fun
<xs:tflt
,x0:tflt>
g_foreach(xs): void

(* ****** ****** *)
//
fun
<xs:tflt
,x0:tflt>
<r0:vtflt>
g_foldleft(xs, r0): r0
fun
<xs:tflt
,x0:tflt>
<r0:vtflt>
g_foldright(xs, r0): r0
//
#symload g_foldl with g_foldleft
#symload g_foldr with g_foldright
//
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
