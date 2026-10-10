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
f1_copy1(x: !a): (a)
//
#extern
fun
<p:pf>
<a:vt>
f1_free0(x: ~a): void
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<p:pf>
<a:vt>
f1_print0(x: ~a): void
#extern
fun
<p:pf>
<a:vt>
f1_print1(x: !a): void
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<p:pf>
<a:vt>
f1_torep0(x: ~a): strn
#extern
fun
<p:pf>
<a:vt>
f1_torep1(x: !a): strn
//
#extern
fun
<p:pf>
<a:vt>
f1_tostr0(x: !a): strn
#extern
fun
<p:pf>
<a:vt>
f1_tostr1(x: !a): strn
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<p:pf>
<a:vt>
f1_equal00(~a, ~a): bool
#extern
fun
<p:pf>
<a:vt>
f1_equal00(~a, !a): bool
#extern
fun
<p:pf>
<a:vt>
f1_equal10(!a, ~a): bool
#extern
fun
<p:pf>
<a:vt>
f1_equal11(!a, !a): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU_prelude/almanac/pre2026/SOOP/IFACE/1.dats] *)
(***********************************************************************)
(***********************************************************************)
