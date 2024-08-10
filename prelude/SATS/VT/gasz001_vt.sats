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
Mon 22 Jul 2024 12:14:37 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gasz_listize0
(xs: ~xs): list_vt(x0)//fun
//
fun
<xs:vt>
<x0:vt>
gasz_strmize0
(xs: ~xs): strm_vt(x0)//fun
fun
<xs:vt>
<x0:vt>
gasz_strqize0
(xs: ~xs): strq_vt(x0)//fun
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gasz_rlistize0
(xs: ~xs): list_vt(x0)//fun
//
fun
<xs:vt>
<x0:vt>
gasz_rstrmize0
(xs: ~xs): strm_vt(x0)//fun
fun
<xs:vt>
<x0:vt>
gasz_rstrqize0
(xs: ~xs): strq_vt(x0)//fun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gasz_forall0(xs: ~xs): bool
fun
<xs:vt>
<x0:vt>
gasz_forall1(xs: !xs): bool
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gasz_rforall0(xs: ~xs): bool
fun
<xs:vt>
<x0:vt>
gasz_rforall1(xs: !xs): bool
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gasz_iforall0(xs: ~xs): bool
fun
<xs:vt>
<x0:vt>
gasz_iforall1(xs: !xs): bool
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gasz_irforall0(xs: ~xs): bool
fun
<xs:vt>
<x0:vt>
gasz_irforall1(xs: !xs): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_VT_gasz001_vt.sats] *)
