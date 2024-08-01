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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Wed 31 Jul 2024 04:11:39 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< y0:t0 >
gs_foritm_a1
  ( y0 ) =
(
  g_foritm<y0>(y0))
//
#impltmp
< y0:t0 >
< y1:t0 >
gs_foritm_a2
  (y0, y1) =
(
  g_foritm<y0>(y0); g_foritm<y1>(y1))
//
#impltmp
< y0:t0 >
< y1:t0 >
< y2:t0 >
gs_foritm_a3
  (y0, y1, y2) =
(
  g_foritm<y0>(y0)
; g_foritm<y1>(y1); g_foritm<y2>(y2))
//
#impltmp
< y0:t0 >
< y1:t0 >
< y2:t0 >
< y3:t0 >
gs_foritm_a4
  (y0, y1, y2, y3) =
(
  g_foritm<y0>(y0); g_foritm<y1>(y1)
; g_foritm<y2>(y2); g_foritm<y3>(y3))
//
#impltmp
< y0:t0 >
< y1:t0 >
< y2:t0 >
< y3:t0 >
< y4:t0 >
gs_foritm_a5
  (y0, y1, y2, y3, y4) =
(
  g_foritm<y0>(y0); g_foritm<y1>(y1)
; g_foritm<y2>(y2); g_foritm<y3>(y3); g_foritm<y4>(y4))
//
#impltmp
< y0:t0 >
< y1:t0 >
< y2:t0 >
< y3:t0 >
< y4:t0 >
< y5:t0 >
gs_foritm_a6
  (y0, y1, y2, y3, y4, y5) =
(
  g_foritm<y0>(y0); g_foritm<y1>(y1); g_foritm<y2>(y2)
; g_foritm<y3>(y3); g_foritm<y4>(y4); g_foritm<y5>(y5))
//
#impltmp
< y0:t0 >
< y1:t0 >
< y2:t0 >
< y3:t0 >
< y4:t0 >
< y5:t0 >
< y6:t0 >
gs_foritm_a7
  (y0, y1, y2, y3, y4, y5, y6) =
(
  g_foritm<y0>(y0)
; g_foritm<y1>(y1); g_foritm<y2>(y2); g_foritm<y3>(y3)
; g_foritm<y4>(y4); g_foritm<y5>(y5); g_foritm<y6>(y6))
//
#impltmp
< y0:t0 >
< y1:t0 >
< y2:t0 >
< y3:t0 >
< y4:t0 >
< y5:t0 >
< y6:t0 >
< y7:t0 >
gs_foritm_a8
  (y0, y1, y2, y3, y4, y5, y6, y7) =
(
  g_foritm<y0>(y0); g_foritm<y1>(y1)
; g_foritm<y2>(y2); g_foritm<y3>(y3); g_foritm<y4>(y4)
; g_foritm<y5>(y5); g_foritm<y6>(y6); g_foritm<y7>(y7))
//
#impltmp
< y0:t0 >
< y1:t0 >
< y2:t0 >
< y3:t0 >
< y4:t0 >
< y5:t0 >
< y6:t0 >
< y7:t0 >
< y8:t0 >
gs_foritm_a9
  (y0, y1, y2, y3, y4, y5, y6, y7, y8) =
(
  g_foritm<y0>(y0); g_foritm<y1>(y1); g_foritm<y2>(y2)
; g_foritm<y3>(y3); g_foritm<y4>(y4); g_foritm<y5>(y5)
; g_foritm<y6>(y6); g_foritm<y7>(y7); g_foritm<y8>(y8))
//
#impltmp
< y0:t0 >
< y1:t0 >
< y2:t0 >
< y3:t0 >
< y4:t0 >
< y5:t0 >
< y6:t0 >
< y7:t0 >
< y8:t0 >
< y9:t0 >
gs_foritm_a10
  (y0, y1, y2, y3, y4, y5, y6, y7, y8, y9) =
(
  g_foritm<y0>(y0)
; g_foritm<y1>(y1); g_foritm<y2>(y2); g_foritm<y3>(y3)
; g_foritm<y4>(y4); g_foritm<y5>(y5); g_foritm<y6>(y6)
; g_foritm<y7>(y7); g_foritm<y8>(y8); g_foritm<y9>(y9))
//
#impltmp
< y0:t0 >
< y1:t0 >
< y2:t0 >
< y3:t0 >
< y4:t0 >
< y5:t0 >
< y6:t0 >
< y7:t0 >
< y8:t0 >
< y9:t0 >
< y10:t0 >
gs_foritm_a11
  (y0, y1, y2, y3, y4, y5, y6, y7, y8, y9, y10) =
(
  g_foritm<y0>(y0); g_foritm<y1>(y1)
; g_foritm<y2>(y2); g_foritm<y3>(y3); g_foritm<y4>(y4)
; g_foritm<y5>(y5); g_foritm<y6>(y6); g_foritm<y7>(y7)
; g_foritm<y8>(y8); g_foritm<y9>(y9); g_foritm<y10>(y10))
//
#impltmp
< y0:t0 >
< y1:t0 >
< y2:t0 >
< y3:t0 >
< y4:t0 >
< y5:t0 >
< y6:t0 >
< y7:t0 >
< y8:t0 >
< y9:t0 >
< y10:t0 >
< y11:t0 >
gs_foritm_a12
  (y0, y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11) =
(
  g_foritm<y0>(y0); g_foritm<y1>(y1); g_foritm<y2>(y2)
; g_foritm<y3>(y3); g_foritm<y4>(y4); g_foritm<y5>(y5)
; g_foritm<y6>(y6); g_foritm<y7>(y7); g_foritm<y8>(y8)
; g_foritm<y9>(y9); g_foritm<y10>(y10); g_foritm<y11>(y11))
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gsyn001.dats] *)
