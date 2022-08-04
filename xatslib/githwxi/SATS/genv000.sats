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
<r0:vt>
<e1:vt>
foldl_e1nv$fopr
(r0:r0, x0:x0, e1: !e1): r0
fun
<x0:t0>
<r0:vt>
<e1:vt>
foldr_e1nv$fopr
(x0:x0, r0:r0, e1: !e1): r0
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
<e1:vt>
gseq_foldl_e1nv
(xs: xs, r0: r0, e1: !e1): r0
fun
<xs:t0>
<x0:t0>
<r0:vt>
<e1:vt>
gseq_foldr_e1nv
(xs: xs, r0: r0, e1: !e1): r0
//
(* ****** ****** *)
//
fun
<x0:t0>
<e1:vt>
forall_e1nv$test
(x0: x0, e1: !e1): bool
//
fun
<xs:t0>
<x0:t0>
<e1:vt>
gseq_forall_e1nv(xs, !e1): bool
//
(* ****** ****** *)
//
fun
<x0:t0>
<e1:vt>
foreach_e1nv$work
(x0: x0, e1: !e1): void
//
fun
<xs:t0>
<x0:t0>
<e1:vt>
gseq_foreach_e1nv(xs, !e1): void
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:vt>
<e1:vt>
map_e1nv$fopr
(x0: x0, e1: !e1): y0
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
<e1:vt>
gseq_map_e1nv_list(xs, !e1): list_vt(y0)
//
fun
<x0:t0>
<y0:t0>
<e1:vt>
list_map_e1nv
{n:int}(list(x0, n), e1: !e1): list(y0, n)
fun
<x0:t0>
<y0:t0>
<e1:vt>
list_map_e1nv_vt
{n:int}(list(x0, n), e1: !e1): list_vt(y0, n)
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:vt>
<e1:vt>
<e2:vt>
map_e2nv$fopr
(x0: x0, e1: !e1, e2: !e2): y0
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<y0:vt>
<e1:vt>
<e2:vt>
gseq_map_e2nv_list
(xs: xs, e1: !e1, e2: !e2): list_vt(y0)
//
fun
<x0:t0>
<y0:t0>
<e1:vt>
<e2:vt>
list_map_e2nv
{n:int}
(list(x0, n), e1: !e1, e2: !e2): list(y0, n)
fun
<x0:t0>
<y0:t0>
<e1:vt>
<e2:vt>
list_map_e2nv_vt
{n:int}
(list(x0, n), e1: !e1, e2: !e2): list_vt(y0, n)
//
(* ****** ****** *)

(* end of [xatslib_githwxi_genv000.sats] *)
