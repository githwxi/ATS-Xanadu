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
Tue 23 Jul 2024 05:53:46 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
z2forall$test0
(x0: ~x0, y0: ~y0): bool
fun
<x0:vt>
<y0:vt>
z2forall$test1
(x0: !x0, y0: !y0): bool
//
fun
<x0:vt>
<y0:vt>
rz2forall$test0
(x0: ~x0, y0: ~y0): bool
fun
<x0:vt>
<y0:vt>
rz2forall$test1
(x0: !x0, y0: !y0): bool
//
fun
<x0:vt>
<y0:vt>
iz2forall$test0
(i0: ni, x0: ~x0, y0: ~y0): bool
fun
<x0:vt>
<y0:vt>
iz2forall$test1
(i0: ni, x0: !x0, y0: !y0): bool
//
fun
<x0:vt>
<y0:vt>
irz2forall$test0
(i0: ni, x0: ~x0, y0: ~y0): bool
fun
<x0:vt>
<y0:vt>
irz2forall$test1
(i0: ni, x0: !x0, y0: !y0): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
z2forcmp$test0
(x0: ~x0, y0: ~y0): sint
fun
<x0:vt>
<y0:vt>
z2forcmp$test1
(x0: !x0, y0: !y0): sint
//
fun
<x0:vt>
<y0:vt>
iz2forcmp$test0
(i0: ni, x0: ~x0, y0: ~y0): sint
fun
<x0:vt>
<y0:vt>
iz2forcmp$test1
(i0: ni, x0: !x0, y0: !y0): sint
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
<z0:vt>
z2map$fopr0(x0: ~x0, y0: ~y0): ( z0 )
fun
<x0:vt>
<y0:vt>
<z0:vt>
z2map$fopr1(x0: !x0, y0: !y0): ( z0 )
//
fun
<x0:vt>
<y0:vt>
<z0:vt>
rz2map$fopr0(x0: ~x0, y0: ~y0): ( z0 )
fun
<x0:vt>
<y0:vt>
<z0:vt>
rz2map$fopr1(x0: !x0, y0: !y0): ( z0 )
//
fun
<x0:vt>
<y0:vt>
<z0:vt>
iz2map$fopr0(i0: ni, x0: ~x0, y0: ~y0): ( z0 )
fun
<x0:vt>
<y0:vt>
<z0:vt>
iz2map$fopr1(i0: ni, x0: !x0, y0: !y0): ( z0 )
//
fun
<x0:vt>
<y0:vt>
<z0:vt>
irz2map$fopr0(i0: ni, x0: ~x0, y0: ~y0): ( z0 )
fun
<x0:vt>
<y0:vt>
<z0:vt>
irz2map$fopr1(i0: ni, x0: !x0, y0: !y0): ( z0 )
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_VT_gbas002_vt.sats] *)
