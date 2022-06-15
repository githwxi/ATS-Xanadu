(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
Start Time: June 14th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
//
fun
<x0:t0>
<e1:vt>
forall_env1$test
(x0: x0, e1: !e1): bool
//
fun
<xs:t0>
<x0:t0>
<e1:vt>
gseq_forall_env1(xs, !e1): bool
//
(* ****** ****** *)
//
fun
<x0:t0>
<e1:vt>
foreach_env1$work
(x0: x0, e1: !e1): void
//
fun
<xs:t0>
<x0:t0>
<e1:vt>
gseq_foreach_env1(xs, !e1): void
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:vt>
<e1:vt>
map_env1$fopr
(x0: x0, e1: !e1): y0
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
<e1:vt>
gseq_map_env1_list(xs, !e1): list_vt(y0)
fun
<xs:t0>
<x0:t0>
<y0:vt>
<e1:vt>
gseq_map_env1_strm(xs, !e1): strm_vt(y0)
//
(* ****** ****** *)

(* end of [xatslib_githwxi_genv000.sats] *)
