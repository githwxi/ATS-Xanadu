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
Thu 08 Aug 2024 04:33:32 AM EDT
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
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasz_z2listize
(xs: xs, ys: ys): list_vt@(x0, y0)
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasz_rz2listize
(xs: xs, ys: ys): list_vt@(x0, y0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasz_z2strmize
(xs: xs, ys: ys): strm_vt@(x0, y0)
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasz_rz2strmize
(xs: xs, ys: ys): strm_vt@(x0, y0)
//
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasz_z2strqize
(xs: xs, ys: ys): strq_vt@(x0, y0)
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasz_rz2strqize
(xs: xs, ys: ys): strq_vt@(x0, y0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasz_z2forall(xs: xs, ys: ys): bool
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasz_rz2forall(xs: xs, ys: ys): bool
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasz_iz2forall(xs: xs, ys: ys): bool
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasz_irz2forall(xs: xs, ys: ys): bool
//
(*
#symload z2forall with gasz_z2forall of 0100
#symload rz2forall with gasz_rz2forall of 0100
#symload iz2forall with gasz_iz2forall of 0100
#symload irz2forall with gasz_irz2forall of 0100
*)
//
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasz_z2forall$f2un
(xs: xs, ys: ys, test: (!x0, !y0)->bool): bool
//
#symload z2forall with gasz_z2forall$f2un of 0100
#symload z2forall$fun with gasz_z2forall$f2un of 0100
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-08-04:
Sun 04 Aug 2024 07:17:13 AM EDT
For multiplicative combination of
two given lists: x is short for cross
*)
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasz_x2listize
(xs: xs, ys: ys): list_vt@(x0, y0)
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasz_x2rlistize
(xs: xs, ys: ys): list_vt@(x0, y0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasz_x2strmize
(xs: xs, ys: ys): strm_vt@(x0, y0)
//
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasz_x2strqize
(xs: xs, ys: ys): strq_vt@(x0, y0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasz_x2forall(xs: xs, ys: ys): bool
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasz_x2rforall(xs: xs, ys: ys): bool
//
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasz_x2iforall(xs: xs, ys: ys): bool
//
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasz_x2irforall(xs: xs, ys: ys): bool
//
(*
#symload x2forall with gasz_x2forall of 0100
#symload x2rforall with gasz_x2rforall of 0100
#symload x2iforall with gasz_x2iforall of 0100
#symload x2irforall with gasz_x2irforall of 0100
*)
//
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasz_x2forall$f2un
(xs: xs, ys: ys, test: (!x0, !y0)->bool): bool
//
#symload x2forall with gasz_x2forall$f2un of 0100
#symload x2forall$fun with gasz_x2forall$f2un of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef
gz2asz
( xs: t0, x0: vt
, ys: t0, y0: vt) =
(
  z2tup(GASZ(xs, x0), GASZ(ys, y0)))
//
#typedef
gx2asz
( xs: t0, x0: vt
, ys: t0, y0: vt) =
(
  x2tup(GASZ(xs, x0), GASZ(ys, y0)))
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
GASZ_z2make
( xs: GASZ(xs, x0)
, ys: GASZ(ys, y0)): GASZ(gz2asz(xs,x0,ys,y0), (x0,y0))
//
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
GASZ_x2make
( xs: GASZ(xs, x0)
, ys: GASZ(ys, y0)): GASZ(gx2asz(xs,x0,ys,y0), (x0,y0))
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gasz002.sats] *)
