(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-09-18:
For FUN!
(yes, pun intended)
Wed Sep 18 02:07:22 PM EDT 2024
*)
(* ****** ****** *)
(* ****** ****** *)
//
#abstype
GFUN_type
(f0: t0
,x0: t0, y0: t0) <= f0
#sexpdef GFUN = GFUN_type
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
GFUN_s2join
( f0:
: GFUN(f0, x0, y0)
, g0:
: GFUN(g0, y0, z0))
: GFUN(gs2fun(f0,g0,x0,y0,z0),x0,z0)
fun
GFUN_p2join
( f0:
: GFUN(f0, x0, y0)
, g1:
: GFUN(f1, x1, y1))
: GFUN(gs2fun(f0,g1,x0,y0,x1,y1),(x0,x1),(y0,y1))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<f0:t0>
<x0:t0>
<y0:t0>
gfun_app(f0: f0, x0: x0): y0
//
fun
<f0:t0>
<x0:t0>
<y0:t0>
GFUN_app
(f0: GFUN(f0, x0, y0), x0: x0): y0
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<f0:t0>
<g0:t0>
<x0:t0>
<y0:t0>
<z0:t0>
gfun_s2app(f0: f0, g0: g0, x0: x0): z0
fun
<f0:t0>
<f1:t0>
<x0:t0>
<y0:t0>
<x1:t0>
<y1:t0>
gfun_p2app(f0: f0, f1: f1, x0: x0, x1: x1): (y0, y1)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<f0:t0>
<g0:t0>
<x0:t0>
<y0:t0>
<x0:t0>
gfun_s2app(f0, g0, x0) =
gfun_app<g0><y0>
(g0, gfun_app<f0><x0>(f0, x0))
//
#impltmp
<f0:t0>
<f1:t0>
<x0:t0><y0:t0>
<x1:t0><y1:t0>
gfun_p2app
(f0, f1, x0, x1) = @(y0, y1) where
{
val y0 = gfun_app<f0><x0><y0>(f0, x0)
and y1 = gfun_app<f1><x1><y1>(f1, x1) }
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_DATS_gfun000.dats] *)
(***********************************************************************)
