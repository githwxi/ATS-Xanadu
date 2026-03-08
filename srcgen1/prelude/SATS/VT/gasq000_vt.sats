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
(*
#include
"./../../../../prelude/SATS/VT/gasq000_vt.sats"
*)
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
#typedef si = sint
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gasq_length1(xs: !xs): nint
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:t0> // HX: t0(not(vt))
gasq_get$at1
(xs: !xs, i0: ni): (x0)
fun
<xs:vt>
<x0:t0> // HX: t0(not(vt))
gasq_set$at1
(xs: !xs, i0: ni, x0: x0): void
//
(* ****** ****** *)
(* ****** ****** *)
(*
#include
"./../../../../prelude/SATS/VT/gasq001_vt.sats"
*)
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gasq_listize0
(xs: ~xs): list_vt(x0)//fun
//
fun
<xs:vt>
<x0:vt>
gasq_strmize0
(xs: ~xs): strm_vt(x0)//fun
fun
<xs:vt>
<x0:vt>
gasq_strqize0
(xs: ~xs): strq_vt(x0)//fun
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gasq_rlistize0
(xs: ~xs): list_vt(x0)//fun
//
fun
<xs:vt>
<x0:vt>
gasq_rstrmize0
(xs: ~xs): strm_vt(x0)//fun
fun
<xs:vt>
<x0:vt>
gasq_rstrqize0
(xs: ~xs): strq_vt(x0)//fun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gasq_forall0(xs: ~xs): bool
fun
<xs:vt>
<x0:vt>
gasq_forall1(xs: !xs): bool
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gasq_rforall0(xs: ~xs): bool
fun
<xs:vt>
<x0:vt>
gasq_rforall1(xs: !xs): bool
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gasq_iforall0(xs: ~xs): bool
fun
<xs:vt>
<x0:vt>
gasq_iforall1(xs: !xs): bool
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gasq_irforall0(xs: ~xs): bool
fun
<xs:vt>
<x0:vt>
gasq_irforall1(xs: !xs): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen1_prelude_SATS_VT_gasq000_vt.sats] *)
(***********************************************************************)
