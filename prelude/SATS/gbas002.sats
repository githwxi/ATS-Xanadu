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
Sat 13 Jul 2024 09:24:55 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-07-13:
We should probably
not go higher to handle z3!!!
*)
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x1:t0
,x2:t0>
z2forall$test
(x1: x1, x2: x2): bool
fun
<x1:t0
,x2:t0>
iz2forall$test
(i0: ni, x1: x1, x2: x2): bool
//
fun
<x1:t0
,x2:t0>
z2foritm$work
(x1: x1, x2: x2): void
fun
<x1:t0
,x2:t0>
iz2foritm$work
(i0: ni, x1: x1, x2: x2): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x1:t0
,x2:t0>
<r0:vt>
z2folditm$fopr
(x1: x1, x2: x2, r0: r0): (r0)
fun
<x1:t0
,x2:t0>
<r0:vt>
z2foldall$fopr
(x1: x1, x2: x2, r0: r0): (bool, r0)
//
fun
<x1:t0
,x2:t0>
<r0:vt>
iz2folditm$fopr
(i0: ni
,x1: x1, x2: x2, r0: r0): (r0)
fun
<x1:t0
,x2:t0>
<r0:vt>
iz2foldall$fopr
(i0: ni
,x1: x1, x2: x2, r0: r0): (bool, r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x1:t0
,x2:t0>
<y0:vt>
z2map$fopr(x1: x1, x2: x2): (y0)
fun
<x1:t0
,x2:t0>
<y0:vt>
iz2map$fopr
  (i0: ni, x1: x1, x2: x2): (y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x1:t0
,x2:t0>
<y0:vt>
z2mapoptn$fopr(x1, x2): optn_vt(y0)
fun
<x1:t0
,x2:t0>
<y0:vt>
z2maplist$fopr(x1, x2): list_vt(y0)
fun
<x1:t0
,x2:t0>
<y0:vt>
z2mapstrm$fopr(x1, x2): strm_vt(y0)
fun
<x1:t0
,x2:t0>
<y0:vt>
z2mapstrq$fopr(x1, x2): strq_vt(y0)
//
(* ****** ****** *)
//
fun
<x1:t0
,x2:t0>
<y0:vt>
iz2mapoptn$fopr
(i0: ni, x1: x1, x2: x2): optn_vt(y0)
fun
<x1:t0
,x2:t0>
<y0:vt>
iz2maplist$fopr
(i0: ni, x1: x1, x2: x2): list_vt(y0)
fun
<x1:t0
,x2:t0>
<y0:vt>
iz2mapstrm$fopr
(i0: ni, x1: x1, x2: x2): strm_vt(y0)
fun
<x1:t0
,x2:t0>
<y0:vt>
iz2mapstrq$fopr
(i0: ni, x1: x1, x2: x2): strq_vt(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gbas002.sats] *)
