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
//
fun<>
nint_rstrmize
(xs: nint): strm_vt(ni)
fun<>
nint_rstrqize
{n:i0}
(xs: nint(n)): strq_vt(ni, n)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
nint_forall(xs: nint): bool
fun<>
nint_rforall(xs: nint): bool
(*
fun<>
nint_iforall(xs: nint): bool
fun<>
nint_irforall(xs: nint): bool
*)
//
#symload
forall with nint_forall of 1000
#symload
rforall with nint_rforall of 1000
(*
#symload
iforall with nint_iforall of 1000
#symload
irforall with nint_irforall of 1000
*)
//
(* ****** ****** *)
//
fun<>
nint_forall$f1un
(ni: nint, test: (ni)->bool): bool
#symload
forall with nint_forall$f1un of 1000
//
fun<>
nint_rforall$f1un
(ni: nint, test: (ni)->bool): bool
#symload
rforall with nint_rforall$f1un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-07:
There is no need for these
special function interfaces!
Wed 07 Aug 2024 01:58:00 PM EDT
*)
(*
HX-2024-08-26:
Mon 26 Aug 2024 07:19:34 AM EDT
However, these interfaces do
help support symbol overloading!
*)
//
fun<>
nint_foritm(xs: nint): void
fun<>
nint_rforitm(xs: nint): void
(*
fun<>
nint_iforitm(xs: nint): void
fun<>
nint_irforitm(xs: nint): void
*)
//
#symload
foritm with nint_foritm of 1000
#symload
rforitm with nint_rforitm of 1000
(*
#symload
iforitm with nint_iforitm of 1000
#symload
irforitm with nint_irforitm of 1000
*)
//
(* ****** ****** *)
//
fun<>
nint_foritm$f1un
(ni: nint, work: (ni)->void): void
#symload
foritm with nint_foritm$f1un of 1000
//
fun<>
nint_rforitm$f1un
(ni: nint, work: (ni)->void): void
#symload
rforitm with nint_rforitm$f1un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<y0:vt>
nint_map_llist
 {n0:i0}
(xs: nint(n0)): list_vt(y0, n0)
fun
<y0:vt>
nint_map$f1un_llist
 {n0:i0}
(xs: nint(n0)
,f0: nintlt(n0)->y0): list_vt(y0, n0)
//
#symload
map_llist with nint_map_llist of 1000
#symload
map_llist with nint_map$f1un_llist of 1000
//
(* ****** ****** *)
//
fun
<y0:vt>
nint_rmap_llist
 {n0:i0}
(xs: nint(n0)): list_vt(y0, n0)
fun
<y0:vt>
nint_rmap$f1un_llist
 {n0:i0}
(xs: nint(n0)
,f0: nintlt(n0)->y0): list_vt(y0, n0)
//
#symload
rmap_llist with nint_rmap_llist of 1000
#symload
rmap_llist with nint_rmap$f1un_llist of 1000
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
nint_map$f1un_lstrm
( xs: nint
, fopr: ( nint )->(y0)): strm_vt(y0)
//
#symload
map_lstrm with nint_map$f1un_lstrm of 1000
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
nint_rmap$f1un_lstrm
( xs: nint
, fopr: ( nint )->(y0)): strm_vt(y0)
//
#symload
rmap_lstrm with nint_rmap$f1un_lstrm of 1000
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
nint_digitize$base
{base:i0|base >= 2}
(nint, sint(base)): strm_vt(nintlt(base))
//
#symload digitize with nint_digitize of 1000
#symload digitize with nint_digitize$base of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-01-10:
Sun Jan 12 09:44:35 AM EST 2025
*)
//
fun
<r0:vt>
nint_folditm
(xs: nint, r0: r0): (r0)
fun
<r0:vt>
nint_rfolditm
(xs: nint, r0: r0): (r0)
//
#symload
folditm with nint_folditm of 1000
#symload
rfolditm with nint_rfolditm of 1000
//
(* ****** ****** *)
//
fun
<r0:vt>
nint_folditm$f2un
(xs: nint
,r0: r0, fopr: (r0, ni)-> r0): (r0)
fun
<r0:vt>
nint_rfolditm$f2un
(xs: nint
,r0: r0, fopr: (ni, r0)-> r0): (r0)
//
#symload
folditm with nint_folditm$f2un of 1000
#symload
rfolditm with nint_rfolditm$f2un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gint001.sats] *)
