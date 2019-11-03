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
"{$XATS}/SATS/intrep1.sats"

(* ****** ****** *)

typedef d2var = $D2E.d2var
typedef d2con = $D2E.d2con
typedef d2cst = $D2E.d2cst

(* ****** ****** *)

abstype irenv_type = ptr
typedef irenv = irenv_type

(* ****** ****** *)
//
datatype
irval =
//
| IRVnil of ()
//
| IRVint of int
| IRVbtf of bool
| IRVchr of char
| IRVflt of double
| IRVstr of string
//
| IRVvar of d2var
| IRVcon of d2con
| IRVcst of d2cst
//
| IRVfc2 of (ir1exp, irenv)
//
(* ****** ****** *)
//
fun
print_irval: print_type(irval)
fun
prerr_irval: prerr_type(irval)
fun
fprint_irval: fprint_type(irval)
//
(* ****** ****** *)

(* end of [xint_interp1.sats] *)
