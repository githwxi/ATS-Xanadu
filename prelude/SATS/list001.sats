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
Sun 28 Jul 2024 08:51:05 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
list_strmize
(xs: list(a)): strm_vt(a)
fun
<a:t0>
list_strqize
{n:i0}
(xs: list(a, n)): strq_vt(a, n)
//
#symload strmize with list_strmize
#symload strqize with list_strqize
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
list_forall(xs: list(x0)): bool
fun
<x0:t0>
list_rforall(xs: list(x0)): bool
fun
<x0:t0>
list_iforall(xs: list(x0)): bool
fun
<x0:t0>
list_irforall(xs: list(x0)): bool
//
(* ****** ****** *)
//
fun
<x0:t0>
list_foritm(xs: list(x0)): void
fun
<x0:t0>
list_rforitm(xs: list(x0)): void
fun
<x0:t0>
list_iforitm(xs: list(x0)): void
fun
<x0:t0>
list_irforitm(xs: list(x0)): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-31:
Wed 31 Jul 2024 03:16:49 AM EDT
*)
fun
<x0:t0>
list_c2hoose0_lstrm
(xs: list(x0)): strm_vt@(x0, x0)
fun
<x0:vt>
list_c3hoose0_lstrm
(xs: list(x0)): strm_vt@(x0, x0, x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_list000.sats] *)
