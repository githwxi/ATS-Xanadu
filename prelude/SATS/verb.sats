(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author: Hongwei Xi
// Start Time: October, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

fun
<x0:vt>
copy$val(!x0): x0
fun
<x0:vt>
copy$ref(&x0): x0

fun
<x0:vt>
free$val(!x0 >> ?): void
fun
<x0:vt>
free$ref(&x0 >> ?): void

(* ****** ****** *)
//
fun
<x0:type>
<y0:vtype>
map$fopr(x0): y0
fun
<x0:vtype>
<y0:vtype>
map_vt0$fopr(x0): y0
fun
<x0:vtype>
<y0:vtype>
map_vt1$fopr(!x0 >> _): y0
//
fun
<x0:vtype>
<y0:vtype>
map_vtr0$fopr(&x0 >> ?): y0
fun
<x0:vtype>
<y0:vtype>
map_vtr1$fopr(&x0 >> x0): y0
//
(* ****** ****** *)
//
fun
<x0:type>
forall$test(x0): bool
fun
<x0:vtype>
forall_vt0$test(x0): bool
fun
<x0:vtype>
forall_vt1$test(!x0 >> _): bool
//
fun
<x0:vtype>
forall_vtr0$test(&x0 >> ?): bool
fun
<x0:vtype>
forall_vtr1$test(&x0 >> x0): bool
//
(* ****** ****** *)
//
fun
<x0:type>
foreach$work(x0): void
fun
<x0:vtype>
foreach_vt0$work(x0): void
fun
<x0:vtype>
foreach_vt1$work(!x0 >> _): void
//
fun
<x0:vtype>
foreach_vtr0$work(&x0 >> ?): void
fun
<x0:vtype>
foreach_vtr1$work(&x0 >> _): void
//
(* ****** ****** *)
//
fun
<x0:type>
iforall$test(nint, x0): bool
fun
<x0:vtype>
iforall_vt0$test(nint, x0): bool
fun
<x0:vtype>
iforall_vt1$test(nint, !x0 >> _): bool
//
fun
<x0:vtype>
iforall_vtr1$test(nint, &x0 >> _): bool
//
(* ****** ****** *)
//
fun
<x0:type>
<r0:type>
foldleft$nil(r0): r0
fun
<x0:type>
<r0:type>
foldleft$cons(r0, x0): r0
//
fun
<x0:type>
<r0:type>
foldright$nil(r0): r0
fun
<x0:type>
<r0:type>
foldright$nil(x0, r0): r0
//
(* ****** ****** *)
//
fun
<x0:type>
<y0:type>
<z0:vtype>
xmap$fopr(x0, y0): z0
//
fun
<x0:vtype>
<y0:vtype>
<z0:vtype>
xmap$fopr_vt0_vt0(x0, y0): z0
fun
<x0:vtype>
<y0:vtype>
<z0:vtype>
xmap$fopr_vt1_vt1(!x0, !y0): z0
//
(* ****** ****** *)
//
fun
<x0:type>
<y0:type>
<z0:vtype>
zmap$fopr(x0, y0): z0
//
fun
<x0:vtype>
<y0:vtype>
<z0:vtype>
zmap$fopr_vt0_vt0(x0, y0): z0
fun
<x0:vtype>
<y0:vtype>
<z0:vtype>
zmap$fopr_vt1_vt1(!x0, !y0): z0
//
(* ****** ****** *)

(* end of [verb.sats] *)
