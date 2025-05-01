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
Wed Apr 30 07:57:27 PM EDT 2025
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
//
#extern
fun
XATS000_gflt_si_dflt
( x0: sint ): dflt = $extnam()
#impltmp
gflt_si_dflt<> = XATS000_gflt_si_dflt
//
(* ****** ****** *)
//
#extern
fun
XATS000_gflt_neg$dflt
  ( x0: dflt ): dflt = $extnam()
#impltmp
gflt_neg$dflt<> = XATS000_gflt_neg$dflt
//
#extern
fun
XATS000_gflt_abs$dflt
  ( x0: dflt ): dflt = $extnam()
#impltmp
gflt_abs$dflt<> = XATS000_gflt_abs$dflt
//
(* ****** ****** *)
//
#extern
fun
XATS000_gflt_suc$dflt
  ( x0: dflt ): dflt = $extnam()
#impltmp
gflt_suc$dflt<> = XATS000_gflt_suc$dflt
#extern
fun
XATS000_gflt_pre$dflt
  ( x0: dflt ): dflt = $extnam()
#impltmp
gflt_pre$dflt<> = XATS000_gflt_pre$dflt
//
(* ****** ****** *)
//
#extern
fun
XATS000_gflt_lt$dflt$dflt
( x0: dflt, y0: dflt ): bool = $extnam()
#extern
fun
XATS000_gflt_gt$dflt$dflt
( x0: dflt, y0: dflt ): bool = $extnam()
#extern
fun
XATS000_gflt_eq$dflt$dflt
( x0: dflt, y0: dflt ): bool = $extnam()
#extern
fun
XATS000_gflt_lte$dflt$dflt
( x0: dflt, y0: dflt ): bool = $extnam()
#extern
fun
XATS000_gflt_gte$dflt$dflt
( x0: dflt, y0: dflt ): bool = $extnam()
#extern
fun
XATS000_gflt_neq$dflt$dflt
( x0: dflt, y0: dflt ): bool = $extnam()
//
#impltmp
gflt_lt$dflt$dflt<> = XATS000_gflt_lt$dflt$dflt
#impltmp
gflt_gt$dflt$dflt<> = XATS000_gflt_gt$dflt$dflt
#impltmp
gflt_eq$dflt$dflt<> = XATS000_gflt_eq$dflt$dflt
#impltmp
gflt_lte$dflt$dflt<> = XATS000_gflt_lte$dflt$dflt
#impltmp
gflt_gte$dflt$dflt<> = XATS000_gflt_gte$dflt$dflt
#impltmp
gflt_neq$dflt$dflt<> = XATS000_gflt_neq$dflt$dflt
//
(* ****** ****** *)
//
#extern
fun
XATS000_gflt_cmp$dflt$dflt
( x0: dflt, y0: dflt ): sint = $extnam()
#impltmp
gflt_cmp$dflt$dflt<> = XATS000_gflt_cmp$dflt$dflt
//
(* ****** ****** *)
//
#extern
fun
XATS000_gflt_add$dflt$dflt
( x0: dflt, y0: dflt ): dflt = $extnam()
#extern
fun
XATS000_gflt_sub$dflt$dflt
( x0: dflt, y0: dflt ): dflt = $extnam()
#extern
fun
XATS000_gflt_mul$dflt$dflt
( x0: dflt, y0: dflt ): dflt = $extnam()
#extern
fun
XATS000_gflt_div$dflt$dflt
( x0: dflt, y0: dflt ): dflt = $extnam()
//
#impltmp
gflt_add$dflt$dflt<> = XATS000_gflt_add$dflt$dflt
#impltmp
gflt_sub$dflt$dflt<> = XATS000_gflt_sub$dflt$dflt
#impltmp
gflt_mul$dflt$dflt<> = XATS000_gflt_mul$dflt$dflt
#impltmp
gflt_div$dflt$dflt<> = XATS000_gflt_div$dflt$dflt
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_gflt000.dats] *)
(***********************************************************************)
