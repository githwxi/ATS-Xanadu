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
Mon 02 Sep 2024 02:43:08 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
optn_vt_nil_
{a:vt}
((*0*)): optn_vt(a,ff)
//
fun
<a:vt>
optn_vt_cons_
( x: a ): optn_vt(a,tt)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
optn_vt_uncons0
(xs: optn_vt(a, tt)): (a)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
optn_vt_length0
{b0:b0}
(xs:
~optn_vt(x0,n0)): sint(b2i(b0))
//
fun
<x0:vt>
optn_vt_length1
{b0:b0}
(xs:
!optn_vt(x0,n0)): sint(b2i(b0))
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_VT_optn000_vt.sats] *)
