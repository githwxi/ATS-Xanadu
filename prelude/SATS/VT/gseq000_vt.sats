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
gseq_strmize0
  (xs: ~xs): strm_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_strqize0
  (xs: ~xs): strq_vt(x0)
//
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gseq_listize0
  (xs: ~xs): list_vt(x0)
fun
<xs:vt>
<x0:vt>
gseq_rlistize0
  (xs: ~xs): list_vt(x0)
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
#symload filter0 with gseq_filter0_self of 0101
//
#symload filter1 with gseq_filter1_ares of 0100
#symload filter1 with gseq_filter1_self of 0101
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_VT_gseq000_vt.sats] *)
