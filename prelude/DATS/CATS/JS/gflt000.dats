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
Mon 09 Sep 2024 06:12:39 PM EDT
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_si<dflt>
  ( i1 ) =
(
XATS2JS_si2dflt
  ( i1 )) where
{
#extern
fcast
XATS2JS_si2dflt
(i1: sint): dflt = $extnam() }
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
dflt_neg
  ( f1 ) =
(
XATS2JS_dflt_neg
  ( f1 )) where
{
#extern
fun
XATS2JS_dflt_neg
(f1: dflt): dflt = $extnam() }
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
dflt_abs
  ( f1 ) =
(
XATS2JS_dflt_abs
  ( f1 )) where
{
#extern
fun
XATS2JS_dflt_abs
(f1: dflt): dflt = $extnam() }
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
dflt_sqrt
  ( f1 ) =
(
XATS2JS_dflt_sqrt
  ( f1 )) where
{
#extern
fun
XATS2JS_dflt_sqrt
(f1: dflt): dflt = $extnam() }
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
dflt_cbrt
  ( f1 ) =
(
XATS2JS_dflt_cbrt
  ( f1 )) where
{
#extern
fun
XATS2JS_dflt_cbrt
(f1: dflt): dflt = $extnam() }
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
dflt_lt$dflt
  (f1, f2) =
(
XATS2JS_dflt_lt$dflt
  (f1, f2)) where
{
#extern
fun
XATS2JS_dflt_lt$dflt
(f1: dflt, f2: dflt): bool = $extnam()
}
//
#impltmp
<(*tmp*)>
dflt_gt$dflt
  (f1, f2) =
(
XATS2JS_dflt_gt$dflt
  (f1, f2)) where
{
#extern
fun
XATS2JS_dflt_gt$dflt
(f1: dflt, f2: dflt): bool = $extnam()
}
//
#impltmp
<(*tmp*)>
dflt_eq$dflt
  (f1, f2) =
(
XATS2JS_dflt_eq$dflt
  (f1, f2)) where
{
#extern
fun
XATS2JS_dflt_eq$dflt
(f1: dflt, f2: dflt): bool = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
dflt_lte$dflt
  (f1, f2) =
(
XATS2JS_dflt_lte$dflt
  (f1, f2)) where
{
#extern
fun
XATS2JS_dflt_lte$dflt
(f1: dflt, f2: dflt): bool = $extnam()
}
//
#impltmp
<(*tmp*)>
dflt_gte$dflt
  (f1, f2) =
(
XATS2JS_dflt_gte$dflt
  (f1, f2)) where
{
#extern
fun
XATS2JS_dflt_gte$dflt
(f1: dflt, f2: dflt): bool = $extnam()
}
//
#impltmp
<(*tmp*)>
dflt_neq$dflt
  (f1, f2) =
(
XATS2JS_dflt_neq$dflt
  (f1, f2)) where
{
#extern
fun
XATS2JS_dflt_neq$dflt
(f1: dflt, f2: dflt): bool = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
dflt_add$dflt
  (f1, f2) =
(
XATS2JS_dflt_add$dflt
  (f1, f2)) where
{
#extern
fun
XATS2JS_dflt_add$dflt
(f1: dflt, f2: dflt): dflt = $extnam()
}
//
#impltmp
<(*tmp*)>
dflt_sub$dflt
  (f1, f2) =
(
XATS2JS_dflt_sub$dflt
  (f1, f2)) where
{
#extern
fun
XATS2JS_dflt_sub$dflt
(f1: dflt, f2: dflt): dflt = $extnam()
}
//
#impltmp
<(*tmp*)>
dflt_mul$dflt
  (f1, f2) =
(
XATS2JS_dflt_mul$dflt
  (f1, f2)) where
{
#extern
fun
XATS2JS_dflt_mul$dflt
(f1: dflt, f2: dflt): dflt = $extnam()
}
//
#impltmp
<(*tmp*)>
dflt_div$dflt
  (f1, f2) =
(
XATS2JS_dflt_div$dflt
  (f1, f2)) where
{
#extern
fun
XATS2JS_dflt_div$dflt
(f1: dflt, f2: dflt): dflt = $extnam()
}
//
#impltmp
<(*tmp*)>
dflt_mod$dflt
  (f1, f2) =
(
XATS2JS_dflt_mod$dflt
  (f1, f2)) where
{
#extern
fun
XATS2JS_dflt_mod$dflt
(f1: dflt, f2: dflt): dflt = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-09-05:
Mon 09 Sep 2024 06:13:03 PM EDT
*)
//
#impltmp
<(*tmp*)>
dflt_print
  ( f0 ) =
(
XATS2JS_dflt_print
  ( f0 )) where
{
#extern
fun
XATS2JS_dflt_print(f0: dflt): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-09-21:
Sat Sep 21 03:31:11 PM EDT 2024
*)
//
#impltmp
<(*tmp*)>
dflt_ceil
  ( df ) =
(
XATS2JS_dflt_ceil
  ( df )) where
{
#extern
fun
XATS2JS_dflt_ceil(df: dflt): dflt = $extnam()
}
//
#impltmp
<(*tmp*)>
dflt_floor
  ( df ) =
(
XATS2JS_dflt_floor
  ( df )) where
{
#extern
fun
XATS2JS_dflt_floor(df: dflt): dflt = $extnam()
}
//
#impltmp
<(*tmp*)>
dflt_round
  ( df ) =
(
XATS2JS_dflt_round
  ( df )) where
{
#extern
fun
XATS2JS_dflt_round(df: dflt): dflt = $extnam()
}
//
#impltmp
<(*tmp*)>
dflt_trunc
  ( df ) =
(
XATS2JS_dflt_trunc
  ( df )) where
{
#extern
fun
XATS2JS_dflt_trunc(df: dflt): dflt = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_CATS_JS_gint000.dats] *)
