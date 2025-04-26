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
Sat 10 Aug 2024 03:48:01 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
g_lt(x1, x2) =
g_gt<x0>(x2, x1)
#impltmp
< x0:t0 >
g_gt(x1, x2) =
g_lt<x0>(x2, x1)
//
#impltmp
< x0:t0 >
g_lt(x1, x2) =
(
g_cmp<x0>(x1, x2) < 0)
#impltmp
< x0:t0 >
g_gt(x1, x2) =
(
g_cmp<x0>(x1, x2) > 0)
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
g_lte(x1, x2) =
g_gte<x0>(x2, x1)
#impltmp
< x0:t0 >
g_gte(x1, x2) =
g_lte<x0>(x2, x1)
//
#impltmp
< x0:t0 >
g_lte(x1, x2) =
(
g_cmp<x0>(x1, x2) <= 0)
#impltmp
< x0:t0 >
g_gte(x1, x2) =
(
g_cmp<x0>(x1, x2) >= 0)
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
g_eq(x1, x2) =
(
g_cmp<x0>(x1, x2) = 0)
#impltmp
< x0:t0 >
g_neq(x1, x2) =
(
g_cmp<x0>(x1, x2) != 0)
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
g_cmp(x1, x2) =
(
if
g_lt<x0>(x1, x2)
then -1 else
if
g_lt<x0>(x2, x1) then -1 else 0
)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
g_ltz(x0) =
g_lt<x0>(x0, g_0<x0>((*void*)))
#impltmp
< x0:t0 >
g_gtz(x0) =
g_gt<x0>(x0, g_0<x0>((*void*)))
#impltmp
< x0:t0 >
g_eqz(x0) =
g_eq<x0>(x0, g_0<x0>((*void*)))
//
#impltmp
< x0:t0 >
g_ltez(x0) =
g_lte<x0>(x0, g_0<x0>((*void*)))
#impltmp
< x0:t0 >
g_gtez(x0) =
g_gte<x0>(x0, g_0<x0>((*void*)))
#impltmp
< x0:t0 >
g_neqz(x0) =
g_neq<x0>(x0, g_0<x0>((*void*)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
g_max(x1, x2) =
(
if // if
g_gte<x0>(x1, x2) then x1 else x2)
//
#impltmp
< x0:t0 >
g_min(x1, x2) =
(
if // if
g_lte<x0>(x1, x2) then x1 else x2)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gord000.dats] *)
