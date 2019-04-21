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
// Start Time: May, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload
SYM = "./symbol.sats"
//
(* ****** ****** *)

#staload "./filpath.sats"

(* ****** ****** *)
//
datatype fname =
  | FNM0 of (string)
//
typedef
fnameopt = Option(fname)
vtypedef
fnameopt_vt = Option_vt(fname)
//
(* ****** ****** *)

fun
print_fname : print_type(fname)
fun
prerr_fname : prerr_type(fname)
fun
fprint_fname : fprint_type(fname)

(* ****** ****** *)

fun
filsrch_absolut
(base: string): Option_vt(filpath)
fun
filsrch_current
(base: string): Option_vt(filpath)
fun
filsrch_includes
(base: string): Option_vt(filpath)

(* ****** ****** *)

fun
filsrch_combined
(fnm0: fname): Option_vt(filpath)

(* ****** ****** *)
//
fun
filsrch_dirbase
( dir: dirpath
, base: string): Option_vt(filpath)
fun
filsrch_dirsbase
( dirs
: List(dirpath)
, base: string): Option_vt(filpath)
//
(* ****** ****** *)

(* end of [xats_filsrch.sats] *)
