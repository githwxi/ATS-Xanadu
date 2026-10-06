(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
Tue Oct  6 08:44:22 AM EDT 2026
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
gstack_vt_size1(xs: !xs): nint
fun
<xs:vt>
<x0:vt>
gstack_vt_capcity1(xs: !xs): nint
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gstack_vt_remove$opt1(xs: !xs): bool
//
fun
<xs:vt>
<x0:vt>
gstack_vt_getout$old1(xs: !xs): (x0)
fun
<xs:vt>
<x0:vt>
gstack_vt_getout$opt1(xs: !xs): luopt(x0)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gstack_vt_insert$new1(xs: !xs, x0: ~x0): void
fun
<xs:vt>
<x0:vt>
gstack_vt_insert$opt1(xs: !xs, x0: ~x0): luopt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_almanac_pre2026_SATS_VT_gstack0_vt.sats] *)
(***********************************************************************)
