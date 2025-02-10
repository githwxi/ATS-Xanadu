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
(* ****** ****** *)
//
(*
For pure arrays in C
*)
//
(* ****** ****** *)
(*
Author: Hongwei Xi
Wed Dec 20 22:43:58 EST 2023
Authoremail: gmhwxiATgmailDOTcom
*)
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
a1rsz_getref
{a:vt}
{n:i0}
(AZ: a1rsz(a, n)): a1ref(a, n)
//
fun<>
a1rsz_length
{a:vt}
{n:i0}(AZ: a1rsz(a, n)): nint(n)
//
(* ****** ****** *)
//
fun
<a:t0>
a1rsz_get$at
{n:i0}
(a1rsz(a,n), nintlt(n)): (a)
fun
<a:t0>
a1rsz_set$at
{n:i0}
(a1rsz(a,n), nintlt(n), a): void
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
//
fun
<a:t0>
a1rsz_make_list
{n:i0}
( xs: list(a, n) ): a1rsz(a, n)
//
fun
<a:vt>
a1rsz_make0_llist
{n:i0}
(xs: list_vt(a, n)): a1rsz(a, n)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
a1rsz_strmize
{n:i0}
(AZ: a1rsz(a, n)): strm_vt(a)
//
fun
<a:vt>
a1rsz_listize
{n:i0}
(AZ: a1rsz(a, n)): list_vt(a, n)
//
(* ****** ****** *)
//
fun
<a:vt>
a1rsz_rlistize
{n:i0}
(AZ: a1rsz(a, n)): list_vt(a, n)
//
(* ****** ****** *)
//
fun
<x0:t0>
a1rsz_forall
{n:i0}(A0: a1rsz(x0, n)): (bool)
fun
<x0:vt>
a1rsz_forall1
{n:i0}(A0: a1rsz(x0, n)): (bool)
//
(* ****** ****** *)
//
fun
<x0:t0>
a1rsz_foritm
{n:i0}(A0: a1rsz(x0, n)): (void)
fun
<x0:vt>
a1rsz_foritm1
{n:i0}(A0: a1rsz(x0, n)): (void)
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_SATS_arrn001.sats] *)
