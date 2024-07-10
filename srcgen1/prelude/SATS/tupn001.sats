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
Sat Jan  6 14:07:17 EST 2024
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
// HX: 1-dimensional
(* ****** ****** *)
//
#abstbox
t1rsz_vt_i0_x0
(elem:vt, ntot:i0)
//
#typedef
t1rsz(a:vt,n:i0) = t1rsz_vt_i0_x0(a, n)
//
(* ****** ****** *)
// HX: 2-dimensional
(* ****** ****** *)
//
#abstbox
t2rsz_vt_i0_i0_x0
(elem:vt,nrow:i0,ncol:i0)
//
#typedef
t2rsz
(a:vt
,m:i0,n:i0) = t2rsz_vt_i0_i0_x0(a, m, n)
//
(* ****** ****** *)
(* ****** ****** *)
#typedef
t1rsz(a:vt) = [n:i0] t1rsz(a, n)
#typedef
t2rsz(a:vt) = [m:i0;n:i0] t2rsz(a, m, n)
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
t1rsz_getref
{a:vt}
{n:i0}
(AZ: t1rsz(a, n)): t1ref(a, n)
//
fun<>
t1rsz_length
{a:vt}
{n:i0}(AZ: t1rsz(a, n)): nint(n)
//
(* ****** ****** *)
//
fun
<a:t0>
t1rsz_get_at
{n:i0}
(t1rsz(a,n), nintlt(n)): (a)
//
(* ****** ****** *)
//
fun
<a:vt>
t1rsz_make_refsize
{n:int}
(t1ref(a, n), sint(n)): t1rsz(a, n)
//
(* ****** ****** *)
//
fun
<a:t0>
t1rsz_make_list
{n:i0}
( xs: list(a, n) ): t1rsz(a, n)
//
fun
<a:vt>
t1rsz_make0_llist
{n:i0}
(xs: list_vt(a, n)): t1rsz(a, n)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
t1rsz_strmize
{n:i0}
(AZ: t1rsz(a, n)): strm_vt(a)
//
fun
<a:vt>
t1rsz_listize
{n:i0}
(AZ: t1rsz(a, n)): list_vt(a, n)
//
(* ****** ****** *)
//
fun
<a:vt>
t1rsz_rlistize
{n:i0}
(AZ: t1rsz(a, n)): list_vt(a, n)
//
(* ****** ****** *)
//
fun
<x0:t0>
t1rsz_forall
{n:i0}(A0: t1rsz(x0, n)): (bool)
fun
<x0:vt>
t1rsz_forall1
{n:i0}(A0: t1rsz(x0, n)): (bool)
//
(* ****** ****** *)
//
fun
<x0:t0>
t1rsz_foreach
{n:i0}(A0: t1rsz(x0, n)): (void)
fun
<x0:vt>
t1rsz_foreach1
{n:i0}(A0: t1rsz(x0, n)): (void)
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_SATS_tupn001.sats] *)
