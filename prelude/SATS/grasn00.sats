(* ****** ****** *)
(*
** For grasn-operations
*)
(* ****** ****** *)
//
(*
//
// HX-2020-07-04:
// Sequences with length
//
*)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ln:i0>
grasn_nilq(xs): bool(ln=0)
//
fun
<xs:t0>
<x0:t0>
<ln:i0>
grasn_consq(xs): bool(ln>0)
//
(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
<ln:i0>
grasn_head{ln>0}(xs): (x0)

(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
<ln:i0>
<tl:t0>
grasn_tail{ln>0}(xs): (tl)

(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
<ln:i0>
grasn_last{ln>0}(xs): (x0)

(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
<ln:i0>
grasn_length(xs: xs): sint(ln)

(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
<ln:i0>
grasn_get_at
(xs: xs, i0: nintlt(ln)): (x0)

(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
<ln:i0>
grasn_listize(xs): list_vt(x0,ln)
fun
<xs:t0>
<x0:t0>
<ln:i0>
grasn_rlistize(xs): list_vt(x0,ln)

(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
<ln:i0>
grasn_unlist(xs:list(x0, ln)):(xs)
fun
<xs:t0>
<x0:t0>
<ln:i0>
grasn_unrlist(xs:list(x0, ln)):(xs)

(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:t0>
<ln:i0>
grasn_map_arrn(xs:xs): a1ptr(y0,ln)
fun
<xs:t0>
<x0:t0>
<y0:t0>
<ln:i0>
grasn_map_rarrn(xs:xs): a1ptr(y0,ln)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:t0>
<ln:i0>
grasn_map_list(xs:xs): list_vt(y0,ln)
fun
<xs:t0>
<x0:t0>
<y0:t0>
<ln:i0>
grasn_map_rlist(xs:xs): list_vt(y0,ln)
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_grasn00.sats] *)
