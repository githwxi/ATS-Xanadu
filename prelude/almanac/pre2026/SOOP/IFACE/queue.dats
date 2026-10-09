(* ****** ****** *)
(* ****** ****** *)
//
#absprop QUEUE(pf:pf)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<pf:pf>
<xs:vt>
<x0:vt>
f$queue_nilq1(xs: !xs): bool
#extern
fun
<pf:pf>
<xs:vt>
<x0:vt>
f$queue_fullq1(xs: !xs): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<pf:pf>
<xs:vt>
<x0:vt>
f$queue_remove$btf1(xs: !xs): bool
//
#extern
fun
<pf:pf>
<xs:vt>
<x0:vt>
f$queue_getout$old1(xs: !xs): (x0)
#extern
fun
<pf:pf>
<xs:vt>
<x0:vt>
f$queue_getout$upt1(xs: !xs): luopt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<pf:pf>
<xs:vt>
<x0:vt>
f$queue_insert$new1(!xs, ~x0): void
#extern
fun
<pf:pf>
<xs:vt>
<x0:vt>
f$queue_insert$upt1(!xs, ~x0): luopt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU/prelude/almanac/pre2026/SOOP/IFACE/queue.dats] *)
(***********************************************************************)
(***********************************************************************)
