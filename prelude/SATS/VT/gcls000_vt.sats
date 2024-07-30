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
#staload "./VT/gcls000.sats"
(* ****** ****** *)
//
prfun
GSEQ_list_vt
{a:vt}((*0*)): GSEQ(list_vt(a), a)
#symload GSEQ with GSEQ_list_vt of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
GSEQ_forall0
(GSEQ(xs, x0) | ~xs): bool
fun
<xs:vt>
<x0:vt>
GSEQ_rforall0
(GSEQ(xs, x0) | ~xs): bool
fun
<xs:vt>
<x0:vt>
GSEQ_iforall0
(GSEQ(xs, x0) | ~xs): bool
fun
<xs:vt>
<x0:vt>
GSEQ_irforall0
(GSEQ(xs, x0) | ~xs): bool
//
#symload forall0 with GSEQ_forall0 of 0100
#symload rforall0 with GSEQ_rforall0 of 0100
#symload iforall0 with GSEQ_iforall0 of 0100
#symload irforall0 with GSEQ_irforall0 of 0100
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
GSEQ_forall0_c1fr
( pf: GSEQ(xs, x0)
| x0: xs, test: (~x0)-<cfr>bool): bool
fun
<xs:vt>
<x0:vt>
GSEQ_forall0_f1np
( pf: GSEQ(xs, x0)
| x0: xs, test: (~x0)-<fnp>bool): bool
//
#symload forall0 with GSEQ_forall0_c1fr of 0100
#symload forall0_c1fr with GSEQ_forall0_c1fr of 0100
#symload forall0_f1np with GSEQ_forall0_f1np of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_VT_gcls000_vt.sats] *)
