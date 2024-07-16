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
fun
<xs:vt
,ys:vt>
<x0:vt
,y0:vt>
gseq_z2forall0(xs: ~xs, ys: ~ys): bool
fun
<xs:vt
,ys:vt>
<x0:vt
,y0:vt>
gseq_z2forall1(xs: !xs, ys: !ys): bool
//
fun
<xs:vt
,ys:vt>
<x0:vt
,y0:vt>
gseq_rz2forall0(xs: ~xs, ys: ~ys): bool
fun
<xs:vt
,ys:vt>
<x0:vt
,y0:vt>
gseq_rz2forall1(xs: !xs, ys: !ys): bool
//
fun
<xs:vt
,ys:vt>
<x0:vt
,y0:vt>
gseq_iz2forall0(xs: ~xs, ys: ~ys): bool
fun
<xs:vt
,ys:vt>
<x0:vt
,y0:vt>
gseq_iz2forall1(xs: !xs, ys: !ys): bool
//
fun
<xs:vt
,ys:vt>
<x0:vt
,y0:vt>
gseq_irz2forall0(xs: ~xs, ys: ~ys): bool
fun
<xs:vt
,ys:vt>
<x0:vt
,y0:vt>
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
<xs:vt
,ys:vt>
<x0:vt
,y0:vt>
gseq_z2foritm0(xs: ~xs, ys: ~ys): void
fun
<xs:vt
,ys:vt>
<x0:vt
,y0:vt>
gseq_z2foritm1(xs: !xs, ys: !ys): void
//
fun
<xs:vt
,ys:vt>
<x0:vt
,y0:vt>
gseq_rz2foritm0(xs: ~xs, ys: ~ys): void
fun
<xs:vt
,ys:vt>
<x0:vt
,y0:vt>
gseq_rz2foritm1(xs: !xs, ys: !ys): void
//
fun
<xs:vt
,ys:vt>
<x0:vt
,y0:vt>
gseq_iz2foritm0(xs: ~xs, ys: ~ys): void
fun
<xs:vt
,ys:vt>
<x0:vt
,y0:vt>
gseq_iz2foritm1(xs: !xs, ys: !ys): void
//
fun
<xs:vt
,ys:vt>
<x0:vt
,y0:vt>
gseq_irz2foritm0(xs: ~xs, ys: ~ys): void
fun
<xs:vt
,ys:vt>
<x0:vt
,y0:vt>
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
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_VT_gseq002_vt.sats] *)
