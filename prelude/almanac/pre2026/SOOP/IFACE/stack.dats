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
f$stack_nilq1(pf | xs: !xs): bool
#extern
<pf:pf>
<xs:vt>
<x0:vt>
f$stack_fullq1(pf | xs: !xs): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<xs:vt>
<x0:vt>
f$stack_remove$btf1(xs: !xs): bool
//
#extern
fun
<xs:vt>
<x0:vt>
f$stack_getout$old1(xs: !xs): (x0)
#extern
fun
<xs:vt>
<x0:vt>
f$stack_getout$upt1(xs: !xs): luopt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<xs:vt>
<x0:vt>
f$stack_insert$new1(!xs, ~x0): void
#extern
fun
<xs:vt>
<x0:vt>
f$stack_insert$upt1(!xs, ~x0): luopt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< pf:pf >
< xs:vt >
< x0:vt >
f$stack_getout$old1 = g2_getout$old1<STACK(pf)><xs><x0>
//
#impltmp
{ pf:pf }
{ xs:vt
, x0:vt }
g2_getout$upt1<STACK(pf)><xs><x0> = f$stack_getout$upt1<pf><xs><x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< pf:pf >
< xs:vt >
< x0:vt >
f$stack_insert$new1 = g2_insert$new1<STACK(pf)><xs><x0>
//
#impltmp
{ pf:pf }
{ xs:vt
, x0:vt }
g2_insert$upt1<STACK(pf)><xs><x0> = f$stack_insert$upt1<pf><xs><x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU/prelude/almanac/pre2026/SOOP/IFACE/stack.dats] *)
(***********************************************************************)
(***********************************************************************)
