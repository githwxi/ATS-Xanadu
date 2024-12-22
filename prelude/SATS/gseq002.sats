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
#typedef si = sint
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-24:
Wed 24 Jul 2024 08:33:48 PM EDT
For additive combination of two
given lists: z is short for zip
*)
//
(* ****** ****** *)
(* ****** ****** *)
fun
<xs:t0>
<x0:t0>
gseq_cmp
(xs: xs, ys: xs): sint(*sign*)
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_z2listize
(xs: xs, ys: ys): list_vt@(x0, y0)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_rz2listize
(xs: xs, ys: ys): list_vt@(x0, y0)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_iz2listize
(xs: xs, ys: ys): list_vt@(ni, x0, y0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_z2strmize
(xs: xs, ys: ys): strm_vt@(x0, y0)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_iz2strmize
(xs: xs, ys: ys): strm_vt@(ni, x0, y0)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_z2strqize
(xs: xs, ys: ys): strq_vt@(x0, y0)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_iz2strqize
(xs: xs, ys: ys): strq_vt@(ni, x0, y0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_z2forall(xs: xs, ys: ys): bool
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_z2forcmp(xs: xs, ys: ys): sint
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_rz2forall(xs: xs, ys: ys): bool
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_iz2forall(xs: xs, ys: ys): bool
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_irz2forall(xs: xs, ys: ys): bool
//
(*
#symload z2forall with gseq_z2forall of 0100
#symload rz2forall with gseq_rz2forall of 0100
#symload iz2forall with gseq_iz2forall of 0100
#symload irz2forall with gseq_irz2forall of 0100
*)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_z2forall$f2un
(xs: xs, ys: ys, test: (x0, y0)->bool): bool
//
#symload z2forall with gseq_z2forall$f2un of 0100
#symload z2forall$fun with gseq_z2forall$f2un of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_z2foritm(xs: xs, ys: ys): void
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_rz2foritm(xs: xs, ys: ys): void
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_iz2foritm(xs: xs, ys: ys): void
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_irz2foritm(xs: xs, ys: ys): void
//
(*
#symload z2foritm with gseq_z2foritm of 0100
#symload rz2foritm with gseq_rz2foritm of 0100
#symload iz2foritm with gseq_iz2foritm of 0100
#symload irz2foritm with gseq_irz2foritm of 0100
*)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_z2foritm$f2un
(xs: xs, ys: ys, work: (x0, y0)->void): void
//
#symload z2foritm with gseq_z2foritm$f2un of 0100
#symload z2foritm$fun with gseq_z2foritm$f2un of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<zs:vt>
<z0:vt>
gseq_z2map_ares(xs: xs, ys: ys): (zs)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_z2map_self(xs: xs, ys: ys): (xs)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_z2map_llist(xs: xs, ys: ys): list_vt(z0)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_z2map_lstrm(xs: xs, ys: ys): strm_vt(z0)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_z2map_lstrq(xs: xs, ys: ys): strq_vt(z0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_rz2map_llist(xs: xs, ys: ys): list_vt(z0)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_rz2map_lstrm(xs: xs, ys: ys): strm_vt(z0)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_rz2map_lstrq(xs: xs, ys: ys): strq_vt(z0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_iz2map_llist(xs: xs, ys: ys): list_vt(z0)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_iz2map_lstrm(xs: xs, ys: ys): strm_vt(z0)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_iz2map_lstrq(xs: xs, ys: ys): strq_vt(z0)
//
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_irz2map_llist(xs: xs, ys: ys): list_vt(z0)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_irz2map_lstrm(xs: xs, ys: ys): strm_vt(z0)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_irz2map_lstrq(xs: xs, ys: ys): strq_vt(z0)
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
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2listize
(xs: xs, ys: ys): list_vt@(x0, y0)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2rlistize
(xs: xs, ys: ys): list_vt@(x0, y0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2strmize
(xs: xs, ys: ys): strm_vt@(x0, y0)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2strqize
(xs: xs, ys: ys): strq_vt@(x0, y0)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2istrmize
( xs: xs
, ys: ys): strm_vt@(ni, x0, ni, y0)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2istrqize
( xs: xs
, ys: ys): strq_vt@(ni, x0, ni, y0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2forall(xs: xs, ys: ys): bool
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2rforall(xs: xs, ys: ys): bool
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2iforall(xs: xs, ys: ys): bool
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2irforall(xs: xs, ys: ys): bool
//
(*
#symload x2forall with gseq_x2forall of 0100
#symload x2rforall with gseq_x2rforall of 0100
#symload x2iforall with gseq_x2iforall of 0100
#symload x2irforall with gseq_x2irforall of 0100
*)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2forall$f2un
(xs: xs, ys: ys, test: (x0, y0)->bool): bool
//
#symload x2forall with gseq_x2forall$f2un of 0100
#symload x2forall$fun with gseq_x2forall$f2un of 0100
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2foritm(xs: xs, ys: ys): void
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2rforitm(xs: xs, ys: ys): void
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2iforitm(xs: xs, ys: ys): void
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2irforitm(xs: xs, ys: ys): void
//
(*
#symload x2foritm with gseq_x2foritm of 0100
#symload x2rforitm with gseq_x2rforitm of 0100
#symload x2iforitm with gseq_x2iforitm of 0100
#symload x2irforitm with gseq_x2irforitm of 0100
*)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2foritm$f2un
(xs: xs, ys: ys, work: (x0, y0)->void): void
//
#symload x2foritm with gseq_x2foritm$f2un of 0100
#symload x2foritm$fun with gseq_x2foritm$f2un of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<zs:vt>
<z0:vt>
gseq_x2map_ares(xs: xs, ys: ys): (zs)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
gseq_x2map_self(xs: xs, ys: ys): (xs)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_x2map_llist(xs: xs, ys: ys): list_vt(z0)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_x2map_lstrm(xs: xs, ys: ys): strm_vt(z0)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_x2map_lstrq(xs: xs, ys: ys): strq_vt(z0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_x2rmap_llist(xs: xs, ys: ys): list_vt(z0)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_x2rmap_lstrm(xs: xs, ys: ys): strm_vt(z0)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_x2rmap_lstrq(xs: xs, ys: ys): strq_vt(z0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_x2imap_llist(xs: xs, ys: ys): list_vt(z0)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_x2imap_lstrm(xs: xs, ys: ys): strm_vt(z0)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_x2imap_lstrq(xs: xs, ys: ys): strq_vt(z0)
//
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_x2irmap_llist(xs: xs, ys: ys): list_vt(z0)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_x2irmap_lstrm(xs: xs, ys: ys): strm_vt(z0)
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
<z0:vt>
gseq_x2irmap_lstrq(xs: xs, ys: ys): strq_vt(z0)
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef
gz2seq
( xs: t0, x0: t0
, ys: t0, y0: t0) =
(
  z2tup(GSEQ(xs, x0), GSEQ(ys, y0)))
//
#typedef
gx2seq
( xs: t0, x0: t0
, ys: t0, y0: t0) =
(
  x2tup(GSEQ(xs, x0), GSEQ(ys, y0)))
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
GSEQ_z2make
( xs: GSEQ(xs, x0)
, ys: GSEQ(ys, y0)): GSEQ(gz2seq(xs,x0,ys,y0),(x0,y0))
//
fun
<xs:t0>
<x0:t0>
<ys:t0>
<y0:t0>
GSEQ_x2make
( xs: GSEQ(xs, x0)
, ys: GSEQ(ys, y0)): GSEQ(gx2seq(xs,x0,ys,y0),(x0,y0))
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gseq002.sats] *)
