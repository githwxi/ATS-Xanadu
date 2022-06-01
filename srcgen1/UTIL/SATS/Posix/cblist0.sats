(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author: Hongwei Xi
// Start Time: April, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt"
(* ****** ****** *)

#staload "./../cblist0.sats"

(* ****** ****** *)
//
fun{}
fpath_get_cblist
  (inp: string, bsz: Size): Option_vt(cblist)
fun{}
fpath_get_cblist_vt
  (inp: string, bsz: Size): Option_vt(cblist_vt)
//
(* ****** ****** *)
//
fun//{}
fileref_get_cblist
  (inp: FILEref, bsz: Size): Option_vt(cblist)
fun//{}
fileref_get_cblist_vt
  (inp: FILEref, bsz: Size): Option_vt(cblist_vt)
//
(* ****** ****** *)

(* end of [XATSOPT_UTIL_Posix_cblist0.sats] *)
