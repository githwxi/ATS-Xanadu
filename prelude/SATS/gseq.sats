(* ****** ****** *)
(*
** for g-sequences
*)
(* ****** ****** *)

fun
<x0:tflt
,xs:tflt>
g_forall(xs): bool
#symload
forall with g_forall

(* ****** ****** *)

fun
<x0:tflt
,xs:tflt>
g_foreach(xs): void
#symload
foreach with g_foreach

(* ****** ****** *)
//
fun
<x0:tflt
,xs:tflt>
g_listize
  (x0: xs): list_vt(x0)
//
#symload
listize with g_listize
//
fun
<x0:tflt
,xs:tflt>
g_streamize
  (x0: xs): stream_vt(x0)
#symload
streamize with g_streamize
//
(* ****** ****** *)
//
fun
<x0:tflt
,xs:tflt>
<r0:vtflt>
g_foldleft(xs, r0): r0
fun
<x0:tflt
,xs:tflt>
<r0:vtflt>
g_foldright(xs, r0): r0
//
#symload
g_foldl with g_foldleft
#symload
g_foldr with g_foldright
//
(* ****** ****** *)

fun
<x0:tflt
,xs:tflt>
<y0:vtflt>
g_map_list
  (xs: xs): list_vt(y0)
#symload
map_list with g_map_list

(* ****** ****** *)

fun
<x0:tflt
,xs:tflt>
<y0:vtflt>
g_maprev_list
  (xs: xs): list_vt(y0)
#symload
maprev_list with g_maprev_list

(* ****** ****** *)

(* end of [gseq.sats] *)
