(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
Sun Sep  6 11:41:11 AM EDT 2026
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
XATS2RB_si2dflt
  ( i1 )) where
{
#extern
fcast
XATS2RB_si2dflt
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
XATS2RB_dflt_neg
  ( f1 )) where
{
#extern
fun
XATS2RB_dflt_neg
(f1: dflt): dflt = $extnam() }
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
dflt_abs
  ( f1 ) =
(
XATS2RB_dflt_abs
  ( f1 )) where
{
#extern
fun
XATS2RB_dflt_abs
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
XATS2RB_dflt_sqrt
  ( f1 )) where
{
#extern
fun
XATS2RB_dflt_sqrt
(f1: dflt): dflt = $extnam() }
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
dflt_cbrt
  ( f1 ) =
(
XATS2RB_dflt_cbrt
  ( f1 )) where
{
#extern
fun
XATS2RB_dflt_cbrt
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
XATS2RB_dflt_lt$dflt
  (f1, f2)) where
{
#extern
fun
XATS2RB_dflt_lt$dflt
(f1: dflt, f2: dflt): bool = $extnam()
}
//
#impltmp
<(*tmp*)>
dflt_gt_dflt
  (f1, f2) =
(
XATS2RB_dflt_gt$dflt
  (f1, f2)) where
{
#extern
fun
XATS2RB_dflt_gt$dflt
(f1: dflt, f2: dflt): bool = $extnam()
}
//
#impltmp
<(*tmp*)>
dflt_eq$dflt
  (f1, f2) =
(
XATS2RB_dflt_eq$dflt
  (f1, f2)) where
{
#extern
fun
XATS2RB_dflt_eq$dflt
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
XATS2RB_dflt_lte$dflt
  (f1, f2)) where
{
#extern
fun
XATS2RB_dflt_lte$dflt
(f1: dflt, f2: dflt): bool = $extnam()
}
//
#impltmp
<(*tmp*)>
dflt_gte$dflt
  (f1, f2) =
(
XATS2RB_dflt_gte$dflt
  (f1, f2)) where
{
#extern
fun
XATS2RB_dflt_gte$dflt
(f1: dflt, f2: dflt): bool = $extnam()
}
//
#impltmp
<(*tmp*)>
dflt_neq$dflt
  (f1, f2) =
(
XATS2RB_dflt_neq$dflt
  (f1, f2)) where
{
#extern
fun
XATS2RB_dflt_neq$dflt
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
XATS2RB_dflt_add$dflt
  (f1, f2)) where
{
#extern
fun
XATS2RB_dflt_add$dflt
(f1: dflt, f2: dflt): dflt = $extnam()
}
//
#impltmp
<(*tmp*)>
dflt_sub$dflt
  (f1, f2) =
(
XATS2RB_dflt_sub$dflt
  (f1, f2)) where
{
#extern
fun
XATS2RB_dflt_sub$dflt
(f1: dflt, f2: dflt): dflt = $extnam()
}
//
#impltmp
<(*tmp*)>
dflt_mul$dflt
  (f1, f2) =
(
XATS2RB_dflt_mul$dflt
  (f1, f2)) where
{
#extern
fun
XATS2RB_dflt_mul$dflt
(f1: dflt, f2: dflt): dflt = $extnam()
}
//
#impltmp
<(*tmp*)>
dflt_div$dflt
  (f1, f2) =
(
XATS2RB_dflt_div$dflt
  (f1, f2)) where
{
#extern
fun
XATS2RB_dflt_div$dflt
(f1: dflt, f2: dflt): dflt = $extnam()
}
//
#impltmp
<(*tmp*)>
dflt_mod$dflt
  (f1, f2) =
(
XATS2RB_dflt_mod$dflt
  (f1, f2)) where
{
#extern
fun
XATS2RB_dflt_mod$dflt
(f1: dflt, f2: dflt): dflt = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
dflt_print
  ( f0 ) =
(
XATS2RB_dflt_print
  ( f0 )) where
{
#extern
fun
XATS2RB_dflt_print(f0: dflt): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
dflt_ceil
  ( df ) =
(
XATS2RB_dflt_ceil
  ( df )) where
{
#extern
fun
XATS2RB_dflt_ceil(df: dflt): dflt = $extnam()
}
//
#impltmp
<(*tmp*)>
dflt_floor
  ( df ) =
(
XATS2RB_dflt_floor
  ( df )) where
{
#extern
fun
XATS2RB_dflt_floor(df: dflt): dflt = $extnam()
}
//
#impltmp
<(*tmp*)>
dflt_round
  ( df ) =
(
XATS2RB_dflt_round
  ( df )) where
{
#extern
fun
XATS2RB_dflt_round(df: dflt): dflt = $extnam()
}
//
#impltmp
<(*tmp*)>
dflt_trunc
  ( df ) =
(
XATS2RB_dflt_trunc
  ( df )) where
{
#extern
fun
XATS2RB_dflt_trunc(df: dflt): dflt = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(*
end of [
ATS3-XANADU/srcgen2/xats2rb/srcgen1/prelude/DATS/CATS/RB/gflt000.dats] *)
(***********************************************************************)
(***********************************************************************)
