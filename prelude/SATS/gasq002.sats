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
gasq_z2listize
(xs: xs, ys: ys): list_vt@(x0, y0)
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasq_z2rlistize
(xs: xs, ys: ys): list_vt@(x0, y0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasq_z2strmize
(xs: xs, ys: ys): strm_vt@(x0, y0)
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasq_z2rstrmize
(xs: xs, ys: ys): strm_vt@(x0, y0)
//
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasq_z2strqize
(xs: xs, ys: ys): strq_vt@(x0, y0)
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasq_z2rstrqize
(xs: xs, ys: ys): strq_vt@(x0, y0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasq_z2forall(xs: xs, ys: ys): bool
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasq_z2forcmp(xs: xs, ys: ys): sint
//
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasq_z2rforall(xs: xs, ys: ys): bool
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasq_z2rforcmp(xs: xs, ys: ys): sint
//
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasq_z2iforall(xs: xs, ys: ys): bool
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasq_z2iforcmp(xs: xs, ys: ys): sint
//
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasq_z2irforall(xs: xs, ys: ys): bool
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasq_z2irforcmp(xs: xs, ys: ys): sint
//
(*
#symload z2forall with gasq_z2forall of 0100
#symload z2forcmp with gasq_z2forcmp of 0100
#symload z2rforall with gasq_z2rforall of 0100
#symload z2rforcmp with gasq_z2rforcmp of 0100
#symload z2iforall with gasq_z2iforall of 0100
#symload z2iforcmp with gasq_z2iforcmp of 0100
#symload z2irforall with gasq_z2irforall of 0100
#symload z2irforcmp with gasq_z2irforcmp of 0100
*)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasq_z2forall$f2un
(xs: xs, ys: ys, test: (!x0, !y0)->bool): bool
//
(*
#symload z2forall with gasq_z2forall$f2un of 0100
#symload z2forall$fun with gasq_z2forall$f2un of 0100
*)
#symload gasq_z2forall with gasq_z2forall$f2un of 0100
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
gasq_x2listize
(xs: xs, ys: ys): list_vt@(x0, y0)
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasq_x2rlistize
(xs: xs, ys: ys): list_vt@(x0, y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasq_x2strmize
(xs: xs, ys: ys): strm_vt@(x0, y0)
//
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasq_x2strqize
(xs: xs, ys: ys): strq_vt@(x0, y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasq_x2forall(xs: xs, ys: ys): bool
//
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasq_ix2forall(xs: xs, ys: ys): bool
//
(*
#symload x2forall with gasq_x2forall of 0100
#symload ix2forall with gasq_ix2forall of 0100
*)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
gasq_x2forall$f2un
(xs: xs, ys: ys, test: (!x0, !y0)->bool): bool
//
(*
#symload x2forall with gasq_x2forall$f2un of 0100
#symload x2forall$fun with gasq_x2forall$f2un of 0100
*)
#symload gasq_x2forall$fun with gasq_x2forall$f2un of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef
gz2asq
( xs: t0, x0: vt
, ys: t0, y0: vt) =
(
  z2tup(GASQ(xs, x0), GASQ(ys, y0)))
//
#typedef
gx2asq
( xs: t0, x0: vt
, ys: t0, y0: vt) =
(
  x2tup(GASQ(xs, x0), GASQ(ys, y0)))
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
GASQ_z2make
( xs: GASQ(xs, x0)
, ys: GASQ(ys, y0)): GASQ(gz2asq(xs,x0,ys,y0), (x0,y0))
//
fun
<xs:t0>
<x0:vt>
<ys:t0>
<y0:vt>
GASQ_x2make
( xs: GASQ(xs, x0)
, ys: GASQ(ys, y0)): GASQ(gx2asq(xs,x0,ys,y0), (x0,y0))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_SATS_gasq002.sats] *)
(***********************************************************************)
