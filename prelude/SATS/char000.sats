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
fun<>
char_code
(char: char): sint
(* ****** ****** *)
//
fun<>
char_make_code
(code: sint): char
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
(*
HX:
[char_code]
=
[sint_make_char]
=
[char2uint2sint]!!!
*)
fun<>
sint_make_char
(char: char): sint
//
(* ****** ****** *)
fun<>
char_print(char): void
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
sub_char_char
{c1,c2:char}
( c1: char(c1)
, c2: char(c2)): sint(c1 - c2)

(* ****** ****** *)
fun<>
char_lt
{c1,c2:char}
( c1: char(c1)
, c2: char(c2)): bool(c1 < c2)
fun<>
char_gt
{c1,c2:char}
( c1: char(c1)
, c2: char(c2)): bool(c1 > c2)
fun<>
char_eq
{c1,c2:char}
( c1: char(c1)
, c2: char(c2)): bool(c1 = c2)
fun<>
char_lte
{c1,c2:char}
( c1: char(c1)
, c2: char(c2)): bool(c1 <= c2)
fun<>
char_gte
{c1,c2:char}
( c1: char(c1)
, c2: char(c2)): bool(c1 >= c2)
fun<>
char_neq
{c1,c2:char}
( c1: char(c1)
, c2: char(c2)): bool(c1 != c2)
(* ****** ****** *)
fun<>
char_cmp
{c1,c2:char}
( c1: char(c1)
, c2: char(c2)): sint(sgn(c1-c2))
(* ****** ****** *)
//
fun<>
char_lower(c0: char): char
fun<>
char_upper(c0: char): char
//
(* ****** ****** *)
//
fun<>
char_isalpha(c0: char): bool
fun<>
sint_isalpha(c0: sint): bool
//
fun<>
char_isalnum(c0: char): bool
fun<>
sint_isalnum(c0: sint): bool
//
fun<>
char_isascii(c0: char): bool
fun<>
sint_isascii(c0: sint): bool
//
fun<>
char_isblank(c0: char): bool
fun<>
sint_isblank(c0: sint): bool
//
fun<>
char_isspace(c0: char): bool
fun<>
sint_isspace(c0: sint): bool
//
fun<>
char_iscntrl(c0: char): bool
fun<>
sint_iscntrl(c0: sint): bool
//
fun<>
char_isdigit(c0: char): bool
fun<>
sint_isdigit(c0: sint): bool
//
fun<>
char_isxdigit(c0: char): bool
fun<>
sint_isxdigit(c0: sint): bool
//
(* ****** ****** *)
//
// HX-2020-05-30:
// symbol overloading for char
//
(* ****** ****** *)
#symload
code with char_code of 1000
(* ****** ****** *)
//
#symload
char with char_make_sint of 1000
#symload
char with char_make_uint of 1000
//
(* ****** ****** *)
//
(*
//
// HX-2022-06-12: deprecated
//
#symload
sint with sint_make_char of 1000
*)
//
(* ****** ****** *)
#symload < with char_lt of 1000
#symload > with char_gt of 1000
#symload = with char_eq of 1000
#symload <= with char_lte of 1000
#symload >= with char_gte of 1000
#symload != with char_neq of 1000
(* ****** ****** *)
#symload cmp with char_cmp of 1000
(* ****** ****** *)
#symload - with sub_char_char of 1000
(* ****** ****** *)
//
(*
#symload print with char_print of 1000
*)
//
(* ****** ****** *)
//
#symload isalpha with char_isalpha of 1000
#symload isalpha with sint_isalpha of 1000
//
#symload isalnum with char_isalnum of 1000
#symload isalnum with sint_isalnum of 1000
//
#symload isascii with char_isascii of 1000
#symload isascii with sint_isascii of 1000
//
#symload isblank with char_isblank of 1000
#symload isblank with sint_isblank of 1000
//
#symload isspace with char_isspace of 1000
#symload isspace with sint_isspace of 1000
//
#symload iscntrl with char_iscntrl of 1000
#symload iscntrl with sint_iscntrl of 1000
//
#symload isdigit with char_isdigit of 1000
#symload isdigit with sint_isdigit of 1000
//
#symload isxdigit with char_isxdigit of 1000
#symload isxdigit with sint_isxdigit of 1000
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_char000.sats] *)
