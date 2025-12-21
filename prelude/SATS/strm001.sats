(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
Sat Dec 20 11:28:05 PM EST 2025
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
<x0:t0>
strm_forall
(xs: strm(x0)): bool
fun
<x0:t0>
strm_iforall
(xs: strm(x0)): bool
//
#symload
forall with strm_forall of 1000
#symload
iforall with strm_iforall of 1000
//
fun
<x0:t0>
strm_forall$f1un
( xs: strm(x0)
, test: (x0) -> bool): bool
//
#symload
forall with strm_forall$f1un of 1000
#symload
forall$fun with strm_forall$f1un of 1000
#symload
strm_forall with strm_forall$f1un of 1000
//
fun
<x0:t0>
strm_iforall$f2un
( xs: strm(x0)
, test: (ni,x0) -> bool): bool
//
#symload
iforall with strm_iforall$f2un of 1000
#symload
iforall$fun with strm_iforall$f2un of 1000
#symload
strm_iforall with strm_iforall$f2un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
strm_foritm
(xs: strm(x0)): void
fun
<x0:t0>
strm_iforitm
(xs: strm(x0)): void
//
#symload
foritm with strm_foritm of 1000
#symload
iforitm with strm_iforitm of 1000
//
fun
<x0:t0>
strm_foritm$f1un
( xs: strm(x0)
, work: (x0) -> void): void
//
#symload
foritm with strm_foritm$f1un of 1000
#symload
foritm$fun with strm_foritm$f1un of 1000
#symload
strm_foritm with strm_foritm$f1un of 1000
//
fun
<x0:t0>
strm_iforitm$f2un
( xs: strm(x0)
, work: (ni,x0) -> void): void
//
#symload
iforitm with strm_iforitm$f2un of 1000
#symload
iforitm$fun with strm_iforitm$f2un of 1000
#symload
strm_iforitm with strm_iforitm$f2un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
//
fun
<x0:t0>
<r0:vt>
strm_folditm
(xs: strm(x0), r0: r0): (r0)
fun
<x0:t0>
<r0:vt>
strm_ifolditm
(xs: strm(x0), r0: r0): (r0)
//
#symload
folditm with strm_folditm of 1000
#symload
ifolditm with strm_ifolditm of 1000
//
fun
<x0:t0>
<r0:vt>
strm_folditm$f2un
( xs
: strm(x0), r0: r0
, fopr: (r0, x0) -> (r0)): (r0)
//
#symload
folditm with strm_folditm$f2un of 1000
#symload
folditm$fun with strm_folditm$f2un of 1000
#symload
strm_folditm with strm_folditm$f2un of 1000
//
fun
<x0:t0>
<r0:vt>
strm_ifolditm$f3un
( xs
: strm(x0), r0: r0
, fopr: (r0, ni, x0) -> (r0)): (r0)
//
#symload
ifolditm with strm_ifolditm$f3un of 1000
#symload
ifolditm$fun with strm_ifolditm$f3un of 1000
#symload
strm_ifolditm with strm_ifolditm$f3un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
//
fun
<x0:t0>
<r0:vt>
strm_foldall
(xs: strm(x0), r0: r0): (r0)
fun
<x0:t0>
<r0:vt>
strm_ifoldall
(xs: strm(x0), r0: r0): (r0)
//
fun
<x0:t0>
<r0:vt>
strm_foldall$f2un
( xs
: strm(x0), r0: r0
, fopr: (r0, ~x0) -> (bool,r0)): (r0)
//
#symload
foldall with strm_foldall$f2un of 1000
#symload
foldall$fun with strm_foldall$f2un of 1000
#symload
strm_foldall with strm_foldall$f2un of 1000
//
fun
<x0:t0>
<r0:vt>
strm_ifoldall$f3un
( xs
: strm(x0), r0: r0
, fopr: (ni, r0, ~x0) -> (bool,r0)): (r0)
//
#symload
ifoldall with strm_ifoldall$f3un of 1000
#symload
ifoldall$fun with strm_ifoldall$f3un of 1000
#symload
strm_ifoldall with strm_ifoldall$f3un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
strm_map
(xs: strm(x0)): strm(y0)
fun
<x0:t0>
<y0:t0>
strq_map
{ln:i0}
(xs: strq(x0,ln)): strq(y0,ln)
//
fun
<x0:t0>
<y0:vt>
strm_map_vt
(xs: strm(x0)): strm_vt(y0)
fun
<x0:t0>
<y0:vt>
strq_map_vt
{ln:i0}
(xs: strq(x0,ln)): strq_vt(y0,ln)
//
#symload map with strm_map of 1000
#symload map with strq_map of 1000
#symload map_vt with strm_map_vt of 1000
#symload map_vt with strq_map_vt of 1000
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
strm_imap
(xs: strm(x0)): strm(y0)
fun
<x0:t0>
<y0:t0>
strq_imap
{ln:i0}
(xs: strq(x0,ln)): strq(y0,ln)
//
fun
<x0:t0>
<y0:vt>
strm_imap_vt
(xs: strm(x0)): strm_vt(y0)
fun
<x0:t0>
<y0:vt>
strq_imap_vt
{ln:i0}
(xs: strq(x0,ln)): strq_vt(y0,ln)
//
#symload imap with strm_imap of 1000
#symload imap with strq_imap of 1000
#symload imap_vt with strm_imap_vt of 1000
#symload imap_vt with strq_imap_vt of 1000
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
strm_map$f1un
( xs: strm(x0)
, fopr: (x0) -> (y0)): strm(y0)
fun
<x0:t0>
<y0:t0>
strq_map$f1un
{ln:i0}
( xs: strq(x0,ln)
, fopr: (x0) -> (y0)): strq(y0,ln)
//
#symload map with strm_map$f1un of 1000
#symload map with strq_map$f1un of 1000
#symload map$fun with strm_map$f1un of 1000
#symload map$fun with strq_map$f1un of 1000
#symload strm_map with strm_map$f1un of 1000
#symload strm_map with strq_map$f1un of 1000
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
strm_imap$f1un
( xs: strm(x0)
, fopr: (ni, x0) -> (y0)): strm(y0)
fun
<x0:t0>
<y0:t0>
strq_imap$f1un
{ln:i0}
( xs: strq(x0,ln)
, fopr: (ni, x0) -> (y0)): strq(y0,ln)
//
#symload imap with strm_imap$f1un of 1000
#symload imap with strq_imap$f1un of 1000
#symload imap$fun with strm_imap$f1un of 1000
#symload imap$fun with strq_imap$f1un of 1000
#symload strm_imap with strm_imap$f1un of 1000
#symload strm_imap with strq_imap$f1un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
strm_filter
(xs: strm(x0)): strm(x0)
fun
<x0:t0>
strq_filter
{ln:i0}
(xs: strq(x0,ln)): strqlte(x0,ln)
//
fun
<x0:t0>
strm_filter_vt
(xs: strm(x0)): strm_vt(x0)
fun
<x0:t0>
strq_filter_vt
{ln:i0}
(xs: strq(x0,ln)): strqlte_vt(x0,ln)
//
#symload filter with strm_filter of 1000
#symload filter with strq_filter of 1000
#symload filter_vt with strm_filter_vt of 1000
#symload filter_vt with strq_filter_vt of 1000
//
(* ****** ****** *)
//
fun
<x0:t0>
strm_ifilter
(xs: strm(x0)): strm(x0)
fun
<x0:t0>
strq_ifilter
{ln:i0}
(xs: strq(x0,ln)): strqlte(x0,ln)
//
fun
<x0:t0>
strm_ifilter_vt
(xs: strm(x0)): strm_vt(x0)
fun
<x0:t0>
strq_ifilter_vt
{ln:i0}
(xs: strq(x0,ln)): strqlte_vt(x0,ln)
//
#symload ifilter with strm_ifilter of 1000
#symload ifilter with strq_ifilter of 1000
#symload ifilter_vt with strm_ifilter_vt of 1000
#symload ifilter_vt with strq_ifilter_vt of 1000
//
(* ****** ****** *)
//
fun
<x0:t0>
strm_filter$f1un
( xs: strm(x0)
, test: (!x0) -> bool): strm(x0)
#symload filter with strm_filter$f1un of 1000
#symload filter$fun with strm_filter$f1un of 1000
#symload strm_filter with strm_filter$f1un of 1000
//
fun
<x0:t0>
strm_ifilter$f2un
( xs: strm(x0)
, test: (ni,!x0) -> bool): strm(x0)
#symload ifilter with strm_ifilter$f2un of 1000
#symload ifilter$fun with strm_ifilter$f2un of 1000
#symload strm_ifilter with strm_ifilter$f2un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
strm_listize
(xs: strm(x0)): list_vt(x0)
fun
<x0:t0>
strq_listize
{n0:i0}
(xs: strq(x0,n0)): list_vt(x0,n0)
//
fun
<x0:t0>
strm_rlistize
(xs: strm(x0)): list_vt(x0)
fun
<x0:t0>
strq_rlistize
{n0:i0}
(xs: strq(x0,n0)): list_vt(x0,n0)
//
#symload listize with strm_listize of 1000
#symload listize with strq_listize of 1000
#symload rlistize with strm_rlistize of 1000
#symload rlistize with strq_rlistize of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-21:
Sun Dec 21 12:17:23 AM EST 2025
*)
//
fun
<x0:t0>
<y0:t0>
<e1:vt>
strm_map$e1nv0
(xs: strm(x0), e1: !e1): strm(y0)
fun
<x0:t0>
<y0:t0>
<e1:vt>
strq_map$e1nv0
{ln:i0}
(xs: strq(x0,ln), e1: !e1): strq(y0,ln)
//
fun
<x0:t0>
<y0:t0>
<e1:vt>
strm_map$e1nv0_vt
(xs: strm(x0), e1: !e1): strm_vt(y0)
fun
<x0:t0>
<y0:t0>
<e1:vt>
strq_map$e1nv0_vt
{ln:i0}
(xs: strq(x0,ln), e1: !e1): strq_vt(y0,ln)
//
#symload map$env0 with strm_map$e1nv0 of 1000
#symload map$env0 with strq_map$e1nv0 of 1000
#symload map$env0_vt with strm_map$e1nv0_vt of 1000
#symload map$env0_vt with strq_map$e1nv0_vt of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_SATS_strm001.sats] *)
(***********************************************************************)
