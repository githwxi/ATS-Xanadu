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
//
(*
Author: Hongwei Xi
(*
Fri 26 Jul 2024 09:27:30 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
sflt_print(sflt): void
fun<>
dflt_print(dflt): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
dflt_abs(df: dflt): dflt
#symload abs with dflt_abs of 1000
//
fun<>
dflt_neg(df: dflt): dflt
#symload - with dflt_neg of 1000
#symload neg with dflt_neg of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
dflt_sqrt(df: dflt): dflt
#symload sqrt with dflt_sqrt of 1000
fun<>
dflt_cbrt(df: dflt): dflt
#symload cbrt with dflt_cbrt of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
dflt_lt_dflt
(f1: dflt, f2: dflt): bool
fun<>
dflt_gt_dflt
(f1: dflt, f2: dflt): bool
fun<>
dflt_eq_dflt
(f1: dflt, f2: dflt): bool
//
#symload < with dflt_lt_dflt of 1000
#symload > with dflt_gt_dflt of 1000
#symload = with dflt_eq_dflt of 1000
//
fun<>
dflt_lte_dflt
(f1: dflt, f2: dflt): bool
fun<>
dflt_gte_dflt
(f1: dflt, f2: dflt): bool
fun<>
dflt_neq_dflt
(f1: dflt, f2: dflt): bool
//
#symload <= with dflt_lte_dflt of 1000
#symload >= with dflt_gte_dflt of 1000
#symload != with dflt_neq_dflt of 1000
//
(* ****** ****** *)
//
fun<>
dflt_cmp_dflt(f1: dflt, f2: dflt): sint
#symload cmp with dflt_cmp_dflt of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
dflt_add_dflt
(f1: dflt, f2: dflt): dflt
fun<>
dflt_sub_dflt
(f1: dflt, f2: dflt): dflt
fun<>
dflt_mul_dflt
(f1: dflt, f2: dflt): dflt
fun<>
dflt_div_dflt
(f1: dflt, f2: dflt): dflt
fun<>
dflt_mod_dflt
(f1: dflt, f2: dflt): dflt
//
#symload + with dflt_add_dflt of 1000
#symload - with dflt_sub_dflt of 1000
#symload * with dflt_mul_dflt of 1000
#symload / with dflt_div_dflt of 1000
#symload % with dflt_mod_dflt of 1000
//
(* ****** ****** *)
//
fun<>
dflt_add_sint
(f1: dflt, i2: sint): dflt
fun<>
sint_add_dflt
(i1: sint, f2: dflt): dflt
//
fun<>
dflt_sub_sint
(f1: dflt, i2: sint): dflt
fun<>
sint_sub_dflt
(i1: sint, f2: dflt): dflt
//
fun<>
dflt_mul_sint
(f1: dflt, i2: sint): dflt
fun<>
sint_mul_dflt
(i1: sint, f2: dflt): dflt
//
fun<>
dflt_div_sint
(f1: dflt, i2: sint): dflt
fun<>
sint_div_dflt
(i1: sint, f2: dflt): dflt
//
fun<>
dflt_mod_sint
(f1: dflt, i2: sint): dflt
//
(* ****** ****** *)
//
#symload + with dflt_add_sint of 1000
#symload + with sint_add_dflt of 1000
//
#symload - with dflt_sub_sint of 1000
#symload - with sint_sub_dflt of 1000
//
#symload * with dflt_mul_sint of 1000
#symload * with sint_mul_dflt of 1000
//
#symload / with dflt_div_sint of 1000
#symload / with sint_div_dflt of 1000
//
#symload % with dflt_mod_sint of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gflt000.sats] *)
