(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author: Hongwei Xi
// Start Time: October, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
(*
** for generics
*)
(* ****** ****** *)
(*
#staload "./../SATS/gflt.sats"
*)
(* ****** ****** *)
//
impltmp
g_i<sflt> = gflt_i_sflt<>
impltmp
g_u<sflt> = gflt_u_sflt<>
//
impltmp
g_i<dflt> = gflt_i_dflt<>
impltmp
g_u<dflt> = gflt_u_dflt<>
//
(* ****** ****** *)

impltmp
g_print<sflt> = gflt_print_sflt<>
impltmp
g_print<dflt> = gflt_print_dflt<>

(* ****** ****** *)
//
impltmp
g_neg<sflt> = gflt_neg_sflt<>
impltmp
g_neg<dflt> = gflt_neg_dflt<>
//
impltmp
g_abs<sflt> = gflt_abs_sflt<>
impltmp
g_abs<dflt> = gflt_abs_dflt<>
//
impltmp
g_succ<sflt> = gflt_succ_sflt<>
impltmp
g_pred<sflt> = gflt_pred_sflt<>
impltmp
g_succ<dflt> = gflt_succ_dflt<>
impltmp
g_pred<dflt> = gflt_pred_dflt<>
//
(* ****** ****** *)
//
impltmp
g_lt<sflt> = gflt_lt_sflt_sflt<>
impltmp
g_gt<sflt> = gflt_gt_sflt_sflt<>
impltmp
g_eq<sflt> = gflt_eq_sflt_sflt<>
impltmp
g_lte<sflt> = gflt_lte_sflt_sflt<>
impltmp
g_gte<sflt> = gflt_gte_sflt_sflt<>
impltmp
g_neq<sflt> = gflt_neq_sflt_sflt<>
//
impltmp
g_lt<dflt> = gflt_lt_dflt_dflt<>
impltmp
g_gt<dflt> = gflt_gt_dflt_dflt<>
impltmp
g_eq<dflt> = gflt_eq_dflt_dflt<>
impltmp
g_lte<dflt> = gflt_lte_dflt_dflt<>
impltmp
g_gte<dflt> = gflt_gte_dflt_dflt<>
impltmp
g_neq<dflt> = gflt_neq_dflt_dflt<>
//
(* ****** ****** *)

impltmp
g_cmp<sflt> = gflt_cmp_sflt_sflt<>
impltmp
g_cmp<dflt> = gflt_cmp_dflt_dflt<>

(* ****** ****** *)
//
impltmp
g_add<sflt> = gflt_add_sflt_sflt<>
impltmp
g_sub<sflt> = gflt_sub_sflt_sflt<>
impltmp
g_mul<sflt> = gflt_mul_sflt_sflt<>
impltmp
g_div<sflt> = gflt_div_sflt_sflt<>
//
impltmp
g_add<dflt> = gflt_add_dflt_dflt<>
impltmp
g_sub<dflt> = gflt_sub_dflt_dflt<>
impltmp
g_mul<dflt> = gflt_mul_dflt_dflt<>
impltmp
g_div<dflt> = gflt_div_dflt_dflt<>
//
(* ****** ****** *)

(* end of [gflt.dats] *)
