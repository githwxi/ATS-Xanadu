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
Mon 08 Jul 2024 12:09:13 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_length0
(xs: strm_vt(x0)): (nint)
fun
<x0:vt>
strq_vt_length0
{n0:i0}
(xs: strq_vt(x0,n0)): sint(n0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_strqize0
(xs: strm_vt(x0)): strq_vt(x0)
//
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_listize0
(xs: strm_vt(x0)): list_vt(x0)
fun
<x0:vt>
strm_vt_rlistize0
(xs: strm_vt(x0)): list_vt(x0)
//
fun
<x0:vt>
strq_vt_listize0
{n0:i0}
(xs: strq_vt(x0,n0)): list_vt(x0,n0)
fun
<x0:vt>
strq_vt_rlistize0
{n0:i0}
(xs: strq_vt(x0,n0)): list_vt(x0,n0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
strm_vt_map
(xs: strm_vt(x0)): strm_vt(y0)
fun
<x0:vt>
<y0:vt>
strq_vt_map
{n0:i0}
(xs: strq_vt(x0,n0)): strq_vt(y0,n0)
//
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
strm_vt_mapoptn
(xs: strm_vt(x0)): strm_vt(y0)
fun
<x0:vt>
<y0:vt>
strq_vt_mapoptn
{n0:i0}
(xs: strq_vt(x0,n0)): strqlte_vt(y0,n0)
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
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_append00
( xs: strm_vt(x0)
, ys: strm_vt(x0)): strm_vt(x0)
//
fun
<x0:vt>
strq_vt_append00
{n1,n2:i0}
( xs: strq_vt(x0,n1)
, ys: strq_vt(x0,n2)): strq_vt(x0,n1+n2)
//
#symload append00 with strm_vt_append00
#symload append00 with strq_vt_append00
//
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_prepend0__llist0
( xs: strm_vt(x0)
, ys: list_vt(x0)): strm_vt(x0)
fun
<x0:vt>
strm_vt_prepend0__lstrm0
( xs: strm_vt(x0)
, ys: strm_vt(x0)): strm_vt(x0)
//
fun
<x0:vt>
strq_vt_prepend0__llist0
{n1,n2:i0}
( xs: strq_vt(x0,n1)
, ys: list_vt(x0,n2)): strq_vt(x0,n1+n2)
fun
<x0:vt>
strq_vt_prepend0__lstrq0
{n1,n2:i0}
( xs: strq_vt(x0,n1)
, ys: strq_vt(x0,n2)): strq_vt(x0,n1+n2)
//
#symload prepend0 with strm_vt_prepend0__llist0
#symload prepend0 with strm_vt_prepend0__lstrq0
#symload prepend0 with strq_vt_prepend0__llist0
#symload prepend0 with strq_vt_prepend0__lstrq0
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<ys:vt>
g_make_lstrm
(xs: strm_vt(x0)): (ys)
fun
<x0:vt>
<ys:vt>
g_make_lstrq
(xs: strq_vt(x0)): (ys)
//
(* ****** ****** *)
//
fun
<x0:t0>
list_make_lstrm
(xs: strm_vt(x0)): list(x0)
fun
<x0:t0>
list_make_lstrq
{n0:i0}
(xs: strq_vt(x0, n0)): list(x0, n0)
//
#symload list with list_make_lstrm
#symload list with list_make_lstrq
//
(* ****** ****** *)
//
fun
<x0:vt>
list_vt_make_lstrm
(xs: strm_vt(x0)): list_vt(x0)
fun
<x0:vt>
list_vt_make_lstrq
{n0:i0}
(xs: strq_vt(x0, n0)): list_vt(x0, n0)
//
#symload list_vt with list_vt_make_lstrm
#symload list_vt with list_vt_make_lstrq
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_VT_strn000_vt.sats] *)
