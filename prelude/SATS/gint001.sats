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
Fri 12 Jul 2024 11:22:47 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
nint_strmize
(xs: nint): strm_vt(ni)
fun<>
nint_strqize
{n:i0}
(xs: nint(n)): strq_vt(ni, n)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
nint_forall(xs: nint): bool
fun<>
nint_foritm(xs: nint): bool
//
fun<>
nint_rforall(xs: nint): bool
fun<>
nint_rforitm(xs: nint): bool
//
fun<>
nint_iforall(xs: nint): bool
fun<>
nint_iforitm(xs: nint): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<y0:vt>
nint_map_llist
 {n0:i0}
(xs: nint(n0)): list_vt(y0, n0)
//
#symload
map_llist with nint_map_llist of 1000
//
(* ****** ****** *)
//
fun
<y0:vt>
nint_rmap_llist
 {n0:i0}
(xs: nint(n0)): list_vt(y0, n0)
//
#symload
map_llist with nint_rmap_llist of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-22:
Mon 22 Jul 2024 11:48:37 AM EDT
*)
//
fun
<y0:vt>
nint_map_lstrm(xs: nint): strm_vt(y0)
//
#symload
map_lstrm with nint_map_lstrm of 1000
//
fun
<y0:vt>
nint_map_lstrm_c1fr
( xs: nint
, fopr: (nint)-<cfr>(y0)): strm_vt(y0)
fun
<y0:vt>
nint_map_lstrm_f1np
( xs: nint
, fopr: (nint)-<fnp>(y0)): strm_vt(y0)
//
#symload
map_lstrm with nint_map_lstrm_c1fr of 1000
#symload
map_lstrm_cfr with nint_map_lstrm_c1fr of 1000
#symload
map_lstrm_fnp with nint_map_lstrm_f1np of 1000
//
(* ****** ****** *)
//
fun
<y0:vt>
nint_rmap_lstrm(xs: nint): strm_vt(y0)
//
#symload
rmap_lstrm with nint_rmap_lstrm of 1000
//
fun
<y0:vt>
nint_rmap_lstrm_c1fr
( xs: nint
, fopr: (nint)-<cfr>(y0)): strm_vt(y0)
fun
<y0:vt>
nint_rmap_lstrm_f1np
( xs: nint
, fopr: (nint)-<fnp>(y0)): strm_vt(y0)
//
#symload
rmap_lstrm with nint_rmap_lstrm_c1fr of 1000
#symload
rmap_lstrm_cfr with nint_rmap_lstrm_c1fr of 1000
#symload
rmap_lstrm_fnp with nint_rmap_lstrm_f1np of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-31:
Wed 31 Jul 2024 09:05:27 AM EDT
*)
//
fun<>
nint_digitize
 (n0: nint): strm_vt(nintlt(10))
fun<>
nint_digitize_base
{base:i0|base >= 2}
(nint, sint(base)): strm_vt(nintlt(base))
//
#symload digitize with nint_digitize of 1000
#symload digitize with nint_digitize_base of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gint001.sats] *)
