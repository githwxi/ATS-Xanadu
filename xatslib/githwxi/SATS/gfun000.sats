(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-09-18:
For FUN!
(yes, pun intended)
Wed Sep 18 02:07:22 PM EDT 2024
HX-2026-01-23:
Fri Jan 23 11:24:52 PM EST 2026
*)
(* ****** ****** *)
(* ****** ****** *)
//
#abstype
GFUN_type
( f0: t0
, x0: t0
, y0: t0) <= f0
#sexpdef GFUN = GFUN_type
//
(* ****** ****** *)
//
#abstype
s2fun_type
(f0:t0,g0:t0) <= (f0, g0)
#abstype
p2fun_type
(f0:t0,g0:t0) <= (f0, g0)
//
#sexpdef s2fun = s2fun_type
#sexpdef p2fun = p2fun_type
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<f0:t0>
<x0:t0>
<y0:t0>
gfun_app(f0: f0, x0: x0): y0
//
#extern
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
(*
HX: For sequential app
*)
#extern
fun
<f0:t0>
<g0:t0>
<x0:t0>
<y0:t0>
<z0:t0>
gfun_s2app(f0: f0, g0: g0, x0: x0): z0
//
#extern
fun
<f0:t0>
<g0:t0>
<x0:t0>
<y0:t0>
<z0:t0>
GFUN_app
(f0: GFUN(s2fun(f0,g0), x0, z0), x0: x0): z0
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX: For app in parallel
*)
#extern
fun
<f1:t0>
<f2:t0>
<x1:t0><y1:t0>
<x2:t0><y2:t0>
gfun_p2app
(f1: f1, f2: f2, x1: x1, x2: x2): (y1, y2)
//
#extern
fun
<f1:t0>
<f2:t0>
<x1:t0><y1:t0>
<x2:t0><y2:t0>
GFUN_app
( f0
: GFUN
( p2fun(f1, f2)
, (x1, x2), (y1, y2)), xx: (x1, x2)): (y1, y2)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_SATS_gfun000.sats] *)
(***********************************************************************)
