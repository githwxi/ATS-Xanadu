(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
// For pure arrays in C
//
(* ****** ****** *)
//
(*
Author: Hongwei Xi
Wed Dec 20 22:43:58 EST 2023
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
// HX: 1-dimensional
(* ****** ****** *)
//
#abstbox
a1rsz_vt_i0_x0
(elem:vt, ntot:i0)
//
#typedef
a1rsz(a:vt,n:i0) = a1rsz_vt_i0_x0(a, n)
//
(* ****** ****** *)
// HX: 2-dimensional
(* ****** ****** *)
//
#abstbox
a2rsz_vt_i0_i0_x0
(elem:vt,nrow:i0,ncol:i0)
//
#typedef
a2rsz
(a:vt
,m:i0,n:i0) = a2rsz_vt_i0_i0_x0(a, m, n)
//
(* ****** ****** *)
(* ****** ****** *)
#typedef
a1rsz(a:vt) = [n:i0] a1rsz(a, n)
#typedef
a2rsz(a:vt) = [m:i0;n:i0] a2rsz(a, m, n)
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
a1rsz_getref
{n:i0}
(AZ: a1rsz(a, n)): a1ref(a, n)
fun
<a:vt>
a1rsz_length
{n:i0}(AZ: a1rsz(a, n)): nint(n)
//
(* ****** ****** *)
//
fun
<a:vt>
a1rsz_make_refsize
{n:int}
(a1ref(a, n), sint(n)): a1rsz(a, n)
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_arrn001.sats] *)
