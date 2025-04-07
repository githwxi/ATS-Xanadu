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
Sat 10 Aug 2024 03:06:45 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
g_lt00(~a, ~a): bool
fun
<a:vt>
g_lt11(!a, !a): bool
//
fun
<a:vt>
g_gt00(~a, ~a): bool
fun
<a:vt>
g_gt11(!a, !a): bool
//
fun
<a:vt>
g_lte00(~a, ~a): bool
fun
<a:vt>
g_lte11(!a, !a): bool
//
fun
<a:vt>
g_gte00(~a, ~a): bool
fun
<a:vt>
g_gte11(!a, !a): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
g_cmp00(~a, ~a): sint
fun
<a:vt>
g_cmp11(!a, !a): sint
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_VT_gord000_vt.sats] *)
