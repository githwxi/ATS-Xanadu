(* ****** ****** *)
(*
** For glseq-operations
*)
(* ****** ****** *)

fun
<xs:vt>
<x0:vt>
glseq_nil(): xs
fun
<xs:vt>
<x0:vt>
glseq_cons(x0, xs): xs

(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
glseq_nilq(!xs): bool
fun
<xs:vt>
<x0:vt>
glseq_consq(!xs): bool
//
(*
fun
<xs:vt>
<x0:vt>
glseq_nilq1(!xs): bool
fun
<xs:vt>
<x0:vt>
glseq_consq1(!xs): bool
*)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
glseq_copy(!xs): (xs)
fun
<xs:vt>
<x0:vt>
glseq_free(~xs): void
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
glseq_head_raw(!xs): x0
fun
<xs:vt>
<x0:vt>
glseq_tail_raw(~xs): xs
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
glseq_uncons_raw
  (xs: &xs >> xs): x0
fun
<xs:vt>
<x0:vt>
glseq_uncons_exn
  (xs: &xs >> xs): x0
fun
<xs:vt>
<x0:vt>
glseq_uncons_opt
  (xs: &xs >> xs): optn_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
glseq_length0(~xs): nint
fun
<xs:vt>
<x0:vt>
glseq_length1(!xs): nint
//
(* ****** ****** *)

fun
<xs:vt>
<x0:vt>
glseq_drop0
(xs: ~xs, n0: sint): xs
fun
<xs:vt>
<x0:vt>
glseq_drop1
(xs: !xs, n0: sint): xs

(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
glseq_listize0(~xs): list_vt(x0)
fun
<xs:vt>
<x0:vt>
glseq_listize1(!xs): list_vt(x0)
//
fun
<xs:vt>
<x0:vt>
glseq_rlistize0(~xs): list_vt(x0)
fun
<xs:vt>
<x0:vt>
glseq_rlistize1(!xs): list_vt(x0)
//
fun
<xs:vt>
<x0:vt>
glseq_streamize(~xs): stream_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:t0>
glseq_unlist(xs: list(x0)): (xs)
fun
<xs:vt>
<x0:vt>
glseq_unlist_vt(list_vt(x0)): (xs)
//
fun
<xs:vt>
<x0:t0>
glseq_unrlist(xs: list(x0)): (xs)
fun
<xs:vt>
<x0:vt>
glseq_unrlist_vt(list_vt(x0)): (xs)
//
fun
<xs:vt>
<x0:vt>
glseq_unstream_vt(stream_vt(x0)): (xs)
//
(* ****** ****** *)
//
(*
glseq_foldl: foldl$fopr
glseq_foldr: foldr$fopr
*)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
glseq_foldl0(~xs, r0): r0
fun
<xs:vt>
<x0:vt>
<r0:vt>
glseq_foldl1(!xs, r0): r0
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
glseq_foldr0(~xs, r0): r0
fun
<xs:vt>
<x0:vt>
<r0:vt>
glseq_foldr1(!xs, r0): r0
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
glseq_exists0(~xs): bool
fun
<xs:vt>
<x0:vt>
glseq_exists1(!xs): bool
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
glseq_forall0(~xs): bool
fun
<xs:vt>
<x0:vt>
glseq_forall1(!xs): bool
//
fun
<xs:vt>
<x0:vt>
glseq_foreach0(~xs): void
fun
<xs:vt>
<x0:vt>
glseq_foreach1(!xs): void
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
glseq_append00
(xs1: xs, xs2: xs): xs
//
fun
<xs:vt>
<x0:vt>
glseq_reverse0(xs: xs): xs
fun
<xs:vt>
<x0:vt>
glseq_rappend00(xs1: xs, xs2: xs): xs
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
glseq_map0_list(~xs): list_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
glseq_map1_list(!xs): list_vt(y0)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
glseq_map0_rlist(~xs): list_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
glseq_map1_rlist(!xs): list_vt(y0)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
glseq_map0_stream(~xs): stream_vt(y0)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
glseq_mapopt0_stream(~xs): stream_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
glseq_maplst0_stream(~xs): stream_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
glseq_mapstrm0_stream(~xs): stream_vt(y0)
//
(* ****** ****** *)
//
// For gseq-i-operations
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
glseq_iexists0(~xs): bool
fun
<xs:vt>
<x0:vt>
glseq_iexists1(!xs): bool
//
fun
<xs:vt>
<x0:vt>
glseq_iforall0(~xs): bool
fun
<xs:vt>
<x0:vt>
glseq_iforall1(!xs): bool
//
fun
<xs:vt>
<x0:vt>
glseq_iforeach0(~xs): void
fun
<xs:vt>
<x0:vt>
glseq_iforeach1(!xs): void
//
(* ****** ****** *)
//
// HX-2020-05-31:
// symbol overloading for gseq_vt
//
(* ****** ****** *)

#symload nilq with glseq_nilq of 0100
#symload consq with glseq_consq of 0100

(* ****** ****** *)

#symload length0 with glseq_length0 of 0100
#symload length1 with glseq_length1 of 0100

(* ****** ****** *)
//
(*
#symload listize with glseq_listize0 of 0100
#symload rlistize with glseq_rlistize0 of 0100
*)
//
#symload listize0 with glseq_listize0 of 0100
#symload rlistize0 with glseq_rlistize0 of 0100
//
#symload streamize with glseq_streamize of 0100
//
(* ****** ****** *)
//
#symload map0_list with glseq_map0_list of 0100
#symload map1_list with glseq_map1_list of 0100
//
#symload map0_rlist with glseq_map0_rlist of 0100
#symload map1_rlist with glseq_map1_rlist of 0100
//
#symload map0_stream with glseq_map0_stream of 0100
(*
#symload map1_stream with glseq_map1_stream of 0100
*)
//
(* ****** ****** *)

(* end of [gseq_vt.sats] *)
