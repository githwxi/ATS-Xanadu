(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
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
//
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

#staload "./../../SATS/cblist.sats"
#staload "./../../SATS/Posix/cblist.sats"

(* ****** ****** *)

implement
{}(*tmp*)
fpath_get_cblist(path) = let
//
val
opt =
fileref_open_opt(path, file_mode_r)
//
in
  case+ opt of
  | ~None_vt() => None_vt(*void*)
  | ~Some_vt(filp) => fileref_get_cblist(filp)
//
end // end of [fpath_get_cblist]

(* ****** ****** *)

implement
{}(*tmp*)
fpath_get_cblist_vt(path) = let
//
val
opt =
fileref_open_opt(path, file_mode_r)
//
in
  case+ opt of
  | ~None_vt() => None_vt(*void*)
  | ~Some_vt(filp) => fileref_get_cblist_vt(filp)
//
end // end of [fpath_get_cblist_vt]

(* ****** ****** *)
//
implement
fileref_get_cblist(inp) =
(
  $UN.castvwtp0(fileref_get_cblist_vt(inp))
)
//
(* ****** ****** *)

(* end of [Posix_cblist.sats] *)
