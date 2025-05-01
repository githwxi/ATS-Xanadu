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
//
fun
<a:vt>
g_0((*void*)): (a)
fun
<a:vt>
g_1((*void*)): (a)
fun
<a:vt>
g_2((*void*)): (a)
fun
<a:vt>
g_3((*void*)): (a)
fun
<a:vt>
g_4((*void*)): (a)
fun
<a:vt>
g_5((*void*)): (a)
fun
<a:vt>
g_6((*void*)): (a)
fun
<a:vt>
g_7((*void*)): (a)
fun
<a:vt>
g_8((*void*)): (a)
fun
<a:vt>
g_9((*void*)): (a)
//
(* ****** ****** *)

fun
<a:vt>
g_si(i0: sint): (a)
fun
<a:vt>
g_ui(u0: uint): (a)

(* ****** ****** *)
//
fun
<a:vt>
g_sf(f0: sflt): (a)
fun
<a:vt>
g_df(f0: dflt): (a)
//
(* ****** ****** *)
//
fun
<a:t0>
g_neg(x: a): a
fun
<a:t0>
g_abs(x: a): a
//
fun
<a:t0>
g_suc(x: a): a
fun
<a:t0>
g_pre(x: a): a
//
(* ****** ****** *)
fun
<a:t0>
g_sqr(x: a): a
fun
<a:t0>
g_cbe(x: a): a
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
(* ****** ****** *)
//
fun
<a:t0>
g_pow(x: a, n: nint): a
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
g_neg0(x: ~a): a
fun
<a:vt>
g_neg1(x: !a): a
//
fun
<a:vt>
g_abs0(x: ~a): a
fun
<a:vt>
g_abs1(x: !a): a
//
(* ****** ****** *)
//
fun
<a:vt>
g_suc0(x: ~a): a
fun
<a:vt>
g_suc1(x: !a): a
//
fun
<a:vt>
g_pre0(x: ~a): a
fun
<a:vt>
g_pre1(x: !a): a
//
(* ****** ****** *)
//
fun
<a:vt>
g_add00(x: ~a, y: ~a): a
fun
<a:vt>
g_add01(x: ~a, y: !a): a
fun
<a:vt>
g_add10(x: !a, y: ~a): a
fun
<a:vt>
g_add11(x: !a, y: !a): a
//
(* ****** ****** *)

fun
<a:vt>
g_sub00(x: ~a, y: ~a): a
fun
<a:vt>
g_sub11(x: !a, y: !a): a

(* ****** ****** *)

fun
<a:vt>
g_mul00(x: ~a, y: ~a): a
fun
<a:vt>
g_mul01(x: ~a, y: !a): a
fun
<a:vt>
g_mul10(x: !a, y: ~a): a
fun
<a:vt>
g_mul11(x: !a, y: !a): a

(* ****** ****** *)

fun
<a:vt>
g_div00(x: ~a, y: ~a): a
fun
<a:vt>
g_div11(x: !a, y: !a): a

(* ****** ****** *)

fun
<a:vt>
g_mod00(x: ~a, y: ~a): a
fun
<a:vt>
g_mod11(x: !a, y: !a): a

(* ****** ****** *)
//
// HX-2020-05-30:
// symbol overloading for gnum
//
(* ****** ****** *)
//
#symload
neg with g_neg of 0101
#symload
abs with g_abs of 0101
//
(* ****** ****** *)
//
#symload
suc with g_suc of 0101
#symload
pre with g_pre of 0101
//
(* ****** ****** *)
//
#symload - with g_neg of 0101
//
#symload + with g_add of 0102
#symload - with g_sub of 0102
//
#symload * with g_mul of 0102
#symload / with g_div of 0102
#symload % with g_mod of 0102
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen1_prelude_SATS_gnum000.sats] *)
(***********************************************************************)
