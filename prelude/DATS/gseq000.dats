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
Mon 08 Jul 2024 12:53:10 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
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
foritm0$work<x0> = g_free<x0>
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
map1$fopr<x0><x0> = g_copy<x0>
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
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gseq000.dats] *)
