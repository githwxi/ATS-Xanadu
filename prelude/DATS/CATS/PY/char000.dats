(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
Wed Jan  8 02:50:04 AM EST 2025
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
char_lt
(c1, c2) =
(
XATS2PY_char_lt
  (c1, c2)) where
{
#extern
fun
XATS2PY_char_lt
(c1: char, c2: char): bool = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
char_gt
(c1, c2) =
(
XATS2PY_char_gt
  (c1, c2)) where
{
#extern
fun
XATS2PY_char_gt
(c1: char, c2: char): bool = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
char_eq
(c1, c2) =
(
XATS2PY_char_eq
  (c1, c2)) where
{
#extern
fun
XATS2PY_char_eq
(c1: char, c2: char): bool = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
char_lte
(c1, c2) =
(
XATS2PY_char_lte
  (c1, c2)) where
{
#extern
fun
XATS2PY_char_lte
(c1: char, c2: char): bool = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
char_gte
(c1, c2) =
(
XATS2PY_char_gte
  (c1, c2)) where
{
#extern
fun
XATS2PY_char_gte
(c1: char, c2: char): bool = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
char_neq
(c1, c2) =
(
XATS2PY_char_neq
  (c1, c2)) where
{
#extern
fun
XATS2PY_char_neq
(c1: char, c2: char): bool = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
char_add$sint
  (c1, i2) =
(
XATS2PY_char_add$sint
  (c1, i2)) where
{
#extern
fun
XATS2PY_char_add$sint
(c1: char, i2: sint): char = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
char_sub$char
  (c1, c2) =
(
XATS2PY_char_sub$char
  (c1, c2)) where
{
#extern
fun
XATS2PY_char_sub$char
(c1: char, c2: char): sint = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
char_print
  ( c0 ) =
(
XATS2PY_char_print
  ( c0 )) where
{
#extern
fun
XATS2PY_char_print(c0: char): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_CATS_PY_char000.dats] *)
