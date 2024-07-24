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
Wed 10 Jul 2024 07:53:15 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<ys:vt>
g_make0_lstrm
(xs: strm_vt(x0)): (ys)
fun
<x0:vt>
<ys:vt>
g_make0_lstrq
(xs: strq_vt(x0)): (ys)
//
(* ****** ****** *)
//
fun
<x0:t0>
list_make0_lstrm
(xs: strm_vt(x0)): list(x0)
fun
<x0:t0>
list_make0_lstrq
{n0:i0}
(xs: strq_vt(x0, n0)): list(x0, n0)
//
#symload list with list_make0_lstrm
#symload list with list_make0_lstrq
//
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_forall0
(xs: strm_vt(x0)): bool
fun
<x0:vt>
strm_vt_foritm0
(xs: strm_vt(x0)): void
//
fun
<x0:vt>
strm_vt_iforall0
(xs: strm_vt(x0)): bool
fun
<x0:vt>
strm_vt_iforitm0
(xs: strm_vt(x0)): void
//
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
strm_vt_foldall0
(xs: strm_vt(x0), r0: r0): (r0)
fun
<x0:vt>
<r0:vt>
strm_vt_folditm0
(xs: strm_vt(x0), r0: r0): (r0)
//
fun
<x0:vt>
<r0:vt>
strm_vt_ifoldall0
(xs: strm_vt(x0), r0: r0): (r0)
fun
<x0:vt>
<r0:vt>
strm_vt_ifolditm0
(xs: strm_vt(x0), r0: r0): (r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
strm_vt_map0
(xs: strm_vt(x0)): strm_vt(y0)
fun
<x0:vt>
<y0:vt>
strq_vt_map0
{n0:i0}
(xs: strq_vt(x0,n0)): strq_vt(y0,n0)
//
fun
<x0:vt>
<y0:vt>
strm_vt_imap0
(xs: strm_vt(x0)): strm_vt(y0)
fun
<x0:vt>
<y0:vt>
strq_vt_imap0
{n0:i0}
(xs: strq_vt(x0,n0)): strq_vt(y0,n0)
//
//
#symload map0 with strm_vt_map0
#symload map0 with strq_vt_map0
#symload imap0 with strm_vt_imap0
#symload imap0 with strq_vt_imap0
//
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_filter0
(xs: strm_vt(x0)): strm_vt(x0)
fun
<x0:vt>
strq_vt_filter0
{n0:i0}
(xs: strq_vt(x0,n0)): strqlte_vt(x0,n0)
//
fun
<x0:vt>
strm_vt_ifilter0
(xs: strm_vt(x0)): strm_vt(x0)
fun
<x0:vt>
strq_vt_ifilter0
{n0:i0}
(xs: strq_vt(x0,n0)): strqlte_vt(x0,n0)
//
#symload filter0 with strm_vt_filter0
#symload filter0 with strq_vt_filter0
#symload ifilter0 with strm_vt_ifilter0
#symload ifilter0 with strq_vt_ifilter0
//
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
strm_vt_mapoptn0
(xs: strm_vt(x0)): strm_vt(y0)
fun
<x0:vt>
<y0:vt>
strq_vt_mapoptn0
{n0:i0}
(xs: strq_vt(x0,n0)): strqlte_vt(y0,n0)
//
#symload mapoptn0 with strm_vt_mapoptn0
#symload mapoptn0 with strq_vt_mapoptn0
//
fun
<x0:vt>
<y0:vt>
strm_vt_maplist0
(xs: strm_vt(x0)): strm_vt(y0)
fun
<x0:vt>
<y0:vt>
strq_vt_maplist0
{n0:i0}
(xs: strq_vt(x0,n0)): strqlte_vt(y0,n0)
//
#symload maplist0 with strm_vt_maplist0
#symload maplist0 with strq_vt_maplist0
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-24:
Wed 24 Jul 2024 07:35:00 PM EDT
*)
fun
<x0:vt>
<r0:vt>
strm_vt_scanitm0
(xs: ~strm_vt(x0), r0: r0): strm_vt(r0)
fun
<x0:vt>
<r0:vt>
strq_vt_scanitm0
{n0:i0}
(xs:
~strq_vt(x0,n0), r0: r0): strq_vt(r0,n0+1)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_VT_strm001_vt.sats] *)
