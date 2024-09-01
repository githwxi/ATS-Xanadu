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
XATS2JS_char_lt
  (c1, c2)) where
{
#extern
fun
XATS2JS_char_lt
(c1: char, c2: char): char = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
char_gt
(c1, c2) =
(
XATS2JS_char_gt
  (c1, c2)) where
{
#extern
fun
XATS2JS_char_gt
(c1: char, c2: char): char = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
char_eq
(c1, c2) =
(
XATS2JS_char_eq
  (c1, c2)) where
{
#extern
fun
XATS2JS_char_eq
(c1: char, c2: char): char = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
char_lte
(c1, c2) =
(
XATS2JS_char_lte
  (c1, c2)) where
{
#extern
fun
XATS2JS_char_lte
(c1: char, c2: char): char = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
char_gte
(c1, c2) =
(
XATS2JS_char_gte
  (c1, c2)) where
{
#extern
fun
XATS2JS_char_gte
(c1: char, c2: char): char = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
char_neq
(c1, c2) =
(
XATS2JS_char_neq
  (c1, c2)) where
{
#extern
fun
XATS2JS_char_neq
(c1: char, c2: char): char = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_CATS_JS_char000.dats] *)
