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
Wed 10 Jul 2024 09:08:28 AM EDT
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
<x0:t0>
forall$test(x0: x0): bool
fun
<x0:t0>
foritm$work(x0: x0): void
fun
<x0:t0>
iforitm$work(ni, x0): void
//
(* ****** ****** *)
//
fun
<x0:t0>
rforall$test(x0: x0): bool
fun
<x0:t0>
rforitm$work(x0: x0): void
fun
<x0:t0>
irforitm$work(ni, x0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<r0:vt>
folditm$fopr(r0, x0): (r0)
fun
<x0:t0>
<r0:vt>
foldall$fopr(r0, x0): (bool, r0)
//
fun
<x0:t0>
<r0:vt>
ifoldall$fopr
(res: r0, pos: ni, itm: x0): (bool, r0)
//
(* ****** ****** *)
//
fun
<x0:t0>
<r0:vt>
rfolditm$fopr(x0, r0): (r0)
fun
<x0:t0>
<r0:vt>
rfoldall$fopr(x0, r0): (bool, r0)
//
fun
<x0:t0>
<r0:vt>
irfoldall$fopr
(pos: ni, itm: x0, res: r0): (bool, r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gbas001.sats] *)
