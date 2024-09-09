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
Mon 09 Sep 2024 06:17:35 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
#typedef si = sint
#typedef df = dflt
(* ****** ****** *)
(* ****** ****** *)
#impltmp
g_0<df>() = (0.0)
#impltmp
g_1<df>() = (1.0)
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_lt<df> = dflt_lt_dflt<>
#impltmp
g_gt<df> = dflt_gt_dflt<>
#impltmp
g_eq<df> = dflt_eq_dflt<>
//
#impltmp
g_lte<df> = dflt_lte_dflt<>
#impltmp
g_gte<df> = dflt_gte_dflt<>
#impltmp
g_neq<df> = dflt_neq_dflt<>
//
#impltmp
g_cmp<df> = dflt_cmp_dflt<>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_add<df> = dflt_add_dflt<>
#impltmp
g_sub<df> = dflt_sub_dflt<>
#impltmp
g_mul<df> = dflt_mul_dflt<>
#impltmp
g_div<df> = dflt_div_dflt<>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print<df> = dflt_print<>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
dflt_neg( f1 ) = (0.0 - f1)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gflt000.dats] *)
