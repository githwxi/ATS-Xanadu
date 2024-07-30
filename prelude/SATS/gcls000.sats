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
GSEQ$list
{a:t0}(list(a)): GSEQ(list(a), a)
#symload GSEQ with GSEQlist of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ$forall
(GSEQ(xs, x0) | xs): bool
fun
<xs:t0>
<x0:t0>
GSEQ$rforall
(GSEQ(xs, x0) | xs): bool
fun
<xs:t0>
<x0:t0>
GSEQ$iforall
(GSEQ(xs, x0) | xs): bool
fun
<xs:t0>
<x0:t0>
GSEQ$irforall
(GSEQ(xs, x0) | xs): bool
//
#symload forall with GSEQ$forall of 0100
#symload rforall with GSEQ$rforall of 0100
#symload iforall with GSEQ$iforall of 0100
#symload irforall with GSEQ$irforall of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ$forall_c1fr
( pf: GSEQ(xs, x0)
| x0: xs, test: (x0)-<cfr>bool): bool
fun
<xs:t0>
<x0:t0>
GSEQ$forall_f1np
( pf: GSEQ(xs, x0)
| x0: xs, test: (x0)-<fnp>bool): bool
//
#symload forall with GSEQ$forall_c1fr of 0100
#symload forall_c1fr with GSEQ$forall_c1fr of 0100
#symload forall_f1np with GSEQ$forall_f1np of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ$foritm
(GSEQ(xs, x0) | xs): void
fun
<xs:t0>
<x0:t0>
GSEQ$rforitm
(GSEQ(xs, x0) | xs): void
fun
<xs:t0>
<x0:t0>
GSEQ$iforitm
(GSEQ(xs, x0) | xs): void
fun
<xs:t0>
<x0:t0>
GSEQ$irforitm
(GSEQ(xs, x0) | xs): void
//
#symload foritm with GSEQ$foritm of 0100
#symload rforitm with GSEQ$rforitm of 0100
#symload iforitm with GSEQ$iforitm of 0100
#symload irforitm with GSEQ$irforitm of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ$foritm_c1fr
( pf: GSEQ(xs, x0)
| x0: xs, test: (x0)-<cfr>void): void
fun
<xs:t0>
<x0:t0>
GSEQ$foritm_f1np
( pf: GSEQ(xs, x0)
| x0: xs, test: (x0)-<fnp>void): void
//
#symload foritm with GSEQ$foritm_c1fr of 0100
#symload foritm_c1fr with GSEQ$foritm_c1fr of 0100
#symload foritm_f1np with GSEQ$foritm_f1np of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gcls000.sats] *)
