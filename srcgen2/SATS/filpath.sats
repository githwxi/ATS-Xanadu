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
// Author: Hongwei Xi
// Start Time: May 28th, 2022
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
typedef int0 = sint
typedef btf0 = book
typedef chr0 = char
typedef str0 = string
(* ****** ****** *)
//
fun theDirSep_get(): char
fun theCurDir_get(): str0
fun theParDir_get(): str0
//
(* ****** ****** *)
//
fun
fpath_normq(fp: str0): bool
fun
fpath_normize(fp: str0): str0
//
(* ****** ****** *)
//
#abstbox fpath_tbox // ptr
//
#typedef fpath = fpath_tbox
#typedef fpathlst = list(fpath)
#typedef fpathopt = optn(fpath)
//
(* ****** ****** *)

(* end of [xatsopt_filpath.sats] *)
