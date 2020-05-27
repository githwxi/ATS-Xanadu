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

fun
<a:vtype>
gl_eq00(a, a): bool
fun
<a:vtype>
gl_eq11(a, a): bool

fun
<a:vtype>
gl_neq00(a, a): bool
fun
<a:vtype>
gl_neq11(!a, !a): bool

(* ****** ****** *)

fun
<a:vtype>
gl_lt00(a, a): bool
fun
<a:vtype>
gl_lt11(!a, !a): bool

fun
<a:vtype>
gl_gt00(a, a): bool
fun
<a:vtype>
gl_gt11(!a, !a): bool

fun
<a:vtype>
gl_lte00(a, a): bool
fun
<a:vtype>
gl_lte11(!a, !a): bool

fun
<a:vtype>
gl_gte00(a, a): bool
fun
<a:vtype>
gl_gte11(!a, !a): bool

(* ****** ****** *)

fun
<a:vtype>
gl_cmp00(a, a): sint
fun
<a:vtype>
gl_cmp11(!a, !a): sint

(* ****** ****** *)

fun
<a:vtype>
gl_max00(x: a, y: a): (a)
fun
<a:vtype>
gl_max11(x: !a, y: !a): (a)


(* ****** ****** *)

fun
<a:vtype>
gl_min00(x: a, y: a): (a)
fun
<a:vtype>
gl_min11(x: !a, y: !a): (a)

(* ****** ****** *)

(* end of [gord_vt.sats] *)
