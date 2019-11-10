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
// Start Time: November, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
// HX-2019-11-02:
// level-1 interpreter for syncheck!
//
(* ****** ****** *)

#staload "./../SATS/interp0.sats"

(* ****** ****** *)

fun
gint_add_sint_sint
( x: ir0val
, y: ir0val): ir0val =
let
val-IR0Vint(x) = x
val-IR0Vint(y) = y in IR0Vint(x+y) end

fun
gint_sub_sint_sint
( x: ir0val
, y: ir0val): ir0val =
let
val-IR0Vint(x) = x
val-IR0Vint(y) = y in IR0Vint(x-y) end

(* ****** ****** *)

fun
gint_mul_sint_sint
( x: ir0val
, y: ir0val): ir0val =
let
val-IR0Vint(x) = x
val-IR0Vint(y) = y in IR0Vint(x*y) end

fun
gint_div_sint_sint
( x: ir0val
, y: ir0val): ir0val =
let
val-IR0Vint(x) = x
val-IR0Vint(y) = y in IR0Vint(x/y) end

fun
gint_mod_sint_sint
( x: ir0val
, y: ir0val): ir0val =
let
val-IR0Vint(x) = x
val-IR0Vint(y) = y in IR0Vint(x%y) end

(* ****** ****** *)

(* end of [xint_interp0_envmap.dats] *)
