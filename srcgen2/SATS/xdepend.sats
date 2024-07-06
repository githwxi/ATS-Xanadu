(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
HX-2024-07-05:
For gathering dependency info!
*)
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Fri 05 Jul 2024 09:18:43 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
//
#absvtbx xd2penv_vtbx
#vwtpdef xd2penv = xd2penv_vtbx
//
(* ****** ****** *)
//
#staload D2E = "./dynexp2.sats"
//
(* ****** ****** *)
//
#typedef d2exp = $D2E.d2exp
#typedef d2ecl = $D2E.d2ecl
//
#typedef d2explst = $D2E.d2explst
#typedef d2eclist = $D2E.d2eclist
//
#typedef d2parsed = $D2E.d2parsed
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
xd2penv_d2exp
( env0:
! xd2penv, d2e0: d2exp): void
//
(* ****** ****** *)
//
fun
xd2penv_d2explst
( env0:
! xd2penv, d2es: d2explst): void
//
(* ****** ****** *)
//
fun
xd2penv_d2eclist
( env0:
! xd2penv, dcls: d2eclist): void
//
(* ****** ****** *)
//
fun
xd2pend_d2parsed(dpar: d2parsed): d2eclist
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_SATS_xdepend.sats] *)
