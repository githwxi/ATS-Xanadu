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
g_lt<df> = dflt_lt$dflt<>
#impltmp
g_gt<df> = dflt_gt$dflt<>
#impltmp
g_eq<df> = dflt_eq$dflt<>
//
#impltmp
g_lte<df> = dflt_lte$dflt<>
#impltmp
g_gte<df> = dflt_gte$dflt<>
#impltmp
g_neq<df> = dflt_neq$dflt<>
//
#impltmp
g_cmp<df> = dflt_cmp$dflt<>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_add<df> = dflt_add$dflt<>
#impltmp
g_sub<df> = dflt_sub$dflt<>
#impltmp
g_mul<df> = dflt_mul$dflt<>
#impltmp
g_div<df> = dflt_div$dflt<>
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
dflt_lt$sint
  (f1, i2) =
dflt_lt$dflt(f1, g_si<dflt>(i2))
#impltmp
<(*tmp*)>
dflt_gt$sint
  (f1, i2) =
dflt_gt$dflt(f1, g_si<dflt>(i2))
#impltmp
<(*tmp*)>
dflt_eq$sint
  (f1, i2) =
dflt_eq$dflt(f1, g_si<dflt>(i2))
//
#impltmp
<(*tmp*)>
dflt_lte$sint
  (f1, i2) =
dflt_lte$dflt(f1, g_si<dflt>(i2))
#impltmp
<(*tmp*)>
dflt_gte$sint
  (f1, i2) =
dflt_gte$dflt(f1, g_si<dflt>(i2))
#impltmp
<(*tmp*)>
dflt_neq$sint
  (f1, i2) =
dflt_neq$dflt(f1, g_si<dflt>(i2))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
dflt_neg( f1 ) = (0.0-f1)
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
dflt_abs( f1 ) =
if
(f1 >= 0.0)
then f1 else dflt_neg<>(f1)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
dflt_suc( f1 ) = (f1+1.0)
#impltmp
<(*tmp*)>
dflt_pre( f1 ) = (f1-1.0)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
dflt_sqr( f1 ) = (f1*f1)
#impltmp
<(*tmp*)>
dflt_cbr( f1 ) = (f1*f1*f1)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
dflt_add$sint
  (f1, i2) =
dflt_add$dflt(f1, g_si<dflt>(i2))
#impltmp
<(*tmp*)>
dflt_sub$sint
  (f1, i2) =
dflt_sub$dflt(f1, g_si<dflt>(i2))
//
#impltmp
<(*tmp*)>
dflt_mul$sint
  (f1, i2) =
dflt_mul$dflt(f1, g_si<dflt>(i2))
#impltmp
<(*tmp*)>
dflt_div$sint
  (f1, i2) =
dflt_div$dflt(f1, g_si<dflt>(i2))
//
#impltmp
<(*tmp*)>
dflt_mod$sint
  (f1, i2) =
dflt_mod$dflt(f1, g_si<dflt>(i2))
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
sint_add$dflt
  (i1, f2) =
dflt_add$dflt(g_si<dflt>(i1), f2)
#impltmp
<(*tmp*)>
sint_sub$dflt
  (i1, f2) =
dflt_sub$dflt(g_si<dflt>(i1), f2)
//
#impltmp
<(*tmp*)>
sint_mul$dflt
  (i1, f2) =
dflt_mul$dflt(g_si<dflt>(i1), f2)
#impltmp
<(*tmp*)>
sint_div$dflt
  (i1, f2) =
dflt_div$dflt(g_si<dflt>(i1), f2)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gflt000.dats] *)
