(* ****** ****** *)
(* ****** ****** *)
(*
HX-2026-10-06:
SOOP: Static OOP!!!
Tue Oct  6 07:04:04 PM EDT 2026
*)
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<p:pf>
<a:vt>
f$a_copy1(x: !a): (a)
//
#extern
fun
<p:pf>
<a:vt>
f$a_free0(x: ~a): void
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<p:pf>
<a:vt>
f$a_print0(x: ~a): void
#extern
fun
<p:pf>
<a:vt>
f$a_print1(x: !a): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<p:pf>
<a:vt>
f$a_torep0(x: ~a): strn
fun
<p:pf>
<a:vt>
f$a_torep1(x: !a): strn
//
fun
<p:pf>
<a:vt>
f$a_tostr0(x: !a): strn
fun
<p:pf>
<a:vt>
f$a_tostr1(x: !a): strn
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<p:pf>
<a:t0>
f$a_equal00(~a, ~a): bool
fun
<p:pf>
<a:t0>
f$a_equal00(~a, !a): bool
fun
<p:pf>
<a:t0>
f$a_equal10(!a, ~a): bool
fun
<p:pf>
<a:t0>
f$a_equal11(!a, !a): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU_prelude/almanac/pre2026/SOOP/IFACE/a.dats] *)
(***********************************************************************)
(***********************************************************************)
