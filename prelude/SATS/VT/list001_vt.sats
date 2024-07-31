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
Mon 08 Jul 2024 04:08:25 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
list_vt_forall0
(xs: ~list_vt(x0)): bool
fun
<x0:vt>
list_vt_forall1
(xs: !list_vt(x0)): bool
//
fun
<x0:vt>
list_vt_rforall0
(xs: ~list_vt(x0)): bool
fun
<x0:vt>
list_vt_rforall1
(xs: !list_vt(x0)): bool
//
fun
<x0:vt>
list_vt_iforall0
(xs: ~list_vt(x0)): bool
fun
<x0:vt>
list_vt_iforall1
(xs: !list_vt(x0)): bool
//
fun
<x0:vt>
list_vt_irforall0
(xs: ~list_vt(x0)): bool
fun
<x0:vt>
list_vt_irforall1
(xs: !list_vt(x0)): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
list_vt_foritm0
(xs: ~list_vt(x0)): void
fun
<x0:vt>
list_vt_foritm1
(xs: !list_vt(x0)): void
//
fun
<x0:vt>
list_vt_rforitm0
(xs: ~list_vt(x0)): void
fun
<x0:vt>
list_vt_rforitm1
(xs: !list_vt(x0)): void
//
fun
<x0:vt>
list_vt_iforitm0
(xs: ~list_vt(x0)): void
fun
<x0:vt>
list_vt_iforitm1
(xs: !list_vt(x0)): void
fun
<x0:vt>
list_vt_irforitm0
(xs: ~list_vt(x0)): void
fun
<x0:vt>
list_vt_irforitm1
(xs: !list_vt(x0)): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
list_vt_folditm0
(xs: list_vt(x0), r0: r0): (r0)
fun
<x0:vt>
<r0:vt>
list_vt_rfolditm0
(xs: list_vt(x0), r0: r0): (r0)
fun
<x0:vt>
<r0:vt>
list_vt_ifolditm0
(xs: list_vt(x0), r0: r0): (r0)
fun
<x0:vt>
<r0:vt>
list_vt_irfolditm0
(xs: list_vt(x0), r0: r0): (r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
list_vt_foldall0
(xs: ~list_vt(x0), r0: r0): (r0)
fun
<x0:vt>
<r0:vt>
list_vt_rfoldall0
(xs: ~list_vt(x0), r0: r0): (r0)
fun
<x0:vt>
<r0:vt>
list_vt_ifoldall0
(xs: ~list_vt(x0), r0: r0): (r0)
fun
<x0:vt>
<r0:vt>
list_vt_irfoldall0
(xs: ~list_vt(x0), r0: r0): (r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-31:
Wed 31 Jul 2024 03:16:49 AM EDT
*)
fun
<x0:vt>
list_vt_c2hoose0_lstrm
(xs: ~list_vt(x0)): strm_vt@(x0, x0)
fun
<x0:vt>
list_vt_c3hoose0_lstrm
(xs: ~list_vt(x0)): strm_vt@(x0, x0, x0)
//
fun
<x0:vt>
list_vt_nchoose0_lstrm$llist
{n0:nat}
( xs:
~ list_vt(x0)
, n0: nint(n0)): strm_vt(list_vt(x0, n0))
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_VT_list001_vt.sats] *)
