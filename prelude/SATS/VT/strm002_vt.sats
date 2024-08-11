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
Tue 23 Jul 2024 05:28:07 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
strm_vt_z2forall0
( xs: ~strm_vt(x0)
, ys: ~strm_vt(y0)): bool//end-of-[fun]
//
fun
<x0:vt>
<y0:vt>
strm_vt_iz2forall0
( xs: ~strm_vt(x0)
, ys: ~strm_vt(y0)): bool//end-of-[fun]
//
#symload
z2forall0 with strm_vt_z2forall0 of 1000
#symload
iz2forall0 with strm_vt_iz2forall0 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
strm_vt_z2forcmp0
( xs: ~strm_vt(x0)
, ys: ~strm_vt(y0)): sint//end-of-[fun]
//
fun
<x0:vt>
<y0:vt>
strm_vt_iz2forcmp0
( xs: ~strm_vt(x0)
, ys: ~strm_vt(y0)): sint//end-of-[fun]
//
#symload
z2forcmp0 with strm_vt_z2forcmp0 of 1000
#symload
iz2forcmp0 with strm_vt_iz2forcmp0 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
strm_vt_z2foritm0
( xs: ~strm_vt(x0)
, ys: ~strm_vt(y0)): void//end-of-[fun]
//
fun
<x0:vt>
<y0:vt>
strm_vt_iz2foritm0
( xs: ~strm_vt(x0)
, ys: ~strm_vt(y0)): void//end-of-[fun]
//
#symload
z2foritm0 with strm_vt_z2foritm0 of 1000
#symload
iz2foritm0 with strm_vt_iz2foritm0 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
<r0:vt>
strm_vt_z2folditm0
(~strm_vt(x0), ~strm_vt(y0), r0): (r0)
fun
<x0:vt>
<y0:vt>
<r0:vt>
strm_vt_iz2folditm0
(~strm_vt(x0), ~strm_vt(y0), r0): (r0)
//
#symload
z2folditm0 with strm_vt_z2folditm0 of 1000
#symload
iz2folditm0 with strm_vt_iz2folditm0 of 1000
//
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
<r0:vt>
strm_vt_z2foldall0
(~strm_vt(x0), ~strm_vt(y0), r0): (r0)
fun
<x0:vt>
<y0:vt>
<r0:vt>
strm_vt_iz2foldall0
(~strm_vt(x0), ~strm_vt(y0), r0): (r0)
//
#symload
z2foldall0 with strm_vt_z2foldall0 of 1000
#symload
iz2foldall0 with strm_vt_iz2foldall0 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
<z0:vt>
strm_vt_z2map0
( xs: ~strm_vt(x0)
, ys: ~strm_vt(y0)): strm_vt(z0)//endfun
fun
<x0:vt>
<y0:vt>
<z0:vt>
strm_vt_iz2map0
( xs: ~strm_vt(x0)
, ys: ~strm_vt(y0)): strm_vt(z0)//endfun
//
#symload z2map0 with strm_vt_z2map0 of 1000
#symload iz2map0 with strm_vt_iz2map0 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-24:
Wed 24 Jul 2024 08:25:27 PM EDT
*)
//
fun
<x0:vt>
<y0:vt>
<r0:vt>
strm_vt_z2scanitm0
( xs: ~strm_vt(x0)
, ys: ~strm_vt(y0), r0: r0): strm_vt(r0)
fun
<x0:vt>
<y0:vt>
<r0:vt>
strm_vt_iz2scanitm0
( xs: ~strm_vt(x0)
, ys: ~strm_vt(y0), r0: r0): strm_vt(r0)
//
#symload
z2scanitm0 with strm_vt_z2scanitm0 of 1000
#symload
iz2scanitm0 with strm_vt_iz2scanitm0 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-05:
Mon 05 Aug 2024 07:50:06 PM EDT
*)
//
fun
<x0:vt>
<y0:vt>
strm_vt_z2strmize0
( xs: strm_vt(x0)
, ys: strm_vt(y0)): strm_vt@(x0, y0)
//
fun
<x0:vt>
<y0:vt>
strm_vt_z2listize0
(xs: strm_vt(x0), ys: strm_vt(y0)): list_vt@(x0, y0)
fun
<x0:vt>
<y0:vt>
strm_vt_z2rlistize0
(xs: strm_vt(x0), ys: strm_vt(y0)): list_vt@(x0, y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_VT_strm002_vt.sats] *)
