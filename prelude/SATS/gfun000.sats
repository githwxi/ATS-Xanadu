(* ****** ****** *)
(*
** For function ops
*)
(* ****** ****** *)
#typedef
fnp1(a1:t0,r0:t0) = (a1)-<fnp>r0
#typedef
cfr1(a1:t0,r0:t0) = (a1)-<cfr>r0
(* ****** ****** *)

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

(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gfun_memq_gseq(xs): cfr1(x0,bool)
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

#symload fmemq with gfun_memq_gseq of 0100

(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gfun000.sats] *)
