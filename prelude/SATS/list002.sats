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
Sun 11 Aug 2024 09:11:41 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0
,y0:t0>
list_z2forall0
( xs: list(x0)
, ys: list(y0)): bool//end-of-[fun]
//
fun
<x0:t0
,y0:t0>
list_iz2forall0
( xs: list(x0)
, ys: list(y0)): bool//end-of-[fun]
//
#symload
z2forall0 with list_z2forall0 of 1000
#symload
iz2forall0 with list_iz2forall0 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0
,y0:t0>
list_z2forcmp0
( xs: list(x0)
, ys: list(y0)): sint//end-of-[fun]
//
fun
<x0:t0
,y0:t0>
list_iz2forcmp0
( xs: list(x0)
, ys: list(y0)): sint//end-of-[fun]
//
#symload
z2forcmp0 with list_z2forcmp0 of 1000
#symload
iz2forcmp0 with list_iz2forcmp0 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0
,y0:t0>
list_z2foritm0
( xs: list(x0)
, ys: list(y0)): void//end-of-[fun]
//
fun
<x0:t0
,y0:t0>
list_iz2foritm0
( xs: list(x0)
, ys: list(y0)): void//end-of-[fun]
//
#symload
z2foritm0 with list_z2foritm0 of 1000
#symload
iz2foritm0 with list_iz2foritm0 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0
,y0:t0>
<r0:t0>
list_z2folditm0
(list(x0), list(y0), r0): (r0)
fun
<x0:t0
,y0:t0>
<r0:t0>
list_iz2folditm0
(list(x0), list(y0), r0): (r0)
//
#symload
z2folditm0 with list_z2folditm0 of 1000
#symload
iz2folditm0 with list_iz2folditm0 of 1000
//
(* ****** ****** *)
//
fun
<x0:t0
,y0:t0>
<r0:t0>
list_z2foldall0
(list(x0), list(y0), r0): (r0)
fun
<x0:t0
,y0:t0>
<r0:t0>
list_iz2foldall0
(list(x0), list(y0), r0): (r0)
//
#symload
z2foldall0 with list_z2foldall0 of 1000
#symload
iz2foldall0 with list_iz2foldall0 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_VT_strm002_vt.sats] *)
