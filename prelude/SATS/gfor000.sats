(* ****** ****** *)
(*
** For forint-loops
*)
(* ****** ****** *)
//
datatype
range(a:type) =
|
RANGE3 of (a, a, sint)
//
(* ****** ****** *)
//
fun
<a:t0>
range_make_arg2
(s1: a, f2: a): range(a)
fun
<a:t0>
range_make_arg3
( s1: a
, f2: a, d3: sint): range(a)
//
#symload range with range_make_arg2
#symload range with range_make_arg3
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
range_foldl
(xs: range(x0), r0: r0): (r0)
fun
<x0:t0>
range_forall(range(x0)): bool
fun
<x0:t0>
range_foreach(range(x0)): void
//
fun
<x0:t0>
range_strmize(range(x0)): strm_vt(x0)
//
(* ****** ****** *)
//
#symload foldl with range_foldl of 0100
#symload forall with range_forall of 0100
#symload foreach with range_foreach of 0100
//
#symload strmize with range_strmize of 0100
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gfor000.sats] *)
