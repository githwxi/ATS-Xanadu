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
<xs:t0>
<x0:t0>
gseq_nil
( (*void*) ): (xs)
fun
<xs:t0>
<x0:t0>
gseq_cons
(x0: x0, xs: xs): (xs)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_max(xs: xs): (x0)
fun
<xs:t0>
<x0:t0>
gseq_min(xs: xs): (x0)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_sum(xs: xs): (x0)
fun
<xs:t0>
<x0:t0>
gseq_prod(xs: xs): (x0)
//
(*
#symload sum with gseq_sum of 0100
#symload prod with gseq_prod of 0100
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_print(xs: xs): void
//
(*
#symload print with gseq_print of 0100
*)
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_head(xs: xs): (x0)
fun
<xs:t0>
<x0:t0>
gseq_tail(xs: xs): (xs)
//
fun
<xs:t0>
<x0:t0>
gseq_head_opt
  (xs: xs): optn_vt(x0)
fun
<xs:t0>
<x0:t0>
gseq_tail_opt
  (xs: xs): optn_vt(xs)
//
(*
#symload head with gseq_head of 0100
#symload tail with gseq_tail of 0100
#symload head_opt with gseq_head_opt of 0100
#symload tail_opt with gseq_tail_opt of 0100
*)
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_length(xs: xs): nint // >= 0
//
(*
#symload length with gseq_length of 0100
*)
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-15:
Mon 15 Jul 2024 03:44:51 PM EDT
*)
//
fun
<xs:t0>
<x0:t0>
gseq_get_at
(xs: xs, i0: ni): (x0)
fun
<xs:t0>
<x0:t0>
gseq_get_at_opt
(xs: xs, i0: ni): optn_vt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-17:
Wed 17 Jul 2024 12:48:59 PM EDT
*)
//
fun
<xs:t0>
<x0:t0>
<ys:vt>
gseq_append(xs: xs, ys: ~ys): xs
//
(* ****** ****** *)
//
(*
HX-2024-07-17:
Wed 17 Jul 2024 12:48:59 PM EDT
*)
//
fun
<xs:t0>
<x0:t0>
<ys:vt>
gseq_prepend(xs: xs, ys: ~ys): xs
//
(* ****** ****** *)
//
(*
HX-2024-07-17:
Wed 17 Jul 2024 04:11:09 PM EDT
*)
//
fun
<xs:t0>
<x0:t0>
<ys:vt>
gseq_rappend(xs: xs, ys: ~ys): xs
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gseq000.sats] *)
