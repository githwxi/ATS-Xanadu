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
Sat 13 Jul 2024 10:09:41 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_listize0
(xs: ~xs): list_vt(x0)//fun
//
fun
<xs:vt>
<x0:vt>
gseq_strmize0
(xs: ~xs): strm_vt(x0)//fun
fun
<xs:vt>
<x0:vt>
gseq_strqize0
(xs: ~xs): strq_vt(x0)//fun
//
#symload listize0 with gseq_listize0 of 0100
#symload strmize0 with gseq_strmize0 of 0100
#symload strqize0 with gseq_strqize0 of 0100
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_rlistize0
(xs: ~xs): list_vt(x0)//fun
fun
<xs:vt>
<x0:vt>
gseq_rstrmize0
(xs: ~xs): strm_vt(x0)//fun
fun
<xs:vt>
<x0:vt>
gseq_rstrqize0
(xs: ~xs): strq_vt(x0)//fun
//
#symload rlistize0 with gseq_rlistize0 of 0100
#symload rstrmize0 with gseq_rstrmize0 of 0100
#symload rstrqize0 with gseq_rstrqize0 of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_forall0(xs: ~xs): bool
fun
<xs:vt>
<x0:vt>
gseq_forall1(xs: !xs): bool
//
(*
#symload forall0 with gseq_forall0 of 0100
#symload forall1 with gseq_forall1 of 0100
*)
//
fun
<xs:vt>
<x0:vt>
gseq_forall0_c1fr
(xs: xs, test: (~x0)-<cfr>bool): bool
//
#symload forall0 with gseq_forall0_c1fr of 0100
#symload forall0_cfr with gseq_forall0_c1fr of 0100
//
fun
<xs:vt>
<x0:vt>
gseq_forall1_c1fr
(xs: xs, test: (!x0)-<cfr>bool): bool
//
#symload forall1 with gseq_forall1_c1fr of 0100
#symload forall1_cfr with gseq_forall1_c1fr of 0100
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_exists0(xs: ~xs): bool
fun
<xs:vt>
<x0:vt>
gseq_exists1(xs: !xs): bool
//
(*
#symload exists0 with gseq_exists0 of 0100
#symload exists1 with gseq_exists1 of 0100
*)
//
fun
<xs:vt>
<x0:vt>
gseq_exists0_c1fr
(xs: xs, test: (~x0)-<cfr>bool): bool
//
#symload exists0 with gseq_exists0_c1fr of 0100
#symload exists0_cfr with gseq_exists0_c1fr of 0100
//
fun
<xs:vt>
<x0:vt>
gseq_exists1_c1fr
(xs: xs, test: (!x0)-<cfr>bool): bool
//
#symload exists1 with gseq_exists1_c1fr of 0100
#symload exists1_cfr with gseq_exists1_c1fr of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_rforall0(xs: ~xs): bool
fun
<xs:vt>
<x0:vt>
gseq_rforall1(xs: !xs): bool
//
(*
#symload rforall0 with gseq_rforall0 of 0100
#symload rforall1 with gseq_rforall1 of 0100
*)
//
fun
<xs:vt>
<x0:vt>
gseq_rforall0_c1fr
(xs: xs, test: (~x0)-<cfr>bool): bool
//
#symload rforall0 with gseq_rforall0_c1fr of 0100
#symload rforall0_cfr with gseq_rforall0_c1fr of 0100
//
fun
<xs:vt>
<x0:vt>
gseq_rforall1_c1fr
(xs: xs, test: (!x0)-<cfr>bool): bool
//
#symload rforall1 with gseq_rforall1_c1fr of 0100
#symload rforall1_cfr with gseq_rforall1_c1fr of 0100
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_rexists0(xs: ~xs): bool
fun
<xs:vt>
<x0:vt>
gseq_rexists1(xs: !xs): bool
//
(*
#symload rexists0 with gseq_rexists0 of 0100
#symload rexists1 with gseq_rexists1 of 0100
*)
//
fun
<xs:vt>
<x0:vt>
gseq_rexists0_c1fr
(xs: xs, test: (~x0)-<cfr>bool): bool
//
#symload rexists0 with gseq_rexists0_c1fr of 0100
#symload rexists0_cfr with gseq_rexists0_c1fr of 0100
//
fun
<xs:vt>
<x0:vt>
gseq_rexists1_c1fr
(xs: xs, test: (!x0)-<cfr>bool): bool
//
#symload rexists1 with gseq_rexists1_c1fr of 0100
#symload rexists1_cfr with gseq_rexists1_c1fr of 0100
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_iforall0(xs: ~xs): bool
fun
<xs:vt>
<x0:vt>
gseq_iforall1(xs: !xs): bool
//
(*
#symload iforall0 with gseq_iforall0 of 0100
#symload iforall1 with gseq_iforall1 of 0100
*)
//
fun
<xs:vt>
<x0:vt>
gseq_iforall0_c2fr
(xs: xs, test: (ni, ~x0)-<cfr>bool): bool
//
#symload iforall0 with gseq_iforall0_c2fr of 0100
#symload iforall0_cfr with gseq_iforall0_c2fr of 0100
//
fun
<xs:vt>
<x0:vt>
gseq_iforall1_c2fr
(xs: xs, test: (ni, !x0)-<cfr>bool): bool
//
#symload iforall1 with gseq_iforall1_c2fr of 0100
#symload iforall1_cfr with gseq_iforall1_c2fr of 0100
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_iexists0(xs: ~xs): bool
fun
<xs:vt>
<x0:vt>
gseq_iexists1(xs: !xs): bool
//
(*
#symload iexists0 with gseq_iexists0 of 0100
#symload iexists1 with gseq_iexists1 of 0100
*)
//
fun
<xs:vt>
<x0:vt>
gseq_iexists0_c2fr
(xs: xs, test: (ni, ~x0)-<cfr>bool): bool
//
#symload iexists0 with gseq_iexists0_c2fr of 0100
#symload iexists0_cfr with gseq_iexists0_c2fr of 0100
//
fun
<xs:vt>
<x0:vt>
gseq_iexists1_c2fr
(xs: xs, test: (ni, !x0)-<cfr>bool): bool
//
#symload iexists1 with gseq_iexists1_c2fr of 0100
#symload iexists1_cfr with gseq_iexists1_c2fr of 0100
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_irforall0(xs: ~xs): bool
fun
<xs:vt>
<x0:vt>
gseq_irforall1(xs: !xs): bool
//
(*
#symload irforall0 with gseq_irforall0 of 0100
#symload irforall1 with gseq_irforall1 of 0100
*)
//
fun
<xs:vt>
<x0:vt>
gseq_irforall0_c2fr
(xs: xs, test: (ni, ~x0)-<cfr>bool): bool
//
#symload irforall0 with gseq_irforall0_c2fr of 0100
#symload irforall0_cfr with gseq_irforall0_c2fr of 0100
//
fun
<xs:vt>
<x0:vt>
gseq_irforall1_c2fr
(xs: xs, test: (ni, !x0)-<cfr>bool): bool
//
#symload irforall1 with gseq_irforall1_c2fr of 0100
#symload irforall1_cfr with gseq_irforall1_c2fr of 0100
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_irexists0(xs: ~xs): bool
fun
<xs:vt>
<x0:vt>
gseq_irexists1(xs: !xs): bool
//
(*
#symload irexists0 with gseq_irexists0 of 0100
#symload irexists1 with gseq_irexists1 of 0100
*)
//
fun
<xs:vt>
<x0:vt>
gseq_irexists0_c2fr
(xs: xs, test: (ni, ~x0)-<cfr>bool): bool
//
#symload irexists0 with gseq_irexists0_c2fr of 0100
#symload irexists0_cfr with gseq_irexists0_c2fr of 0100
//
fun
<xs:vt>
<x0:vt>
gseq_irexists1_c2fr
(xs: xs, test: (ni, !x0)-<cfr>bool): bool
//
#symload irexists1 with gseq_irexists1_c2fr of 0100
#symload irexists1_cfr with gseq_irexists1_c2fr of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_foritm0(xs: ~xs): void
fun
<xs:vt>
<x0:vt>
gseq_foritm1(xs: !xs): void
//
(*
#symload foritm0 with gseq_foritm0 of 0100
#symload foritm1 with gseq_foritm1 of 0100
*)
//
fun
<xs:vt>
<x0:vt>
gseq_foritm0_c1fr
(xs: xs, work: (~x0)-<cfr>void): void
//
#symload foritm0 with gseq_foritm0_c1fr of 0100
#symload foritm0_cfr with gseq_foritm0_c1fr of 0100
//
fun
<xs:vt>
<x0:vt>
gseq_foritm1_c1fr
(xs: xs, work: (!x0)-<cfr>void): void
//
#symload foritm1 with gseq_foritm1_c1fr of 0100
#symload foritm1_cfr with gseq_foritm1_c1fr of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_rforitm0(xs: ~xs): void
fun
<xs:vt>
<x0:vt>
gseq_rforitm1(xs: !xs): void
//
(*
#symload rforitm0 with gseq_rforitm0 of 0100
#symload rforitm1 with gseq_rforitm1 of 0100
*)
//
fun
<xs:vt>
<x0:vt>
gseq_rforitm0_c1fr
(xs: xs, work: (~x0)-<cfr>void): void
//
#symload rforitm0 with gseq_rforitm0_c1fr of 0100
#symload rforitm0_cfr with gseq_rforitm0_c1fr of 0100
//
fun
<xs:vt>
<x0:vt>
gseq_rforitm1_c1fr
(xs: xs, work: (!x0)-<cfr>void): void
//
#symload rforitm1 with gseq_rforitm1_c1fr of 0100
#symload rforitm1_cfr with gseq_rforitm1_c1fr of 0100
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_iforitm0(xs: ~xs): void
fun
<xs:vt>
<x0:vt>
gseq_iforitm1(xs: !xs): void
//
(*
#symload iforitm0 with gseq_iforitm0 of 0100
#symload iforitm1 with gseq_iforitm1 of 0100
*)
//
fun
<xs:vt>
<x0:vt>
gseq_iforitm0_c2fr
(xs: xs, work: (ni, ~x0)-<cfr>void): void
//
#symload iforitm0 with gseq_iforitm0_c2fr of 0100
#symload iforitm0_cfr with gseq_iforitm0_c2fr of 0100
//
fun
<xs:vt>
<x0:vt>
gseq_iforitm1_c2fr
(xs: xs, work: (ni, !x0)-<cfr>void): void
//
#symload iforitm1 with gseq_iforitm1_c2fr of 0100
#symload iforitm1_cfr with gseq_iforitm1_c2fr of 0100
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_irforitm0(xs: ~xs): void
fun
<xs:vt>
<x0:vt>
gseq_irforitm1(xs: !xs): void
//
(*
#symload irforitm0 with gseq_irforitm0 of 0100
#symload irforitm1 with gseq_irforitm1 of 0100
*)
//
fun
<xs:vt>
<x0:vt>
gseq_irforitm0_c2fr
(xs: xs, work: (ni, ~x0)-<cfr>void): void
//
#symload irforitm0 with gseq_irforitm0_c2fr of 0100
#symload irforitm0_cfr with gseq_irforitm0_c2fr of 0100
//
fun
<xs:vt>
<x0:vt>
gseq_irforitm1_c2fr
(xs: xs, work: (ni, !x0)-<cfr>void): void
//
#symload irforitm1 with gseq_irforitm1_c2fr of 0100
#symload irforitm1_cfr with gseq_irforitm1_c2fr of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_folditm0(~xs, r0): (r0)
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_folditm1(!xs, r0): (r0)
//
(*
#symload folditm0 with gseq_folditm0 of 0100
#symload folditm1 with gseq_folditm1 of 0100
*)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_folditm0_c2fr
( xs: ~xs, r0: r0
, fopr: (r0, ~x0)-<cfr> (r0)): (r0)
//
#symload
folditm0 with gseq_folditm0_c2fr of 1000
#symload
folditm0_cfr with gseq_folditm0_c2fr of 1000
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_folditm1_c2fr
( xs: !xs, r0: r0
, fopr: (r0, !x0)-<cfr> (r0)): (r0)
//
#symload
folditm1 with gseq_folditm1_c2fr of 1000
#symload
folditm1_cfr with gseq_folditm1_c2fr of 1000
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_rfolditm0(~xs, r0): (r0)
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_rfolditm1(!xs, r0): (r0)
//
(*
#symload rfolditm0 with gseq_rfolditm0 of 0100
#symload rfolditm1 with gseq_rfolditm1 of 0100
*)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_rfolditm0_c2fr
( xs: ~xs, r0: r0
, fopr: (~x0, r0)-<cfr> (r0)): (r0)
//
#symload
rfolditm0 with gseq_rfolditm0_c2fr of 1000
#symload
rfolditm0_cfr with gseq_rfolditm0_c2fr of 1000
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_rfolditm1_c2fr
( xs: !xs, r0: r0
, fopr: (!x0, r0)-<cfr> (r0)): (r0)
//
#symload
rfolditm1 with gseq_rfolditm1_c2fr of 1000
#symload
rfolditm1_cfr with gseq_rfolditm1_c2fr of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_ifolditm0(~xs, r0): (r0)
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_ifolditm1(!xs, r0): (r0)
//
(*
#symload ifolditm0 with gseq_ifolditm0 of 0100
#symload ifolditm1 with gseq_ifolditm1 of 0100
*)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_ifolditm0_c3fr
( xs: ~xs, r0: r0
, fopr: (r0, ni, ~x0)-<cfr> (r0)): (r0)
//
#symload
ifolditm0 with gseq_ifolditm0_c3fr of 1000
#symload
ifolditm0_cfr with gseq_ifolditm0_c3fr of 1000
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_ifolditm1_c3fr
( xs: !xs, r0: r0
, fopr: (r0, ni, !x0)-<cfr> (r0)): (r0)
//
#symload
ifolditm1 with gseq_ifolditm1_c3fr of 1000
#symload
ifolditm1_cfr with gseq_ifolditm1_c3fr of 1000
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_irfolditm0(~xs, r0): (r0)
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_irfolditm1(!xs, r0): (r0)
//
(*
#symload irfolditm0 with gseq_irfolditm0 of 0100
#symload irfolditm1 with gseq_irfolditm1 of 0100
*)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_irfolditm0_c3fr
( xs: ~xs, r0: r0
, fopr: (ni, ~x0, r0)-<cfr> (r0)): (r0)
//
#symload
irfolditm0 with gseq_irfolditm0_c3fr of 1000
#symload
irfolditm0_cfr with gseq_irfolditm0_c3fr of 1000
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_irfolditm1_c3fr
( xs: !xs, r0: r0
, fopr: (ni, !x0, r0)-<cfr> (r0)): (r0)
//
#symload
irfolditm1 with gseq_irfolditm1_c3fr of 1000
#symload
irfolditm1_cfr with gseq_irfolditm1_c3fr of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_foldall0(~xs, r0): (r0)
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_foldall1(!xs, r0): (r0)
//
(*
#symload foldall0 with gseq_foldall0 of 0100
#symload foldall1 with gseq_foldall1 of 0100
*)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_foldall0_c2fr
( xs: ~xs, r0: r0
, fopr: (r0, ~x0)-<cfr>(bool,r0)): (r0)
//
#symload
foldall0 with gseq_foldall0_c2fr of 1000
#symload
foldall0_cfr with gseq_foldall0_c2fr of 1000
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_foldall1_c2fr
( xs: !xs, r0: r0
, fopr: (r0, !x0)-<cfr>(bool,r0)): (r0)
//
#symload
foldall1 with gseq_foldall1_c2fr of 1000
#symload
foldall1_cfr with gseq_foldall1_c2fr of 1000
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_rfoldall0(~xs, r0): (r0)
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_rfoldall1(!xs, r0): (r0)
//
(*
#symload rfoldall0 with gseq_rfoldall0 of 0100
#symload rfoldall1 with gseq_rfoldall1 of 0100
*)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_rfoldall0_c2fr
( xs: ~xs, r0: r0
, fopr: (~x0, r0)-<cfr>(bool,r0)): (r0)
//
#symload
rfoldall0 with gseq_rfoldall0_c2fr of 1000
#symload
rfoldall0_cfr with gseq_rfoldall0_c2fr of 1000
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_rfoldall1_c2fr
( xs: !xs, r0: r0
, fopr: (!x0, r0)-<cfr>(bool,r0)): (r0)
//
#symload
rfoldall1 with gseq_rfoldall1_c2fr of 1000
#symload
rfoldall1_cfr with gseq_rfoldall1_c2fr of 1000
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_ifoldall0(~xs, r0): (r0)
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_ifoldall1(!xs, r0): (r0)
//
(*
#symload ifoldall0 with gseq_ifoldall0 of 0100
#symload ifoldall1 with gseq_ifoldall1 of 0100
*)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_ifoldall0_c3fr
( xs: ~xs, r0: r0
, fopr: (ni,r0,~x0)-<cfr>(bool,r0)): (r0)
//
#symload
ifoldall0 with gseq_ifoldall0_c3fr of 1000
#symload
ifoldall0_cfr with gseq_ifoldall0_c3fr of 1000
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_ifoldall1_c3fr
( xs: !xs, r0: r0
, fopr: (ni,r0,!x0)-<cfr>(bool,r0)): (r0)
//
#symload
ifoldall1 with gseq_ifoldall1_c3fr of 1000
#symload
ifoldall1_cfr with gseq_ifoldall1_c3fr of 1000
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_irfoldall0(~xs, r0): (r0)
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_irfoldall1(!xs, r0): (r0)
//
(*
#symload irfoldall0 with gseq_irfoldall0 of 0100
#symload irfoldall1 with gseq_irfoldall1 of 0100
*)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_irfoldall0_c3fr
( xs: ~xs, r0: r0
, fopr: (ni,~x0,r0)-<cfr>(bool,r0)): (r0)
//
#symload
irfoldall0 with gseq_irfoldall0_c3fr of 1000
#symload
irfoldall0_cfr with gseq_irfoldall0_c3fr of 1000
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_irfoldall1_c3fr
( xs: !xs, r0: r0
, fopr: (ni,!x0,r0)-<cfr>(bool,r0)): (r0)
//
#symload
irfoldall1 with gseq_irfoldall1_c3fr of 1000
#symload
irfoldall1_cfr with gseq_irfoldall1_c3fr of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
gseq_map0_ares(xs: ~xs): (ys)
fun
<xs:vt>
<x0:vt>
<ys:vt>
gseq_map1_ares(xs: !xs): (ys)
//
fun
<xs:vt>
<x0:vt>
gseq_map0_self(xs: ~xs): (xs)
fun
<xs:vt>
<x0:vt>
gseq_map1_self(xs: !xs): (xs)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_map0_llist(xs: ~xs): list_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_map1_llist(xs: !xs): list_vt(y0)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_map0_f1un_llist
(xs: xs, fopr: (~x0)->(y0)): list_vt(y0)
//
#symload map0_llist with gseq_map0_f1un_llist of 0100
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_map1_f1un_llist
(xs: xs, fopr: (!x0)->(y0)): list_vt(y0)
//
#symload map1_llist with gseq_map1_f1un_llist of 0100
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_map0_lstrm(xs: ~xs): strm_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_map0_lstrq(xs: ~xs): strq_vt(y0)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_map1_lstrm(xs: !xs): strm_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_map1_lstrq(xs: !xs): strq_vt(y0)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_map0_f1un_lstrm
(xs: xs, fopr: (~x0)->(y0)): strm_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_map0_f1un_lstrq
(xs: xs, fopr: (~x0)->(y0)): strq_vt(y0)
//
#symload map0_lstrm with gseq_map0_f1un_lstrm of 0100
#symload map0_lstrq with gseq_map0_f1un_lstrq of 0100
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_map1_f1un_lstrm
(xs: xs, fopr: (!x0)->(y0)): strm_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_map1_f1un_lstrq
(xs: xs, fopr: (!x0)->(y0)): strq_vt(y0)
//
#symload map1_lstrm with gseq_map1_f1un_lstrm of 0100
#symload map1_lstrq with gseq_map1_f1un_lstrq of 0100
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_rmap0_llist(xs: ~xs): list_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_rmap1_llist(xs: !xs): list_vt(y0)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_rmap0_f1un_llist
(xs: xs, fopr: (~x0)->(y0)): list_vt(y0)
//
#symload rmap0_llist with gseq_rmap0_f1un_llist of 0100
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_rmap1_f1un_llist
(xs: xs, fopr: (!x0)->(y0)): list_vt(y0)
//
#symload rmap1_llist with gseq_rmap1_f1un_llist of 0100
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_rmap0_lstrm(xs: ~xs): strm_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_rmap0_lstrq(xs: ~xs): strq_vt(y0)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_rmap1_lstrm(xs: !xs): strm_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_rmap1_lstrq(xs: !xs): strq_vt(y0)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_rmap0_f1un_lstrm
(xs: xs, fopr: (~x0)->(y0)): strm_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_rmap0_f1un_lstrq
(xs: xs, fopr: (~x0)->(y0)): strq_vt(y0)
//
#symload rmap0_lstrm with gseq_rmap0_f1un_lstrm of 0100
#symload rmap0_lstrq with gseq_rmap0_f1un_lstrq of 0100
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_rmap1_f1un_lstrm
(xs: xs, fopr: (!x0)->(y0)): strm_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_rmap1_f1un_lstrq
(xs: xs, fopr: (!x0)->(y0)): strq_vt(y0)
//
#symload rmap1_lstrm with gseq_rmap1_f1un_lstrm of 0100
#symload rmap1_lstrq with gseq_rmap1_f1un_lstrq of 0100
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_imap0_llist(xs: ~xs): list_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_imap1_llist(xs: !xs): list_vt(y0)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_imap0_lstrm(xs: ~xs): strm_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_imap0_lstrq(xs: ~xs): strq_vt(y0)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_imap1_lstrm(xs: !xs): strm_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_imap1_lstrq(xs: !xs): strq_vt(y0)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_imap0_f1un_lstrm
(xs: xs, fopr: (ni,~x0)->(y0)): strm_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_imap0_f1un_lstrq
(xs: xs, fopr: (ni,~x0)->(y0)): strq_vt(y0)
//
#symload imap0_lstrm with gseq_imap0_f1un_lstrm of 0100
#symload imap0_lstrq with gseq_imap0_f1un_lstrq of 0100
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_imap1_f1un_lstrm
(xs: xs, fopr: (ni,!x0)->(y0)): strm_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_imap1_f1un_lstrq
(xs: xs, fopr: (ni,!x0)->(y0)): strq_vt(y0)
//
#symload imap1_lstrm with gseq_imap1_f1un_lstrm of 0100
#symload imap1_lstrq with gseq_imap1_f1un_lstrq of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-28:
Sun 28 Jul 2024 05:45:15 PM EDT
*)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_irmap0_llist(xs: ~xs): list_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_irmap1_llist(xs: !xs): list_vt(y0)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_irmap0_lstrm(xs: ~xs): strm_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_irmap0_lstrq(xs: ~xs): strq_vt(y0)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_irmap1_lstrm(xs: !xs): strm_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_irmap1_lstrq(xs: !xs): strq_vt(y0)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_irmap0_f1un_lstrm
(xs: xs, fopr: (ni,~x0)->(y0)): strm_vt(y0)
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_irmap0_f1un_lstrq
(xs: xs, fopr: (ni,~x0)->(y0)): strq_vt(y0)
//
#symload irmap0_lstrm with gseq_irmap0_f1un_lstrm of 0100
#symload irmap0_lstrq with gseq_irmap0_f1un_lstrq of 0100
//
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_irmap1_f1un_lstrm
(xs: xs, fopr: (ni,!x0)->(y0)): strm_vt(y0)
fun
<xs:vt>
<x0:vt>
<y0:vt>
gseq_irmap1_f1un_lstrq
(xs: xs, fopr: (ni,!x0)->(y0)): strq_vt(y0)
//
#symload irmap1_lstrm with gseq_irmap1_f1un_lstrm of 0100
#symload irmap1_lstrq with gseq_irmap1_f1un_lstrq of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
gseq_filter0_ares(xs: ~xs): (ys)
fun
<xs:vt>
<x0:vt>
<ys:vt>
gseq_filter1_ares(xs: !xs): (ys)
//
fun
<xs:vt>
<x0:vt>
gseq_filter0_self(xs: ~xs): (xs)
fun
<xs:vt>
<x0:vt>
gseq_filter1_self(xs: !xs): (xs)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_filter0_llist(xs: ~xs): list_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_filter1_llist(xs: !xs): list_vt(x0)
//
fun
<xs:vt>
<x0:vt>
gseq_filter0_f1un_llist
(xs: xs, fopr: (~x0)->bool): list_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_filter1_f1un_llist
(xs: xs, fopr: (!x0)->bool): list_vt(x0)
//
#symload filter0_llist with gseq_filter0_f1un_llist of 0100
#symload filter1_llist with gseq_filter1_f1un_llist of 0100
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_filter0_lstrm(xs: ~xs): strm_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_filter0_lstrq(xs: ~xs): strq_vt(x0)
//
fun
<xs:vt>
<x0:vt>
gseq_filter1_lstrm(xs: !xs): strm_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_filter1_lstrq(xs: !xs): strq_vt(x0)
//
fun
<xs:vt>
<x0:vt>
gseq_filter0_f1un_lstrm
(xs: xs, fopr: (~x0)->bool): strm_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_filter0_f1un_lstrq
(xs: xs, fopr: (~x0)->bool): strq_vt(x0)
//
#symload filter0_lstrm with gseq_filter0_f1un_lstrm of 0100
#symload filter0_lstrq with gseq_filter0_f1un_lstrq of 0100
//
fun
<xs:vt>
<x0:vt>
gseq_filter1_f1un_lstrm
(xs: xs, fopr: (!x0)->bool): strm_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_filter1_f1un_lstrq
(xs: xs, fopr: (!x0)->bool): strq_vt(x0)
//
#symload filter1_lstrm with gseq_filter1_f1un_lstrm of 0100
#symload filter1_lstrq with gseq_filter1_f1un_lstrq of 0100
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_rfilter0_llist(xs: ~xs): list_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_rfilter1_llist(xs: !xs): list_vt(x0)
//
fun
<xs:vt>
<x0:vt>
gseq_rfilter0_f1un_llist
(xs: xs, fopr: (~x0)->bool): list_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_rfilter1_f1un_llist
(xs: xs, fopr: (!x0)->bool): list_vt(x0)
//
#symload rfilter0_llist with gseq_rfilter0_f1un_llist of 0100
#symload rfilter1_llist with gseq_rfilter1_f1un_llist of 0100
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_rfilter0_lstrm(xs: ~xs): strm_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_rfilter0_lstrq(xs: ~xs): strq_vt(x0)
//
fun
<xs:vt>
<x0:vt>
gseq_rfilter1_lstrm(xs: !xs): strm_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_rfilter1_lstrq(xs: !xs): strq_vt(x0)
//
fun
<xs:vt>
<x0:vt>
gseq_rfilter0_f1un_lstrm
(xs: xs, fopr: (~x0)->bool): strm_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_rfilter0_f1un_lstrq
(xs: xs, fopr: (~x0)->bool): strq_vt(x0)
//
#symload rfilter0_lstrm with gseq_rfilter0_f1un_lstrm of 0100
#symload rfilter0_lstrq with gseq_rfilter0_f1un_lstrq of 0100
//
fun
<xs:vt>
<x0:vt>
gseq_rfilter1_f1un_lstrm
(xs: xs, fopr: (!x0)->bool): strm_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_rfilter1_f1un_lstrq
(xs: xs, fopr: (!x0)->bool): strq_vt(x0)
//
#symload rfilter1_lstrm with gseq_rfilter1_f1un_lstrm of 0100
#symload rfilter1_lstrq with gseq_rfilter1_f1un_lstrq of 0100
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_ifilter0_llist(xs: ~xs): list_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_ifilter1_llist(xs: !xs): list_vt(x0)
//
fun
<xs:vt>
<x0:vt>
gseq_ifilter0_f1un_llist
(xs: xs, fopr: (ni,~x0)->bool): list_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_ifilter1_f1un_llist
(xs: xs, fopr: (ni,!x0)->bool): list_vt(x0)
//
#symload ifilter0_llist with gseq_ifilter0_f1un_llist of 0100
#symload ifilter1_llist with gseq_ifilter1_f1un_llist of 0100
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_ifilter0_lstrm(xs: ~xs): strm_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_ifilter0_lstrq(xs: ~xs): strq_vt(x0)
//
fun
<xs:vt>
<x0:vt>
gseq_ifilter1_lstrm(xs: !xs): strm_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_ifilter1_lstrq(xs: !xs): strq_vt(x0)
//
fun
<xs:vt>
<x0:vt>
gseq_ifilter0_f1un_lstrm
(xs: xs, fopr: (ni,~x0)->bool): strm_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_ifilter0_f1un_lstrq
(xs: xs, fopr: (ni,~x0)->bool): strq_vt(x0)
//
#symload ifilter0_lstrm with gseq_ifilter0_f1un_lstrm of 0100
#symload ifilter0_lstrq with gseq_ifilter0_f1un_lstrq of 0100
//
fun
<xs:vt>
<x0:vt>
gseq_ifilter1_f1un_lstrm
(xs: xs, fopr: (ni,!x0)->bool): strm_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_ifilter1_f1un_lstrq
(xs: xs, fopr: (ni,!x0)->bool): strq_vt(x0)
//
#symload ifilter1_lstrm with gseq_ifilter1_f1un_lstrm of 0100
#symload ifilter1_lstrq with gseq_ifilter1_f1un_lstrq of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_VT_gseq001_vt.sats] *)
