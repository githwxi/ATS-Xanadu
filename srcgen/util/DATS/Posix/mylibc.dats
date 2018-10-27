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
//
#staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#staload
"libats/libc/SATS/string.sats"
//
(* ****** ****** *)
//
#staload "./../../SATS/mylibc.sats"
//
(* ****** ****** *)
//
implement
xatsopt_memcpy
(dst, src, nbyte) =
(
  $extfcall(ptr, "memcpy", dst, src, nbyte)
)
//
(* ****** ****** *)
//
implement
xatsopt_strchr(cs, c0) =
(
  $extfcall(ptr, "strchr", cs, c0)
)
implement
xatsopt_strrchr(cs, c0) =
(
  $extfcall(ptr, "strrchr", cs, c0)
)
//
(* ****** ****** *)
//
implement
xatsopt_strcmp(cs1, cs2) =
(
  $extfcall(int, "strcmp", cs1, cs2)
)
implement
xatsopt_strncmp(cs1, cs2, nlen) =
(
  $extfcall(int, "strncmp", cs1, cs2, nlen)
)
//
(* ****** ****** *)

(* end of [Posix_mylibc.dats] *)
