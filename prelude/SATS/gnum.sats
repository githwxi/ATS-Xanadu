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
<a:type>
g_0((*void*)): a
fun
<a:type>
g_1((*void*)): a
fun
<a:type>
g_2((*void*)): a

(* ****** ****** *)

fun
<a:type>
g_add(x: a, y: a): a
fun
<a:type>
g_sub(x: a, y: a): a

(* ****** ****** *)

fun
<a:type>
g_mul(x: a, y: a): a
fun
<a:type>
g_div(x: a, y: a): a
fun
<a:type>
g_mod(x: a, y: a): a

(* ****** ****** *)

(* end of [gnum.sats] *)
