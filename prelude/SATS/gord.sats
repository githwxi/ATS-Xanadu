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
// For generic ordering
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
<a:t0>
g_lt(a, a): bool
fun
<a:t0>
g_gt(a, a): bool
fun
<a:t0>
g_eq(a, a): bool
//
fun
<a:t0>
g_lte(a, a): bool
fun
<a:t0>
g_gte(a, a): bool
fun
<a:t0>
g_neq(a, a): bool
//
(* ****** ****** *)
//
fun
<a:t0>
g_cmp(a, a): sint
//
(* ****** ****** *)
//
fun
<a:t0>
g_max(x: a, y: a): (a)
fun
<a:t0>
g_min(x: a, y: a): (a)
//
(* ****** ****** *)
//
fun
<a:t0>
g_ltz(x: a): bool
fun
<a:t0>
g_gtz(x: a): bool
fun
<a:t0>
g_eqz(x: a): bool
fun
<a:t0>
g_ltez(x: a): bool
fun
<a:t0>
g_gtez(x: a): bool
fun
<a:t0>
g_neqz(x: a): bool
//
fun
<a:t0>
g_cmpz(x: a): sint
//
(* ****** ****** *)
//
// HX:
// For linear gords
//
(* ****** ****** *)

fun
<a:vt>
gl_eq00(~a, ~a): bool
fun
<a:vt>
gl_eq11(!a, !a): bool

fun
<a:vt>
gl_neq00(~a, ~a): bool
fun
<a:vt>
gl_neq11(!a, !a): bool

(* ****** ****** *)

fun
<a:vt>
gl_lt00(~a, ~a): bool
fun
<a:vt>
gl_lt11(!a, !a): bool

fun
<a:vt>
gl_gt00(~a, ~a): bool
fun
<a:vt>
gl_gt11(!a, !a): bool

fun
<a:vt>
gl_lte00(~a, ~a): bool
fun
<a:vt>
gl_lte11(!a, !a): bool

fun
<a:vt>
gl_gte00(~a, ~a): bool
fun
<a:vt>
gl_gte11(!a, !a): bool

(* ****** ****** *)

fun
<a:vt>
gl_cmp00(~a, ~a): sint
fun
<a:vt>
gl_cmp11(!a, !a): sint

(* ****** ****** *)

fun
<a:vt>
gl_max00(x: ~a, y: ~a): (a)
fun
<a:vt>
gl_max11(x: !a, y: !a): (a)

(* ****** ****** *)

fun
<a:vt>
gl_min00(x: ~a, y: ~a): (a)
fun
<a:vt>
gl_min11(x: !a, y: !a): (a)

(* ****** ****** *)
//
// HX-2020-05-30:
// symbol overloading for gnum
//
(* ****** ****** *)
//
#symload < with g_lt of 0102
#symload > with g_gt of 0102
#symload = with g_eq of 0102
//
#symload <= with g_lte of 0102
#symload >= with g_gte of 0102
#symload != with g_neq of 0102
//
#symload cmp with g_cmp of 0102
//
(* ****** ****** *)
//
#symload max with g_max of 0102
#symload min with g_min of 0102
//
(* ****** ****** *)
//
#symload ltz with g_ltz of 0101
#symload gtz with g_gtz of 0101
#symload eqz with g_eqz of 0101
//
#symload ltez with g_ltez of 0101
#symload gtez with g_gtez of 0101
#symload neqz with g_neqz of 0101
//
#symload cmpz with g_cmpz of 0101
//
(* ****** ****** *)

(* end of [gord.sats] *)
