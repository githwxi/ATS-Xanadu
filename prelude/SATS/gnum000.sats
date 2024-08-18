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
Fri 12 Jul 2024 06:59:23 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
g_0((*void*)): (a)
fun
<a:vt>
g_1((*void*)): (a)
fun
<a:vt>
g_2((*void*)): (a)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
g_si(i0: sint): (a)
fun
<a:vt>
g_ui(u0: uint): (a)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
g_sf(f0: sflt): (a)
fun
<a:vt>
g_df(f0: dflt): (a)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
g_neg(x0: x0): (x0)
fun
<x0:t0>
g_abs(x0: x0): (x0)
//
fun
<x0:t0>
g_suc(x0: x0): (x0)
fun
<x0:t0>
g_pre(x0: x0): (x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
g_add( x0, x0 ): (x0)
fun
<x0:t0>
g_sub( x0, x0 ): (x0)
fun
<x0:t0>
g_mul( x0, x0 ): (x0)
fun
<x0:t0>
g_div( x0, x0 ): (x0)
fun
<x0:t0>
g_mod( x0, x0 ): (x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
g_sqr( x0 ): (x0)
fun
<x0:t0>
g_cbe( x0 ): (x0)
fun
<x0:t0>
g_pow(x0, nint): (x0)
//
(* ****** ****** *)
//
(*
HX-2024-08-17:
This may not be
a good place for g_ncpy!
Sat 17 Aug 2024 09:20:01 PM EDT
*)
fun
<x0:t0>
g_ncpy(x0, nint): (x0)
#symload ncpy with g_ncpy of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gnum000.sats] *)
