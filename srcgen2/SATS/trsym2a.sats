(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
Sat 11 Feb 2023 05:06:27 PM EST
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
HX-2023-02-12: pre-type-inference
The main purpose of this translation
is for resolving overloaded symbols!
This one is a continuation of [trans2a]
*)
(* ****** ****** *)
#staload
BAS = "./xbasics.sats"
#typedef
f2clknd = $BAS.f2clknd
(* ****** ****** *)
//
#staload
LAB = "./xlabel0.sats"
#staload
LOC = "./locinfo.sats"
#staload
SYM = "./xsymbol.sats"
#staload
LEX = "./lexing0.sats"
//
#typedef lab_t = $LAB.lab_t
#typedef loc_t = $LOC.loc_t
#typedef sym_t = $SYM.sym_t
#typedef token = $LEX.token
//
(* ****** ****** *)
#staload S2E = "./staexp2.sats"
#staload T2P = "./statyp2.sats"
#staload D2E = "./dynexp2.sats"
(* ****** ****** *)
//
fun
trsym2a_d2pat
( env0:
! tr2aenv, d2p0: d2pat): void
//
fun
trsym2a_d2exp
( env0:
! tr2aenv, d2e0: d2exp): void
//
(* ****** ****** *)
//
fun
trsym2a_l2d2p
( env0:
! tr2aenv, ld2p: l2d2p): void
//
fun
trsym2a_l2d2e
( env0:
! tr2aenv, ld2e: l2d2e): void
//
(* ****** ****** *)
//
fun
trsym2a_f2arg
( env0:
! tr2aenv, f2a0: f2arg): void
//
(* ****** ****** *)
//
fun
trans2a_d2gua
(env0: !tr2aenv, dgua: d2gua): void
fun
trans2a_d2gpt
(env0: !tr2aenv, dgpt: d2gpt): void
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trsym2a.sats] *)
