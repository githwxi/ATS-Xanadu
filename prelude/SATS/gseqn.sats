(* ****** ****** *)
(*
** For gseqn-operations
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
gseqn_nilq(xs): bool(ln=0)
//
fun
<xs:t0>
<x0:t0>
<ln:i0>
gseqn_consq(xs): bool(ln>0)
//
(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
<ln:i0>
gseqn_head{ln>0}(xs): (x0)

(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
<ln:i0>
<tl:t0>
gseqn_tail{ln>0}(xs): (tl)

(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
<ln:i0>
gseqn_last{ln>0}(xs): (x0)

(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
<ln:i0>
gseqn_length(xs): sint(ln)

(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
<ln:i0>
gseqn_get_at
(xs: xs, i0: nintlt(ln)): (x0)

(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
<ln:i0>
gseqn_listize(xs): list_vt(x0, ln)
fun
<xs:t0>
<x0:t0>
<ln:i0>
gseqn_rlistize(xs): list_vt(x0, ln)

(* ****** ****** *)

fun
<xs:t0>
<x0:t0>
<ln:i0>
gseqn_unlist(xs: list(x0, ln)): (xs)
fun
<xs:t0>
<x0:t0>
<ln:i0>
gseqn_unrlist(xs: list(x0, ln)): (xs)

(* ****** ****** *)

(* end of [gseqn.sats] *)
