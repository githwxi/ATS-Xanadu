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
#sexpdef
listn(a:t0) =
(
  lam(n:i0) => list(a, n))
#sexpdef
strqn(a:t0) =
(
  lam(n:i0) => strq(a, n))
//
(* ****** ****** *)
//
fun
<xs:
i0->t0>
<x0:t0>
gseqn_nilq
{ln:i0}(xs(ln)): bool(ln=0)
//
fun
<xs:
i0->t0>
<x0:t0>
gseqn_consq
{ln:i0}(xs(ln)): bool(ln>0)
//
(* ****** ****** *)
//
fun
<xs:
i0->t0>
<x0:t0>
gseqn_head
{ln:i0|ln>0}(xs: xs(ln)): (x0)
//
fun
<xs:
i0->t0>
<x0:t0>
gseqn_last
{ln:i0|ln>0}(xs: xs(ln)): (x0)
//
(* ****** ****** *)

fun
<xs:
i0->t0>
<x0:t0>
gseqn_tail
{ln:i0|ln>0}(xs: xs(ln)): xs(ln-1)

(* ****** ****** *)

fun
<xs:
i0->t0>
<x0:t0>
gseqn_length
{ln:i0}(xs: xs(ln)): sint(ln)

(* ****** ****** *)

fun
<xs:
i0->t0>
<x0:t0>
gseqn_get_at
{ln:i0}(xs(ln),nintlt(ln)): (x0)

(* ****** ****** *)
//
fun
<xs:
i0->t0>
<x0:t0>
gseqn_strqize
{ln:i0}(xs:xs(ln)): strq_vt(x0,ln)
//
fun
<xs:
i0->t0>
<x0:t0>
gseqn_listize
{ln:i0}(xs:xs(ln)): list_vt(x0,ln)
fun
<xs:
i0->t0>
<x0:t0>
gseqn_rlistize
{ln:i0}(xs:xs(ln)): list_vt(x0,ln)
//
(* ****** ****** *)

fun
<xs:
i0->t0>
<x0:t0>
gseqn_unlist
{ln:i0}(xs:list(x0,ln)): (xs(ln))
fun
<xs:
i0->t0>
<x0:t0>
gseqn_unrlist
{ln:i0}(xs:list(x0,ln)): (xs(ln))

(* ****** ****** *)
//
fun
<xs:
i0->t0>
<x0:t0>
gseqn_unlist_vt
  {ln:i0}
  (xs: ~list_vt(x0,ln)): (xs(ln))
fun
<xs:
i0->t0>
<x0:t0>
gseqn_unrlist_vt
  {ln:i0}
  (xs: ~list_vt(x0,ln)): (xs(ln))
//
(* ****** ****** *)
//
fun
<xs:
i0->t0>
<x0:t0>
<y0:t0>
gseqn_map_arrn
  {ln:i0}(xs:xs(ln)): a1ptr(y0,ln)
fun
<xs:
i0->t0>
<x0:t0>
<y0:t0>
gseqn_map_rarrn
  {ln:i0}(xs:xs(ln)): a1ptr(y0,ln)
//
(* ****** ****** *)
//
fun
<xs:
i0->t0>
<x0:t0>
<y0:t0>
gseqn_map_list
  {ln:i0}(xs:xs(ln)): list_vt(y0,ln)
fun
<xs:
i0->t0>
<x0:t0>
<y0:t0>
gseqn_map_rlist
  {ln:i0}(xs:xs(ln)): list_vt(y0,ln)
//
(* ****** ****** *)
//
(*
HX-2020-07-04:
Is this interesting?!
*)
//
(*
//
fun
<xs:
i0->t0>
<x0:t0>
<rz:vt>
<ln:i0>
gseqn_foldln
  (xs: xs(ln), r0: rz(0)): (rz(ln))
*)
//
(* ****** ****** *)
//
// For gseqn-i-operations
//
(* ****** ****** *)
//
fun
<xs:
i0->t0>
<x0:t0>
<ln:i0>gseqn_iforalln(xs: xs(ln)): bool
//
fun
<xs:
i0->t0>
<x0:t0>
<ln:i0>gseqn_iforeachn(xs: xs(ln)): void
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gseqn00.sats] *)
