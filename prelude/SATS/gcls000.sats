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
#absprop
GSEQ(xs: vt, x0: vt)
//
(* ****** ****** *)
//
prfun
GSEQ_list
{a:t0}((*0*)): GSEQ(list(a), a)
#symload GSEQ with GSEQ_list of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_forall
(GSEQ(xs, x0) | xs): bool
fun
<xs:t0>
<x0:t0>
GSEQ_rforall
(GSEQ(xs, x0) | xs): bool
fun
<xs:t0>
<x0:t0>
GSEQ_iforall
(GSEQ(xs, x0) | xs): bool
fun
<xs:t0>
<x0:t0>
GSEQ_irforall
(GSEQ(xs, x0) | xs): bool
//
#symload forall with GSEQ_forall of 0100
#symload rforall with GSEQ_rforall of 0100
#symload iforall with GSEQ_iforall of 0100
#symload irforall with GSEQ_irforall of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_forall_c1fr
( pf: GSEQ(xs, x0)
| x0: xs, test: (x0)-<cfr>bool): bool
fun
<xs:t0>
<x0:t0>
GSEQ_forall_f1np
( pf: GSEQ(xs, x0)
| x0: xs, test: (x0)-<fnp>bool): bool
//
#symload forall with GSEQ_forall_c1fr of 0100
#symload forall_c1fr with GSEQ_forall_c1fr of 0100
#symload forall_f1np with GSEQ_forall_f1np of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_foritm
(GSEQ(xs, x0) | xs): void
fun
<xs:t0>
<x0:t0>
GSEQ_rforitm
(GSEQ(xs, x0) | xs): void
fun
<xs:t0>
<x0:t0>
GSEQ_iforitm
(GSEQ(xs, x0) | xs): void
fun
<xs:t0>
<x0:t0>
GSEQ_irforitm
(GSEQ(xs, x0) | xs): void
//
#symload foritm with GSEQ_foritm of 0100
#symload rforitm with GSEQ_rforitm of 0100
#symload iforitm with GSEQ_iforitm of 0100
#symload irforitm with GSEQ_irforitm of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_foritm_c1fr
( pf: GSEQ(xs, x0)
| x0: xs, test: (x0)-<cfr>void): void
fun
<xs:t0>
<x0:t0>
GSEQ_foritm_f1np
( pf: GSEQ(xs, x0)
| x0: xs, test: (x0)-<fnp>void): void
//
#symload foritm with GSEQ_foritm_c1fr of 0100
#symload foritm_c1fr with GSEQ_foritm_c1fr of 0100
#symload foritm_f1np with GSEQ_foritm_f1np of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gcls000.sats] *)
