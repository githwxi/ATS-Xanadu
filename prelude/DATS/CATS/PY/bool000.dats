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
Wed Jan  8 02:48:44 AM EST 2025
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
bool_lt
(b1, b2) =
(
XATS2PY_bool_lt
  (b1, b2)) where
{
#extern
fun
XATS2PY_bool_lt
(b1: bool, b2: bool): bool = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
bool_gt
(b1, b2) =
(
XATS2PY_bool_gt
  (b1, b2)) where
{
#extern
fun
XATS2PY_bool_gt
(b1: bool, b2: bool): bool = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
bool_eq
(b1, b2) =
(
XATS2PY_bool_eq
  (b1, b2)) where
{
#extern
fun
XATS2PY_bool_eq
(b1: bool, b2: bool): bool = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
bool_lte
(b1, b2) =
(
XATS2PY_bool_lte
  (b1, b2)) where
{
#extern
fun
XATS2PY_bool_lte
(b1: bool, b2: bool): bool = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
bool_gte
(b1, b2) =
(
XATS2PY_bool_gte
  (b1, b2)) where
{
#extern
fun
XATS2PY_bool_gte
(b1: bool, b2: bool): bool = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
bool_neq
(b1, b2) =
(
XATS2PY_bool_neq
  (b1, b2)) where
{
#extern
fun
XATS2PY_bool_neq
(b1: bool, b2: bool): bool = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
bool_print(b0) =
(
if b0
then strn_print<>("true")
else strn_print<>("false"))//end(impl)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_CATS_PY_bool000.dats] *)
