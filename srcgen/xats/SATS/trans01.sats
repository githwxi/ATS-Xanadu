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
typedef sort0 = $S0E.sort0
typedef sort0opt = $S0E.sort0opt
typedef sort0lst = $S0E.sort0lst
//
typedef s0arg = $S0E.s0arg
//
typedef s0exp = $S0E.s0exp
typedef d0exp = $D0E.d0exp
typedef d0ecl = $D0E.d0ecl
typedef s0expopt = $S0E.s0expopt
typedef s0explst = $S0E.s0explst
typedef d0expopt = $D0E.d0expopt
typedef d0explst = $D0E.d0explst
typedef d0eclopt = $D0E.d0eclopt
typedef d0eclist = $D0E.d0eclist
//
typedef sort1 = $S1E.sort1
typedef sort1opt = $S1E.sort1opt
typedef sort1lst = $S1E.sort1lst
//
typedef s1arg = $S1E.s1arg
//
typedef s1exp = $S1E.s1exp
typedef d1exp = $D1E.d1exp
typedef d1ecl = $D1E.d1ecl
typedef s1expopt = $S1E.s1expopt
typedef s1explst = $S1E.s1explst
typedef d1expopt = $D1E.d1expopt
typedef d1explst = $D1E.d1explst
typedef d1eclopt = $D1E.d1eclopt
typedef d1eclist = $D1E.d1eclist
//
fun sort0_trans: sort0 -> sort1
//
fun s0arg_trans: s0arg -> s1arg
//
fun s0exp_trans: s0exp -> s1exp
fun d0exp_trans: d0exp -> d1exp
fun d0ecl_trans: d0ecl -> d1ecl
//
fun sort0opt_trans: sort0opt -> sort1opt
fun sort0lst_trans: sort0lst -> sort1lst
//
fun s0explst_trans: s0explst -> s1explst
fun d0explst_trans: d0explst -> d1explst
fun d0eclist_trans: d0eclist -> d1eclist
//
(* ****** ****** *)

(* end of [xats_trans01.sats] *)
