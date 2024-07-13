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
Sat 13 Jul 2024 10:09:41 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_length0(xs: ~xs): sint
fun
<xs:vt>
<x0:vt>
gseq_length1(xs: !xs): sint
//
#symload length0 with gseq_length0
#symload length1 with gseq_length1
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_strmize0
(xs: ~xs): strm_vt(x0)//fun
fun
<xs:vt>
<x0:vt>
gseq_strqize0
(xs: ~xs): strq_vt(x0)//fun
//
fun
<xs:vt>
<x0:vt>
gseq_listize0
(xs: ~xs): list_vt(x0)//fun
//
#symload strmize0 with gseq_strmize0 of 0100
#symload strqize0 with gseq_strqize0 of 0100
#symload listize0 with gseq_listize0 of 0100
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_rstrmize0
(xs: ~xs): strm_vt(x0)//fun
fun
<xs:vt>
<x0:vt>
gseq_rstrqize0
(xs: ~xs): strq_vt(x0)//fun
fun
<xs:vt>
<x0:vt>
gseq_rlistize0
(xs: ~xs): list_vt(x0)//fun
//
#symload rstrmize0 with gseq_rstrmize0 of 0100
#symload rstrqize0 with gseq_rstrqize0 of 0100
#symload rlistize0 with gseq_rlistize0 of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_forall0(xs: ~xs): bool
fun
<xs:vt>
<x0:vt>
gseq_forall1(xs: !xs): bool
//
fun
<xs:vt>
<x0:vt>
gseq_foritm0(xs: ~xs): void
fun
<xs:vt>
<x0:vt>
gseq_foritm1(xs: !xs): void
//
fun
<xs:vt>
<x0:vt>
gseq_rforall0(xs: ~xs): bool
fun
<xs:vt>
<x0:vt>
gseq_rforall1(xs: !xs): bool
//
fun
<xs:vt>
<x0:vt>
gseq_rforitm0(xs: ~xs): void
fun
<xs:vt>
<x0:vt>
gseq_rforitm1(xs: !xs): void
//
fun
<xs:vt>
<x0:vt>
gseq_iforall0(xs: ~xs): bool
fun
<xs:vt>
<x0:vt>
gseq_iforall1(xs: !xs): bool
//
fun
<xs:vt>
<x0:vt>
gseq_iforitm0(xs: ~xs): void
fun
<xs:vt>
<x0:vt>
gseq_iforitm1(xs: !xs): void
//
(* ****** ****** *)
//
#symload forall0 with gseq_forall0 of 0100
#symload forall1 with gseq_forall1 of 0100
#symload foritm0 with gseq_foritm0 of 0100
#symload foritm1 with gseq_foritm1 of 0100
//
#symload rforall0 with gseq_rforall0 of 0100
#symload rforall1 with gseq_rforall1 of 0100
#symload rforitm0 with gseq_rforitm0 of 0100
#symload rforitm1 with gseq_rforitm1 of 0100
//
#symload iforall0 with gseq_iforall0 of 0100
#symload iforall1 with gseq_iforall1 of 0100
#symload iforitm0 with gseq_iforitm0 of 0100
#symload iforitm1 with gseq_iforitm1 of 0100
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_folditm0(~xs, r0): (r0)
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_folditm1(!xs, r0): (r0)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_foldall0(~xs, r0): (r0)
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_foldall1(!xs, r0): (r0)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_rfolditm0(~xs, r0): (r0)
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_rfolditm1(!xs, r0): (r0)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_rfoldall0(~xs, r0): (r0)
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_rfoldall1(!xs, r0): (r0)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_ifolditm0(~xs, r0): (r0)
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_ifolditm1(!xs, r0): (r0)
//
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_ifoldall0(~xs, r0): (r0)
fun
<xs:vt>
<x0:vt>
<r0:vt>
gseq_ifoldall1(!xs, r0): (r0)
//
(* ****** ****** *)
//
#symload foldall0 with gseq_foldall0 of 0100
#symload foldall1 with gseq_foldall1 of 0100
#symload folditm0 with gseq_folditm0 of 0100
#symload folditm1 with gseq_folditm1 of 0100
//
#symload rfoldall0 with gseq_rfoldall0 of 0100
#symload rfoldall1 with gseq_rfoldall1 of 0100
#symload rfolditm0 with gseq_rfolditm0 of 0100
#symload rfolditm1 with gseq_rfolditm1 of 0100
//
#symload ifoldall0 with gseq_ifoldall0 of 0100
#symload ifoldall1 with gseq_ifoldall1 of 0100
#symload ifolditm0 with gseq_ifolditm0 of 0100
#symload ifolditm1 with gseq_ifolditm1 of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
gseq_map0_ares(xs: ~xs): (ys)
fun
<xs:vt>
<x0:vt>
gseq_map0_self(xs: ~xs): (xs)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
gseq_map1_ares(xs: !xs): (ys)
fun
<xs:vt>
<x0:vt>
gseq_map1_self(xs: !xs): (xs)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
gseq_filter0_ares(xs: ~xs): (ys)
fun
<xs:vt>
<x0:vt>
gseq_filter0_self(xs: ~xs): (xs)
//
fun
<xs:vt>
<x0:vt>
<ys:vt>
gseq_filter1_ares(xs: !xs): (ys)
fun
<xs:vt>
<x0:vt>
gseq_filter1_self(xs: !xs): (xs)
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload filter0 with gseq_filter0_ares of 0100
#symload filter1 with gseq_filter1_ares of 0100
//
#symload filter1 with gseq_filter1_self of 0101
#symload filter0 with gseq_filter0_self of 0101
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_VT_gseq001_vt.sats] *)
