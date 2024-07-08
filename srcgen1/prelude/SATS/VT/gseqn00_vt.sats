(* ****** ****** *)
(*
** For glseqn-operations
*)
(* ****** ****** *)
//
(*
//
// HX-2020-07-04:
// Linear
// Sequences with length
//
*)
//
(* ****** ****** *)
//
fun
<xs:
i0->vt>
<x0:vt>
glseqn_nilq1
{ln:i0}(!xs(ln)): bool(ln=0)
//
fun
<xs:
i0->vt>
<x0:vt>
glseqn_consq1
{ln:i0}(!xs(ln)): bool(ln>0)
//
(* ****** ****** *)
//
fun
<xs:
i0->vt>
<x0:vt>
glseqn_head1
{ln:i0|ln>0}(xs: !xs(ln)): (x0)
fun
<xs:
i0->vt>
<x0:vt>
glseqn_last1
{ln:i0|ln>0}(xs: !xs(ln)): (x0)
//
fun
<xs:
i0->vt>
<x0:vt>
glseqn_tail0
{ln:i0|ln>0}(xs: ~xs(ln)): xs(ln-1)
//
(* ****** ****** *)

fun
<xs:
i0->vt>
<x0:vt>
glseqn_length0
  {ln:i0}(xs: ~xs(ln)): ( sint(ln) )
fun
<xs:
i0->vt>
<x0:vt>
glseqn_length1
  {ln:i0}(xs: !xs(ln)): ( sint(ln) )

(* ****** ****** *)
//
fun
<xs:
i0->vt>
<x0:vt>
<y0:vt>
glseqn_map0_list
  {ln:i0}(xs: ~xs(ln)): list_vt(y0,ln)
fun
<xs:
i0->vt>
<x0:vt>
<y0:vt>
glseqn_map0_rlist
  {ln:i0}(xs: ~xs(ln)): list_vt(y0,ln)
//
(* ****** ****** *)
//
// For gseqn-i-operations
//
(* ****** ****** *)
//
fun
<xs:
i0->vt>
<x0:vt>
<ys:
i0->vt>
<y0:vt>
<ln:i0>glseqn_imapn0(xs: ~xs(ln)): ys(ln)
fun
<xs:
i0->vt>
<x0:vt>
<ys:
i0->vt>
<y0:vt>
<ln:i0>glseqn_imapn1(xs: !xs(ln)): ys(ln)
//
(* ****** ****** *)
//
fun
<xs:
i0->vt>
<x0:vt>
<ln:i0>glseqn_iforalln0(xs: ~xs(ln)): bool
//
fun
<xs:
i0->vt>
<x0:vt>
<ln:i0>glseqn_iforeachn0(xs: ~xs(ln)): void
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gseqn00_vt.sats] *)
