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
(*
HX-2024-07-25:
This one is already
included by [./../unsfx00.sats]
Thu 25 Jul 2024 10:28:59 AM EDT
*)
(* ****** ****** *)
(* ****** ****** *)
//
fcast
optn_vt2t
{a:t0}{b:b0}
(xs: !optn_vt(a, b)): optn(a, b)
fcast
list_vt2t
{a:t0}{n:i0}
(xs: !list_vt(a, n)): list(a, n)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
p2tr_set_list_vt_nil
(p0: p2tr(list_vt(a))): void
fun
<a:vt>
p2tr_set_list_vt_cons
(p0: p2tr(list_vt(a)), x0: a): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
strn_vt_get$at1
(cs: !strn_vt, i0: sint): cgtz
fun<>
strn_vt_set$at1
(cs: !strn_vt, i0: sint, c0: cgtz): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-22:
Mon 22 Jul 2024 08:20:12 AM EDT
*)
//
fcast
strm2q_vt
{a:vt}{n:nat}
(xs: strm_vt(a)): strq_vt(a, n)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gasz_get$at$raw1
(xs: !xs, i0: ni): (x0)
fun
<xs:vt>
<x0:vt>
gasz_set$at$raw1
(xs: !xs, i0: ni, x0: x0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_VT_unsfx00_vt.sats] *)
