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
list_listize
{n:i0}
(xs: list(a, n)): list_vt(a, n)
//
#symload listize with list_listize of 1000
//
fun
<a:t0>
list_rlistize
{n:i0}
(xs: list(a, n)): list_vt(a, n)
//
#symload rlistize with list_rlistize of 1000
//
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
#symload strmize with list_strmize of 1000
#symload strqize with list_strqize of 1000
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
#symload forall with list_forall of 1000
#symload rforall with list_rforall of 1000
#symload iforall with list_iforall of 1000
#symload irforall with list_irforall of 1000
//
(* ****** ****** *)
//
fun
<x0:t0>
list_forall$f1un
( xs
: list(x0), test: (x0) -> bool): bool
#symload forall with list_forall$f1un of 1000
#symload forall$fun with list_forall$f1un of 1000
//
fun
<x0:t0>
list_iforall$f2un
( xs
: list(x0), test: (ni,x0) -> bool): bool
#symload iforall with list_iforall$f2un of 1000
#symload iforall$fun with list_iforall$f2un of 1000
//
(* ****** ****** *)
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
#symload foritm with list_foritm of 1000
#symload rforitm with list_rforitm of 1000
#symload iforitm with list_iforitm of 1000
#symload irforitm with list_irforitm of 1000
//
(* ****** ****** *)
//
fun
<x0:t0>
list_foritm$f1un
( xs
: list(x0), work: (x0) -> void): void
#symload foritm with list_foritm$f1un of 1000
#symload foritm$fun with list_foritm$f1un of 1000
//
fun
<x0:t0>
list_iforitm$f2un
( xs
: list(x0), work: (ni,x0) -> void): void
#symload iforitm with list_iforitm$f2un of 1000
#symload iforitm$fun with list_iforitm$f2un of 1000
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
list_c2hoose_lstrm
(xs: list(x0)): strm_vt@(x0, x0)
//
#symload c2hoose_lstrm with list_c2hoose_lstrm
//
fun
<x0:t0>
list_c2hoose$forall(list(x0)): bool
fun
<x0:t0>
list_c2hoose$forall$f2un
(xs:list(x0), test:(x0,x0)->bool): bool
//
#symload c2hoose$forall with list_c2hoose$forall
#symload c2hoose$forall with list_c2hoose$forall$f2un
//
(* ****** ****** *)
//
fun
<x0:t0>
list_c3hoose_lstrm
(xs: list(x0)): strm_vt@(x0, x0, x0)
//
#symload c3hoose_lstrm with list_c3hoose_lstrm
//
fun
<x0:t0>
list_c3hoose$forall(list(x0)): bool
fun
<x0:t0>
list_c3hoose$forall$f3un
(xs:list(x0), test:(x0,x0,x0)->bool): bool
//
#symload c3hoose$forall with list_c3hoose$forall
#symload c3hoose$forall with list_c3hoose$forall$f3un
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-31:
Wed 31 Jul 2024 12:53:34 PM EDT
*)
//
fun
<x0:t0>
list_fmake((*void*)): list(x0)
fun
<x0:t0>
list_fmake_fwork
(fwork: (x0 -> void) -> void): list(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-09-03:
Tue 03 Sep 2024 01:11:20 PM EDT
*)
//
fun
<x0:t0>
<y0:t0>
list_map
{ln:nat}
(xs: list(x0, ln)): list(y0, ln)
fun
<x0:t0>
<y0:t0>
list_map$f1un
{ln:nat}
(xs: list(x0, ln), (x0)->y0): list(y0, ln)
//
#symload map with list_map of 1000
#symload map with list_map$f1un of 1000
#symload map$fun with list_map$f1un of 1000
#symload list_map with list_map$f1un of 1000
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:vt>
list_map_vt
{ln:nat}
(xs: list(x0, ln)): list_vt(y0, ln)
fun
<x0:t0>
<y0:vt>
list_map$f1un_vt
{ln:nat}
(xs: list(x0, ln), (x0)->y0): list_vt(y0, ln)
//
#symload map_vt with list_map_vt of 1000
#symload map_vt with list_map$f1un_vt of 1000
#symload map$fun_vt with list_map$f1un_vt of 1000
#symload list_map_vt with list_map$f1un_vt of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
list_maprev
{ln:nat}
(xs: list(x0, ln)): list(y0, ln)
fun
<x0:t0>
<y0:t0>
list_maprev$f1un
{ln:nat}
(xs: list(x0, ln), (x0)->y0): list(y0, ln)
//
#symload maprev with list_maprev of 1000
#symload maprev with list_maprev$f1un of 1000
#symload maprev$fun with list_maprev$f1un of 1000
#symload list_maprev with list_maprev$f1un of 1000
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:vt>
list_maprev_vt
{ln:nat}
(xs: list(x0, ln)): list_vt(y0, ln)
fun
<x0:t0>
<y0:vt>
list_maprev$f1un_vt
{ln:nat}
(xs: list(x0, ln), (x0)->y0): list_vt(y0, ln)
//
#symload maprev_vt with list_maprev_vt of 1000
#symload maprev_vt with list_maprev$f1un_vt of 1000
#symload maprev$fun_vt with list_maprev$f1un_vt of 1000
#symload list_maprev_vt with list_maprev$f1un_vt of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_list001.sats] *)
