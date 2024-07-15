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
Mon 08 Jul 2024 02:15:16 AM EDT
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
gseq_free( ~xs ): void
fun
<xs:vt>
<x0:vt>
gseq_copy( !xs ): (xs)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_nil0((*nil*)): (xs)
fun
<xs:vt>
<x0:vt>
gseq_cons0(x0, xs): (xs)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_max0(xs: ~xs): (x0)
fun
<xs:vt>
<x0:vt>
gseq_max1(xs: !xs): (x0)
//
fun
<xs:vt>
<x0:vt>
gseq_min0(xs: ~xs): (x0)
fun
<xs:vt>
<x0:vt>
gseq_min1(xs: !xs): (x0)
//
fun
<xs:vt>
<x0:vt>
gseq_max0_opt
  (xs: ~xs): optn_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_max1_opt
  (xs: !xs): optn_vt(x0)
//
fun
<xs:vt>
<x0:vt>
gseq_min0_opt
  (xs: ~xs): optn_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_min1_opt
  (xs: !xs): optn_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_sum0(xs: ~xs): (x0)
fun
<xs:vt>
<x0:vt>
gseq_sum1(xs: !xs): (x0)
//
fun
<xs:vt>
<x0:vt>
gseq_prod0(xs: ~xs): (x0)
fun
<xs:vt>
<x0:vt>
gseq_prod1(xs: !xs): (x0)
//
(*
#symload sum0 with gseq_sum0 of 0100
#symload sum1 with gseq_sum1 of 0100
#symload prod0 with gseq_prod0 of 0100
#symload prod1 with gseq_prod1 of 0100
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_nilq0(xs: ~xs): bool
fun
<xs:vt>
<x0:vt>
gseq_nilq1(xs: !xs): bool
//
fun
<xs:vt>
<x0:vt>
gseq_consq0(xs: ~xs): bool
fun
<xs:vt>
<x0:vt>
gseq_consq1(xs: !xs): bool
//
(*
#symload nilq0 with gseq_nilq0 of 0100
#symload nilq0 with gseq_nilq1 of 0100
#symload consq0 with gseq_consq0 of 0100
#symload consq0 with gseq_consq1 of 0100
*)
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_head0(xs: ~xs): (x0)
fun
<xs:vt>
<x0:vt>
gseq_head1(xs: !xs): (x0)
//
fun
<xs:vt>
<x0:vt>
gseq_head0_opt
  (xs : ~xs): optn_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_head1_opt
  (xs : !xs): optn_vt(x0)
//
(*
#symload head0 with gseq_head0 of 0100
#symload head0 with gseq_head1 of 0100
#symload head0 with gseq_head0_opt of 0100
#symload head0 with gseq_head1_opt of 0100
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_print0(xs: ~xs): void
fun
<xs:vt>
<x0:vt>
gseq_print1(xs: !xs): void
//
(*
#symload print0 with gseq_print0 of 0100
#symload print1 with gseq_print1 of 0100
*)
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
(*
#symload length0 with gseq_length0 of 0100
#symload length1 with gseq_length1 of 0100
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-15:
Mon 15 Jul 2024 04:09:48 PM EDT
*)
//
fun
<xs:vt>
<x0:vt>
gseq_get0_at
(xs: ~xs, i0: ni): (x0)
fun
<xs:vt>
<x0:vt>
gseq_get1_at
(xs: !xs, i0: ni): (x0)
//
fun
<xs:vt>
<x0:vt>
gseq_get0_at_opt
(xs: ~xs, i0: ni): optn_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_get1_at_opt
(xs: !xs, i0: ni): optn_vt(x0)
//
(*
#symload get0_at with gseq_get0_at of 0100
#symload get1_at with gseq_get1_at of 0100
#symload get0_at_opt with gseq_get0_at_opt of 0100
#symload get1_at_opt with gseq_get1_at_opt of 0100
*)
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_VT_gseq000_vt.sats] *)
