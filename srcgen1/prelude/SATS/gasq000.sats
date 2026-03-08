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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Sun 21 Jul 2024 02:16:49 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
// #include
"./../../../prelude/SATS/gasq000.sats"
*)
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
gasq_length(xs: xs): nint
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gasq_get$at
(xs: xs, i0: ni): (x0)
fun
<xs:t0>
<x0:t0>
gasq_set$at
(xs: xs, i0: ni, x0: x0): void
//
#typedef
gasq_get$at
(xs:t0, x0:t0) = (xs, ni) -> (x0)
#typedef
gasq_set$at
(xs:t0, x0:t0) = (xs, ni, x0) -> void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-31:
The 'l' here means 'linear'
Wed Dec 31 11:21:54 AM EST 2025
*)
//
fun
<xs:t0>
<x0:vt>
gasq_lget$at
(xs: xs
,i0: ni): (owed(x0) | x0)
fun
<xs:t0>
<x0:vt>
gasq_lset$at
(pf: owed(x0)
|xs: xs, i0: ni, x0: x0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-31:
The 'c' in 'cget' means 'copy'
The 'f' in 'setf' means 'free'
For reference, the 'f' in 'fset'
means 'functional'.
Wed Dec 31 11:21:54 AM EST 2025
*)
//
fun
<xs:t0>
<x0:vt>
gasq_cget$at
(xs: xs, i0: ni): (x0)
fun
<xs:t0>
<x0:vt>
gasq_setf$at
(xs: xs, i0: ni, x0: x0): void
//
(* ****** ****** *)
//
(*
HX-2024-09-20:
nil() is returned
if [i0] is out of bounds
*)
fun
<xs:t0>
<x0:vt>
gasq_cget$at$opt
(xs: xs, i0: ni): optn_vt(x0)
(*
HX-2024-09-20:
cons(x0) is returned
if [i0] is out of bounds
*)
fun
<xs:t0>
<x0:vt>
gasq_setf$at$opt
(xs: xs, i0: ni, x0: x0): optn_vt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
// #include
"./../../../prelude/SATS/gasq001.sats"
*)
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
gasq_listize
 ( xs: xs ): list_vt(x0)
fun
<xs:t0>
<x0:vt>
gasq_rlistize
 ( xs: xs ): list_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
gasq_strmize
 ( xs: xs ): strm_vt(x0)
fun
<xs:t0>
<x0:vt>
gasq_rstrmize
 ( xs: xs ): strm_vt(x0)
//
fun
<xs:t0>
<x0:vt>
gasq_strqize
 ( xs: xs ): strq_vt(x0)
fun
<xs:t0>
<x0:vt>
gasq_rstrqize
 ( xs: xs ): strq_vt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
gasq_forall(xs: xs): bool
fun
<xs:t0>
<x0:vt>
gasq_exists(xs: xs): bool
fun
<xs:t0>
<x0:vt>
gasq_rforall(xs: xs): bool
fun
<xs:t0>
<x0:vt>
gasq_rexists(xs: xs): bool
//
fun
<xs:t0>
<x0:vt>
gasq_iforall(xs: xs): bool
fun
<xs:t0>
<x0:vt>
gasq_irforall(xs: xs): bool
//
(*
#symload forall with gasq_forall of 0100
#symload exists with gasq_exists of 0100
#symload rforall with gasq_rforall of 0100
#symload rexists with gasq_rexists of 0100
*)
//
fun
<xs:t0>
<x0:vt>
gasq_forall$f1un
(xs: xs, test: (!x0)->bool): bool
fun
<xs:t0>
<x0:vt>
gasq_exists$f1un
(xs: xs, test: (!x0)->bool): bool
//
fun
<xs:t0>
<x0:vt>
gasq_rforall$f1un
(xs: xs, test: (!x0)->bool): bool
fun
<xs:t0>
<x0:vt>
gasq_rexists$f1un
(xs: xs, test: (!x0)->bool): bool
//
fun
<xs:t0>
<x0:vt>
gasq_iforall$f2un
(xs: xs, test: (ni, !x0)->bool): bool
fun
<xs:t0>
<x0:vt>
gasq_irforall$f2un
(xs: xs, test: (ni, !x0)->bool): bool
//
(* ****** ****** *)
//
(*
#symload
gasq_forall with gasq_forall$f1un of 0100
#symload
gasq_exists with gasq_exists$f1un of 0100
*)
//
(*
#symload
gasq_rforall with gasq_rforall$f1un of 0100
#symload
gasq_rexists with gasq_rexists$f1un of 0100
*)
//
(*
#symload
gasq_iforall with gasq_iforall$f2un of 0100
#symload
gasq_irforall with gasq_irforall$f2un of 0100
*)
//
(* ****** ****** *)
//
(*
HX-2026-01-12:
Mon Jan 12 08:10:11 PM EST 2026
*)
fun
<xs:t0>
<x0:vt>
gasq_foritm(xs: xs): void
fun
<xs:t0>
<x0:vt>
gasq_rforitm(xs: xs): void
fun
<xs:t0>
<x0:vt>
gasq_iforitm(xs: xs): void
fun
<xs:t0>
<x0:vt>
gasq_irforitm(xs: xs): void
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
gasq_foritm$f1un
(xs: xs, test: (!x0)->void): void
fun
<xs:t0>
<x0:vt>
gasq_rforitm$f1un
(xs: xs, test: (!x0)->void): void
fun
<xs:t0>
<x0:vt>
gasq_iforitm$f2un
(xs: xs, test: (ni, !x0)->void): void
fun
<xs:t0>
<x0:vt>
gasq_irforitm$f2un
(xs: xs, test: (ni, !x0)->void): void
//
(* ****** ****** *)
//
(*
#symload
gasq_foritm with gasq_foritm$f1un of 0100
#symload
gasq_rforitm with gasq_rforitm$f1un of 0100
#symload
gasq_iforitm with gasq_iforitm$f2un of 0100
#symload
gasq_irforitm with gasq_irforitm$f2un of 0100
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-25:
Thu 25 Jul 2024 01:47:26 PM EDT
HX-2025-09-08:
There seems to be overlapping between
[mapref] and [foritm1x]
Let us keep [mapref] as a special combinator for now.
*)
//
fun
<x0:vt>
mapref$fopr0
( itm: ~x0 ): ( x0 )
fun
<x0:vt>
mapref$fopr1x
( ref: &x0 >> x0 ): void
//
(*
fun
<x0:vt>
mapref$fopr0x
( ref: &x0 >> ?x0 ): void
fun
<x0:vt>
mapref$fopr01x
( ref: &(?x0) >> (x0) ): void
fun
<x0:vt>
mapref$fopr10x
( ref: &(?x0) << (x0) ): void
*)
//
fun
<xs:t0>
<x0:vt>
gasq_mapref(xs: xs): void
fun
<xs:t0>
<x0:vt>
gasq_mapref$c1bv
(xs: xs, fopr: (~x0)->(x0)): void
//
(*
#symload mapref with gasq_mapref$c1bv of 0100
#symload mapref$cbv with gasq_mapref$c1bv of 0100
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
rmapref$fopr0
( x0: ~x0 ): ( x0 )
fun
<x0:vt>
rmapref$fopr1x
( ref: &x0 >> x0 ): void
//
fun
<xs:t0>
<x0:vt>
gasq_rmapref(xs: xs): void
fun
<xs:t0>
<x0:vt>
gasq_rmapref$c1bv
(xs: xs, fopr: (~x0)->(x0)): void
//
(*
#symload rmapref with gasq_rmapref$c1bv of 0100
#symload rmapref$cbv with gasq_rmapref$c1bv of 0100
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
imapref$fopr0
(i0: ni, x0: ~x0): (x0)
fun
<x0:vt>
imapref$fopr1x
(i0: ni, ref: &x0 >> x0): void
//
//
fun
<xs:t0>
<x0:vt>
gasq_imapref(xs: xs): void
fun
<xs:t0>
<x0:vt>
gasq_imapref$c2bv
(xs: xs, fopr: (ni, ~x0)->(x0)): void
//
(*
#symload imapref with gasq_imapref$c2bv of 0100
#symload imapref$cbv with gasq_imapref$c2bv of 0100
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
irmapref$fopr0
(i0: ni, x0: ~x0): (x0)
fun
<x0:vt>
irmapref$fopr1x
(i0: ni, ref: &x0 >> x0): void
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
gasq_irmapref(xs: xs): void
fun
<xs:t0>
<x0:vt>
gasq_irmapref$c2bv
(xs: xs, fopr: (ni, ~x0)->(x0)): void
//
(*
#symload irmapref with gasq_irmapref$c2bv of 0100
#symload irmapref$cbv with gasq_irmapref$c2bv of 0100
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-05:
Mon Jan  5 06:44:09 PM EST 2026
*)
fun
<xs:t0>
<x0:t0>
gasq_sortedq(xs: xs): bool
fun
<xs:t0>
<x0:t0>
gasq_sortedq$f2un
(xs: xs, lteq: (x0, x0) -> bool): bool
(*
#symload gasq_sortedq with gasq_sortedq$f2un of 0100
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
// #include
"./../../../prelude/SATS/gasq002.sats"
*)
//
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
#symload gasq_z2forall with gasq_z2forall$f2un of 0100
*)
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
#symload gasq_x2forall$fun with gasq_x2forall$f2un of 0100
*)
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
(* end of [ATS3/XANADU_srcgen1_prelude_SATS_gasq000.sats] *)
(***********************************************************************)
