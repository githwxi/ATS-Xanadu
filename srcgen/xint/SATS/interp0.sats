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
// Start Time: November, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
// HX-2019-11-02: level-1 interpreter
//
(* ****** ****** *)

#define
XATS_targetloc
"./../../xats"

(* ****** ****** *)

#staload
D2E =
"{$XATS}/SATS/dynexp2.sats"

(* ****** ****** *)

#staload
"{$XATS}/SATS/intrep0.sats"

(* ****** ****** *)

typedef d2var = $D2E.d2var
typedef d2con = $D2E.d2con
typedef d2cst = $D2E.d2cst

(* ****** ****** *)

abstype ir0env_type = ptr
typedef ir0env = ir0env_type

(* ****** ****** *)
//
datatype
ir0val =
//
| IR0Vnil of ()
//
| IR0Vint of int
| IR0Vbtf of bool
| IR0Vchr of char
| IR0Vflt of double
| IR0Vstr of string
//
| IR0Vvar of d2var
| IR0Vcon of d2con
| IR0Vcst of d2cst
//
| IR0Vfc2 of (ir0exp, ir0env)
//
(* ****** ****** *)
//
fun
print_ir0val: print_type(ir0val)
fun
prerr_ir0val: prerr_type(ir0val)
fun
fprint_ir0val: fprint_type(ir0val)
//
overload print with print_ir0val
overload prerr with prerr_ir0val
overload fprint with fprint_ir0val
//
(* ****** ****** *)

(* end of [xint_interp0.sats] *)
