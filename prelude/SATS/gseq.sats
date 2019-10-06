(* ****** ****** *)
(*
** for g-sequences
*)
(* ****** ****** *)

fun
<x0:tflt
,xs:tflt>
gseq_forall(xs): bool
#symload
forall with gseq_forall

(* ****** ****** *)

fun
<x0:tflt
,xs:tflt>
gseq_foreach(xs): void
#symload
foreach with gseq_foreach

(* ****** ****** *)
//
fun
<x0:tflt
,xs:tflt>
gseq_listize
  (xs: xs): list_vt(x0)
#symload
listize with gseq_listize
//
fun
<x0:tflt
,xs:tflt>
gseq_streamize
  (xs: xs): stream_vt(x0)
#symload
streamize with gseq_streamize
//
(* ****** ****** *)
//
(*
gseq_map: map$fopr
gseq_maprev: map$fopr
*)
//
fun
<x0:tflt
,xs:tflt>
<y0:vtflt>
gseq_map_list
  (xs: xs): list_vt(y0)
#symload
map_list with gseq_map_list
fun
<x0:tflt
,xs:tflt>
<y0:vtflt>
gseq_maprev_list
  (xs: xs): list_vt(y0)
#symload
maprev_list with gseq_maprev_list

(* ****** ****** *)
//
(*
gseq_foldl: foldl$fopr
gseq_foldr: foldr$fopr
*)
//
fun
<x0:tflt
,xs:tflt>
<r0:vtflt>
gseq_foldl(xs, r0): r0
fun
<x0:tflt
,xs:tflt>
<r0:vtflt>
gseq_foldr(xs, r0): r0
//
#symload foldl with gseq_foldl
#symload foldr with gseq_foldr
//
(* ****** ****** *)
//
fun
<x0:tflt,xs:tflt>gseq_add(xs): x0
fun
<x0:tflt,xs:tflt>gseq_mul(xs): x0
//
(* ****** ****** *)

(* end of [gseq.sats] *)
