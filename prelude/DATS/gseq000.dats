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
Mon 08 Jul 2024 12:53:10 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_sep((*void*)) = ","
#impltmp
< xs:vt >
< x0:vt >
gseq_end((*void*)) = ")"
#impltmp
< xs:vt >
< x0:vt >
gseq_beg((*void*)) = "gseq("
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_omit((*void*)) = "..."
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_prlen((*void*)) = (-1)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-03:
Sat 03 Aug 2024 02:54:34 PM EDT
*)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_nilq(xs) =
not(gseq_consq<xs><x0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_consq(xs) =
(
 not(gseq_nilq<xs><x0>(xs)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_free(xs) =
(
gseq_foritm0<xs><x0>(xs)
) where
{
#impltmp
foritm$work0<x0> = g_free<x0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_copy(xs) =
(
gseq_map1_self<xs><x0>(xs)
) where
{
#impltmp
map$fopr1<x0><x0> = g_copy<x0>
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_max = gseq_max0<xs><x0>
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_min = gseq_min0<xs><x0>
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_sum = gseq_sum0<xs><x0>
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_prod = gseq_prod0<xs><x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_print = gseq_print0<xs><x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_length = gseq_length0<xs><x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-17:
Wed 17 Jul 2024 01:31:56 PM EDT
*)
//
(*
#impltmp
< xs:t0 >
< x0:t0 >
< ys:vt >
gseq_append =
gseq_append00<xs><x0><ys>(*void*)
*)
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:vt >
gseq_append
  (xs, ys) =
gseq_fmake_fwork<xs><x0>
(
lam(work) =>
(
gseq_foritm$f1un<xs><x0>(xs, work);
gseq_foritm0$f1un<ys><x0>(ys, work)))
//
(* ****** ****** *)
//
(*
HX-2024-07-17:
Wed 17 Jul 2024 01:36:53 PM EDT
*)
//
(*
#impltmp
< xs:t0 >
< x0:t0 >
< ys:vt >
gseq_prepend =
gseq_prepend00<xs><x0><ys>(*void*)
*)
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:vt >
gseq_prepend
  (xs, ys) =
gseq_fmake_fwork<xs><x0>
(
lam(work) =>
(
gseq_foritm0$f1un<ys><x0>(ys, work)
;gseq_foritm$f1un<xs><x0>(xs, work)))
//
(* ****** ****** *)
//
(*
Wed 17 Jul 2024 04:10:30 PM EDT
*)
//
(*
#impltmp
< xs:t0 >
< x0:t0 >
< ys:vt >
gseq_reverse =
gseq_reverse0<xs><x0>(*void*)
#impltmp
< xs:t0 >
< x0:t0 >
< ys:vt >
gseq_rappend =
gseq_rappend00<xs><x0><ys>(*void*)
*)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_reverse
  ( xs ) =
gseq_fmake_fwork<xs><x0>
(
lam(work) =>
(
gseq_rforitm$f1un<xs><x0>(xs, work)))
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:vt >
gseq_rappend
  (xs, ys) =
gseq_fmake_fwork<xs><x0>
(
lam(work) =>
(
gseq_rforitm$f1un<xs><x0>(xs, work);
gseq_foritm0$f1un<ys><x0>(ys, work)))
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gseq000.dats] *)
