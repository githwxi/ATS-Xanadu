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
( f00
: f0un(r0), msg: strn): f0un(r0)
//
fun
<a1:t0>
<r0:vt>
f1un_trace
( f00
: f1un(a1,r0), msg: strn): f1un(a1,r0)
//
fun
<a1:t0>
<a2:t0>
<r0:vt>
f2un_trace
( f00
: f2un(a1,a2,r0), msg: strn): f2un(a1,a2,r0)
//
fun
<a1:t0>
<a2:t0>
<a3:t0>
<r0:vt>
f3un_trace
( f00
: f3un(a1,a2,a3,r0), msg: strn): f3un(a1,a2,a3,r0)
//
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<r0:vt>
f4un_trace
( f00
: f4un(a1,a2,a3,a4,r0), msg: strn): f4un(a1,a2,a3,a4,r0)
//
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
<r0:vt>
f5un_trace
( f00
: f5un(a1,a2,a3,a4,a5,r0), msg: strn): f5un(a1,a2,a3,a4,a5,r0)
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
( f00
: f6un(a1,a2,a3,a4,a5,a6,r0), msg: strn): f6un(a1,a2,a3,a4,a5,a6,r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
f1un_map$list
(f00: (x0) -> y0): list(x0) -> list(y0)
fun
<x0:vt>
<y0:vt>
f1un_map0$llist
(f00: (~x0) -> y0): list_vt(x0) -> list_vt(y0)
fun
<x0:vt>
<y0:vt>
f1un_map1$llist
(f00: (!x0) -> y0): (!list_vt(x0)) -> list_vt(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
f1un_map$optn
( f00
: (x0) -> y0): optn(x0) -> optn(y0)
fun
<x0:vt>
<y0:vt>
f1un_map0$loptn
( f00
: (~x0) -> y0): optn_vt(x0) -> optn_vt(y0)
fun
<x0:vt>
<y0:vt>
f1un_map1$loptn
( f00
: (!x0) -> y0): (!optn_vt(x0)) -> optn_vt(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
<e1:vt>
f1un_map$e1nv$list
(f00
:(x0, !e1)->(y0)): (list(x0), !e1)->list(y0)
fun
<x0:vt>
<y0:vt>
<e1:vt>
f1un_map$e1nv0$llist
(f00
:(~x0, !e1)->(y0)): (~list_vt(x0), !e1)->list_vt(y0)
fun
<x0:vt>
<y0:vt>
<e1:vt>
f1un_map$e1nv1$llist
(f00
:(!x0, !e1)->(y0)): (!list_vt(x0), !e1)->list_vt(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
<e1:vt>
f1un_map$e1nv$optn
(f00
:(x0, !e1)->(y0)): (optn(x0), !e1)->optn(y0)
fun
<x0:vt>
<y0:vt>
<e1:vt>
f1un_map$e1nv0$loptn
(f00
:(~x0, !e1)->(y0)): (~optn_vt(x0), !e1)->optn_vt(y0)
fun
<x0:vt>
<y0:vt>
<e1:vt>
f1un_map$e1nv1$loptn
(f00
:(!x0, !e1)->(y0)): (!optn_vt(x0), !e1)->optn_vt(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen1_prelude_SATS_gfun000.sats] *)
(***********************************************************************)
