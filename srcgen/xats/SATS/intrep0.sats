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
#staload
D3E = "./dynexp3.sats"

(* ****** ****** *)

typedef d2con = $D2E.d2con
typedef d2cst = $D2E.d2cst
typedef d2var = $D2E.d2var

(* ****** ****** *)

typedef d3exp = $D3E.d3exp

(* ****** ****** *)

abstype ir0pat_type = ptr
typedef ir0pat = ir0pat_type
typedef ir0patlst = List0(ir0pat)

(* ****** ****** *)

abstype ir0dcl_type = ptr
typedef ir0dcl = ir0dcl_type
typedef ir0dclist = List0(ir0dcl)

abstype ir0exp_type = ptr
typedef ir0exp = ir0exp_type
typedef ir0explst = List0(ir0exp)
typedef ir0expopt = Option(ir0exp)

(* ****** ****** *)
//
datatype
ir0exp_node =
//
| IR0Eint of int
//
| IR0Evar of d2var
| IR0Econ of d2con
| IR0Ecst of d2cst
//
| IR0Eapp of (ir0exp, ir0explst)
//
| IR0Elet of (ir0dclist, ir0exp)
//
| IR0Enone0 of () | IR0Enone1 of d3exp
//
(* ****** ****** *)
//
fun
print_ir0exp: print_type(ir0exp)
fun
prerr_ir0exp: prerr_type(ir0exp)
fun
fprint_ir0exp: fprint_type(ir0exp)
//
overload print with print_ir0exp
overload prerr with prerr_ir0exp
overload fprint with fprint_ir0exp
//
(* ****** ****** *)

(* end of [intrep0.sats] *)
