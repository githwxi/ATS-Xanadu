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
// For defining
// various system-wise parameters
//
(* ****** ****** *)
(*
** HX-2020-07-08:
** proposed by Richard Kent:
*)
#ifndef
XATSOPT_DEBUG_INFO
#define
XATSOPT_DEBUG_INFO

#define
__XATSOPT_DEBUG__ 1

#endif(*XATSOPT_DEBUG_INFO*)
(* ****** ****** *)
//
#define SYSTEM_IS_POSIX_LIKE 1
#define SYSTEM_IS_WINDOWS_LIKE 0
//
(* ****** ****** *)

(* end of [xatsopt.hats] *)
