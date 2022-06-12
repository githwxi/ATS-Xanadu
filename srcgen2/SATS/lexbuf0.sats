(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
Start Time: June 10th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
//
#absvtbx lxbf1_vtbx // ptr
#vwtpdef lxbf1 = lxbf1_vtbx
//
(* ****** ****** *)

#typedef
lxbf0_get0
( obj:vt ) = (!obj) -> sint
#typedef
lxbf0_get1
( obj:vt ) = (!obj) -> sint

(* ****** ****** *)
fun
lxbf1_get0: // get char
lxbf0_get0(lxbf1) // and stay
fun
lxbf1_get1: // get char
lxbf0_get0(lxbf1) // and incby1
(* ****** ****** *)
#symload get0 with lxbf1_get0
#symload get1 with lxbf1_get1
(* ****** ****** *)
fun
lxbf1_get_pbeg // get the
(buf: !lxbf1): postn // beg-pos
fun
lxbf1_get_pcur // get the
(buf: !lxbf1): postn // cur-pos
(* ****** ****** *)
fun
lxbf1_get_cseg // get the char
(buf: !lxbf1): list_vt(char) // seg
(* ****** ****** *)
fun
lxbf1_make_cstrx // lxbf1 bases on a
(inp: ~strx_vt(sint)): lxbf1 // stream
(* ****** ****** *)

(* end of [ATS3/XATSOPT_lexbuf0.sats] *)
