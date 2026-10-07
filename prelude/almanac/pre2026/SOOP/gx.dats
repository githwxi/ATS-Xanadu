(* ****** ****** *)
(* ****** ****** *)
(*
HX-2026-10-06:
SOOP: Static OOP!!!
Tue Oct  6 07:04:04 PM EDT 2026
*)
(* ****** ****** *)
(* ****** ****** *)
#sexpdef luopt = uopt_vt
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<pf:pf>
<xs:vt>
<x0:vt>
g2_remove$btf1(pf | !xs): bool
//
#extern
fun
<pf:pf>
<xs:vt>
<x0:vt>
g2_getout$old1(pf | !xs): (x0)
#extern
fun
<pf:pf>
<xs:vt>
<x0:vt>
g2_getout$upt1(pf | !xs): luopt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<pf:pf>
<xs:vt>
<x0:vt>
g2_insert$new1(pf | !xs, ~x0): void
#extern
fun
<pf:pf>
<xs:vt>
<x0:vt>
g2_insert$upt1(pf | !xs, ~x0): luopt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
g2_remove$btf1
  ( pf | xs ) =
(
case+ opt of
| @optn_nil() => (false)
| @optn_cons(x0) => (~x0; true)
where
{
val opt = g2_getout$upt1<xs><x0>(pf | xs)
}(*where*)//end-of-[g2_getout$old1(...)]
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
g2_getout$old1
  ( pf | xs ) =
(
case- opt of
@optn_cons(x0) => ( x0 ))
where
{
val opt =
g2_getout$upt1<xs><x0>(pf | xs, x0)
}(*where*)//end-of-[g2_getout$old1(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< pf:pf >
< xs:vt >
< x0:vt >
g2_insert$new1
( pf | xs, x0 ) =
(
case- opt of
| @optn_nil() => ( (*0*) ))
where
{
val opt =
g2_insert$upt1<xs><x0>(pf | xs, x0)
}(*where*)//end-of-[g2_insert$new1(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_almanac_pre2026_SOOP_gx.dats] *)
(***********************************************************************)
(***********************************************************************)
