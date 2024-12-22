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
GLSEQ_unmk0
(gseq: !GLSEQ(xs, x0)): (xs)
fun
<xs:vt>
<x0:vt>
GLSEQ_unmk1
(gseq: !GLSEQ(xs, x0)): (owed(xs)|xs)
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
fun
<xs:vt>
<x0:vt>
GLSEQ_forall0$f1un
( gseq: ~GLSEQ(xs, x0)
, test: ( ~x0 ) -> bool): bool
//
#symload forall0 with GLSEQ_forall0$f1un of 1000
#symload forall0$fun with GLSEQ_forall0$f1un of 1000
//
fun
<xs:vt>
<x0:vt>
GLSEQ_forall1$f1un
( gseq: !GLSEQ(xs, x0)
, test: ( !x0 ) -> bool): bool
//
#symload forall1 with GLSEQ_forall1$f1un of 1000
#symload forall1$fun with GLSEQ_forall1$f1un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
GLSEQ_rforall0
(gseq: ~GLSEQ(xs, x0)): bool
fun
<xs:vt>
<x0:vt>
GLSEQ_rforall1
(gseq: !GLSEQ(xs, x0)): bool
//
#symload rforall0 with GLSEQ_rforall0 of 1000
#symload rforall1 with GLSEQ_rforall1 of 1000
//
fun
<xs:vt>
<x0:vt>
GLSEQ_rforall0$f1un
( gseq: ~GLSEQ(xs, x0)
, test: ( ~x0 ) -> bool): bool
//
#symload rforall0 with GLSEQ_rforall0$f1un of 1000
#symload rforall0$fun with GLSEQ_rforall0$f1un of 1000
//
fun
<xs:vt>
<x0:vt>
GLSEQ_rforall1$f1un
( gseq: !GLSEQ(xs, x0)
, test: ( !x0 ) -> bool): bool
//
#symload rforall1 with GLSEQ_rforall1$f1un of 1000
#symload rforall1$fun with GLSEQ_rforall1$f1un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
GLSEQ_iforall0
(gseq: ~GLSEQ(xs, x0)): bool
fun
<xs:vt>
<x0:vt>
GLSEQ_iforall1
(gseq: !GLSEQ(xs, x0)): bool
//
#symload iforall0 with GLSEQ_iforall0 of 1000
#symload iforall1 with GLSEQ_iforall1 of 1000
//
fun
<xs:vt>
<x0:vt>
GLSEQ_iforall0$f2un
( gseq: ~GLSEQ(xs, x0)
, test: (ni, ~x0) -> bool): bool
//
#symload iforall0 with GLSEQ_iforall0$f2un of 1000
#symload iforall0$fun with GLSEQ_iforall0$f2un of 1000
//
fun
<xs:vt>
<x0:vt>
GLSEQ_iforall1$f2un
( gseq: !GLSEQ(xs, x0)
, test: (ni, !x0) -> bool): bool
//
#symload iforall1 with GLSEQ_iforall1$f2un of 1000
#symload iforall1$fun with GLSEQ_iforall1$f2un of 1000
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
GLSEQ_irforall0
(gseq: ~GLSEQ(xs, x0)): bool
fun
<xs:vt>
<x0:vt>
GLSEQ_irforall1
(gseq: !GLSEQ(xs, x0)): bool
//
#symload irforall0 with GLSEQ_irforall0 of 1000
#symload irforall1 with GLSEQ_irforall1 of 1000
//
fun
<xs:vt>
<x0:vt>
GLSEQ_irforall0$f2un
( gseq: ~GLSEQ(xs, x0)
, test: (ni, ~x0) -> bool): bool
//
#symload irforall0 with GLSEQ_irforall0$f2un of 1000
#symload irforall0$fun with GLSEQ_irforall0$f2un of 1000
//
fun
<xs:vt>
<x0:vt>
GLSEQ_irforall1$f2un
( gseq: !GLSEQ(xs, x0)
, test: (ni, !x0) -> bool): bool
//
#symload irforall1 with GLSEQ_irforall1$f2un of 1000
#symload irforall1$fun with GLSEQ_irforall1$f2un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_VT_gcls000_vt.sats] *)
