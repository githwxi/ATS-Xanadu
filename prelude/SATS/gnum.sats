(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
// For generic numbers
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: June, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

fun
<a:t0>
g_0((*void*)): (a)
fun
<a:t0>
g_1((*void*)): (a)
fun
<a:t0>
g_2((*void*)): (a)

(* ****** ****** *)

fun
<a:t0>
g_i(i0: sint): (a)
fun
<a:t0>
g_u(u0: uint): (a)

(* ****** ****** *)
//
fun
<a:t0>
g_neg(x: a): a
fun
<a:t0>
g_succ(x: a): a
fun
<a:t0>
g_pred(x: a): a
//
(* ****** ****** *)
//
fun
<a:t0>
g_add(x: a, y: a): a
fun
<a:t0>
g_sub(x: a, y: a): a
//
(* ****** ****** *)
//
fun
<a:t0>
g_mul(x: a, y: a): a
fun
<a:t0>
g_div(x: a, y: a): a
fun
<a:t0>
g_mod(x: a, y: a): a
//
(* ****** ****** *)
//
// HX-2020-05-30:
// symbol overloading for gnum
//
(* ****** ****** *)
//
#symload
pred with g_neg of 101
#symload
succ with g_succ of 101
#symload
pred with g_pred of 101
//
(* ****** ****** *)
//
#symload - with g_neg of 101
//
#symload + with g_add of 102
#symload - with g_sub of 102
//
#symload * with g_mul of 102
#symload / with g_div of 102
#symload % with g_mod of 102
//
(* ****** ****** *)

(* end of [gnum.sats] *)
