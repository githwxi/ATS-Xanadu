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
//
(* ****** ****** *)
#typedef sym_t = $SYM.sym_t
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
#staload S1E = "./staexp1.sats"
#staload D1E = "./dynexp1.sats"
(* ****** ****** *)
#staload S2E = "./staexp2.sats"
#staload D2E = "./dynexp2.sats"
(* ****** ****** *)
#typedef sort1 = $S1E.sort1
(* ****** ****** *)
#typedef s1arg = $S1E.s1arg
#typedef s1mag = $S1E.s1mag
(* ****** ****** *)
#typedef t1arg = $S1E.t1arg
#typedef t1mag = $S1E.t1mag
(* ****** ****** *)
#typedef s1exp = $S1E.s1exp
#typedef l1s1e = $S1E.l1s1e
(* ****** ****** *)
#typedef sort2 = $S2E.sort2
(* ****** ****** *)
#typedef s2cst = $S2E.s2cst
#typedef s2var = $S2E.s2var
(* ****** ****** *)
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
#typedef sort1lst = $S1E.sort1lst
(* ****** ****** *)
#typedef s1arglst = $S1E.s1arglst
#typedef s1maglst = $S1E.s1maglst
(* ****** ****** *)
#typedef t1arglst = $S1E.t1arglst
#typedef t1maglst = $S1E.t1maglst
(* ****** ****** *)
#typedef s1explst = $S1E.s1explst
#typedef l1s1elst = $S1E.l1s1elst
(* ****** ****** *)
#typedef sort2lst = $S2E.sort2lst
(* ****** ****** *)
#typedef s2cstlst = $S2E.s2cstlst
#typedef s2varlst = $S2E.s2varlst
(* ****** ****** *)
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
#typedef d1patopt = $D1E.d1patopt
#typedef d1expopt = $D1E.d1expopt
#typedef d2patopt = $D2E.d2patopt
#typedef d2expopt = $D2E.d2expopt
//
(* ****** ****** *)
//
#typedef d1eclist = $D1E.d1eclist
#typedef d2eclist = $D2E.d2eclist
//
(* ****** ****** *)
//
#typedef d1parsed = $D1E.d1parsed
#typedef d2parsed = $D2E.d2parsed
//
(* ****** ****** *)
#typedef sort2lstlst = list(sort2lst)
#typedef s2varlstlst = list(s2varlst)
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
d2parsed_from_trans
(  dpar: d1parsed  ): d2parsed
//
(* ****** ****** *)
fun
tr12env_make_nil(): tr12env
fun
tr12env_free_top(tr12env): void
(* ****** ****** *)
//
fun
tr12env_add0_s2tex
( env:
! tr12env
, key: sym_t, itm: s2tex): void
fun
tr12env_add0_s2itm
( env:
! tr12env
, key: sym_t, itm: s2itm): void
fun
tr12env_add0_d2itm
( env:
! tr12env
, key: sym_t, itm: d2itm): void
//
(* ****** ****** *)
//
fun
tr12env_find_s2tex
( env:
! tr12env, sym: sym_t): s2texopt_vt
//
fun
tr12env_find_s2itm
( env:
! tr12env, sym: sym_t): s2itmopt_vt
//
fun
tr12env_find_d2itm
( env:
! tr12env, sym: sym_t): d2itmopt_vt
//
(* ****** ****** *)
//
fun
tr12env_qfind_s2tex
( env:
! tr12env
, qua:token,sym:sym_t): s2texopt_vt
//
fun
tr12env_qfind_s2itm
( env:
! tr12env
, qua:token,sym:sym_t): s2itmopt_vt
//
fun
tr12env_qfind_d2itm
( env:
! tr12env
, qua:token,sym:sym_t): d2itmopt_vt
//
(* ****** ****** *)
//
fun
tr12env_poplam0(env: !tr12env): void
fun
tr12env_pshlam0(env: !tr12env): void
//
(* ****** ****** *)
//
fun
tr12env_poplet0(env: !tr12env): void
fun
tr12env_pshlet0(env: !tr12env): void
fun
tr12env_pshloc1(env: !tr12env): void
fun
tr12env_pshloc2(env: !tr12env): void
//
fun
tr12env_locjoin(env: !tr12env): void
//
(* ****** ****** *)
fun // HX: it does accumulative
tr12env_add0_s2cst_all // insertion
( env0: !tr12env, s2c0: s2cst ): void
(* ****** ****** *)
fun
tr12env_add0_s2var_one
( env0: !tr12env, s2v0: s2var ): void
fun
tr12env_add0_s2varlst_one
( env0: !tr12env, s2vs: s2varlst ): void
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
list_trans12_fnp
( e1:
! tr12env
, xs: list(x0)
, (!tr12env, x0) -> y0): list(y0)
fun
<x0:t0>
<y0:t0>
optn_trans12_fnp
( e1:
! tr12env
, xs: optn(x0)
, (!tr12env, x0) -> y0): optn(y0)
//
(* ****** ****** *)
//
fun
trans12_sort1:
(!tr12env, sort1)->sort2
//
(* ****** ****** *)
fun
trans12_s1arg:
(!tr12env, s1arg)->s2var
fun
trans12_s1mag:
(!tr12env, s1mag)->s2varlst
(* ****** ****** *)
fun
trans12_t1arg:
(!tr12env, t1arg)->sort2
fun
trans12_t1mag:
(!tr12env, t1mag)->sort2lst
(* ****** ****** *)
//
fun
trans12_s1exp:
(!tr12env, s1exp)->s2exp
fun
trans12_l1s1e:
(!tr12env, l1s1e)->l2s2e
//
(* ****** ****** *)
//
fun
trans12_s1exp_sort
( env0:
! tr12env
, s1e1: s1exp,s2t2: sort2): s2exp
//
(* ****** ****** *)
//
fun
trans12_sort1lst
( env0:
! tr12env, s1ts: sort1lst): sort2lst
//
(* ****** ****** *)
fun
trans12_s1arglst
( env0:
! tr12env, s1as: s1arglst): s2varlst
fun
trans12_s1maglst
( env0:
! tr12env, smas: s1maglst): s2varlstlst
(* ****** ****** *)
fun
trans12_t1arglst
( env0:
! tr12env, t1as: t1arglst): sort2lst
fun
trans12_t1maglst
( env0:
! tr12env, tmas: t1maglst): sort2lstlst
(* ****** ****** *)
//
fun
trans12_s1explst
( env0:
! tr12env, s1es: s1explst): s2explst
//
(* ****** ****** *)
fun
trans12_s1explst_impr
( env0:
! tr12env, s1es: s1explst): s2explst
fun
trans12_s1explst_prgm
( env0:
! tr12env, s1es: s1explst): s2explst
(* ****** ****** *)
fun
trans12_l1s1elst_impr
( env0:
! tr12env, lses: l1s1elst): l2s2elst
fun
trans12_l1s1elst_prgm
( env0:
! tr12env, lses: l1s1elst): l2s2elst
(* ****** ****** *)
fun
trans12_s1explst_sort
(!tr12env, s1explst, sort2): s2explst
fun
trans12_s1explst_sortlst
(!tr12env, s1explst, sort2lst): s2explst
//
(* ****** ****** *)
//
fun
trans12_d1pat
(env0: !tr12env, d1p0: d1pat): d2pat
fun
trans12_l1d1p
(env0: !tr12env, ld1p: l1d1p): l2d2p
//
(* ****** ****** *)
//
fun
trans12_d1exp
(env0: !tr12env, d1e0: d1exp): d2exp
fun
trans12_l1d1e
(env0: !tr12env, ld1e: l1d1e): l2d2e
//
(* ****** ****** *)
fun
trans12_d1expseq
( env0:
! tr12env
, loc0: loc_t, d1es: d1explst): d2exp
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
trans12_d1patopt:(!tr12env, d1patopt)->d2patopt
//
(* ****** ****** *)
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
trans12_d1eclist:(!tr12env, d1eclist)->d2eclist
//
(* ****** ****** *)
//
#typedef d1eclistopt = optn(d1eclist)
#typedef d2eclistopt = optn(d2eclist)
//
fun
trans12_d1eclistopt:(!tr12env, d1eclistopt)->d2eclistopt
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans12.sats] *)
