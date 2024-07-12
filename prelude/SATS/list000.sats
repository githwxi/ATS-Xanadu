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
Mon 08 Jul 2024 11:17:44 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
list_nil_
{a:t0}(): list(a,0)
fun
<a:t0>
list_cons_
{n:i0}
(
x0: (a),
xs: list(a,n)): list(a,n+1)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
list_make_1val
( x1: a): list(a,1)
fun
<a:t0>
list_make_2val
(x1: a, x2: a): list(a,2)
fun
<a:t0>
list_make_2val
(x1: a
,x2: a, x3: a): list(a,3)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
list_length
{n:i0}
(xs: list(a, n)): sint(n)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
list_strmize
(xs: list(a)): strm_vt(a)
fun
<a:t0>
list_strqize
{n:i0}
(xs: list(a, n)): strq_vt(a, n)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
list_reverse
{n:i0}
(xs: list(a, n)): list(a, n)
fun
<a:t0>
list_reverse_vt
{n:i0}
(xs: list(a, n)): list_vt(a, n)
//
(* ****** ****** *)
(* ****** ****** *)

fun
<a:t0>
list_rappend
{m,n:i0}
( xs: list(a, m)
, ys: list(a, n)): list(a, m+n)

fun
<a:t0>
list_rappend_vt
{m,n:i0}
( xs: list(a, m)
, ys: list(a, n)): list_vt(a, m+n)

fun
<a:t0>
list_rappendx0_vt
{m,n:i0}
( xs: list(a, m)
, ys: list_vt(a, n)): list_vt(a, m+n)

(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_list000.sats] *)
