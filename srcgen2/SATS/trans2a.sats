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
Sat 19 Nov 2022 01:54:56 PM EST
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
(*
HX-2022-11-19: pre-type-inference
The main purpose of this translation
is for resolving overloaded symbols!
*)
(* ****** ****** *)
#absvtbx
tr2aenv_vtbx
#vwtpdef
tr2aenv = tr2aenv_vtbx
(* ****** ****** *)
//
#staload
LAB = "./xlabel0.sats"
#staload
LOC = "./locinfo.sats"
#staload
LEX = "./lexing0.sats"
//
#typedef lab_t = $LAB.lab_t
#typedef loc_t = $LOC.loc_t
#typedef token = $LEX.token
//
(* ****** ****** *)
#staload S2E = "./staexp2.sats"
#staload S2T = "./statyp2.sats"
#staload D2E = "./dynexp2.sats"
(* ****** ****** *)
#typedef s2exp = $S2T.s2exp
#typedef s2typ = $S2T.s2typ
(* ****** ****** *)
#typedef d2pat = $D2E.d2pat
#typedef d2exp = $D2E.d2exp
(* ****** ****** *)
#typedef d2patlst = $D2E.d2patlst
#typedef d2explst = $D2E.d2explst
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
list_trans2a_fnp
( e1:
! tr2aenv
, xs: list(x0)
, (!tr2aenv, x0) -> y0): list(y0)
fun
<x0:t0>
<y0:t0>
optn_trans2a_fnp
( e1:
! tr2aenv
, xs: optn(x0)
, (!tr2aenv, x0) -> y0): optn(y0)
//
(* ****** ****** *)
//
fun
trans2a_d2pat
(env0:
!tr2aenv, d2p0: d2pat): d2pat
fun
trans2a_d2exp
(env0:
!tr2aenv, d2e0: d2exp): d2exp
//
(* ****** ****** *)
//
fun
trans2a_d2patlst
( env0:
! tr2aenv, d2ps: d2patlst): d2patlst
//
(* ****** ****** *)
//
fun
trans2a_d2expopt
( env0:
! tr2aenv, dopt: d2expopt): d2expopt
//
fun
trans2a_d2explst
( env0:
! tr2aenv, d2es: d2explst): d2explst
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans2a.sats] *)
