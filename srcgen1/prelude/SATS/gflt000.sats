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
gflt_print$sflt( sflt ): void
fun<>
gflt_print$dflt( dflt ): void
//
(* ****** ****** *)
//
fun<>
sflt_neg( f0: sflt ): sflt
fun<>
dflt_neg( f0: dflt ): dflt
//
fun<>
gflt_neg$sflt( f0: sflt ): sflt
fun<>
gflt_neg$dflt( f0: dflt ): dflt
//
(* ****** ****** *)
//
fun<>
sflt_abs( f0: sflt ): sflt
fun<>
dflt_abs( f0: dflt ): dflt
//
fun<>
gflt_abs$sflt( f0: sflt ): sflt
fun<>
gflt_abs$dflt( f0: dflt ): dflt
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
gflt_suc$sflt( f0: sflt ): sflt
fun<>
gflt_suc$dflt( f0: dflt ): dflt
//
fun<>
gflt_pre$sflt( f0: sflt ): sflt
fun<>
gflt_pre$dflt( f0: dflt ): dflt
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
gflt_sqr$sflt( f0: sflt ): sflt
fun<>
gflt_sqr$dflt( f0: dflt ): dflt
//
fun<>
gflt_cbr$sflt( f0: sflt ): sflt
fun<>
gflt_cbr$dflt( f0: dflt ): dflt
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
gflt_lt$sflt$sflt(sflt, sflt): bool
fun<>
gflt_gt$sflt$sflt(sflt, sflt): bool
fun<>
gflt_eq$sflt$sflt(sflt, sflt): bool
//
fun<>
gflt_lte$sflt$sflt(sflt, sflt): bool
fun<>
gflt_gte$sflt$sflt(sflt, sflt): bool
fun<>
gflt_neq$sflt$sflt(sflt, sflt): bool
//
(* ****** ****** *)
//
fun<>
dflt_lt$dflt
(f1: dflt, f2: dflt): bool
fun<>
dflt_gt$dflt
(f1: dflt, f2: dflt): bool
fun<>
dflt_eq$dflt
(f1: dflt, f2: dflt): bool
//
fun<>
dflt_lte$dflt
(f1: dflt, f2: dflt): bool
fun<>
dflt_gte$dflt
(f1: dflt, f2: dflt): bool
fun<>
dflt_neq$dflt
(f1: dflt, f2: dflt): bool
//
fun<>
dflt_cmp$dflt
(f1: dflt, f2: dflt): sint
//
fun<>
gflt_lt$dflt$dflt(dflt, dflt): bool
fun<>
gflt_gt$dflt$dflt(dflt, dflt): bool
fun<>
gflt_eq$dflt$dflt(dflt, dflt): bool
//
fun<>
gflt_lte$dflt$dflt(dflt, dflt): bool
fun<>
gflt_gte$dflt$dflt(dflt, dflt): bool
fun<>
gflt_neq$dflt$dflt(dflt, dflt): bool
//
(* ****** ****** *)
//
fun<>
gflt_cmp$sflt$sflt(sflt, sflt): sint
//
fun<>
gflt_cmp$dflt$dflt(dflt, dflt): sint
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
gflt_add$sflt$sflt(sflt, sflt): sflt
fun<>
gflt_sub$sflt$sflt(sflt, sflt): sflt
fun<>
gflt_mul$sflt$sflt(sflt, sflt): sflt
fun<>
gflt_div$sflt$sflt(sflt, sflt): sflt
fun<>
gflt_mod$sflt$sflt(sflt, sflt): sflt
//
(* ****** ****** *)
//
fun<>
dflt_add$dflt
(f1: dflt, f2: dflt): dflt
fun<>
dflt_sub$dflt
(f1: dflt, f2: dflt): dflt
fun<>
dflt_mul$dflt
(f1: dflt, f2: dflt): dflt
fun<>
dflt_div$dflt
(f1: dflt, f2: dflt): dflt
fun<>
dflt_mod$dflt
(f1: dflt, f2: dflt): dflt
//
fun<>
gflt_add$dflt$dflt(dflt, dflt): dflt
fun<>
gflt_sub$dflt$dflt(dflt, dflt): dflt
fun<>
gflt_mul$dflt$dflt(dflt, dflt): dflt
fun<>
gflt_div$dflt$dflt(dflt, dflt): dflt
fun<>
gflt_mod$dflt$dflt(dflt, dflt): dflt
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
dflt_lt$sint(dflt, sint): bool
fun<>
dflt_gt$sint(dflt, sint): bool
fun<>
dflt_eq$sint(dflt, sint): bool
fun<>
dflt_lte$sint(dflt, sint): bool
fun<>
dflt_gte$sint(dflt, sint): bool
fun<>
dflt_neq$sint(dflt, sint): bool
fun<>
dflt_cmp$sint(dflt, sint): sint
//
fun<>
gflt_lt$dflt$sint(dflt, sint): bool
fun<>
gflt_gt$dflt$sint(dflt, sint): bool
fun<>
gflt_eq$dflt$sint(dflt, sint): bool
fun<>
gflt_lte$dflt$sint(dflt, sint): bool
fun<>
gflt_gte$dflt$sint(dflt, sint): bool
fun<>
gflt_neq$dflt$sint(dflt, sint): bool
fun<>
gflt_cmp$dflt$sint(dflt, sint): sint
//
fun<>
gflt_gt$sint$dflt(sint, dflt): bool
fun<>
gflt_lt$sint$dflt(sint, dflt): bool
fun<>
gflt_eq$sint$dflt(sint, dflt): bool
fun<>
gflt_lte$sint$dflt(sint, dflt): bool
fun<>
gflt_gte$sint$dflt(sint, dflt): bool
fun<>
gflt_neq$sint$dflt(sint, dflt): bool
fun<>
gflt_cmp$sint$dflt(sint, dflt): sint
//
(* ****** ****** *)
//
fun<>
sint_add$dflt
(i1: sint, f2: dflt): dflt
fun<>
sint_sub$dflt
(i1: sint, f2: dflt): dflt
fun<>
sint_mul$dflt
(i1: sint, f2: dflt): dflt
fun<>
sint_div$dflt
(i1: sint, f2: dflt): dflt
//
fun<>
gflt_add$sint$dflt(sint, dflt): dflt
fun<>
gflt_sub$sint$dflt(sint, dflt): dflt
fun<>
gflt_mul$sint$dflt(sint, dflt): dflt
fun<>
gflt_div$sint$dflt(sint, dflt): dflt
//
(* ****** ****** *)
//
fun<>
dflt_add$sint
(f1: dflt, i2: sint): dflt
fun<>
dflt_sub$sint
(f1: dflt, i2: sint): dflt
fun<>
dflt_mul$sint
(f1: dflt, i2: sint): dflt
fun<>
dflt_div$sint
(f1: dflt, i2: sint): dflt
fun<>
dflt_mod$sint
(f1: dflt, i2: sint): dflt
//
fun<>
gflt_add$dflt$sint(dflt, sint): dflt
fun<>
gflt_sub$dflt$sint(dflt, sint): dflt
fun<>
gflt_mul$dflt$sint(dflt, sint): dflt
fun<>
gflt_div$dflt$sint(dflt, sint): dflt
fun<>
gflt_mod$dflt$sint(dflt, sint): dflt
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
cmp with gflt_cmp$sflt$sflt of 1001
//
#symload < with gflt_lt$sflt$sflt of 1001
#symload > with gflt_gt$sflt$sflt of 1001
#symload = with gflt_eq$sflt$sflt of 1001
//
#symload <= with gflt_lte$sflt$sflt of 1001
#symload >= with gflt_gte$sflt$sflt of 1001
#symload != with gflt_neq$sflt$sflt of 1001
//
(* ****** ****** *)
#symload + with gflt_add$sflt$sflt of 1001
#symload - with gflt_sub$sflt$sflt of 1001
#symload * with gflt_mul$sflt$sflt of 1001
#symload / with gflt_div$sflt$sflt of 1001
(* ****** ****** *)
(* ****** ****** *)
//
#symload
cmp with gflt_cmp$dflt$dflt of 1001
//
#symload < with gflt_lt$dflt$dflt of 1001
#symload > with gflt_gt$dflt$dflt of 1001
#symload = with gflt_eq$dflt$dflt of 1001
//
#symload <= with gflt_lte$dflt$dflt of 1001
#symload >= with gflt_gte$dflt$dflt of 1001
#symload != with gflt_neq$dflt$dflt of 1001
//
(* ****** ****** *)
#symload + with gflt_add$dflt$dflt of 1001
#symload - with gflt_sub$dflt$dflt of 1001
#symload * with gflt_mul$dflt$dflt of 1001
#symload / with gflt_div$dflt$dflt of 1001
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2023-11-10:
hybrid variants: sint$dflt/dflt$sint
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload
cmp with gflt_cmp$sint$dflt of 1000
//
#symload < with gflt_lt$sint$dflt of 1000
#symload > with gflt_gt$sint$dflt of 1000
#symload = with gflt_eq$sint$dflt of 1000
//
#symload <= with gflt_lte$sint$dflt of 1000
#symload >= with gflt_gte$sint$dflt of 1000
#symload != with gflt_neq$sint$dflt of 1000
//
(* ****** ****** *)
//
#symload
cmp with gflt_cmp$dflt$sint of 1000
//
#symload < with gflt_lt$dflt$sint of 1000
#symload > with gflt_gt$dflt$sint of 1000
#symload = with gflt_eq$dflt$sint of 1000
//
#symload <= with gflt_lte$dflt$sint of 1000
#symload >= with gflt_gte$dflt$sint of 1000
#symload != with gflt_neq$dflt$sint of 1000
//
(* ****** ****** *)
//
#symload + with gflt_add$sint$dflt of 1000
#symload - with gflt_sub$sint$dflt of 1000
#symload * with gflt_mul$sint$dflt of 1000
#symload / with gflt_div$sint$dflt of 1000
//
(* ****** ****** *)
//
#symload + with gflt_add$dflt$sint of 1000
#symload - with gflt_sub$dflt$sint of 1000
#symload * with gflt_mul$dflt$sint of 1000
#symload / with gflt_div$dflt$sint of 1000
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_SATS_gflt000.sats] *)
