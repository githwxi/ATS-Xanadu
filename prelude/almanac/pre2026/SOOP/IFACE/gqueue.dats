(* ****** ****** *)
(* ****** ****** *)
#staload "./../gxs.dats"
(* ****** ****** *)
(* ****** ****** *)
//
#absprop QUEUE(pf:pf)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
<pf:pf>
<xs:vt>
<x0:vt>
gqueue_fullq(pf | xs: !xs): bool
#extern
<pf:pf>
<xs:vt>
<x0:vt>
gqueue_emptyq(pf | xs: !xs): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<xs:vt>
<x0:vt>
gqueue_remove$btf1(xs: !xs): bool
//
#extern
fun
<xs:vt>
<x0:vt>
gqueue_getout$old1(xs: !xs): (x0)
#extern
fun
<xs:vt>
<x0:vt>
gqueue_getout$upt1(xs: !xs): luopt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<xs:vt>
<x0:vt>
gqueue_insert$new1(!xs, ~x0): void
#extern
fun
<xs:vt>
<x0:vt>
gqueue_insert$upt1(!xs, ~x0): luopt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< pf:pf >
< xs:vt >
< x0:vt >
gqueue_getout$old1 = gxs_getout$old1<QUEUE(pf)><xs><x0>
//
#impltmp
{ pf:pf }
{ xs:vt
, x0:vt }
gxs_getout$upt1<QUEUE(pf)><xs><x0> = gqueue_getout$upt1<pf><xs><x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< pf:pf >
< xs:vt >
< x0:vt >
gqueue_insert$new1 = gxs_insert$new1<QUEUE(pf)><xs><x0>
//
#impltmp
{ pf:pf }
{ xs:vt
, x0:vt }
gxs_insert$upt1<QUEUE(pf)><xs><x0> = gqueue_insert$upt1<pf><xs><x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU/prelude/almanac/pre2026/SOOP/IFACE/gqueue.dats] *)
(***********************************************************************)
(***********************************************************************)
