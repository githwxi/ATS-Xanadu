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
#staload
LOC = "./locinfo.sats"
(* ****** ****** *)
#typedef pos_t = $LOC.pos_t
#typedef loc_t = $LOC.loc_t
(* ****** ****** *)
//
#absvtbx lxbf1_vtbx // ptr
#vwtpdef lxbf1 = lxbf1_vtbx
//
(* ****** ****** *)
//
#absvtbx lxbf2_vtbx // ptr
#vwtpdef lxbf2 = lxbf2_vtbx
//
(* ****** ****** *)

#typedef
lxbf0_getc0
( obj:vt ) = (!obj) -> sint
#typedef
lxbf0_getc1
( obj:vt ) = (!obj) -> sint

(* ****** ****** *)
fun
lxbf1_getc0: // get char
lxbf0_getc0(lxbf1) // and stay
fun
lxbf1_getc1: // get char
lxbf0_getc1(lxbf1) // and incby1
(* ****** ****** *)
#symload getc0 with lxbf1_getc0
#symload getc1 with lxbf1_getc1
(* ****** ****** *)
fun
lxbf1_unget // undo [getc1]
(buf: !lxbf1, ci0: sint): sint
(* ****** ****** *)
#symload unget with lxbf1_unget
(* ****** ****** *)
fun
lxbf1_take_clst // get the char
(buf: !lxbf1): list_vt(char) // seg
(* ****** ****** *)
#symload tclst with lxbf1_take_clst
(* ****** ****** *)
fun
lxbf1_make_strn
(src: strn(*text*)): lxbf1
fun
lxbf1_make_fpath
(src: strn(*path*)): lxbf1
fun
lxbf1_make_cstrm // lxbf1 bases on a
(inp: ~strm_vt(char)): lxbf1 // stream
fun
lxbf1_make_cstrx // lxbf1 bases on a
(inp: ~strx_vt(sint)): lxbf1 // stream
(* ****** ****** *)
//
(*
HX-2022-06-12:
[lxbf2] contains position info
*)
//
(* ****** ****** *)
fun
lxbf2_getc0: // get char
lxbf0_getc0(lxbf2) // and stay
fun
lxbf2_getc1: // get char
lxbf0_getc1(lxbf2) // and incby1
(* ****** ****** *)
#symload getc0 with lxbf2_getc0
#symload getc1 with lxbf2_getc1
(* ****** ****** *)
fun
lxbf2_unget // it undoes
(buf: !lxbf2): sint // 1 getc1-op
(* ****** ****** *)
#symload unget with lxbf2_unget
(* ****** ****** *)
fun
lxbf2_copy_pbeg // get the
(buf: !lxbf2): pos_t // beg-postn
fun
lxbf2_copy_pcur // get the
(buf: !lxbf2): pos_t // cur-postn
(* ****** ****** *)
fun
lxbf2_take_clst // get the char
(buf: !lxbf2): list_vt(char) // seg
(* ****** ****** *)
#symload cpbeg with lxbf2_copy_pbeg
#symload cpcur with lxbf2_copy_pcur
#symload tclst with lxbf2_take_clst
(* ****** ****** *)
fun
lxbf2_make_strn
(src: strn(*text*)): lxbf2
fun
lxbf2_make_cstrx // lxbf2 bases on a
(inp: ~strx_vt(sint)): lxbf2 // stream
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_lexbuf0.sats] *)
