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
// For generic basics
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
g_self(x: a): a

(* ****** ****** *)

fun
<a:vtype>
g_free(x: a): void
fun
<a:vtype>
g_copy(x: !(a)): (a)

(* ****** ****** *)

fun
<a:vtype>
g_equal(!a, !a): void
fun
<a:vtype>
g_nequal(!a, !a): void

(* ****** ****** *)

fun
<x0:t0><y0:vt>
map$fopr(x0: x0): y0
fun
<x0:vt><y0:vt>
map0$fopr(x0: x0): y0
fun
<x0:vt><y0:vt>
map1$fopr(x0: !x0): y0

(* ****** ****** *)

fun
<x0:t0>
forall$test(x0: x0): bool
fun
<x0:t0>
forall0$test(x0: x0): bool
fun
<x0:t0>
forall1$test(x0: !x0): bool

(* ****** ****** *)

fun
<x0:t0>
foreach$work(x0: x0): void
fun
<x0:t0>
foreach0$work(x0: x0): void
fun
<x0:t0>
foreach1$work(x0: !x0): void

(* ****** ****** *)
//
fun
<x0:t0>
<r0:vt>
foldleft$fopr(r0: r0, x0: x0): r0
fun
<x0:t0>
<r0:vt>
foldright$fopr(x0: x0, r0: r0): r0
//
(* ****** ****** *)

(* end of [gbas.sats] *)
