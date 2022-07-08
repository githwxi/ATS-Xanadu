(* ****** ****** *)
(*
** For function ops
*)
(* ****** ****** *)
#typedef
cfr0(r0:vt) = () -<cfr> r0
(* ****** ****** *)
#typedef
fnp1
(a1:t0,r0:vt) = (a1)-<fnp>r0
#typedef
cfr1
(a1:t0,r0:vt) = (a1)-<cfr>r0
(* ****** ****** *)
#typedef
fnp2
(a1:t0
,a2:t0,r0:vt) = (a1,a2)-<fnp>r0
#typedef
cfr2
(a1:t0
,a2:t0,r0:vt) = (a1,a2)-<cfr>r0
(* ****** ****** *)
#typedef
fnp3
(a1:t0
,a2:t0
,a3:t0,r0:vt) = (a1,a2,a3)-<fnp>r0
#typedef
cfr3
(a1:t0
,a2:t0
,a3:t0,r0:vt) = (a1,a2,a3)-<cfr>r0
(* ****** ****** *)
#typedef
fnp4
(a1:t0
,a2:t0
,a3:t0
,a4:t0,r0:vt) = (a1,a2,a3,a4)-<fnp>r0
#typedef
cfr4
(a1:t0
,a2:t0
,a3:t0
,a4:t0,r0:vt) = (a1,a2,a3,a4)-<cfr>r0
(* ****** ****** *)
//
fun
<a1:t0>
gfun_not_fnp1
( f0
: fnp1(a1,bool)): cfr1(a1, bool)
fun
<a1:t0>
gfun_not_cfr1
( f0
: cfr1(a1,bool)): cfr1(a1, bool)
//
(* ****** ****** *)
//
fun
<x0:vt>
gfun_enum_strx_vt
  (xs: strx_vt( x0 )): cfr0( x0 )
//
//
fun
<xs:t0>
<x0:t0>
gfun_memberq_gseq(xs): cfr1(x0,bool)
//
(* ****** ****** *)
//
// HX:
// For various symbol-overloading
//
(* ****** ****** *)

#symload fnot with gfun_not_fnp1 of 0100
#symload fnot with gfun_not_cfr1 of 0100

(* ****** ****** *)
//
#symload fenum with gfun_enum_strx_vt of 0100
//
(* ****** ****** *)
//
#symload fmemberq with gfun_memberq_gseq of 0100
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gfun000.sats] *)
