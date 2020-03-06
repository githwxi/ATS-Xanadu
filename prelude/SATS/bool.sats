(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
// For booleans
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: March, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
fun//<>
bool_neg
(x: bool(b)): bool(~b)
//
#symload ~ with neg_bool of 100
#symload not with neg_bool of 100
//
(* ****** ****** *)
//
fun//<>
bool_add
( x: bool(b1)
, y: bool(b2)): bool(b1+b2)
fun//<>
bool_mul
( x: bool(b1)
, y: bool(b2)): bool(b1*b2)
//
#symload + with bool_add of 100
#symload * with bool_mul of 100
//
(* ****** ****** *)

fun//<>
bool_print(bool): void
fun<>
g_print_bool(b0: bool): void
#symload print with g_print_bool of 110

(* ****** ****** *)

(* end of [bool.sats] *)
