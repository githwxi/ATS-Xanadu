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
#absvwtp
GSEQ_vwtp
(xs: vt, x0: vt) <= xs
#sexpdef GLSEQ = GSEQ_vwtp
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<xs:vt>
<x0:vt>
GLSEQ_make0(xs): GLSEQ(xs, x0)
*)
fun
<xs:vt>
<x0:vt>
GLSEQ_unmk0(GLSEQ(xs, x0)): (xs)
//
(* ****** ****** *)
(* ****** ****** *)
//
fcast // fun
GLSEQ_make0_list_vt
{a:vt}
(xs:list_vt(a)): GLSEQ(list_vt(a),a)
#symload
GLSEQ with GLSEQ_make0_list_vt of 1000
#symload
GLSEQ_list_vt with GLSEQ_make0_list_vt of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
GLSEQ_forall0
(gseq: ~GLSEQ(xs, x0)): bool
fun
<xs:vt>
<x0:vt>
GLSEQ_forall1
(gseq: !GLSEQ(xs, x0)): bool
//
#symload forall0 with GLSEQ_forall0 of 1000
#symload forall1 with GLSEQ_forall1 of 1000
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
GLSEQ_forall0_c1fr
( gseq: ~GLSEQ(xs, x0)
, test: (~x0)-<cfr>bool): bool
//
#symload forall0 with GLSEQ_forall0_c1fr of 1000
#symload forall0_c1fr with GLSEQ_forall0_c1fr of 1000
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
GLSEQ_forall1_c1fr
( gseq: !GLSEQ(xs, x0)
, test: (!x0)-<cfr>bool): bool
//
#symload forall1 with GLSEQ_forall1_c1fr of 1000
#symload forall1_c1fr with GLSEQ_forall1_c1fr of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_VT_gcls000_vt.sats] *)
