(* ****** ****** *)
(*
** For glseq-operations
*)
(* ****** ****** *)

fun
<x0:vt
,xs:vt>
glseq_nil(): xs
fun
<x0:vt
,xs:vt>
glseq_cons(x0, xs): xs

(* ****** ****** *)
//
fun
<x0:vt
,xs:vt>
glseq_nilq(!xs): bool
fun
<x0:vt
,xs:vt>
glseq_consq(!xs): bool
//
(*
fun
<x0:vt
,xs:vt>
glseq_is_nil1(!xs): bool
fun
<x0:vt
,xs:vt>
glseq_is_cons1(!xs): bool
*)
//
(* ****** ****** *)
//
fun
<x0:vt
,xs:vt>
glseq_uncons_raw
  (xs: &xs >> xs): x0
fun
<x0:vt
,xs:vt>
glseq_uncons_exn
  (xs: &xs >> xs): x0
fun
<x0:vt
,xs:vt>
glseq_uncons_opt
  (xs: &xs >> xs): optn_vt(x0)
//
(* ****** ****** *)
//
fun
<x0:vt
,xs:vt>
glseq_length0(~xs): nint
fun
<x0:vt
,xs:vt>
glseq_length1(!xs): nint
//
(* ****** ****** *)

fun
<x0:vt
,xs:vt>
glseq_drop0
(xs: ~xs, n0: sint): xs
fun
<x0:vt
,xs:vt>
glseq_drop1
(xs: !xs, n0: sint): xs

(* ****** ****** *)
//
fun
<x0:vt
,xs:vt>
glseq_listize0(~xs): list_vt(x0)
fun
<x0:vt
,xs:vt>
glseq_rlistize0(~xs): list_vt(x0)
//
fun
<x0:vt
,xs:vt>
glseq_streamize(~xs): stream_vt(x0)
//
(* ****** ****** *)
//
(*
glseq_foldl: foldl$fopr
glseq_foldr: foldr$fopr
*)
//
fun
<x0:vt
,xs:vt>
<r0:vt>
glseq_foldl0(~xs, r0): r0
fun
<x0:vt
,xs:vt>
<r0:vt>
glseq_foldl1(!xs, r0): r0
//
fun
<x0:vt
,xs:vt>
<r0:vt>
glseq_foldr0(~xs, r0): r0
fun
<x0:vt
,xs:vt>
<r0:vt>
glseq_foldr1(!xs, r0): r0
//
(* ****** ****** *)
//
fun
<x0:vt
,xs:vt>
glseq_forall0(~xs): bool
fun
<x0:vt
,xs:vt>
glseq_forall1(!xs): bool
//
fun
<x0:vt
,xs:vt>
glseq_foreach0(~xs): void
fun
<x0:vt
,xs:vt>
glseq_foreach1(!xs): void
//
(* ****** ****** *)
//
fun
<x0:vt
,xs:vt>
<y0:vt>
glseq_map0_list(~xs): list_vt(y0)
fun
<x0:vt
,xs:vt>
<y0:vt>
glseq_map1_list(!xs): list_vt(y0)
//
(* ****** ****** *)
//
// For gseq-i-operations
//
(* ****** ****** *)
//
fun
<x0:vt
,xs:vt>
glseq_iexists0(~xs): bool
fun
<x0:vt
,xs:vt>
glseq_iexists1(!xs): bool
//
fun
<x0:vt
,xs:vt>
glseq_iforall0(~xs): bool
fun
<x0:vt
,xs:vt>
glseq_iforall1(!xs): bool
//
fun
<x0:vt
,xs:vt>
glseq_iforeach0(~xs): void
fun
<x0:vt
,xs:vt>
glseq_iforeach1(!xs): void
//
(* ****** ****** *)
//
fun
<x0:vt
,xs:vt>
<y0:vt>
glseq_map0_rlist(~xs): list_vt(y0)
fun
<x0:vt
,xs:vt>
<y0:vt>
glseq_map1_rlist(!xs): list_vt(y0)
//
(* ****** ****** *)
//
fun
<x0:vt
,xs:vt>
<y0:vt>
glseq_map0_stream(~xs): stream_vt(y0)
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
#symload map0_list with gseq_map0_list of 0100
#symload map1_list with gseq_map1_list of 0100
//
#symload map0_rlist with gseq_map0_rlist of 0100
#symload map1_rlist with gseq_map1_rlist of 0100
//
#symload map0_stream with gseq_map0_stream of 0100
(*
#symload map1_stream with gseq_map1_stream of 0100
*)
//
(* ****** ****** *)

(* end of [gseq_vt.sats] *)
