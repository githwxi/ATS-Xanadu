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
Sat 27 Jul 2024 01:32:19 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
(* ****** ****** *)
(* ****** ****** *)
#staload
"./../SATS/gsyn000.sats"
(* ****** ****** *)
(* ****** ****** *)
#impltmp
<(*tmp*)>
gs_print$beg() = ()
//
#impltmp
<(*tmp*)>
gs_print$end() = ()
(*
#impltmp
<(*tmp*)>
gs_print$end() =
(
  strn_print("\n"))
*)
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
gs_print_a1
  ( x0 ) =
( gs_print$beg<>();
(
  g_print<x0>(x0))
; gs_print$end<>())
//
#impltmp
< x0:t0 >
< x1:t0 >
gs_print_a2
  (x0, x1) =
( gs_print$beg<>();
( g_print<x0>(x0); g_print<x1>(x1))
; gs_print$end<>())
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
gs_print_a3
  (x0, x1, x2) =
( gs_print$beg<>();
( g_print<x0>(x0)
; g_print<x1>(x1); g_print<x2>(x2); gs_print$end<>())
; gs_print$end<>())
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
gs_print_a4
  (x0, x1, x2, x3) =
( gs_print$beg<>();
( g_print<x0>(x0); g_print<x1>(x1)
; g_print<x2>(x2); g_print<x3>(x3); gs_print$end<>())
; gs_print$end<>())
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
gs_print_a5
  (x0, x1, x2, x3, x4) =
( gs_print$beg<>();
( g_print<x0>(x0); g_print<x1>(x1)
; g_print<x2>(x2); g_print<x3>(x3); g_print<x4>(x4); gs_print$end<>())
; gs_print$end<>())
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
gs_print_a6
  (x0, x1, x2, x3, x4, x5) =
( gs_print$beg<>();
( g_print<x0>(x0); g_print<x1>(x1); g_print<x2>(x2)
; g_print<x3>(x3); g_print<x4>(x4); g_print<x5>(x5); gs_print$end<>())
; gs_print$end<>())
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
gs_print_a7
  (x0, x1, x2, x3, x4, x5, x6) =
( gs_print$beg<>();
( g_print<x0>(x0)
; g_print<x1>(x1); g_print<x2>(x2); g_print<x3>(x3)
; g_print<x4>(x4); g_print<x5>(x5); g_print<x6>(x6); gs_print$end<>())
; gs_print$end<>())
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
< x7:t0 >
gs_print_a8
  (x0, x1, x2, x3, x4, x5, x6, x7) =
( gs_print$beg<>();
( g_print<x0>(x0); g_print<x1>(x1)
; g_print<x2>(x2); g_print<x3>(x3); g_print<x4>(x4)
; g_print<x5>(x5); g_print<x6>(x6); g_print<x7>(x7))
; gs_print$end<>())
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
< x7:t0 >
< x8:t0 >
gs_print_a9
  (x0, x1, x2, x3, x4, x5, x6, x7, x8) =
( gs_print$beg<>();
( g_print<x0>(x0); g_print<x1>(x1); g_print<x2>(x2)
; g_print<x3>(x3); g_print<x4>(x4); g_print<x5>(x5)
; g_print<x6>(x6); g_print<x7>(x7); g_print<x8>(x8))
; gs_print$end<>())
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
< x7:t0 >
< x8:t0 >
< x9:t0 >
gs_print_a10
  (x0, x1, x2, x3, x4, x5, x6, x7, x8, x9) =
( gs_print$beg<>();
( g_print<x0>(x0); g_print<x1>(x1); g_print<x2>(x2)
; g_print<x3>(x3); g_print<x4>(x4); g_print<x5>(x5)
; g_print<x6>(x6); g_print<x7>(x7); g_print<x8>(x8); g_print<x9>(x9))
; gs_print$end<>())
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
< x7:t0 >
< x8:t0 >
< x9:t0 >
< x10:t0 >
gs_print_a11
  (x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10) =
( gs_print$beg<>();
( g_print<x0>(x0); g_print<x1>(x1); g_print<x2>(x2)
; g_print<x3>(x3); g_print<x4>(x4); g_print<x5>(x5); g_print<x6>(x6)
; g_print<x7>(x7); g_print<x8>(x8); g_print<x9>(x9); g_print<x10>(x10))
; gs_print$end<>())
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
< x7:t0 >
< x8:t0 >
< x9:t0 >
< x10:t0 >
< x11:t0 >
gs_print_a12
  (x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11) =
( gs_print$beg<>();
( g_print<x0>(x0); g_print<x1>(x1); g_print<x2>(x2); g_print<x3>(x3)
; g_print<x4>(x4); g_print<x5>(x5); g_print<x6>(x6); g_print<x7>(x7)
; g_print<x8>(x8); g_print<x9>(x9); g_print<x10>(x10); g_print<x11>(x11))
; gs_print$end<>())
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gsyn000.sats] *)
