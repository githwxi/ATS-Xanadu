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
(* ****** ****** *)
//
(*
fun
<xs:t0>
<x0:t0>
GSEQ_make(xs): GSEQ(xs, x0)
*)
fun
<xs:t0>
<x0:t0>
GSEQ_unmk(GSEQ(xs, x0)): (xs)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_forall
(gseq: GSEQ(xs, x0)): bool
//
#symload forall with GSEQ_forall of 0100
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
#symload forall with GSEQ_forall_c1fr of 0100
#symload forall_c1fr with GSEQ_forall_c1fr of 0100
#symload forall_f1np with GSEQ_forall_f1np of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
GSEQ_make_list
{a:t0}
(xs: list(a)): GSEQ(list(a), a)
#symload GSEQ with GSEQ_make_list of 0100
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
#symload GSEQ with GSEQ_make_nint1 of 0100
//
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gcls000.sats] *)
