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
z2rforall$test0
(x0: ~x0, y0: ~y0): bool
fun
<x0:vt>
<y0:vt>
z2rforall$test1
(x0: !x0, y0: !y0): bool
//
fun
<x0:vt>
<y0:vt>
z2iforall$test0
(i0: ni, x0: ~x0, y0: ~y0): bool
fun
<x0:vt>
<y0:vt>
z2iforall$test1
(i0: ni, x0: !x0, y0: !y0): bool
//
fun
<x0:vt>
<y0:vt>
z2irforall$test0
(i0: ni, x0: ~x0, y0: ~y0): bool
fun
<x0:vt>
<y0:vt>
z2irforall$test1
(i0: ni, x0: !x0, y0: !y0): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
z2forcmp$tcmp0
(x0: ~x0, y0: ~y0): sint
fun
<x0:vt>
<y0:vt>
z2forcmp$tcmp1
(x0: !x0, y0: !y0): sint
//
fun
<x0:vt>
<y0:vt>
z2rforcmp$tcmp0
(x0: ~x0, y0: ~y0): sint
fun
<x0:vt>
<y0:vt>
z2rforcmp$tcmp1
(x0: !x0, y0: !y0): sint
//
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
z2iforcmp$tcmp0
(i0: ni, x0: ~x0, y0: ~y0): sint
fun
<x0:vt>
<y0:vt>
z2iforcmp$tcmp1
(i0: ni, x0: !x0, y0: !y0): sint
//
fun
<x0:vt>
<y0:vt>
z2irforcmp$tcmp0
(i0: ni, x0: ~x0, y0: ~y0): sint
fun
<x0:vt>
<y0:vt>
z2irforcmp$tcmp1
(i0: ni, x0: !x0, y0: !y0): sint
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
z2foritm$work0
(x0: ~x0, y0: ~y0): void
fun
<x0:vt>
<y0:vt>
z2foritm$work1
(x0: !x0, y0: !y0): void
//
fun
<x0:vt>
<y0:vt>
z2rforitm$work0
(x0: ~x0, y0: ~y0): void
fun
<x0:vt>
<y0:vt>
z2rforitm$work1
(x0: !x0, y0: !y0): void
//
fun
<x0:vt>
<y0:vt>
z2iforitm$work0
(i0: ni, x0: ~x0, y0: ~y0): void
fun
<x0:vt>
<y0:vt>
z2iforitm$work1
(i0: ni, x0: !x0, y0: !y0): void
//
fun
<x0:vt>
<y0:vt>
z2irforitm$work0
(i0: ni, x0: ~x0, y0: ~y0): void
fun
<x0:vt>
<y0:vt>
z2irforitm$work1
(i0: ni, x0: !x0, y0: !y0): void
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
z2rmap$fopr0(x0: ~x0, y0: ~y0): ( z0 )
fun
<x0:vt>
<y0:vt>
<z0:vt>
z2rmap$fopr1(x0: !x0, y0: !y0): ( z0 )
//
fun
<x0:vt>
<y0:vt>
<z0:vt>
z2imap$fopr0(i0: ni, x0: ~x0, y0: ~y0): ( z0 )
fun
<x0:vt>
<y0:vt>
<z0:vt>
z2imap$fopr1(i0: ni, x0: !x0, y0: !y0): ( z0 )
//
fun
<x0:vt>
<y0:vt>
<z0:vt>
z2irmap$fopr0(i0: ni, x0: ~x0, y0: ~y0): ( z0 )
fun
<x0:vt>
<y0:vt>
<z0:vt>
z2irmap$fopr1(i0: ni, x0: !x0, y0: !y0): ( z0 )
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_SATS_VT_gbas002_vt.sats] *)
(***********************************************************************)
