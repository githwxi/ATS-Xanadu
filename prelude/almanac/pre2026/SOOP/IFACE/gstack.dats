(* ****** ****** *)
(* ****** ****** *)
#staload "./gxs.dats"
(* ****** ****** *)
(* ****** ****** *)
//
#absprop STACK(pf:pf)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
<pf:pf>
<xs:vt>
<x0:vt>
gstack_nilq1(pf | xs: !xs): bool
#extern
<pf:pf>
<xs:vt>
<x0:vt>
gstack_fullq1(pf | xs: !xs): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<xs:vt>
<x0:vt>
gstack_remove$btf1(xs: !xs): bool
//
#extern
fun
<xs:vt>
<x0:vt>
gstack_getout$old1(xs: !xs): (x0)
#extern
fun
<xs:vt>
<x0:vt>
gstack_getout$upt1(xs: !xs): luopt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<xs:vt>
<x0:vt>
gstack_insert$new1(!xs, ~x0): void
#extern
fun
<xs:vt>
<x0:vt>
gstack_insert$upt1(!xs, ~x0): luopt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< pf:pf >
< xs:vt >
< x0:vt >
gstack_getout$old1 = g2_getout$old1<STACK(pf)><xs><x0>
//
#impltmp
{ pf:pf }
{ xs:vt
, x0:vt }
g2_getout$upt1<STACK(pf)><xs><x0> = gstack_getout$upt1<pf><xs><x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< pf:pf >
< xs:vt >
< x0:vt >
gstack_insert$new1 = g2_insert$new1<STACK(pf)><xs><x0>
//
#impltmp
{ pf:pf }
{ xs:vt
, x0:vt }
g2_insert$upt1<STACK(pf)><xs><x0> = gstack_insert$upt1<pf><xs><x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU/prelude/almanac/pre2026/SOOP/FACE/gstack.dats] *)
(***********************************************************************)
(***********************************************************************)
