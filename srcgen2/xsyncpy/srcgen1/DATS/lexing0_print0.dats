(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
Sun May 18 10:02:26 AM EDT 2025
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/lexing0.sats"
#staload
"./../../../SATS/lexing0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload
"prelude/SATS/gsyn000.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print<token>(tokn) =
g_print<tnode>(tokn.node())
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print<tnode>(tknd) =
(
//
case+ tknd of
//
|T_EOF() => prints("T_EOF()")
|T_ERR() => prints("T_ERR()")
|T_EOL() => prints("T_EOL()")
//
|T_BLANK(rep) => prints("T_BLANK(", rep, ")")
|T_CLNLT(rep) => prints("T_CLNLT(", rep, ")")
|T_DOTLT(rep) => prints("T_DOTLT(", rep, ")")
//
|T_SPCHR(rep) => prints("T_SPCHR(", rep, ")")
//
)(*case+*)//end-of-[g_print<tnode>(tknd)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_lexing0_print0.dats] *)
(***********************************************************************)
