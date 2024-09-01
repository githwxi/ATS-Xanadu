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
sint_lt_sint
  (i1, i2) =
(
XATS2JS_sint_lt_sint
  (i1, i2)) where
{
#extern
fun
XATS2JS_sint_lt_sint
(i1: sint, i2: sint): bool = $extnam()
}
//
#impgtmp
<(*tmp*)>
sint_gt_sint
  (i1, i2) =
(
XATS2JS_sint_gt_sint
  (i1, i2)) where
{
#extern
fun
XATS2JS_sint_gt_sint
(i1: sint, i2: sint): bool = $extnam()
}
//
#impltmp
<(*tmp*)>
sint_eq_sint
  (i1, i2) =
(
XATS2JS_sint_eq_sint
  (i1, i2)) where
{
#extern
fun
XATS2JS_sint_eq_sint
(i1: sint, i2: sint): bool = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_CATS_JS_gint000.dats] *)
