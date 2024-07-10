(* ****** ****** *)
(*
** For function ops
*)
(* ****** ****** *)
#typedef
c0fr(r0:vt) = () -<cfr> r0
(* ****** ****** *)
#typedef
c1fr
(a1:t0,r0:vt) = (a1)-<cfr>r0
#typedef
f1np
(a1:t0,r0:vt) = (a1)-<fnp>r0
(* ****** ****** *)
#typedef
c2fr
(a1:t0
,a2:t0,r0:vt) = (a1,a2)-<cfr>r0
#typedef
f2np
(a1:t0
,a2:t0,r0:vt) = (a1,a2)-<fnp>r0
(* ****** ****** *)
#typedef
c3fr
(a1:t0
,a2:t0
,a3:t0,r0:vt) = (a1,a2,a3)-<cfr>r0
#typedef
f3np
(a1:t0
,a2:t0
,a3:t0,r0:vt) = (a1,a2,a3)-<fnp>r0
(* ****** ****** *)
#typedef
cfr4
(a1:t0
,a2:t0
,a3:t0
,a4:t0,r0:vt) = (a1,a2,a3,a4)-<cfr>r0
#typedef
fnp4
(a1:t0
,a2:t0
,a3:t0
,a4:t0,r0:vt) = (a1,a2,a3,a4)-<fnp>r0
(* ****** ****** *)
//
fun
<a1:t0>
gfun_not_c1fr
( f0
: c1fr(a1,bool)): c1fr(a1, bool)
fun
<a1:t0>
gfun_not_f1np
( f0
: f1np(a1,bool)): c1fr(a1, bool)
//
(* ****** ****** *)
//
fun<>
gfun_thunk_repeat
( f0
: c0fr(void), times: sint): void
//
(* ****** ****** *)
//
fun
<x0:vt>
gfun_enum_strx_vt
  (xs: strx_vt( x0 )): c0fr( x0 )
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gfun_memberq_gseq(xs): c1fr(x0,bool)
//
(* ****** ****** *)
//
(*
HX: for run-time testing
Sun Aug 13 21:10:14 EDT 2023
*)
//
fun
<x0:t0>
<y0:vt>
gfun_equal_at
( f0
: f1np(x0, y0)
, x0: x0, y0: y0): bool
//
fun
<x0:t0>
<y0:vt>
gfun_rand_equal_c1fr
( f1: c1fr(x0, y0)
, f2: c1fr(x0, y0)): bool // end-fun
//
fun
<x0:t0>
<y0:vt>
gfun_rand_equal_f1np
( f1: f1np(x0, y0)
, f2: f1np(x0, y0)): bool // end-fun
//
(* ****** ****** *)
//
// HX:
// For various symbol-overloading
//
(* ****** ****** *)
//
#symload fnot with gfun_not_f1np of 0100
#symload fnot with gfun_not_c1fr of 0100
//
(* ****** ****** *)
//
#symload fenum with gfun_enum_strx_vt of 0100
//
(* ****** ****** *)
//
#symload repeat with gfun_thunk_repeat of 0100
//
(* ****** ****** *)
//
#symload fmemberq with gfun_memberq_gseq of 0100
//
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_SATS_gfun000.sats] *)
