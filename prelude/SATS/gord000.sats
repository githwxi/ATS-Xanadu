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
Sat 10 Aug 2024 03:05:09 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
//
fun
<a:t0>
g_lt(a, a): bool
fun
<a:t0>
g_gt(a, a): bool
fun
<a:t0>
g_eq(a, a): bool
//
fun
<a:t0>
g_lte(a, a): bool
fun
<a:t0>
g_gte(a, a): bool
fun
<a:t0>
g_neq(a, a): bool
//
(* ****** ****** *)
//
fun
<a:t0>
g_cmp(a, a): sint
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
g_max( x0, x0 ): (x0)
fun
<x0:t0>
g_min( x0, x0 ): (x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-04-25:
generic zero-comparisons
*)
//
fun
<x0:t0>
g_ltz( x0: x0 ): (bool)
fun
<x0:t0>
g_gtz( x0: x0 ): (bool)
fun
<x0:t0>
g_eqz( x0: x0 ): (bool)
//
fun
<x0:t0>
g_ltez( x0: x0 ): (bool)
fun
<x0:t0>
g_gtez( x0: x0 ): (bool)
fun
<x0:t0>
g_neqz( x0: x0 ): (bool)
//
(* ****** ****** *)
//
#symload ltz with g_ltz of 0100
#symload gtz with g_gtz of 0100
#symload eqz with g_eqz of 0100
//
#symload ltez with g_ltez of 0100
#symload gtez with g_gtez of 0100
#symload neqz with g_neqz of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gord000.sats] *)
