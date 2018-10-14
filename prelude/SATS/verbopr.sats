(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
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
//
fun
<x:type>
<y:type>
map$fopr(x): y
fun
<x:vtype>
<y:vtype>
map_vt0$fopr(x): y
fun
<x:vtype>
<y:vtype>
map_vt1$fopr(&x >> x): y
//
(* ****** ****** *)
//
fun
<x:type>
forall$test(x): bool
fun
<x:vtype>
forall_vt0$test(x): bool
fun
<x:vtype>
forall_vt1$test(&x >> x): bool
//
(* ****** ****** *)
//
fun
<x:type>
foreach$work(x): void
fun
<x:vtype>
foreach_vt0$work(x): void
fun
<x:vtype>
foreach_vt1$work(&x >> x): void
//
(* ****** ****** *)

(* end of [verbopr.sats] *)
