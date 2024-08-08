(* ****** ****** *)
(*
** For function ops
*)
(* ****** ****** *)
(* ****** ****** *)
//
#typedef
f0un(r0:vt) = () -> r0
//
#typedef
f1un
(a1:t0,r0:vt) = (a1) -> r0
//
#typedef
f2un
(a1:t0
,a2:t0,r0:vt) = (a1,a2) -> r0
//
#typedef
f3un
(a1:t0
,a2:t0
,a3:t0,r0:vt) = (a1,a2,a3) -> r0
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a1:t0>
gfun_not_f1un
( f0
: f1un(a1,bool)): f1un(a1, bool)
//
(* ****** ****** *)
//
fun<>
gfun_thunk_repeat
( f0
: f0un(void), times: sint): void
//
(* ****** ****** *)
//
fun
<x0:vt>
gfun_enum_strx_vt
  (xs: strx_vt( x0 )): f0un( x0 )
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gfun_memberq_gseq(xs): f1un(x0,bool)
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
gfun_equal$at
( f0
: f1un(x0, y0)
, x0: x0, y0: y0): bool
//
fun
<x0:t0>
<y0:vt>
gfun_rand_equal_f1un
( f1: f1un(x0, y0)
, f2: f1un(x0, y0)): bool // end-fun
//
(* ****** ****** *)
//
// HX:
// For various symbol-overloading
//
(* ****** ****** *)
//
#symload fnot with gfun_not_f1un of 0100
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
