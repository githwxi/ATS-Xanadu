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
glseq_nilq1(!xs): bool
fun
<x0:vt
,xs:vt>
glseq_consq1(!xs): bool
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
glseq_streamize0(~xs): stream_vt(x0)
//
(* ****** ****** *)

(* end of [gseq_vt.sats] *)
