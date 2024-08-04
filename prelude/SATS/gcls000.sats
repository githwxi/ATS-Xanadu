(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Mon 29 Jul 2024 06:15:29 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
#typedef si = sint
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX:
For functional lists
*)
#abstype
GSEQ_type
(xs: t0, x0: t0) <= xs
#sexpdef GSEQ = GSEQ_type
//
(* ****** ****** *)
//
(*
HX:
For persistent arrays
*)
//
#abstype
GASZ_type
(xs: t0, x0: vt) <= xs
#sexpdef GASZ = GASZ_type
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_make
(xs: xs): GSEQ(xs, x0)
fun
<xs:t0>
<x0:vt>
GASZ_make
(xs: xs): GASZ(xs, x0)
//
#symload GSEQ with GSEQ_make of 0100
#symload GASZ with GASZ_make of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_unmk
(gseq: GSEQ(xs, x0)): (xs)
fun
<xs:t0>
<x0:vt>
GASZ_unmk
(gasz: GASZ(xs, x0)): (xs)
//
#symload unmk with GSEQ_unmk of 0100
#symload unmk with GASZ_unmk of 0100
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-08-03:
[GSEQ] is like a functional list
*)
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_sum
(gseq: GSEQ(xs, x0)): (x0)
fun
<xs:t0>
<x0:t0>
GSEQ_prod
(gseq: GSEQ(xs, x0)): (x0)
//
#symload sum with GSEQ_sum of 1000
#symload prod with GSEQ_prod of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_length
(gseq: GSEQ(xs, x0)): nint
//
#symload length with GSEQ_length of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_listize
(GSEQ(xs,x0)): list_vt(x0)
fun
<xs:t0>
<x0:t0>
GSEQ_rlistize
(GSEQ(xs,x0)): list_vt(x0)
//
#symload listize with GSEQ_listize of 1000
#symload rlistize with GSEQ_rlistize of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_forall
(gseq: GSEQ(xs, x0)): bool
fun
<xs:t0>
<x0:t0>
GSEQ_exists
(gseq: GSEQ(xs, x0)): bool
fun
<xs:t0>
<x0:t0>
GSEQ_rforall
(gseq: GSEQ(xs, x0)): bool
fun
<xs:t0>
<x0:t0>
GSEQ_iforall
(gseq: GSEQ(xs, x0)): bool
fun
<xs:t0>
<x0:t0>
GSEQ_irforall
(gseq: GSEQ(xs, x0)): bool
//
#symload forall with GSEQ_forall of 1000
#symload rforall with GSEQ_rforall of 1000
#symload iforall with GSEQ_rforall of 1000
#symload irforall with GSEQ_rforall of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_forall_c1fr
( gseq: GSEQ(xs, x0)
, test: (x0)-<cfr>bool): bool
fun
<xs:t0>
<x0:t0>
GSEQ_forall_f1np
( gseq: GSEQ(xs, x0)
, test: (x0)-<fnp>bool): bool
//
#symload forall with GSEQ_forall_c1fr of 1000
#symload forall_cfr with GSEQ_forall_c1fr of 1000
#symload forall_fnp with GSEQ_forall_f1np of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_exists_c1fr
( gseq: GSEQ(xs, x0)
, test: (x0)-<cfr>bool): bool
fun
<xs:t0>
<x0:t0>
GSEQ_exists_f1np
( gseq: GSEQ(xs, x0)
, test: (x0)-<fnp>bool): bool
//
#symload exists with GSEQ_exists_c1fr of 1000
#symload exists_cfr with GSEQ_exists_c1fr of 1000
#symload exists_fnp with GSEQ_exists_f1np of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_rforall_c1fr
( gseq: GSEQ(xs, x0)
, test: (x0)-<cfr>bool): bool
fun
<xs:t0>
<x0:t0>
GSEQ_rforall_f1np
( gseq: GSEQ(xs, x0)
, test: (x0)-<fnp>bool): bool
//
#symload rforall with GSEQ_rforall_c1fr of 1000
#symload rforall_cfr with GSEQ_rforall_c1fr of 1000
#symload rforall_fnp with GSEQ_rforall_f1np of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_rexists_c1fr
( gseq: GSEQ(xs, x0)
, test: (x0)-<cfr>bool): bool
fun
<xs:t0>
<x0:t0>
GSEQ_rexists_f1np
( gseq: GSEQ(xs, x0)
, test: (x0)-<fnp>bool): bool
//
#symload rexists with GSEQ_rexists_c1fr of 1000
#symload rexists_cfr with GSEQ_rexists_c1fr of 1000
#symload rexists_fnp with GSEQ_rexists_f1np of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_iforall_c2fr
( gseq: GSEQ(xs, x0)
, test: (ni, x0)-<cfr>bool): bool
fun
<xs:t0>
<x0:t0>
GSEQ_iforall_f2np
( gseq: GSEQ(xs, x0)
, test: (ni, x0)-<fnp>bool): bool
//
#symload iforall with GSEQ_iforall_c2fr of 1000
#symload iforall_cfr with GSEQ_iforall_c2fr of 1000
#symload iforall_fnp with GSEQ_iforall_f2np of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_irforall_c2fr
( gseq: GSEQ(xs, x0)
, test: (ni, x0)-<cfr>bool): bool
fun
<xs:t0>
<x0:t0>
GSEQ_irforall_f2np
( gseq: GSEQ(xs, x0)
, test: (ni, x0)-<fnp>bool): bool
//
#symload irforall with GSEQ_irforall_c2fr of 1000
#symload irforall_cfr with GSEQ_irforall_c2fr of 1000
#symload irforall_fnp with GSEQ_irforall_f2np of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
GSEQ_folditm
(
gseq:
GSEQ(xs,x0), r0: r0): (r0)
fun
<xs:t0>
<x0:t0>
<r0:vt>
GSEQ_rfolditm
(
gseq:
GSEQ(xs,x0), r0: r0): (r0)
fun
<xs:t0>
<x0:t0>
<r0:vt>
GSEQ_ifolditm
(
gseq:
GSEQ(xs,x0), r0: r0): (r0)
fun
<xs:t0>
<x0:t0>
<r0:vt>
GSEQ_irfolditm
(
gseq:
GSEQ(xs,x0), r0: r0): (r0)
//
#symload folditm with GSEQ_folditm of 1000
#symload rfolditm with GSEQ_rfolditm of 1000
#symload ifolditm with GSEQ_rfolditm of 1000
#symload irfolditm with GSEQ_rfolditm of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
GSEQ_folditm_c2fr
( gseq
: GSEQ(xs, x0), r0: r0
, fopr: (r0, x0)-<cfr>(r0)): (r0)
fun
<xs:t0>
<x0:t0>
<r0:vt>
GSEQ_folditm_f2np
( gseq
: GSEQ(xs, x0), r0: r0
, fopr: (r0, x0)-<fnp>(r0)): (r0)
//
#symload folditm with GSEQ_folditm_c2fr of 1000
#symload folditm_cfr with GSEQ_folditm_c2fr of 1000
#symload folditm_fnp with GSEQ_folditm_f2np of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
GSEQ_rfolditm_c2fr
( gseq
: GSEQ(xs, x0), r0: r0
, fopr: (x0, r0)-<cfr>(r0)): (r0)
fun
<xs:t0>
<x0:t0>
<r0:vt>
GSEQ_rfolditm_f2np
( gseq
: GSEQ(xs, x0), r0: r0
, fopr: (x0, r0)-<fnp>(r0)): (r0)
//
#symload rfolditm with GSEQ_rfolditm_c2fr of 1000
#symload rfolditm_cfr with GSEQ_rfolditm_c2fr of 1000
#symload rfolditm_fnp with GSEQ_rfolditm_f2np of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
GSEQ_ifolditm_c3fr
( gseq
: GSEQ(xs, x0), r0: r0
, fopr: (r0, ni, x0)-<cfr>(r0)): (r0)
fun
<xs:t0>
<x0:t0>
<r0:vt>
GSEQ_ifolditm_f3np
( gseq
: GSEQ(xs, x0), r0: r0
, fopr: (r0, ni, x0)-<fnp>(r0)): (r0)
//
#symload ifolditm with GSEQ_ifolditm_c3fr of 1000
#symload ifolditm_cfr with GSEQ_ifolditm_c3fr of 1000
#symload ifolditm_fnp with GSEQ_ifolditm_f3np of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
GSEQ_irfolditm_c3fr
( gseq
: GSEQ(xs, x0), r0: r0
, fopr: (ni, x0, r0)-<cfr>(r0)): (r0)
fun
<xs:t0>
<x0:t0>
<r0:vt>
GSEQ_irfolditm_f3np
( gseq
: GSEQ(xs, x0), r0: r0
, fopr: (ni, x0, r0)-<fnp>(r0)): (r0)
//
#symload irfolditm with GSEQ_irfolditm_c3fr of 1000
#symload irfolditm_cfr with GSEQ_irfolditm_c3fr of 1000
#symload irfolditm_fnp with GSEQ_irfolditm_f3np of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-03:
[GASZ] is for
persistent arrays with size attched
For instance, it should support ops
like binary search.
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
GASZ_length
(gseq: GASZ(xs, x0)): nint
//
#symload length with GASZ_length of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
GASZ_listize
(GASZ(xs,x0)): list_vt(x0)
fun
<xs:t0>
<x0:vt>
GASZ_rlistize
(GASZ(xs,x0)): list_vt(x0)
//
#symload listize with GASZ_listize of 1000
#symload rlistize with GASZ_rlistize of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
GASZ_forall
(gasz: GASZ(xs, x0)): bool
fun
<xs:t0>
<x0:vt>
GASZ_rforall
(gasz: GASZ(xs, x0)): bool
fun
<xs:t0>
<x0:vt>
GASZ_iforall
(gasz: GASZ(xs, x0)): bool
fun
<xs:t0>
<x0:vt>
GASZ_irforall
(gasz: GASZ(xs, x0)): bool
//
#symload forall with GASZ_forall of 1000
#symload rforall with GASZ_rforall of 1000
#symload iforall with GASZ_iforall of 1000
#symload irforall with GASZ_irforall of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
GASZ_forall_c1fr
( gasz: GASZ(xs, x0)
, test: (!x0)-<cfr>bool): bool
fun
<xs:t0>
<x0:vt>
GASZ_forall_f1np
( gasz: GASZ(xs, x0)
, test: (!x0)-<fnp>bool): bool
//
#symload forall with GASZ_forall_c1fr of 1000
#symload forall_cfr with GASZ_forall_c1fr of 1000
#symload forall_fnp with GASZ_forall_f1np of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
GASZ_exists_c1fr
( gasz: GASZ(xs, x0)
, test: (!x0)-<cfr>bool): bool
fun
<xs:t0>
<x0:vt>
GASZ_exists_f1np
( gasz: GASZ(xs, x0)
, test: (!x0)-<fnp>bool): bool
//
#symload exists with GASZ_exists_c1fr of 1000
#symload exists_cfr with GASZ_exists_c1fr of 1000
#symload exists_fnp with GASZ_exists_f1np of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
GASZ_rforall_c1fr
( gasz: GASZ(xs, x0)
, test: (!x0)-<cfr>bool): bool
fun
<xs:t0>
<x0:vt>
GASZ_rforall_f1np
( gasz: GASZ(xs, x0)
, test: (!x0)-<fnp>bool): bool
//
#symload rforall with GASZ_rforall_c1fr of 1000
#symload rforall_cfr with GASZ_rforall_c1fr of 1000
#symload rforall_fnp with GASZ_rforall_f1np of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
GASZ_rexists_c1fr
( gasz: GASZ(xs, x0)
, test: (!x0)-<cfr>bool): bool
fun
<xs:t0>
<x0:vt>
GASZ_rexists_f1np
( gasz: GASZ(xs, x0)
, test: (!x0)-<fnp>bool): bool
//
#symload rexists with GASZ_rexists_c1fr of 1000
#symload rexists_cfr with GASZ_rexists_c1fr of 1000
#symload rexists_fnp with GASZ_rexists_f1np of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gcls000.sats] *)
