(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2021 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: May 21st, 2021
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload "./xlabel0.sats"
#staload "./locinfo.sats"

(* ****** ****** *)
#staload S2E = "./staexp2.sats"
(* ****** ****** *)
#staload D4E = "./dynexp4.sats"
(* ****** ****** *)
typedef s2var = $S2E.s2var
(* ****** ****** *)
typedef d4exp = $D4E.d4exp
(* ****** ****** *)
#staload C1S = "./cstrnt1.sats"
(* ****** ****** *)
typedef c1itm = $C1S.c1itm
typedef c1itmlst = $C1S.c1itmlst
(* ****** ****** *)
//
absvtype
tr4cenv_vtype = ptr
vtypedef
tr4cenv = tr4cenv_vtype
//
(* ****** ****** *)
//
fun
tr4cenv_add_fun0
  ( env0: !tr4cenv ) : void
fun
tr4cenv_pop_fun0
  ( env0: !tr4cenv ) : void
//
(* ****** ****** *)
fun
tr4cenv_add_svar
( env0:
! tr4cenv, s2v0: s2var): void
(* ****** ****** *)
fun
tr4cenv_add_citm
( env0:
! tr4cenv, itm0: c1itm): void
(* ****** ****** *)
//
fun
trans4c_dpat
( env0:
! tr4cenv, d4e0: d4exp): void
//
(* ****** ****** *)
//
fun
trans4c_dexp
( env0:
! tr4cenv, d4e0: d4exp): void
//
(* ****** ****** *)

(* end of [trans4c.sats] *)
