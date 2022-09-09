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
(*
Fri 09 Sep 2022 12:54:41 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME // namespace
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
//
#staload
SYM = "./xsymbol.sats"
#staload
MAP = "./xsymmap.sats"
#staload
LEX = "./lexing0.sats"
//
#typedef sym_t = $SYM.sym_t
#typedef token = $LEX.token
//
(* ****** ****** *)
#staload S1E = "./staexp1.sats"
#staload D1E = "./dynexp1.sats"
(* ****** ****** *)
#staload S2E = "./staexp2.sats"
#staload D2E = "./dynexp2.sats"
(* ****** ****** *)
//
#typedef sort1 = $S1E.sort1
#typedef s1exp = $S1E.s1exp
#typedef l1s1e = $S1E.l1s1e
#typedef sort2 = $S2E.sort2
#typedef s2exp = $S2E.s2exp
#typedef l2s2e = $S2E.l2s2e
//
#typedef sort1lst = $S1E.sort1lst
#typedef s1explst = $S1E.s1explst
#typedef l1s1elst = $S1E.l1s1elst
#typedef sort2lst = $S2E.sort2lst
#typedef s2explst = $S2E.s2explst
#typedef l2s2elst = $S2E.l2s2elst
//
(* ****** ****** *)
#absvtbx tr12env_vtbx
#vwtpdef tr12env = tr12env_vtbx
(* ****** ****** *)
fun
tr12env_sortenv_find
( env:
! tr12env, key: sym_t): s2texopt_vt
the_sortenv_find(tid)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_trans12.sats] *)
