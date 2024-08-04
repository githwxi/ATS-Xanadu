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
Sat 27 Jul 2024 01:32:19 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-29:
Sat 03 Aug 2024 05:17:37 PM EDT
*)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_forall0(xs) =
(
  gseq_forall<xs><x0>(xs))
where
{
#impltmp
forall$test<x0> = forall$test0<x0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_forall1(xs) =
(
  gseq_forall<xs><x0>(xs))
where
{
#impltmp
forall$test<x0> = forall$test1<x0>
}
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_rforall0(xs) =
(
  gseq_rforall<xs><x0>(xs))
where
{
#impltmp
rforall$test<x0> = rforall$test0<x0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_rforall1(xs) =
(
  gseq_rforall<xs><x0>(xs))
where
{
#impltmp
rforall$test<x0> = rforall$test1<x0>
}
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_iforall0(xs) =
(
  gseq_iforall<xs><x0>(xs))
where
{
#impltmp
iforall$test<x0> = iforall$test0<x0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_iforall1(xs) =
(
  gseq_iforall<xs><x0>(xs))
where
{
#impltmp
iforall$test<x0> = iforall$test1<x0>
}
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_irforall0(xs) =
(
  gseq_irforall<xs><x0>(xs))
where
{
#impltmp
irforall$test<x0> = irforall$test0<x0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_irforall1(xs) =
(
  gseq_irforall<xs><x0>(xs))
where
{
#impltmp
irforall$test<x0> = irforall$test1<x0>
}
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_forall0_c1fr
  (xs, test) =
(
  gseq_forall_c1fr<xs><x0>(xs, test))
#impltmp
< xs:t0 >
< x0:t0 >
gseq_forall1_c1fr
  (xs, test) =
(
  gseq_forall_c1fr<xs><x0>(xs, test))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_rforall0_c1fr
  (xs, test) =
(
  gseq_rforall_c1fr<xs><x0>(xs, test))
#impltmp
< xs:t0 >
< x0:t0 >
gseq_rforall1_c1fr
  (xs, test) =
(
  gseq_rforall_c1fr<xs><x0>(xs, test))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-03:
Sat 03 Aug 2024 05:37:49 PM EDT
*)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_foritm0(xs) =
(
  gseq_foritm<xs><x0>(xs))
where
{
#impltmp
foritm$work<x0> = foritm$work0<x0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_foritm1(xs) =
(
  gseq_foritm<xs><x0>(xs))
where
{
#impltmp
foritm$work<x0> = foritm$work1<x0>
}
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_rforitm0(xs) =
(
  gseq_rforitm<xs><x0>(xs))
where
{
#impltmp
rforitm$work<x0> = rforitm$work0<x0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_rforitm1(xs) =
(
  gseq_rforitm<xs><x0>(xs))
where
{
#impltmp
rforitm$work<x0> = rforitm$work1<x0>
}
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_iforitm0(xs) =
(
  gseq_iforitm<xs><x0>(xs))
where
{
#impltmp
iforitm$work<x0> = iforitm$work0<x0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_iforitm1(xs) =
(
  gseq_iforitm<xs><x0>(xs))
where
{
#impltmp
iforitm$work<x0> = iforitm$work1<x0>
}
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_irforitm0(xs) =
(
  gseq_irforitm<xs><x0>(xs))
where
{
#impltmp
irforitm$work<x0> = irforitm$work0<x0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_irforitm1(xs) =
(
  gseq_irforitm<xs><x0>(xs))
where
{
#impltmp
irforitm$work<x0> = irforitm$work1<x0>
}
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_foritm0_c1fr
  (xs, work) =
(
  gseq_foritm_c1fr<xs><x0>(xs, work))
#impltmp
< xs:t0 >
< x0:t0 >
gseq_foritm1_c1fr
  (xs, work) =
(
  gseq_foritm_c1fr<xs><x0>(xs, work))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_rforitm0_c1fr
  (xs, work) =
(
  gseq_rforitm_c1fr<xs><x0>(xs, work))
#impltmp
< xs:t0 >
< x0:t0 >
gseq_rforitm1_c1fr
  (xs, work) =
(
  gseq_rforitm_c1fr<xs><x0>(xs, work))
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_VT_gxyz000_vt.dats] *)