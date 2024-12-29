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
Sun 01 Sep 2024 04:25:37 PM EDT
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
sint_neg
  ( i1 ) =
(
XATS2JS_sint_neg
  ( i1 )) where
{
#extern
fun
XATS2JS_sint_neg
(i1: sint): sint = $extnam() }
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
sint_lt$sint
  (i1, i2) =
(
XATS2JS_sint_lt$sint
  (i1, i2)) where
{
#extern
fun
XATS2JS_sint_lt$sint
(i1: sint, i2: sint): bool = $extnam()
}
//
#impltmp
<(*tmp*)>
sint_gt$sint
  (i1, i2) =
(
XATS2JS_sint_gt$sint
  (i1, i2)) where
{
#extern
fun
XATS2JS_sint_gt$sint
(i1: sint, i2: sint): bool = $extnam()
}
//
#impltmp
<(*tmp*)>
sint_eq$sint
  (i1, i2) =
(
XATS2JS_sint_eq$sint
  (i1, i2)) where
{
#extern
fun
XATS2JS_sint_eq$sint
(i1: sint, i2: sint): bool = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
sint_lte$sint
  (i1, i2) =
(
XATS2JS_sint_lte$sint
  (i1, i2)) where
{
#extern
fun
XATS2JS_sint_lte$sint
(i1: sint, i2: sint): bool = $extnam()
}
//
#impltmp
<(*tmp*)>
sint_gte$sint
  (i1, i2) =
(
XATS2JS_sint_gte$sint
  (i1, i2)) where
{
#extern
fun
XATS2JS_sint_gte$sint
(i1: sint, i2: sint): bool = $extnam()
}
//
#impltmp
<(*tmp*)>
sint_neq$sint
  (i1, i2) =
(
XATS2JS_sint_neq$sint
  (i1, i2)) where
{
#extern
fun
XATS2JS_sint_neq$sint
(i1: sint, i2: sint): bool = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
sint_add$sint
  (i1, i2) =
(
XATS2JS_sint_add$sint
  (i1, i2)) where
{
#extern
fun
XATS2JS_sint_add$sint
(i1: sint, i2: sint): sint = $extnam()
}
//
#impltmp
<(*tmp*)>
sint_sub$sint
  (i1, i2) =
(
XATS2JS_sint_sub$sint
  (i1, i2)) where
{
#extern
fun
XATS2JS_sint_sub$sint
(i1: sint, i2: sint): sint = $extnam()
}
//
#impltmp
<(*tmp*)>
sint_mul$sint
  (i1, i2) =
(
XATS2JS_sint_mul$sint
  (i1, i2)) where
{
#extern
fun
XATS2JS_sint_mul$sint
(i1: sint, i2: sint): sint = $extnam()
}
//
#impltmp
<(*tmp*)>
sint_div$sint
  (i1, i2) =
(
XATS2JS_sint_div$sint
  (i1, i2)) where
{
#extern
fun
XATS2JS_sint_div$sint
(i1: sint, i2: sint): sint = $extnam()
}
//
#impltmp
<(*tmp*)>
sint_mod$sint
  (i1, i2) =
(
XATS2JS_sint_mod$sint
  (i1, i2)) where
{
#extern
fun
XATS2JS_sint_mod$sint
(i1: sint, i2: sint): sint = $extnam()
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
sint_print
  ( i0 ) =
(
XATS2JS_sint_print
  ( i0 )) where
{
#extern
fun
XATS2JS_sint_print(i0: sint): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_CATS_JS_gint000.dats] *)
