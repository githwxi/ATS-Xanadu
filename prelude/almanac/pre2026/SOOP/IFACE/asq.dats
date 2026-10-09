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
f$asq_length(xs: !xs): nint
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<pf:pf>
<xs:vt>
<x0:vt>
f$asq_cget$at$raw1(xs: !xs, i0: nint): (x0)
//
#extern
fun
<pf:pf>
<xs:vt>
<x0:vt>
f$asq_cget$at$exn1(xs: !xs, i0: nint): (x0)
//
#extern
fun
<pf:pf>
<xs:vt>
<x0:vt>
f$asq_cget$at$upt1(xs: !xs, i0: nint): luopt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
f$seq_foritm1<pf><xs><x0>(xs) = f$seq_forall1<SEQ><xs><x0>(xs)
f$seq_forall1<ASQ(pf)><xs><x0>(xs) = ...
f$seq_get$at1<ASQ(A1SZ(pf))><xs><x0>(xs) = ...

(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU_prelude/almanac/pre2026/SOOP/IFACE/asq.dats] *)
(***********************************************************************)
(***********************************************************************)
