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
gxs_remove$btf1(pf | !xs): bool
//
#extern
fun
<pf:pf>
<xs:vt>
<x0:vt>
gxs_getout$old1(pf | !xs): (x0)
#extern
fun
<pf:pf>
<xs:vt>
<x0:vt>
gxs_getout$upt1(pf | !xs): luopt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<pf:pf>
<xs:vt>
<x0:vt>
gxs_insert$new1(pf | !xs, ~x0): void
#extern
fun
<pf:pf>
<xs:vt>
<x0:vt>
gxs_insert$upt1(pf | !xs, ~x0): luopt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gxs_remove$btf1
  ( pf | xs ) =
(
case+ opt of
| @optn_nil() => (false)
| @optn_cons(x0) => (~x0; true)
where
{
val opt = gxs_getout$upt1<xs><x0>(pf | xs)
}(*where*)//end-of-[gxs_getout$old1(...)]
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gxs_getout$old1
  ( pf | xs ) =
(
case- opt of
@optn_cons(x0) => ( x0 ))
where
{
val opt =
gxs_getout$upt1<xs><x0>(pf | xs, x0)
}(*where*)//end-of-[gxs_getout$old1(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< pf:pf >
< xs:vt >
< x0:vt >
gxs_insert$new1
( pf | xs, x0 ) =
(
case- opt of
| @optn_nil() => ( (*0*) ))
where
{
val opt =
gxs_insert$upt1<xs><x0>(pf | xs, x0)
}(*where*)//end-of-[gxs_insert$new1(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU_prelude/almanac/pre2026/SOOP/IFACE/gxs.dats] *)
(***********************************************************************)
(***********************************************************************)
