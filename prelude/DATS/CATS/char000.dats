(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
Sun 01 Sep 2024 04:48:38 PM EDT
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
XATS000_char_lt
  (c1, c2)) where
{
#extern
fun
XATS000_char_lt
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
XATS000_char_gt
  (c1, c2)) where
{
#extern
fun
XATS000_char_gt
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
XATS000_char_eq
  (c1, c2)) where
{
#extern
fun
XATS000_char_eq
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
XATS000_char_lte
  (c1, c2)) where
{
#extern
fun
XATS000_char_lte
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
XATS000_char_gte
  (c1, c2)) where
{
#extern
fun
XATS000_char_gte
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
XATS000_char_neq
  (c1, c2)) where
{
#extern
fun
XATS000_char_neq
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
XATS000_char_add$sint
  (c1, i2)) where
{
#extern
fun
XATS000_char_add$sint
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
XATS000_char_sub$char
  (c1, c2)) where
{
#extern
fun
XATS000_char_sub$char
(c1: char, c2: char): sint = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-09-05:
Thu 05 Sep 2024 11:11:27 AM EDT
*)
//
#impltmp
<(*tmp*)>
char_print
  ( c0 ) =
(
XATS000_char_print
  ( c0 )) where
{
#extern
fun
XATS000_char_print(c0: char): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-01-19: from gavinz
Sun Jan 19 01:11:19 AM EST 2025
*)
#impltmp
<(*tmp*)>
char_make_sint(i0) =
(
XATS000_char_make_int(i0))
where
{
#extern
fun
XATS000_char_make_int(i0: sint): char = $extnam()
}
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_CATS_char000.dats] *)
