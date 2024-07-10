(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-07-10:
These are newly designed
function interfaces ATS3
*)
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<r0:vt>
foldlft$fopr(r0, x0): (r0)
fun
<x0:t0>
<r0:vt>
foldall$fopr(r0, x0): (bool, r0)
//
(* ****** ****** *)
//
fun
<x0:t0>
<r0:vt>
rfoldlft$fopr(x0, r0): (r0)
fun
<x0:t0>
<r0:vt>
rfoldall$fopr(x0, r0): (bool, r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<ys:vt>
g_make_lstrm
(xs: strm_vt(x0)): (ys)
fun
<x0:vt>
<ys:vt>
g_make_lstrq
(xs: strq_vt(x0)): (ys)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:vt>
gseq_filter_ares(xs: xs): (ys)
fun
<xs:t0>
<x0:t0>
gseq_filter_self(xs: xs): (xs)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
gseq_filter0_ares(xs: ~xs): (ys)
fun
<xs:vt>
<x0:vt>
gseq_filter0_self(xs: ~xs): (xs)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
gseq_filter1_ares(xs: !xs): (ys)
fun
<xs:vt>
<x0:vt>
gseq_filter1_self(xs: !xs): (xs)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
