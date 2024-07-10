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
Wed 10 Jul 2024 09:26:36 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
forall0$test(x0: ~x0): bool
fun
<x0:vt>
forall1$test(x0: !x0): bool
//
fun
<x0:vt>
foreach0$work(x0: ~x0): void
fun
<x0:vt>
foreach1$work(x0: ~x0): void
//
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
foldlft0$fopr(r0, !x0): (r0)
fun
<x0:vt>
<r0:vt>
foldlft1$fopr(r0, ~x0): (r0)
//
fun
<x0:vt>
<r0:vt>
foldall0$fopr(r0, ~x0): (bool, r0)
fun
<x0:vt>
<r0:vt>
foldall1$fopr(r0, !x0): (bool, r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
rforall0$test(x0: ~x0): bool
fun
<x0:vt>
rforall1$test(x0: !x0): bool
//
fun
<x0:vt>
rforeach0$work(x0: ~x0): void
fun
<x0:vt>
rforeach1$work(x0: !x0): void
//
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
rfoldlft0$fopr(~x0, r0): (r0)
fun
<x0:vt>
<r0:vt>
rfoldlft1$fopr(!x0, r0): (r0)
//
fun
<x0:vt>
<r0:vt>
rfoldall0$fopr(~x0, r0): (bool, r0)
fun
<x0:vt>
<r0:vt>
rfoldall1$fopr(!x0, r0): (bool, r0)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gbas001.sats] *)
