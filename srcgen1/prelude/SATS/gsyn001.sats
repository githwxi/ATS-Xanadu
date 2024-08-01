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
Wed 31 Jul 2024 03:49:34 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<y0:t0>
gs_forall_a1(y0): bool
fun
<y0:t0>
<y1:t0>
gs_forall_a2(y0, y1): bool
fun
<y0:t0>
<y1:t0>
<y2:t0>
gs_forall_a3(y0, y1, y2): bool
//
fun
<y0:t0>
<y1:t0>
<y2:t0>
<y3:t0>
gs_forall_a4(y0, y1, y2, y3): bool
//
fun
<y0:t0>
<y1:t0>
<y2:t0>
<y3:t0>
<y4:t0>
gs_forall_a5(y0, y1, y2, y3, y4): bool
//
fun
<y0:t0>
<y1:t0>
<y2:t0>
<y3:t0>
<y4:t0>
<y5:t0>
gs_forall_a6(y0, y1, y2, y3, y4, y5): bool
//
fun
<y0:t0>
<y1:t0>
<y2:t0>
<y3:t0>
<y4:t0>
<y5:t0>
<y6:t0>
gs_forall_a7(y0, y1, y2, y3, y4, y5, y6): bool
//
fun
<y0:t0>
<y1:t0>
<y2:t0>
<y3:t0>
<y4:t0>
<y5:t0>
<y6:t0>
<y7:t0>
gs_forall_a8(y0, y1, y2, y3, y4, y5, y6, y7): bool
//
fun
<y0:t0>
<y1:t0>
<y2:t0>
<y3:t0>
<y4:t0>
<y5:t0>
<y6:t0>
<y7:t0>
<y8:t0>
gs_forall_a9(y0, y1, y2, y3, y4, y5, y6, y7, y8): bool
//
fun
<y0:t0>
<y1:t0>
<y2:t0>
<y3:t0>
<y4:t0>
<y5:t0>
<y6:t0>
<y7:t0>
<y8:t0>
<y9:t0>
gs_forall_a10(y0, y1, y2, y3, y4, y5, y6, y7, y8, y9): bool
//
(* ****** ****** *)
//
fun
<y0:t0>
<y1:t0>
<y2:t0>
<y3:t0>
<y4:t0>
<y5:t0>
<y6:t0>
<y7:t0>
<y8:t0>
<y9:t0>
<y10:t0>
gs_forall_a11(y0, y1, y2, y3, y4, y5, y6, y7, y8, y9, y10): bool
//
fun
<y0:t0>
<y1:t0>
<y2:t0>
<y3:t0>
<y4:t0>
<y5:t0>
<y6:t0>
<y7:t0>
<y8:t0>
<y9:t0>
<y10:t0>
<y11:t0>
gs_forall_a12(y0, y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11): bool
//
(* ****** ****** *)
//
#symload foralls with gs_forall_a1
#symload foralls with gs_forall_a2
#symload foralls with gs_forall_a3
#symload foralls with gs_forall_a4
#symload foralls with gs_forall_a5
#symload foralls with gs_forall_a6
#symload foralls with gs_forall_a7
#symload foralls with gs_forall_a8
#symload foralls with gs_forall_a9
#symload foralls with gs_forall_a10
#symload foralls with gs_forall_a11
#symload foralls with gs_forall_a12
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<y0:t0>
gs_foritm_a1(y0): void
fun
<y0:t0>
<y1:t0>
gs_foritm_a2(y0, y1): void
fun
<y0:t0>
<y1:t0>
<y2:t0>
gs_foritm_a3(y0, y1, y2): void
//
fun
<y0:t0>
<y1:t0>
<y2:t0>
<y3:t0>
gs_foritm_a4(y0, y1, y2, y3): void
//
fun
<y0:t0>
<y1:t0>
<y2:t0>
<y3:t0>
<y4:t0>
gs_foritm_a5(y0, y1, y2, y3, y4): void
//
fun
<y0:t0>
<y1:t0>
<y2:t0>
<y3:t0>
<y4:t0>
<y5:t0>
gs_foritm_a6(y0, y1, y2, y3, y4, y5): void
//
fun
<y0:t0>
<y1:t0>
<y2:t0>
<y3:t0>
<y4:t0>
<y5:t0>
<y6:t0>
gs_foritm_a7(y0, y1, y2, y3, y4, y5, y6): void
//
fun
<y0:t0>
<y1:t0>
<y2:t0>
<y3:t0>
<y4:t0>
<y5:t0>
<y6:t0>
<y7:t0>
gs_foritm_a8(y0, y1, y2, y3, y4, y5, y6, y7): void
//
fun
<y0:t0>
<y1:t0>
<y2:t0>
<y3:t0>
<y4:t0>
<y5:t0>
<y6:t0>
<y7:t0>
<y8:t0>
gs_foritm_a9(y0, y1, y2, y3, y4, y5, y6, y7, y8): void
//
fun
<y0:t0>
<y1:t0>
<y2:t0>
<y3:t0>
<y4:t0>
<y5:t0>
<y6:t0>
<y7:t0>
<y8:t0>
<y9:t0>
gs_foritm_a10(y0, y1, y2, y3, y4, y5, y6, y7, y8, y9): void
//
(* ****** ****** *)
//
fun
<y0:t0>
<y1:t0>
<y2:t0>
<y3:t0>
<y4:t0>
<y5:t0>
<y6:t0>
<y7:t0>
<y8:t0>
<y9:t0>
<y10:t0>
gs_foritm_a11(y0, y1, y2, y3, y4, y5, y6, y7, y8, y9, y10): void
//
fun
<y0:t0>
<y1:t0>
<y2:t0>
<y3:t0>
<y4:t0>
<y5:t0>
<y6:t0>
<y7:t0>
<y8:t0>
<y9:t0>
<y10:t0>
<y11:t0>
gs_foritm_a12(y0, y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11): void
//
(* ****** ****** *)
//
#symload foritms with gs_foritm_a1
#symload foritms with gs_foritm_a2
#symload foritms with gs_foritm_a3
#symload foritms with gs_foritm_a4
#symload foritms with gs_foritm_a5
#symload foritms with gs_foritm_a6
#symload foritms with gs_foritm_a7
#symload foritms with gs_foritm_a8
#symload foritms with gs_foritm_a9
#symload foritms with gs_foritm_a10
#symload foritms with gs_foritm_a11
#symload foritms with gs_foritm_a12
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gsyn001.sats] *)
