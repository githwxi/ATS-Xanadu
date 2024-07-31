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
//
#absvwtp
GSEQ_type
(xs: t0, x0: t0) <= xs
#sexpdef GSEQ = GSEQ_type
//
#absvwtp
GASZ_type
(xs: t0, x0: vt) <= xs
#sexpdef GASZ = GASZ_type
//
(* ****** ****** *)
//
(*
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
*)
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
#symload forall_c1fr with GSEQ_forall_c1fr of 1000
#symload forall_f1np with GSEQ_forall_f1np of 1000
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
#symload rforall_c1fr with GSEQ_rforall_c1fr of 1000
#symload rforall_f1np with GSEQ_rforall_f1np of 1000
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
#symload forall_c1fr with GASZ_forall_c1fr of 1000
#symload forall_f1np with GASZ_forall_f1np of 1000
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
#symload rforall_c1fr with GASZ_rforall_c1fr of 1000
#symload rforall_f1np with GASZ_rforall_f1np of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
GSEQ_make_list
{a:t0}
(xs: list(a)): GSEQ(list(a), a)
#symload GSEQ with GSEQ_make_list of 1000
//
(* ****** ****** *)
//
fun
GSEQ_make_nint0
(xs: nint): GSEQ(nint, unit)
(*
HX-2024-07-30:
no overloading for GSEQ_make_nint0
*)
//
fun
GSEQ_make_nint1
(xs: nint): GSEQ(nint, nint)
#symload GSEQ with GSEQ_make_nint1 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gcls000.sats] *)
