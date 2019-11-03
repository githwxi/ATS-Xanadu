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
// Start Time: October, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
// HX-2019-10-30:
// level-1 intermediate representation
//
(* ****** ****** *)

#staload
D2E = "./dynexp2.sats"

(* ****** ****** *)

typedef d2con = $D2E.d2con
typedef d2cst = $D2E.d2cst
typedef d2var = $D2E.d2var

(* ****** ****** *)

abstype ir1pat_type = ptr
typedef ir1pat = ir1pat_type
typedef ir1patlst = List0(ir1pat)

(* ****** ****** *)

abstype ir1exp_type = ptr
typedef ir1exp = ir1exp_type
typedef ir1explst = List0(ir1exp)
typedef ir1expopt = Option(ir1exp)

(* ****** ****** *)

datatype
ir1exp_node =
| IR1Eint of int
| IR1Evar of d2var
| IR1Econ of d2con
| IR1Ecst of d2cst
| IR1Eapp of (ir1exp, ir1explst)

(* ****** ****** *)

(* end of [intrep1.sats] *)
