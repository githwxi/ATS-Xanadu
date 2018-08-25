(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
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
// Start Time: August, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload
SYM = "./symbol.sats"
#staload
FIX = "./fixity.sats"
//
typedef fixty = $FIX.fixty
typedef sym_t = $SYM.sym_t
//
vtypedef
fixtyopt_vt = Option_vt(fixty)
//
(* ****** ****** *)
//
#staload S0E = "./staexp0.sats"
#staload D0E = "./dynexp0.sats"
#staload S1E = "./staexp1.sats"
#staload D1E = "./dynexp1.sats"
//
(* ****** ****** *)
//
fun
the_fixtyenv_search
  (key: sym_t): fixtyopt_vt
fun
the_fixtyenv_insert
  (key: sym_t, itm: fixty): void
//
(* ****** ****** *)
//
typedef s0exp = $S0E.s0exp
typedef d0exp = $D0E.d0exp
typedef d0ecl = $D0E.d0ecl
//
typedef s1exp = $S1E.s1exp
typedef d1exp = $D1E.d1exp
typedef d1ecl = $D1E.d1ecl
//
fun s0exp_trans: s0exp -> s1exp
fun d0exp_trans: d0exp -> d1exp
fun d0ecl_trans: d0ecl -> d1ecl
//
(* ****** ****** *)

(* end of [xats_trans01.sats] *)
