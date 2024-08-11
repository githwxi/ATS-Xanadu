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
Sat 13 Jul 2024 04:35:37 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-24:
Wed 24 Jul 2024 06:54:17 PM EDT
*)
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_z2forall0(xs: ~xs, ys: ~ys): bool
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_z2forall1(xs: !xs, ys: !ys): bool
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_rz2forall0(xs: ~xs, ys: ~ys): bool
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_rz2forall1(xs: !xs, ys: !ys): bool
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_iz2forall0(xs: ~xs, ys: ~ys): bool
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_iz2forall1(xs: !xs, ys: !ys): bool
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_irz2forall0(xs: ~xs, ys: ~ys): bool
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_irz2forall1(xs: !xs, ys: !ys): bool
//
(* ****** ****** *)
//
#symload z2forall0 with gseq_z2forall0 of 0100
#symload z2forall1 with gseq_z2forall1 of 0100
#symload rz2forall0 with gseq_rz2forall0 of 0100
#symload rz2forall1 with gseq_rz2forall1 of 0100
#symload iz2forall0 with gseq_iz2forall0 of 0100
#symload iz2forall1 with gseq_iz2forall1 of 0100
#symload irz2forall0 with gseq_irz2forall0 of 0100
#symload irz2forall1 with gseq_irz2forall1 of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_z2foritm0(xs: ~xs, ys: ~ys): void
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_z2foritm1(xs: !xs, ys: !ys): void
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_rz2foritm0(xs: ~xs, ys: ~ys): void
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_rz2foritm1(xs: !xs, ys: !ys): void
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_iz2foritm0(xs: ~xs, ys: ~ys): void
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_iz2foritm1(xs: !xs, ys: !ys): void
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_irz2foritm0(xs: ~xs, ys: ~ys): void
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_irz2foritm1(xs: !xs, ys: !ys): void
//
(* ****** ****** *)
//
#symload z2foritm0 with gseq_z2foritm0 of 0100
#symload z2foritm1 with gseq_z2foritm1 of 0100
#symload rz2foritm0 with gseq_rz2foritm0 of 0100
#symload rz2foritm1 with gseq_rz2foritm1 of 0100
#symload iz2foritm0 with gseq_iz2foritm0 of 0100
#symload iz2foritm1 with gseq_iz2foritm1 of 0100
#symload irz2foritm0 with gseq_irz2foritm0 of 0100
#symload irz2foritm1 with gseq_irz2foritm1 of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-24:
Wed 24 Jul 2024 06:54:17 PM EDT
*)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
<zs:vt>
<z0:vt>
gseq_z2map0_ares(xs: ~xs, ys: ~ys): ( zs )
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
gseq_z2map0_self(xs: ~xs, ys: ~ys): ( xs )
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
<z0:vt>
gseq_z2map0_llist(xs: ~xs, ys: ~ys): list_vt(z0)
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
<z0:vt>
gseq_z2map1_llist(xs: !xs, ys: !ys): list_vt(z0)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
<z0:vt>
gseq_z2map0_lstrm(xs: ~xs, ys: ~ys): strm_vt(z0)
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
<z0:vt>
gseq_z2map1_lstrm(xs: !xs, ys: !ys): strm_vt(z0)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
<z0:vt>
gseq_z2map0_lstrq(xs: ~xs, ys: ~ys): strq_vt(z0)
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
<z0:vt>
gseq_z2map1_lstrq(xs: !xs, ys: !ys): strq_vt(z0)
//
#symload z2map0_llist with gseq_z2map0_llist of 0100
#symload z2map1_llist with gseq_z2map1_llist of 0100
#symload z2map0_lstrm with gseq_z2map0_lstrm of 0100
#symload z2map1_lstrm with gseq_z2map1_lstrm of 0100
#symload z2map0_lstrq with gseq_z2map0_lstrq of 0100
#symload z2map1_lstrq with gseq_z2map1_lstrq of 0100
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
<z0:vt>
gseq_rz2map0_llist(xs: ~xs, ys: ~ys): list_vt(z0)
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
<z0:vt>
gseq_rz2map1_llist(xs: !xs, ys: !ys): list_vt(z0)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
<z0:vt>
gseq_rz2map0_lstrm(xs: ~xs, ys: ~ys): strm_vt(z0)
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
<z0:vt>
gseq_rz2map1_lstrm(xs: !xs, ys: !ys): strm_vt(z0)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
<z0:vt>
gseq_rz2map0_lstrq(xs: ~xs, ys: ~ys): strq_vt(z0)
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
<z0:vt>
gseq_rz2map1_lstrq(xs: !xs, ys: !ys): strq_vt(z0)
//
#symload rz2map0_llist with gseq_rz2map0_llist of 0100
#symload rz2map1_llist with gseq_rz2map1_llist of 0100
#symload rz2map0_lstrm with gseq_rz2map0_lstrm of 0100
#symload rz2map1_lstrm with gseq_rz2map1_lstrm of 0100
#symload rz2map0_lstrq with gseq_rz2map0_lstrq of 0100
#symload rz2map1_lstrq with gseq_rz2map1_lstrq of 0100
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
<z0:vt>
gseq_iz2map0_llist(xs: ~xs, ys: ~ys): list_vt(z0)
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
<z0:vt>
gseq_iz2map1_llist(xs: !xs, ys: !ys): list_vt(z0)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
<z0:vt>
gseq_iz2map0_lstrm(xs: ~xs, ys: ~ys): strm_vt(z0)
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
<z0:vt>
gseq_iz2map1_lstrm(xs: !xs, ys: !ys): strm_vt(z0)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
<z0:vt>
gseq_iz2map0_lstrq(xs: ~xs, ys: ~ys): strq_vt(z0)
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
<z0:vt>
gseq_iz2map1_lstrq(xs: !xs, ys: !ys): strq_vt(z0)
//
#symload iz2map0_llist with gseq_iz2map0_llist of 0100
#symload iz2map1_llist with gseq_iz2map1_llist of 0100
#symload iz2map0_lstrm with gseq_iz2map0_lstrm of 0100
#symload iz2map1_lstrm with gseq_iz2map1_lstrm of 0100
#symload iz2map0_lstrq with gseq_iz2map0_lstrq of 0100
#symload iz2map1_lstrq with gseq_iz2map1_lstrq of 0100
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
<z0:vt>
gseq_irz2map0_llist(xs: ~xs, ys: ~ys): list_vt(z0)
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
<z0:vt>
gseq_irz2map1_llist(xs: !xs, ys: !ys): list_vt(z0)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
<z0:vt>
gseq_irz2map0_lstrm(xs: ~xs, ys: ~ys): strm_vt(z0)
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
<z0:vt>
gseq_irz2map1_lstrm(xs: !xs, ys: !ys): strm_vt(z0)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
<z0:vt>
gseq_irz2map0_lstrq(xs: ~xs, ys: ~ys): strq_vt(z0)
fun
<xs:vt>
<x0:vt>
<ys:vt>
<y0:vt>
<z0:vt>
gseq_irz2map1_lstrq(xs: !xs, ys: !ys): strq_vt(z0)
//
#symload irz2map0_llist with gseq_irz2map0_llist of 0100
#symload irz2map1_llist with gseq_irz2map1_llist of 0100
#symload irz2map0_lstrm with gseq_irz2map0_lstrm of 0100
#symload irz2map1_lstrm with gseq_irz2map1_lstrm of 0100
#symload irz2map0_lstrq with gseq_irz2map0_lstrq of 0100
#symload irz2map1_lstrq with gseq_irz2map1_lstrq of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_VT_gseq002_vt.sats] *)
