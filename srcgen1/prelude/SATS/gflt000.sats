(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
// For
// generic floating points
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: June, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

fun<>
gflt_si_sflt(sint): sflt
fun<>
gflt_ui_sflt(uint): sflt

(* ****** ****** *)

fun<>
gflt_si_dflt(sint): dflt
fun<>
gflt_ui_dflt(uint): dflt

(* ****** ****** *)
//
fun<>
sflt_print(sf: sflt): void
fun<>
dflt_print(df: dflt): void
//
fun<>
gflt_print_sflt( sflt ): void
fun<>
gflt_print_dflt( dflt ): void
//
(* ****** ****** *)
//
fun<>
sflt_neg( f0: sflt ): sflt
fun<>
dflt_neg( f0: dflt ): dflt
//
fun<>
gflt_neg_sflt( f0: sflt ): sflt
fun<>
gflt_neg_dflt( f0: dflt ): dflt
//
(* ****** ****** *)
//
fun<>
sflt_abs( f0: sflt ): sflt
fun<>
dflt_abs( f0: dflt ): dflt
//
fun<>
gflt_abs_sflt( f0: sflt ): sflt
fun<>
gflt_abs_dflt( f0: dflt ): dflt
//
(* ****** ****** *)
//
fun<>
sflt_suc( f0: sflt ): sflt
fun<>
dflt_suc( f0: dflt ): dflt
//
fun<>
sflt_pre( f0: sflt ): sflt
fun<>
dflt_pre( f0: dflt ): dflt
//
fun<>
gflt_suc_sflt( f0: sflt ): sflt
fun<>
gflt_suc_dflt( f0: dflt ): dflt
//
fun<>
gflt_pre_sflt( f0: sflt ): sflt
fun<>
gflt_pre_dflt( f0: dflt ): dflt
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
sflt_sqr( f0: sflt ): sflt
fun<>
dflt_sqr( f0: dflt ): dflt
//
fun<>
sflt_cbr( f0: sflt ): sflt
fun<>
dflt_cbr( f0: dflt ): dflt
//
fun<>
gflt_sqr_sflt( f0: sflt ): sflt
fun<>
gflt_sqr_dflt( f0: dflt ): dflt
//
fun<>
gflt_cbr_sflt( f0: sflt ): sflt
fun<>
gflt_cbr_dflt( f0: dflt ): dflt
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
gflt_lt_sflt_sflt(sflt, sflt): bool
fun<>
gflt_gt_sflt_sflt(sflt, sflt): bool
fun<>
gflt_eq_sflt_sflt(sflt, sflt): bool
//
fun<>
gflt_lte_sflt_sflt(sflt, sflt): bool
fun<>
gflt_gte_sflt_sflt(sflt, sflt): bool
fun<>
gflt_neq_sflt_sflt(sflt, sflt): bool
//
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
fun<>
dflt_cmp_dflt
(f1: dflt, f2: dflt): sint
//
fun<>
gflt_lt_dflt_dflt(dflt, dflt): bool
fun<>
gflt_gt_dflt_dflt(dflt, dflt): bool
fun<>
gflt_eq_dflt_dflt(dflt, dflt): bool
//
fun<>
gflt_lte_dflt_dflt(dflt, dflt): bool
fun<>
gflt_gte_dflt_dflt(dflt, dflt): bool
fun<>
gflt_neq_dflt_dflt(dflt, dflt): bool
//
(* ****** ****** *)
//
fun<>
gflt_cmp_sflt_sflt(sflt, sflt): sint
//
fun<>
gflt_cmp_dflt_dflt(dflt, dflt): sint
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
gflt_add_sflt_sflt(sflt, sflt): sflt
fun<>
gflt_sub_sflt_sflt(sflt, sflt): sflt
fun<>
gflt_mul_sflt_sflt(sflt, sflt): sflt
fun<>
gflt_div_sflt_sflt(sflt, sflt): sflt
fun<>
gflt_mod_sflt_sflt(sflt, sflt): sflt
//
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
fun<>
gflt_add_dflt_dflt(dflt, dflt): dflt
fun<>
gflt_sub_dflt_dflt(dflt, dflt): dflt
fun<>
gflt_mul_dflt_dflt(dflt, dflt): dflt
fun<>
gflt_div_dflt_dflt(dflt, dflt): dflt
fun<>
gflt_mod_dflt_dflt(dflt, dflt): dflt
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
dflt_lt_sint(dflt, sint): bool
fun<>
dflt_gt_sint(dflt, sint): bool
fun<>
dflt_eq_sint(dflt, sint): bool
fun<>
dflt_lte_sint(dflt, sint): bool
fun<>
dflt_gte_sint(dflt, sint): bool
fun<>
dflt_neq_sint(dflt, sint): bool
fun<>
dflt_cmp_sint(dflt, sint): sint
//
fun<>
gflt_lt_dflt_sint(dflt, sint): bool
fun<>
gflt_gt_dflt_sint(dflt, sint): bool
fun<>
gflt_eq_dflt_sint(dflt, sint): bool
fun<>
gflt_lte_dflt_sint(dflt, sint): bool
fun<>
gflt_gte_dflt_sint(dflt, sint): bool
fun<>
gflt_neq_dflt_sint(dflt, sint): bool
fun<>
gflt_cmp_dflt_sint(dflt, sint): sint
//
fun<>
gflt_gt_sint_dflt(sint, dflt): bool
fun<>
gflt_lt_sint_dflt(sint, dflt): bool
fun<>
gflt_eq_sint_dflt(sint, dflt): bool
fun<>
gflt_lte_sint_dflt(sint, dflt): bool
fun<>
gflt_gte_sint_dflt(sint, dflt): bool
fun<>
gflt_neq_sint_dflt(sint, dflt): bool
fun<>
gflt_cmp_sint_dflt(sint, dflt): sint
//
(* ****** ****** *)
//
fun<>
sint_add_dflt
(i1: sint, f2: dflt): dflt
fun<>
sint_sub_dflt
(i1: sint, f2: dflt): dflt
fun<>
sint_mul_dflt
(i1: sint, f2: dflt): dflt
fun<>
sint_div_dflt
(i1: sint, f2: dflt): dflt
//
fun<>
gflt_add_sint_dflt(sint, dflt): dflt
fun<>
gflt_sub_sint_dflt(sint, dflt): dflt
fun<>
gflt_mul_sint_dflt(sint, dflt): dflt
fun<>
gflt_div_sint_dflt(sint, dflt): dflt
//
(* ****** ****** *)
//
fun<>
dflt_add_sint
(f1: dflt, i2: sint): dflt
fun<>
dflt_sub_sint
(f1: dflt, i2: sint): dflt
fun<>
dflt_mul_sint
(f1: dflt, i2: sint): dflt
fun<>
dflt_div_sint
(f1: dflt, i2: sint): dflt
fun<>
dflt_mod_sint
(f1: dflt, i2: sint): dflt
//
fun<>
gflt_add_dflt_sint(dflt, sint): dflt
fun<>
gflt_sub_dflt_sint(dflt, sint): dflt
fun<>
gflt_mul_dflt_sint(dflt, sint): dflt
fun<>
gflt_div_dflt_sint(dflt, sint): dflt
fun<>
gflt_mod_dflt_sint(dflt, sint): dflt
//
(* ****** ****** *)
(* ****** ****** *)
//
// HX-2020-11-18:
// For symbol overloading
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload
cmp with gflt_cmp_sflt_sflt of 1001
//
#symload < with gflt_lt_sflt_sflt of 1001
#symload > with gflt_gt_sflt_sflt of 1001
#symload = with gflt_eq_sflt_sflt of 1001
//
#symload <= with gflt_lte_sflt_sflt of 1001
#symload >= with gflt_gte_sflt_sflt of 1001
#symload != with gflt_neq_sflt_sflt of 1001
//
(* ****** ****** *)
#symload + with gflt_add_sflt_sflt of 1001
#symload - with gflt_sub_sflt_sflt of 1001
#symload * with gflt_mul_sflt_sflt of 1001
#symload / with gflt_div_sflt_sflt of 1001
(* ****** ****** *)
(* ****** ****** *)
//
#symload
cmp with gflt_cmp_dflt_dflt of 1001
//
#symload < with gflt_lt_dflt_dflt of 1001
#symload > with gflt_gt_dflt_dflt of 1001
#symload = with gflt_eq_dflt_dflt of 1001
//
#symload <= with gflt_lte_dflt_dflt of 1001
#symload >= with gflt_gte_dflt_dflt of 1001
#symload != with gflt_neq_dflt_dflt of 1001
//
(* ****** ****** *)
#symload + with gflt_add_dflt_dflt of 1001
#symload - with gflt_sub_dflt_dflt of 1001
#symload * with gflt_mul_dflt_dflt of 1001
#symload / with gflt_div_dflt_dflt of 1001
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2023-11-10:
hybrid variants: sint_dflt/dflt_sint
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload
cmp with gflt_cmp_sint_dflt of 1000
//
#symload < with gflt_lt_sint_dflt of 1000
#symload > with gflt_gt_sint_dflt of 1000
#symload = with gflt_eq_sint_dflt of 1000
//
#symload <= with gflt_lte_sint_dflt of 1000
#symload >= with gflt_gte_sint_dflt of 1000
#symload != with gflt_neq_sint_dflt of 1000
//
(* ****** ****** *)
//
#symload
cmp with gflt_cmp_dflt_sint of 1000
//
#symload < with gflt_lt_dflt_sint of 1000
#symload > with gflt_gt_dflt_sint of 1000
#symload = with gflt_eq_dflt_sint of 1000
//
#symload <= with gflt_lte_dflt_sint of 1000
#symload >= with gflt_gte_dflt_sint of 1000
#symload != with gflt_neq_dflt_sint of 1000
//
(* ****** ****** *)
//
#symload + with gflt_add_sint_dflt of 1000
#symload - with gflt_sub_sint_dflt of 1000
#symload * with gflt_mul_sint_dflt of 1000
#symload / with gflt_div_sint_dflt of 1000
//
(* ****** ****** *)
//
#symload + with gflt_add_dflt_sint of 1000
#symload - with gflt_sub_dflt_sint of 1000
#symload * with gflt_mul_dflt_sint of 1000
#symload / with gflt_div_dflt_sint of 1000
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_SATS_gflt000.sats] *)
