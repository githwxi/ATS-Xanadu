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
(*
HX-2026-01-12:
Mon Jan 12 11:55:56 PM EST 2026
This is 100% boilerplate stuff!
It should be automated eventually.
*)
(* ****** ****** *)
(* ****** ****** *)
//
#absvwtp
GSEQ_vt(
xs: vt, x0: vt) <= xs
#sexpdef GLSEQ = GSEQ_vt
//
(* ****** ****** *)
//
(*
HX-2026-01-13:
[GSEQ_vt]
can sub for [GASQ_vt]!
#absvwtp
GASQ_vt(
xs: vt, x0: vt) <= xs
#sexpdef GLASQ = GASQ_vt
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
fun
<xs:vt>
<x0:vt>
GLSEQ_make(xs): GLSEQ(xs, x0)
*)
fun
<xs:vt>
<x0:vt>
GLSEQ_unmk0
(gseq: ~GLSEQ(xs, x0)): (xs)
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
GLSEQ_make_list_vt
{a:vt}
(xs:list_vt(a)): GLSEQ(list_vt(a), a)
#symload
GLSEQ with GLSEQ_make_list_vt of 1000
#symload
GLSEQ_list_vt with GLSEQ_make_list_vt of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
GLSEQ_length0
(gseq: ~GLSEQ(xs, x0)): nint
fun
<xs:vt>
<x0:vt>
GLSEQ_length1
(gseq: !GLSEQ(xs, x0)): nint
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
(*
HX-2026-01-13:
Tue Jan 13 12:03:35 AM EST 2026
*)
fun
<xs:vt>
<x0:vt>
GLSEQ_foritm0
(gseq: ~GLSEQ(xs, x0)): void
fun
<xs:vt>
<x0:vt>
GLSEQ_foritm1
(gseq: !GLSEQ(xs, x0)): void
//
#symload foritm0 with GLSEQ_foritm0 of 1000
#symload foritm1 with GLSEQ_foritm1 of 1000
//
fun
<xs:vt>
<x0:vt>
GLSEQ_foritm0$f1un
( gseq: ~GLSEQ(xs, x0)
, work: ( ~x0 ) -> void): void
//
#symload foritm0 with GLSEQ_foritm0$f1un of 1000
#symload foritm0$fun with GLSEQ_foritm0$f1un of 1000
//
fun
<xs:vt>
<x0:vt>
GLSEQ_foritm1$f1un
( gseq: !GLSEQ(xs, x0)
, work: ( !x0 ) -> void): void
//
#symload foritm1 with GLSEQ_foritm1$f1un of 1000
#symload foritm1$fun with GLSEQ_foritm1$f1un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
GLSEQ_rforitm0
(gseq: ~GLSEQ(xs, x0)): void
fun
<xs:vt>
<x0:vt>
GLSEQ_rforitm1
(gseq: !GLSEQ(xs, x0)): void
//
#symload rforitm0 with GLSEQ_rforitm0 of 1000
#symload rforitm1 with GLSEQ_rforitm1 of 1000
//
fun
<xs:vt>
<x0:vt>
GLSEQ_rforitm0$f1un
( gseq: ~GLSEQ(xs, x0)
, work: ( ~x0 ) -> void): void
//
#symload rforitm0 with GLSEQ_rforitm0$f1un of 1000
#symload rforitm0$fun with GLSEQ_rforitm0$f1un of 1000
//
fun
<xs:vt>
<x0:vt>
GLSEQ_rforitm1$f1un
( gseq: !GLSEQ(xs, x0)
, work: ( !x0 ) -> void): void
//
#symload rforitm1 with GLSEQ_rforitm1$f1un of 1000
#symload rforitm1$fun with GLSEQ_rforitm1$f1un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
GLSEQ_iforitm0
(gseq: ~GLSEQ(xs, x0)): void
fun
<xs:vt>
<x0:vt>
GLSEQ_iforitm1
(gseq: !GLSEQ(xs, x0)): void
//
#symload iforitm0 with GLSEQ_iforitm0 of 1000
#symload iforitm1 with GLSEQ_iforitm1 of 1000
//
fun
<xs:vt>
<x0:vt>
GLSEQ_iforitm0$f2un
( gseq: ~GLSEQ(xs, x0)
, work: (ni, ~x0) -> void): void
//
#symload iforitm0 with GLSEQ_iforitm0$f2un of 1000
#symload iforitm0$fun with GLSEQ_iforitm0$f2un of 1000
//
fun
<xs:vt>
<x0:vt>
GLSEQ_iforitm1$f2un
( gseq: !GLSEQ(xs, x0)
, work: (ni, !x0) -> void): void
//
#symload iforitm1 with GLSEQ_iforitm1$f2un of 1000
#symload iforitm1$fun with GLSEQ_iforitm1$f2un of 1000
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
GLSEQ_irforitm0
(gseq: ~GLSEQ(xs, x0)): void
fun
<xs:vt>
<x0:vt>
GLSEQ_irforitm1
(gseq: !GLSEQ(xs, x0)): void
//
#symload irforitm0 with GLSEQ_irforitm0 of 1000
#symload irforitm1 with GLSEQ_irforitm1 of 1000
//
fun
<xs:vt>
<x0:vt>
GLSEQ_irforitm0$f2un
( gseq: ~GLSEQ(xs, x0)
, work: (ni, ~x0) -> void): void
//
#symload irforitm0 with GLSEQ_irforitm0$f2un of 1000
#symload irforitm0$fun with GLSEQ_irforitm0$f2un of 1000
//
fun
<xs:vt>
<x0:vt>
GLSEQ_irforitm1$f2un
( gseq: !GLSEQ(xs, x0)
, work: (ni, !x0) -> void): void
//
#symload irforitm1 with GLSEQ_irforitm1$f2un of 1000
#symload irforitm1$fun with GLSEQ_irforitm1$f2un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_SATS_VT_gcls000_vt.sats] *)
(***********************************************************************)
