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
// For characters
// that is, sint8 and uint8
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: March, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
fun<>
char_make_sint
(code: sint): char
fun<>
char_make_uint
(code: uint): char
//
(* ****** ****** *)
//
fun<>
sint_make_char
(char: char): sint
//
(* ****** ****** *)
//
fun<>
char_eqzq
{c:char}
(c0: char(c)): bool(c=0)
fun<>
char_neqzq
{c:char}
(c0: char(c)): bool(c>0)
//
fun<>
char_equal
{c1,c2:char}
( c1: char(c1)
, c2: char(c2)): bool(c1=c2)
fun<>
char_noteq
{c1,c2:char}
( c1: char(c1)
, c2: char(c2)): bool(c1!=c2)
//
(* ****** ****** *)

fun<>
char_cmp
{c1,c2:char}
( c1: char(c1)
, c2: char(c2)): sint(sgn(c1-c2))

(* ****** ****** *)

fun<>
char_print(c0: char): void

(* ****** ****** *)
//
// HX-2020-05-30:
// symbol overloading for char
//
(* ****** ****** *)
//
#symload
char with char_make_sint of 1000
#symload
char with char_make_uint of 1000
//
(* ****** ****** *)
//
#symload
sint with sint_make_char of 1000
//
(* ****** ****** *)
//
#symload print with char_print of 1000
//
(* ****** ****** *)

(* end of [char.sats] *)
