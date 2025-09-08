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
<x0:t0>
<y0:t0>
list_z2forall
( xs: list(x0)
, ys: list(y0)): bool//end-of-[fun]
//
fun
<x0:t0>
<y0:t0>
list_z2iforall
( xs: list(x0)
, ys: list(y0)): bool//end-of-[fun]
//
#symload
z2forall with list_z2forall of 1000
#symload
z2iforall with list_z2iforall of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
list_z2forcmp
( xs: list(x0)
, ys: list(y0)): sint//end-of-[fun]
//
fun
<x0:t0>
<y0:t0>
list_z2iforcmp
( xs: list(x0)
, ys: list(y0)): sint//end-of-[fun]
//
#symload
z2forcmp with list_z2forcmp of 1000
#symload
z2iforcmp with list_z2iforcmp of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
list_z2foritm
( xs: list(x0)
, ys: list(y0)): void//end-of-[fun]
//
fun
<x0:t0>
<y0:t0>
list_z2iforitm
( xs: list(x0)
, ys: list(y0)): void//end-of-[fun]
//
#symload
z2foritm with list_z2foritm of 1000
#symload
z2iforitm with list_z2iforitm of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
<r0:t0>
list_z2folditm
(list(x0), list(y0), r0): (r0)
fun
<x0:t0>
<y0:t0>
<r0:t0>
list_z2ifolditm
(list(x0), list(y0), r0): (r0)
//
#symload
z2folditm with list_z2folditm of 1000
#symload
z2ifolditm with list_z2ifolditm of 1000
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
<r0:t0>
list_z2foldall
(list(x0), list(y0), r0): (r0)
fun
<x0:t0>
<y0:t0>
<r0:t0>
list_z2ifoldall
(list(x0), list(y0), r0): (r0)
//
#symload
z2foldall with list_z2foldall of 1000
#symload
z2ifoldall with list_z2ifoldall of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_SATS_list002.sats] *)
(***********************************************************************)
