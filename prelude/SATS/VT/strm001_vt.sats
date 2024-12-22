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
#typedef ni = nint
#typedef si = sint
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_forall0
(xs: strm_vt(x0)): bool
fun
<x0:vt>
strm_vt_iforall0
(xs: strm_vt(x0)): bool
//
#symload
forall0 with strm_vt_forall0 of 1000
#symload
iforall0 with strm_vt_iforall0 of 1000
//
fun
<x0:vt>
strm_vt_forall0$f1un
( xs: strm_vt(x0)
, test: (~x0) -> bool): bool
//
#symload
forall0 with strm_vt_forall0$f1un of 1000
#symload
forall0$fun with strm_vt_forall0$f1un of 1000
//
fun
<x0:vt>
strm_vt_iforall0$f2un
( xs: strm_vt(x0)
, test: (ni,~x0)->bool): bool
//
#symload
iforall0 with strm_vt_iforall0$f2un of 1000
#symload
iforall0$fun with strm_vt_iforall0$f2un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_foritm0
(xs: strm_vt(x0)): void
fun
<x0:vt>
strm_vt_iforitm0
(xs: strm_vt(x0)): void
//
#symload
foritm0 with strm_vt_foritm0 of 1000
#symload
iforitm0 with strm_vt_iforitm0 of 1000
//
fun
<x0:vt>
strm_vt_foritm0$f1un
( xs: strm_vt(x0)
, work: (~x0) -> void): void
//
#symload
foritm0 with strm_vt_foritm0$f1un of 1000
#symload
foritm0$fun with strm_vt_foritm0$f1un of 1000
//
fun
<x0:vt>
strm_vt_iforitm0$f2un
( xs: strm_vt(x0)
, work: (ni,~x0) -> void): void
//
#symload
iforitm0 with strm_vt_iforitm0$f2un of 1000
#symload
iforitm0$fun with strm_vt_iforitm0$f2un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
strm_vt_folditm0
(xs: strm_vt(x0), r0: r0): (r0)
fun
<x0:vt>
<r0:vt>
strm_vt_ifolditm0
(xs: strm_vt(x0), r0: r0): (r0)
//
#symload
folditm0 with strm_vt_folditm0 of 1000
#symload
ifolditm0 with strm_vt_ifolditm0 of 1000
//
fun
<x0:vt>
<r0:vt>
strm_vt_folditm0$f2un
( xs
: strm_vt(x0), r0: r0
, fopr: (r0, ~x0) -> (r0)): (r0)
//
#symload
folditm0 with strm_vt_folditm0$f2un of 1000
#symload
folditm0$fun with strm_vt_folditm0$f2un of 1000
//
fun
<x0:vt>
<r0:vt>
strm_vt_ifolditm0$f3un
( xs
: strm_vt(x0), r0: r0
, fopr: (r0, ni, ~x0) -> (r0)): (r0)
//
#symload
ifolditm0 with strm_vt_ifolditm0$f3un of 1000
#symload
ifolditm0$fun with strm_vt_ifolditm0$f3un of 1000
//
(* ****** ****** *)
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
strm_vt_ifoldall0
(xs: strm_vt(x0), r0: r0): (r0)
//
fun
<x0:vt>
<r0:vt>
strm_vt_foldall0$f2un
( xs
: strm_vt(x0), r0: r0
, fopr: (r0, ~x0) -> (bool,r0)): (r0)
//
#symload
foldall0 with strm_vt_foldall0$f2un of 1000
#symload
foldall0$fun with strm_vt_foldall0$f2un of 1000
//
fun
<x0:vt>
<r0:vt>
strm_vt_ifoldall0$f3un
( xs
: strm_vt(x0), r0: r0
, fopr: (ni, r0, ~x0) -> (bool,r0)): (r0)
//
#symload
ifoldall0 with strm_vt_ifoldall0$f3un of 1000
#symload
ifoldall0$fun with strm_vt_ifoldall0$f3un of 1000
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
(* ****** ****** *)
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
#symload map0 with strm_vt_map0 of 1000
#symload map0 with strq_vt_map0 of 1000
#symload imap0 with strm_vt_imap0 of 1000
#symload imap0 with strq_vt_imap0 of 1000
//
(* ****** ****** *)
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
#symload filter0 with strm_vt_filter0 of 1000
#symload filter0 with strq_vt_filter0 of 1000
#symload ifilter0 with strm_vt_ifilter0 of 1000
#symload ifilter0 with strq_vt_ifilter0 of 1000
//
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_filter0$f1un
( xs: strm_vt(x0)
, test: (!x0) -> bool): strm_vt(x0)
#symload filter0 with strm_vt_filter0$f1un of 1000
#symload filter0$fun with strm_vt_filter0$f1un of 1000
//
fun
<x0:vt>
strm_vt_ifilter0$f2un
( xs: strm_vt(x0)
, test: (ni,!x0) -> bool): strm_vt(x0)
#symload ifilter0 with strm_vt_ifilter0$f2un of 1000
#symload ifilter0$fun with strm_vt_ifilter0$f2un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
strm_vt_mapoptn0
(xs: ~strm_vt(x0)): strm_vt(y0)
fun
<x0:vt>
<y0:vt>
strq_vt_mapoptn0
(xs: ~strq_vt(x0)): strq_vt(y0)
//
#symload mapoptn0 with strm_vt_mapoptn0 of 1000
#symload mapoptn0 with strq_vt_mapoptn0 of 1000
//
fun
<x0:vt>
<y0:vt>
strm_vt_maplist0
(xs: ~strm_vt(x0)): strm_vt(y0)
fun
<x0:vt>
<y0:vt>
strq_vt_maplist0
(xs: ~strq_vt(x0)): strq_vt(y0)
//
#symload maplist0 with strm_vt_maplist0 of 1000
#symload maplist0 with strq_vt_maplist0 of 1000
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
#symload scanitm0 with strm_vt_scanitm0 of 1000
#symload scanitm0 with strq_vt_scanitm0 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-28:
Sun 28 Jul 2024 01:52:55 PM EDT
*)
//
(* ****** ****** *)
//
(*
fun
<x0:vt>
strm_vt_strqize0
(xs: strm_vt(x0)): strq_vt(x0)
#symload strqize0 with strm_vt_strqize0 of 1000
*)
//
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_listize0
(xs: strm_vt(x0)): list_vt(x0)
fun
<x0:vt>
strq_vt_listize0
{n0:i0}
(xs: strq_vt(x0,n0)): list_vt(x0,n0)
//
fun
<x0:vt>
strm_vt_rlistize0
(xs: strm_vt(x0)): list_vt(x0)
fun
<x0:vt>
strq_vt_rlistize0
{n0:i0}
(xs: strq_vt(x0,n0)): list_vt(x0,n0)
//
#symload listize0 with strm_vt_listize0 of 1000
#symload listize0 with strq_vt_listize0 of 1000
#symload rlistize0 with strm_vt_rlistize0 of 1000
#symload rlistize0 with strq_vt_rlistize0 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_a1rfize0
(xs: strm_vt(x0)): a1rf_vt(x0)
fun
<x0:vt>
strq_vt_a1rfize0
{n0:i0}
(xs: strq_vt(x0,n0)): a1rf_vt(x0,n0)
//
#symload a1rfize0 with strm_vt_a1rfize0 of 1000
#symload a1rfize0 with strq_vt_a1rfize0 of 1000
//
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_a1szize0
(xs: strm_vt(x0)): a1sz_vt(x0)
fun
<x0:vt>
strq_vt_a1szize0
{n0:i0}
(xs: strq_vt(x0,n0)): a1sz_vt(x0,n0)
//
#symload a1szize0 with strm_vt_a1szize0 of 1000
#symload a1szize0 with strq_vt_a1szize0 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_VT_strm001_vt.sats] *)
