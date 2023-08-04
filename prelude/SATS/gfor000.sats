(* ****** ****** *)
(*
** For forint-loops
*)
(* ****** ****** *)
//
datatype
range1(a:type) =
|
RANGE1 of (a, a, sint)
//
(* ****** ****** *)
//
fun
<a:t0>
range1_make_arg2
(s1: a, f2: a): range1(a)
fun
<a:t0>
range1_make_arg3
(s1: a, f2: a, d3: sint): range1(a)
//
#symload
range1 with range1_make_arg2
#symload
range1 with range1_make_arg3
//
(* ****** ****** *)
//
fun
<n1:i0>
g_x1forint(n1: int(n1)): void
fun
<n1:i0>
x1forint$work(i1: nintlt(n1)): void
//
(* ****** ****** *)
//
fun
<n1:i0
,n2:i0>
g_x2forint
( n1: int(n1), n2: int(n2)): void
fun
<n1:i0
,n2:i0>
x2forint$work
( i1: nintlt(n1), i2: nintlt(n2)): void
//
(* ****** ****** *)
//
fun
<n1:i0
,n2:i0
,n3:i0>
g_x3forint
( n1: int(n1)
, n2: int(n2), n3: int(n3)): void
fun
<n1:i0
,n2:i0
,n3:i0>
x3forint$work
( i1: nintlt(n1)
, i2: nintlt(n2), i3: nintlt(n3)): void
//
(* ****** ****** *)
//
fun
<x0:t0>
<r0:vt>
range1_foldl
(xs: range1(x0), r0: r0): (r0)
fun
<x0:t0>
range1_forall(range1(x0)): bool
fun
<x0:t0>
range1_foreach(range1(x0)): void
//
(* ****** ****** *)
//
fun
<x0:t0>
range1_listize(range1(x0)): list_vt(x0)
fun
<x0:t0>
range1_strmize(range1(x0)): strm_vt(x0)
//
fun
<x0:t0>
range1_rlistize(range1(x0)): list_vt(x0)
fun
<x0:t0>
range1_rstrmize(range1(x0)): strm_vt(x0)
//
(* ****** ****** *)
//
#symload foldl with range1_foldl of 1000
//
#symload forall with range1_forall of 1000
#symload foreach with range1_foreach of 1000
//
#symload listize with range1_listize of 1000
#symload strmize with range1_strmize of 1000
//
#symload rlistize with range1_rlistize of 1000
#symload rstrmize with range1_rstrmize of 1000
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gfor000.sats] *)
