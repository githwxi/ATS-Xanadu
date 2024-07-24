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
<x0:vt
,y0:vt>
strm_vt_z2forall0
( xs: ~strm_vt(x0)
, ys: ~strm_vt(y0)): bool//end-of-[fun]
//
fun
<x0:vt
,y0:vt>
strm_vt_iz2forall0
( xs: ~strm_vt(x0)
, ys: ~strm_vt(y0)): bool//end-of-[fun]
//
(* ****** ****** *)
//
fun
<x0:vt
,y0:vt>
strm_vt_z2foritm0
( xs: ~strm_vt(x0)
, ys: ~strm_vt(y0)): void//end-of-[fun]
//
fun
<x0:vt
,y0:vt>
strm_vt_iz2foritm0
( xs: ~strm_vt(x0)
, ys: ~strm_vt(y0)): void//end-of-[fun]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt
,y0:vt>
<r0:vt>
strm_vt_z2folditm0
(~strm_vt(x0), ~strm_vt(y0), r0): (r0)
fun
<x0:vt
,y0:vt>
<r0:vt>
strm_vt_iz2folditm0
(~strm_vt(x0), ~strm_vt(y0), r0): (r0)
//
(* ****** ****** *)
//
fun
<x0:vt
,y0:vt>
<r0:vt>
strm_vt_z2foldall0
(~strm_vt(x0), ~strm_vt(y0), r0): (r0)
fun
<x0:vt
,y0:vt>
<r0:vt>
strm_vt_iz2foldall0
(~strm_vt(x0), ~strm_vt(y0), r0): (r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt
,y0:vt>
<z0:vt>
strm_vt_z2map0
( xs: ~strm_vt(x0)
, ys: ~strm_vt(y0)): strm_vt(z0)//endfun
fun
<x0:vt
,y0:vt>
<z0:vt>
strm_vt_iz2map0
( xs: ~strm_vt(x0)
, ys: ~strm_vt(y0)): strm_vt(z0)//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt
,y0:vt>
<r0:vt>
strm_vt_z2scanitm0
( xs: ~strm_vt(x0)
, ys: ~strm_vt(y0), r0: r0): strm_vt(r0)
fun
<x0:vt
,y0:vt>
<r0:vt>
strm_vt_iz2scanitm0
( xs: ~strm_vt(x0)
, ys: ~strm_vt(y0), r0: r0): strm_vt(r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_VT_strm002_vt.sats] *)
