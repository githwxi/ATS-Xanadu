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
<xs:
i0->t0>
<x0:t0>
grasn_nilq
{ln:i0}(xs(ln)): bool(ln=0)
//
fun
<xs:
i0->t0>
<x0:t0>
grasn_consq
{ln:i0}(xs(ln)): bool(ln>0)
//
(* ****** ****** *)
//
fun
<xs:
i0->t0>
<x0:t0>
grasn_head
{ln:i0|ln>0}(xs: xs(ln)): (x0)
//
fun
<xs:
i0->t0>
<x0:t0>
grasn_last
{ln:i0|ln>0}(xs: xs(ln)): (x0)
//
(* ****** ****** *)

fun
<xs:
i0->t0>
<x0:t0>
grasn_length
{ln:i0}(xs: xs(ln)): sint(ln)

(* ****** ****** *)

fun
<xs:
i0->t0>
<x0:t0>
grasn_get_at
{ln:i0}(xs(ln),nintlt(ln)): (x0)

(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_SATS_grasn00.sats] *)
