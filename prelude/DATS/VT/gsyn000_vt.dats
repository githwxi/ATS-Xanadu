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
Sun 28 Jul 2024 04:18:27 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
gs_print$beg0() = ()
//
#impltmp
<(*tmp*)>
gs_print$end0() = ()
(*
#impltmp
<(*tmp*)>
gs_print$end0() = strn_print("\n")
*)
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
gs_print0_a1
  ( x0 ) =
( gs_print$beg0<>();
(
  g_print0<x0>(x0))
; gs_print$end0<>())
//
#impltmp
< x0:vt >
< x1:vt >
gs_print0_a2
  (x0, x1) =
( gs_print$beg0<>();
( g_print0<x0>(x0); g_print0<x1>(x1))
; gs_print$end0<>())
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
gs_print0_a3
  (x0, x1, x2) =
( gs_print$beg0<>();
( g_print0<x0>(x0)
; g_print0<x1>(x1); g_print0<x2>(x2))
; gs_print$end0<>())
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
< x3:vt >
gs_print0_a4
  (x0, x1, x2, x3) =
( gs_print$beg0<>();
( g_print0<x0>(x0); g_print0<x1>(x1)
; g_print0<x2>(x2); g_print0<x3>(x3))
; gs_print$end0<>())
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
< x3:vt >
< x4:vt >
gs_print0_a5
  (x0, x1, x2, x3, x4) =
( gs_print$beg0<>();
( g_print0<x0>(x0); g_print0<x1>(x1)
; g_print0<x2>(x2); g_print0<x3>(x3); g_print0<x4>(x4))
; gs_print$end0<>())
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
< x3:vt >
< x4:vt >
< x5:vt >
gs_print0_a6
  (x0, x1, x2, x3, x4, x5) =
( gs_print$beg0<>();
( g_print0<x0>(x0); g_print0<x1>(x1); g_print0<x2>(x2)
; g_print0<x3>(x3); g_print0<x4>(x4); g_print0<x5>(x5))
; gs_print$end0<>())
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
< x3:vt >
< x4:vt >
< x5:vt >
< x6:vt >
gs_print0_a7
  (x0, x1, x2, x3, x4, x5, x6) =
( gs_print$beg0<>();
( g_print0<x0>(x0)
; g_print0<x1>(x1); g_print0<x2>(x2); g_print0<x3>(x3)
; g_print0<x4>(x4); g_print0<x5>(x5); g_print0<x6>(x6))
; gs_print$end0<>())
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
< x3:vt >
< x4:vt >
< x5:vt >
< x6:vt >
< x7:vt >
gs_print0_a8
  (x0, x1, x2, x3, x4, x5, x6, x7) =
( gs_print$beg0<>();
( g_print0<x0>(x0); g_print0<x1>(x1)
; g_print0<x2>(x2); g_print0<x3>(x3); g_print0<x4>(x4)
; g_print0<x5>(x5); g_print0<x6>(x6); g_print0<x7>(x7))
; gs_print$end0<>())
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
< x3:vt >
< x4:vt >
< x5:vt >
< x6:vt >
< x7:vt >
< x8:vt >
gs_print0_a9
  (x0, x1, x2, x3, x4, x5, x6, x7, x8) =
( gs_print$beg0<>();
( g_print0<x0>(x0); g_print0<x1>(x1); g_print0<x2>(x2)
; g_print0<x3>(x3); g_print0<x4>(x4); g_print0<x5>(x5)
; g_print0<x6>(x6); g_print0<x7>(x7); g_print0<x8>(x8))
; gs_print$end0<>())
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
< x3:vt >
< x4:vt >
< x5:vt >
< x6:vt >
< x7:vt >
< x8:vt >
< x9:vt >
gs_print0_a10
  (x0, x1, x2, x3, x4, x5, x6, x7, x8, x9) =
( gs_print$beg0<>();
( g_print0<x0>(x0); g_print0<x1>(x1); g_print0<x2>(x2)
; g_print0<x3>(x3); g_print0<x4>(x4); g_print0<x5>(x5)
; g_print0<x6>(x6); g_print0<x7>(x7); g_print0<x8>(x8); g_print0<x9>(x9))
; gs_print$end0<>())
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
< x3:vt >
< x4:vt >
< x5:vt >
< x6:vt >
< x7:vt >
< x8:vt >
< x9:vt >
< x10:vt >
gs_print0_a11
  (x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10) =
( gs_print$beg0<>();
( g_print0<x0>(x0); g_print0<x1>(x1); g_print0<x2>(x2)
; g_print0<x3>(x3); g_print0<x4>(x4); g_print0<x5>(x5); g_print0<x6>(x6)
; g_print0<x7>(x7); g_print0<x8>(x8); g_print0<x9>(x9); g_print0<x10>(x10))
; gs_print$end0<>())
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
< x3:vt >
< x4:vt >
< x5:vt >
< x6:vt >
< x7:vt >
< x8:vt >
< x9:vt >
< x10:vt >
< x11:vt >
gs_print0_a12
  (x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11) =
( gs_print$beg0<>();
( g_print0<x0>(x0); g_print0<x1>(x1); g_print0<x2>(x2); g_print0<x3>(x3)
; g_print0<x4>(x4); g_print0<x5>(x5); g_print0<x6>(x6); g_print0<x7>(x7)
; g_print0<x8>(x8); g_print0<x9>(x9); g_print0<x10>(x10); g_print0<x11>(x11))
; gs_print$end0<>())
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
gs_print$beg1() = ()
//
#impltmp
<(*tmp*)>
gs_print$end1() = ()
(*
#impltmp
<(*tmp*)>
gs_print$end1() = strn_print("\n")
*)
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
gs_print1_a1
  ( x0 ) =
( gs_print$beg1<>();
(
  g_print1<x0>(x0))
; gs_print$end1<>())
//
#impltmp
< x0:vt >
< x1:vt >
gs_print1_a2
  (x0, x1) =
( gs_print$beg1<>();
( g_print1<x0>(x0); g_print1<x1>(x1))
; gs_print$end1<>())
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
gs_print1_a3
  (x0, x1, x2) =
( gs_print$beg1<>();
( g_print1<x0>(x0)
; g_print1<x1>(x1); g_print1<x2>(x2))
; gs_print$end1<>())
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
< x3:vt >
gs_print1_a4
  (x0, x1, x2, x3) =
( gs_print$beg1<>();
( g_print1<x0>(x0); g_print1<x1>(x1)
; g_print1<x2>(x2); g_print1<x3>(x3))
; gs_print$end1<>())
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
< x3:vt >
< x4:vt >
gs_print1_a5
  (x0, x1, x2, x3, x4) =
( gs_print$beg1<>();
( g_print1<x0>(x0); g_print1<x1>(x1)
; g_print1<x2>(x2); g_print1<x3>(x3); g_print1<x4>(x4))
; gs_print$end1<>())
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
< x3:vt >
< x4:vt >
< x5:vt >
gs_print1_a6
  (x0, x1, x2, x3, x4, x5) =
( gs_print$beg1<>();
( g_print1<x0>(x0); g_print1<x1>(x1); g_print1<x2>(x2)
; g_print1<x3>(x3); g_print1<x4>(x4); g_print1<x5>(x5))
; gs_print$end1<>())
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
< x3:vt >
< x4:vt >
< x5:vt >
< x6:vt >
gs_print1_a7
  (x0, x1, x2, x3, x4, x5, x6) =
( gs_print$beg1<>();
( g_print1<x0>(x0)
; g_print1<x1>(x1); g_print1<x2>(x2); g_print1<x3>(x3)
; g_print1<x4>(x4); g_print1<x5>(x5); g_print1<x6>(x6))
; gs_print$end1<>())
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
< x3:vt >
< x4:vt >
< x5:vt >
< x6:vt >
< x7:vt >
gs_print1_a8
  (x0, x1, x2, x3, x4, x5, x6, x7) =
( gs_print$beg1<>();
( g_print1<x0>(x0); g_print1<x1>(x1)
; g_print1<x2>(x2); g_print1<x3>(x3); g_print1<x4>(x4)
; g_print1<x5>(x5); g_print1<x6>(x6); g_print1<x7>(x7))
; gs_print$end1<>())
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
< x3:vt >
< x4:vt >
< x5:vt >
< x6:vt >
< x7:vt >
< x8:vt >
gs_print1_a9
  (x0, x1, x2, x3, x4, x5, x6, x7, x8) =
( gs_print$beg1<>();
( g_print1<x0>(x0); g_print1<x1>(x1); g_print1<x2>(x2)
; g_print1<x3>(x3); g_print1<x4>(x4); g_print1<x5>(x5)
; g_print1<x6>(x6); g_print1<x7>(x7); g_print1<x8>(x8))
; gs_print$end1<>())
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
< x3:vt >
< x4:vt >
< x5:vt >
< x6:vt >
< x7:vt >
< x8:vt >
< x9:vt >
gs_print1_a10
  (x0, x1, x2, x3, x4, x5, x6, x7, x8, x9) =
( gs_print$beg1<>();
( g_print1<x0>(x0); g_print1<x1>(x1); g_print1<x2>(x2)
; g_print1<x3>(x3); g_print1<x4>(x4); g_print1<x5>(x5)
; g_print1<x6>(x6); g_print1<x7>(x7); g_print1<x8>(x8); g_print1<x9>(x9))
; gs_print$end1<>())
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
< x3:vt >
< x4:vt >
< x5:vt >
< x6:vt >
< x7:vt >
< x8:vt >
< x9:vt >
< x10:vt >
gs_print1_a11
  (x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10) =
( gs_print$beg1<>();
( g_print1<x0>(x0); g_print1<x1>(x1); g_print1<x2>(x2)
; g_print1<x3>(x3); g_print1<x4>(x4); g_print1<x5>(x5); g_print1<x6>(x6)
; g_print1<x7>(x7); g_print1<x8>(x8); g_print1<x9>(x9); g_print1<x10>(x10))
; gs_print$end1<>())
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
< x3:vt >
< x4:vt >
< x5:vt >
< x6:vt >
< x7:vt >
< x8:vt >
< x9:vt >
< x10:vt >
< x11:vt >
gs_print1_a12
  (x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11) =
( gs_print$beg1<>();
( g_print1<x0>(x0); g_print1<x1>(x1); g_print1<x2>(x2); g_print1<x3>(x3)
; g_print1<x4>(x4); g_print1<x5>(x5); g_print1<x6>(x6); g_print1<x7>(x7)
; g_print1<x8>(x8); g_print1<x9>(x9); g_print1<x10>(x10); g_print1<x11>(x11))
; gs_print$end1<>())
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_VT_gsyn000_vt.dats] *)
