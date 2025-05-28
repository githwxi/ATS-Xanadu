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
//
#typedef
f4un
(a1:t0
,a2:t0
,a3:t0
,a4:t0,r0:vt) = (a1,a2,a3,a4)->r0
//
#typedef
f5un
(a1:t0
,a2:t0
,a3:t0
,a4:t0
,a5:t0,r0:vt) = (a1,a2,a3,a4,a5)->r0
//
#typedef
f6un
(a1:t0
,a2:t0
,a3:t0
,a4:t0
,a5:t0
,a6:t0,r0:vt) = (a1,a2,a3,a4,a5,a6)->r0
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a1:t0>
gfun_not_f1un
(
f00:
f1un(a1,bool)): f1un(a1, bool)
//
#symload
fnot with gfun_not_f1un of 0100
//
(* ****** ****** *)
//
fun
<x0:vt>
gfun_enum_strx_vt
  (xs: strx_vt( x0 )): f0un(x0)
//
#symload
fenum with gfun_enum_strx_vt of 0100
//
(* ****** ****** *)
//
fun<>
gfun_thunk_repeat
( f00
: f0un(void), times: sint): void
//
#symload
repeat with gfun_thunk_repeat of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gfun_memberq_gseq(xs): f1un(x0,bool)
//
#symload
fmemberq with gfun_memberq_gseq of 0100
//
(* ****** ****** *)
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
(* ****** ****** *)
//
fun
<r0:vt>
f0un_trace
(msg: strn
,f00: f0un(r0)): f0un(r0)
fun
<a1:t0>
<r0:vt>
f1un_trace
(msg: strn
,f00: f1un(a1,r0)): f1un(a1,r0)
fun
<a1:t0>
<a2:t0>
<r0:vt>
f2un_trace
(msg: strn
,f00: f2un(a1,a2,r0)): f2un(a1,a2,r0)
fun
<a1:t0>
<a2:t0>
<a3:t0>
<r0:vt>
f3un_trace
(msg: strn
,f00: f3un(a1,a2,a3,r0)): f3un(a1,a2,a3,r0)
//
(* ****** ****** *)
//
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<r0:vt>
f4un_trace
(msg: strn
,f00: f4un(a1,a2,a3,a4,r0)): f4un(a1,a2,a3,a4,r0)
//
(* ****** ****** *)
//
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
<r0:vt>
f5un_trace
(msg: strn
,f00: f5un(a1,a2,a3,a4,a5,r0)): f5un(a1,a2,a3,a4,a5,r0)
//
(* ****** ****** *)
//
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
<a6:t0>
<r0:vt>
f6un_trace
(msg: strn
,f00: f6un(a1,a2,a3,a4,a5,a6,r0)): f6un(a1,a2,a3,a4,a5,a6,r0)
//
(* ****** ****** *)
//
#symload trace with f0un_trace of 1000
#symload trace with f1un_trace of 1000
#symload trace with f2un_trace of 1000
#symload trace with f3un_trace of 1000
#symload trace with f4un_trace of 1000
#symload trace with f5un_trace of 1000
#symload trace with f6un_trace of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_SATS_gfun000.sats] *)
