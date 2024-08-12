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
Mon 12 Aug 2024 09:36:20 AM EDT
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#absimpl
a0rf_vt_tx(a:vt) = $extype("jsarray")
#absimpl
a0rf_vt_vx(a:vt) = $extype("jsarray")
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: vt >
a0rf_lget(A) =
(
XATS2JS_a0rf_lget
  ( A )) where
{
#extern
fun
XATS2JS_a0rf_lget
{a:vt}(A: a0rf(a)): a = $extnam()
}
//
#impltmp
< a: vt >
a0rf_lset(A, x) =
(
XATS2JS_a0rf_lset
  (A, x)) where
{
#extern
fun
XATS2JS_a0rf_lset
{a:vt}
(A: a0rf(a), x: a): void = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
< a: vt >
a0rf_make_1val(x0) =
(
XATS2JS_a0rf_make_1val
  ( x0 )) where
{
#extern
fun
XATS2JS_a0rf_make_1val
{a:vt}(x0: a): a0rf(a) = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_CATS_JS_axrf000.dats] *)
