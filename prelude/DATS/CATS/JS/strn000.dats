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
Fri 16 Aug 2024 05:24:40 PM EDT
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
strn_length
  ( cs ) =
(
XATS2JS_strn_length
  ( cs )) where
{
#extern
fun
XATS2JS_strn_length
  (cs: strn): nint = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
strn_get$at
  (cs, i0) =
(
XATS2JS_strn_get$at$raw
  (cs, i0)) where
{
#extern
fun
XATS2JS_strn_get$at$raw
(cs: strn, i0: nint): char = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-09-04:
Wed 04 Sep 2024 04:52:34 AM EDT
*)
//
#impltmp
<(*tmp*)>
strn_cmp
  (x1, x2) =
(
XATS2JS_strn_cmp
  (x1, x2)) where
{
#extern
fun
XATS2JS_strn_cmp
(x1: strn, x2: strn): nint = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
strn_fmake_fwork
  (fwork) =
(
XATS2JS_strn_fmake_fwork
  (fwork)) where
{
#extern
fun
XATS2JS_strn_fmake_fwork
(fwork: ((cgtz)->void)->void): strn = $extnam()
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
strn_print
  ( cs ) =
(
XATS2JS_strn_print
  ( cs )) where
{
#extern
fun
XATS2JS_strn_print(cs: strn): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_CATS_JS_strn000.dats] *)
