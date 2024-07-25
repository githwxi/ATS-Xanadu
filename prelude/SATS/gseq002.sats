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
Sat 13 Jul 2024 09:56:55 AM EDT
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
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_z2listize
  (xs: xs, ys: ys): list_vt@(x0, y0)
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_rz2listize
  (xs: xs, ys: ys): list_vt@(x0, y0)
//
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_iz2listize
  (xs: xs, ys: ys): list_vt@(ni, x0, y0)
//
(* ****** ****** *)
//
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_z2strmize
  (xs: xs, ys: ys): strm_vt@(x0, y0)
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_iz2strmize
  (xs: xs, ys: ys): strm_vt@(ni, x0, y0)
//
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_z2strqize
  (xs: xs, ys: ys): strq_vt@(x0, y0)
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_iz2strqize
  (xs: xs, ys: ys): strq_vt@(ni, x0, y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_z2forall(xs: xs, ys: ys): bool
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_rz2forall(xs: xs, ys: ys): bool
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_iz2forall(xs: xs, ys: ys): bool
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_irz2forall(xs: xs, ys: ys): bool
//
#symload z2forall with gseq_z2forall of 0100
#symload rz2forall with gseq_rz2forall of 0100
#symload iz2forall with gseq_iz2forall of 0100
#symload irz2forall with gseq_irz2forall of 0100
//
(* ****** ****** *)
//
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_z2foritm(xs: xs, ys: ys): void
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_rz2foritm(xs: xs, ys: ys): void
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_iz2foritm(xs: xs, ys: ys): void
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_irz2foritm(xs: xs, ys: ys): void
//
#symload z2foritm with gseq_z2foritm of 0100
#symload rz2foritm with gseq_rz2foritm of 0100
#symload iz2foritm with gseq_iz2foritm of 0100
#symload irz2foritm with gseq_irz2foritm of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-24:
Wed 24 Jul 2024 08:33:48 PM EDT
*)
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
<zs:vt>
<z0:vt>
gseq_z2map_ares(xs: xs, ys: ys): (zs)
//
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
gseq_z2map_self(xs: xs, ys: ys): (xs)
//
(* ****** ****** *)
//
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
<z0:vt>
gseq_z2map_llist(xs: xs, ys: ys): list_vt(z0)
//
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
<z0:vt>
gseq_z2map_lstrm(xs: xs, ys: ys): strm_vt(z0)
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
<z0:vt>
gseq_z2map_lstrq(xs: xs, ys: ys): strq_vt(z0)
//
(* ****** ****** *)
//
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
<z0:vt>
gseq_rz2map_llist(xs: xs, ys: ys): list_vt(z0)
//
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
<z0:vt>
gseq_rz2map_lstrm(xs: xs, ys: ys): strm_vt(z0)
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
<z0:vt>
gseq_rz2map_lstrq(xs: xs, ys: ys): strq_vt(z0)
//
(* ****** ****** *)
//
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
<z0:vt>
gseq_iz2map_llist(xs: xs, ys: ys): list_vt(z0)
//
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
<z0:vt>
gseq_iz2map_lstrm(xs: xs, ys: ys): strm_vt(z0)
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
<z0:vt>
gseq_iz2map_lstrq(xs: xs, ys: ys): strq_vt(z0)
//
//
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
<z0:vt>
gseq_irz2map_llist(xs: xs, ys: ys): list_vt(z0)
//
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
<z0:vt>
gseq_irz2map_lstrm(xs: xs, ys: ys): strm_vt(z0)
fun
<xs:t0
,ys:t0>
<x0:t0
,y0:t0>
<z0:vt>
gseq_irz2map_lstrq(xs: xs, ys: ys): strq_vt(z0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gseq002.sats] *)
