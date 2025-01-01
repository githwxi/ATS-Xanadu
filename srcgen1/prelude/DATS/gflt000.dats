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
(*
Author: Hongwei Xi
Start Time: October, 2018
Authoremail: gmhwxiATgmailDOTcom
*)
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
#impltmp
g_si<sflt> = gflt_si_sflt<>
#impltmp
g_ui<sflt> = gflt_ui_sflt<>
//
#impltmp
g_si<dflt> = gflt_si_dflt<>
#impltmp
g_ui<dflt> = gflt_ui_dflt<>
//
(* ****** ****** *)

#impltmp
g_print<sflt> = gflt_print$sflt<>
#impltmp
g_print<dflt> = gflt_print$dflt<>

(* ****** ****** *)
//
#impltmp
g_neg<sflt> = gflt_neg$sflt<>
#impltmp
g_neg<dflt> = gflt_neg$dflt<>
//
#impltmp
g_abs<sflt> = gflt_abs$sflt<>
#impltmp
g_abs<dflt> = gflt_abs$dflt<>
//
#impltmp
g_suc<sflt> = gflt_suc$sflt<>
#impltmp
g_pre<sflt> = gflt_pre$sflt<>
#impltmp
g_suc<dflt> = gflt_suc$dflt<>
#impltmp
g_pre<dflt> = gflt_pre$dflt<>
//
(* ****** ****** *)
//
#impltmp
g_lt<sflt> = gflt_lt$sflt$sflt<>
#impltmp
g_gt<sflt> = gflt_gt$sflt$sflt<>
#impltmp
g_eq<sflt> = gflt_eq$sflt$sflt<>
#impltmp
g_lte<sflt> = gflt_lte$sflt$sflt<>
#impltmp
g_gte<sflt> = gflt_gte$sflt$sflt<>
#impltmp
g_neq<sflt> = gflt_neq$sflt$sflt<>
//
#impltmp
g_lt<dflt> = gflt_lt$dflt$dflt<>
#impltmp
g_gt<dflt> = gflt_gt$dflt$dflt<>
#impltmp
g_eq<dflt> = gflt_eq$dflt$dflt<>
#impltmp
g_lte<dflt> = gflt_lte$dflt$dflt<>
#impltmp
g_gte<dflt> = gflt_gte$dflt$dflt<>
#impltmp
g_neq<dflt> = gflt_neq$dflt$dflt<>
//
(* ****** ****** *)

#impltmp
g_cmp<sflt> = gflt_cmp$sflt$sflt<>
#impltmp
g_cmp<dflt> = gflt_cmp$dflt$dflt<>

(* ****** ****** *)
//
#impltmp
g_add<sflt> = gflt_add$sflt$sflt<>
#impltmp
g_sub<sflt> = gflt_sub$sflt$sflt<>
#impltmp
g_mul<sflt> = gflt_mul$sflt$sflt<>
#impltmp
g_div<sflt> = gflt_div$sflt$sflt<>
//
#impltmp
g_add<dflt> = gflt_add$dflt$dflt<>
#impltmp
g_sub<dflt> = gflt_sub$dflt$dflt<>
#impltmp
g_mul<dflt> = gflt_mul$dflt$dflt<>
#impltmp
g_div<dflt> = gflt_div$dflt$dflt<>
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
gflt_lt$dflt$sint(f1, i2) =
gflt_lt$dflt$dflt(f1, g_si(i2))
#impltmp
<>(*tmp*)
gflt_gt$dflt$sint(f1, i2) =
gflt_gt$dflt$dflt(f1, g_si(i2))
#impltmp
<>(*tmp*)
gflt_eq$dflt$sint(f1, i2) =
gflt_eq$dflt$dflt(f1, g_si(i2))
#impltmp
<>(*tmp*)
gflt_lte$dflt$sint(f1, i2) =
gflt_lte$dflt$dflt(f1, g_si(i2))
#impltmp
<>(*tmp*)
gflt_gte$dflt$sint(f1, i2) =
gflt_gte$dflt$dflt(f1, g_si(i2))
#impltmp
<>(*tmp*)
gflt_neq$dflt$sint(f1, i2) =
gflt_neq$dflt$dflt(f1, g_si(i2))
//
#impltmp
<>(*tmp*)
gflt_cmp$dflt$sint(f1, i2) =
gflt_cmp$dflt$dflt(f1, g_si(i2))
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
gflt_lt$sint$dflt(i1, f2) =
gflt_lt$dflt$dflt(g_si(i1), f2)
#impltmp
<>(*tmp*)
gflt_gt$sint$dflt(i1, f2) =
gflt_gt$dflt$dflt(g_si(i1), f2)
#impltmp
<>(*tmp*)
gflt_eq$sint$dflt(i1, f2) =
gflt_eq$dflt$dflt(g_si(i1), f2)
#impltmp
<>(*tmp*)
gflt_lte$sint$dflt(i1, f2) =
gflt_lte$dflt$dflt(g_si(i1), f2)
#impltmp
<>(*tmp*)
gflt_gte$sint$dflt(i1, f2) =
gflt_gte$dflt$dflt(g_si(i1), f2)
#impltmp
<>(*tmp*)
gflt_neq$sint$dflt(i1, f2) =
gflt_neq$dflt$dflt(g_si(i1), f2)
//
#impltmp
<>(*tmp*)
gflt_cmp$sint$dflt(i1, f2) =
gflt_cmp$dflt$dflt(g_si(i1), f2)
//
(* ****** ****** *)

#impltmp
<>(*tmp*)
gflt_add$sint$dflt(i1, f2) =
gflt_add$dflt$dflt(g_si(i1), f2)
#impltmp
<>(*tmp*)
gflt_sub$sint$dflt(i1, f2) =
gflt_sub$dflt$dflt(g_si(i1), f2)
#impltmp
<>(*tmp*)
gflt_mul$sint$dflt(i1, f2) =
gflt_mul$dflt$dflt(g_si(i1), f2)
#impltmp
<>(*tmp*)
gflt_div$sint$dflt(i1, f2) =
gflt_div$dflt$dflt(g_si(i1), f2)

(* ****** ****** *)

#impltmp
<>(*tmp*)
gflt_add$dflt$sint(f1, i2) =
gflt_add$dflt$dflt(f1, g_si(i2))
#impltmp
<>(*tmp*)
gflt_sub$dflt$sint(f1, i2) =
gflt_sub$dflt$dflt(f1, g_si(i2))
#impltmp
<>(*tmp*)
gflt_mul$dflt$sint(f1, i2) =
gflt_mul$dflt$dflt(f1, g_si(i2))
#impltmp
<>(*tmp*)
gflt_div$dflt$sint(f1, i2) =
gflt_div$dflt$dflt(f1, g_si(i2))

(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_DATS_gflt000.dats] *)
