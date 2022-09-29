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
Fri 09 Sep 2022 12:54:41 PM EDT
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
//
#staload
SYM = "./xsymbol.sats"
#staload
MAP = "./xsymmap.sats"
#staload
LEX = "./lexing0.sats"
//
#typedef sym_t = $SYM.sym_t
#typedef token = $LEX.token
//
(* ****** ****** *)
#staload S1E = "./staexp1.sats"
#staload D1E = "./dynexp1.sats"
(* ****** ****** *)
#staload S2E = "./staexp2.sats"
#staload D2E = "./dynexp2.sats"
(* ****** ****** *)
#typedef sort1 = $S1E.sort1
#typedef s1exp = $S1E.s1exp
#typedef l1s1e = $S1E.l1s1e
(* ****** ****** *)
#typedef sort2 = $S2E.sort2
#typedef s2var = $S2E.s2var
#typedef s2cst = $S2E.s2cst
#typedef s2exp = $S2E.s2exp
#typedef l2s2e = $S2E.l2s2e
(* ****** ****** *)
#typedef s2itm = $S2E.s2itm
#typedef s2tex = $S2E.s2tex
(* ****** ****** *)
#typedef d1pat = $D1E.d1pat
#typedef d1exp = $D1E.d1exp
#typedef l1d1p = $D1E.l1d1p
#typedef l1d1e = $D1E.l1d1e
(* ****** ****** *)
#typedef d1ecl = $D1E.d1ecl
(* ****** ****** *)
#typedef d2pat = $D2E.d2pat
#typedef d2exp = $D2E.d2exp
#typedef l2d2p = $D2E.l2d2p
#typedef l2d2e = $D2E.l2d2e
(* ****** ****** *)
#typedef d2itm = $D2E.d2itm
(* ****** ****** *)
#typedef d2ecl = $D2E.d2ecl
(* ****** ****** *)
//
#typedef sort1lst = $S1E.sort1lst
#typedef s1explst = $S1E.s1explst
#typedef l1s1elst = $S1E.l1s1elst
#typedef sort2lst = $S2E.sort2lst
#typedef s2explst = $S2E.s2explst
#typedef l2s2elst = $S2E.l2s2elst
//
(* ****** ****** *)
//
#typedef d1patlst = $D1E.d1patlst
#typedef d1explst = $D1E.d1explst
#typedef l1d1plst = $D1E.l1d1plst
#typedef l1d1elst = $D1E.l1d1elst
#typedef d2patlst = $D2E.d2patlst
#typedef d2explst = $D2E.d2explst
#typedef l2d2plst = $D2E.l2d2plst
#typedef l2d2elst = $D2E.l2d2elst
//
(* ****** ****** *)
//
#typedef d1expopt = $D1E.d1expopt
#typedef d2expopt = $D2E.d2expopt
//
(* ****** ****** *)
//
#typedef d1eclist = $D1E.d1eclist
#typedef d2eclist = $D2E.d2eclist
//
(* ****** ****** *)
#absvtbx tr12env_vtbx
#vwtpdef tr12env = tr12env_vtbx
(* ****** ****** *)
#vwtpdef s2texopt_vt = optn_vt(s2tex)
#vwtpdef s2itmopt_vt = optn_vt(s2itm)
#vwtpdef d2itmopt_vt = optn_vt(d2itm)
(* ****** ****** *)
//
fun
tr12env_sort_find
( env:
! tr12env, sym: sym_t): s2texopt_vt
//
fun
tr12env_sexp_find
( env:
! tr12env, sym: sym_t): s2itmopt_vt
//
fun
tr12env_dexp_find
( env:
! tr12env, sym: sym_t): d2itmopt_vt
//
(* ****** ****** *)
//
fun
tr12env_sort_qfind
( env:
! tr12env
, qua:token,sym:sym_t): s2texopt_vt
//
fun
tr12env_sexp_qfind
( env:
! tr12env
, qua:token,sym:sym_t): s2itmopt_vt
//
fun
tr12env_dexp_qfind
( env:
! tr12env
, qua:token,sym:sym_t): d2itmopt_vt
//
(* ****** ****** *)
//
fun
tr12env_poplet0( env: !tr12env ): void
fun
tr12env_pshlet0( env: !tr12env ): void
fun
tr12env_pshloc1( env: !tr12env ): void
fun
tr12env_pshloc2( env: !tr12env ): void
//
fun
tr12env_locjoin( env: !tr12env ): void
//
(* ****** ****** *)
//
fun
trans12_sort1:(!tr12env, sort1)->sort2
fun
trans12_s1exp:(!tr12env, s1exp)->s2exp
fun
trans12_l1s1e:(!tr12env, l1s1e)->l2s2e
//
(* ****** ****** *)
//
fun
trans12_d1pat:(!tr12env, d1pat)->d2pat
fun
trans12_l1d1p:(!tr12env, l1d1p)->l2d2p
(* ****** ****** *)
fun
trans12_d1exp:(!tr12env, d1exp)->d2exp
fun
trans12_l1d1e:(!tr12env, l1d1e)->l2d2e
//
(* ****** ****** *)
//
fun
trans12_d1ecl:(!tr12env, d1ecl)->d2ecl
//
(* ****** ****** *)
//
fun
trans12_d1patlst:(!tr12env, d1patlst)->d2patlst
fun
trans12_l1d1plst:(!tr12env, l1d1plst)->l2d2plst
//
fun
trans12_d1explst:(!tr12env, d1explst)->d2explst
fun
trans12_l1d1elst:(!tr12env, l1d1elst)->l2d2elst
//
fun
trans12_d1expopt:(!tr12env, d1expopt)->d2expopt
//
(* ****** ****** *)
//
fun
trans12_d1ecllst:(!tr12env, d1eclist)->d2eclist
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans12.sats] *)
