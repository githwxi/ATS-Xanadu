(* ****** ****** *)
(*
** For gras-operations
*)
(* ****** ****** *)
// HX: random-access-seq
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gras_get_at
(xs: xs, i0: nint): x0
fun
<xs:t0>
<x0:t0>
gras_get_at$exn
(xs: xs, i0: nint): x0
//
fun
<xs:t0>
<x0:t0>
gras_get_at_opt
( xs: xs
, i0: nint ): optn_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gras_listize(xs): list_vt(x0)
fun
<xs:t0>
<x0:t0>
gras_strmize(xs): strm_vt(x0)
//
fun
<xs:t0>
<x0:t0>
gras_rlistize(xs): list_vt(x0)
fun
<xs:t0>
<x0:t0>
gras_rstrmize(xs): strm_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gras_bsearch
(xs:xs, x0:x0): optn_vt((nint,x0))
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gras000.sats] *)
