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
#absvtbx
tr12env_vtbx
#vwtpdef
tr12env = tr12env_vtbx
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
#staload G1M = "./gmacro1.sats"
(* ****** ****** *)
#staload S2E = "./staexp2.sats"
#staload D2E = "./dynexp2.sats"
(* ****** ****** *)
#typedef g1exp = $S1E.g1exp
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
#typedef d1tcn = $S1E.d1tcn
#typedef d1typ = $S1E.d1typ
(* ****** ****** *)
#typedef g1mac = $G1M.g1mac
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
#typedef f2env = $S2E.f2env
(* ****** ****** *)
#typedef q1arg = $D1E.q1arg
#typedef s1qag = $D1E.s1qag
#typedef t1qag = $D1E.t1qag
#typedef t1iag = $D1E.t1iag
(* ****** ****** *)
#typedef d1pid = $D1E.d1pid
#typedef d1pat = $D1E.d1pat
#typedef d1exp = $D1E.d1exp
#typedef l1d1p = $D1E.l1d1p
#typedef l1d1e = $D1E.l1d1e
(* ****** ****** *)
#typedef f1arg = $D1E.f1arg
#typedef d1gua = $D1E.d1gua
#typedef d1gpt = $D1E.d1gpt
#typedef d1cls = $D1E.d1cls
(* ****** ****** *)
#typedef s1eff = $D1E.s1eff
#typedef s1res = $D1E.s1res
(* ****** ****** *)
#typedef d1ecl = $D1E.d1ecl
(* ****** ****** *)
#typedef a1tdf = $D1E.a1tdf
(* ****** ****** *)
#typedef d1arg = $D1E.d1arg
(* ****** ****** *)
#typedef d2con = $D2E.d2con
#typedef d2cst = $D2E.d2cst
#typedef d2var = $D2E.d2var
(* ****** ****** *)
#typedef s2qag = $D2E.s2qag
#typedef t2qag = $D2E.t2qag
#typedef t2iag = $D2E.t2iag
(* ****** ****** *)
#typedef d2pat = $D2E.d2pat
#typedef d2exp = $D2E.d2exp
#typedef l2d2p = $D2E.l2d2p
#typedef l2d2e = $D2E.l2d2e
(* ****** ****** *)
#typedef f2arg = $D2E.f2arg
#typedef d2gua = $D2E.d2gua
#typedef d2gpt = $D2E.d2gpt
#typedef d2cls = $D2E.d2cls
(* ****** ****** *)
#typedef s2eff = $D2E.s2eff
#typedef s2res = $D2E.s2res
(* ****** ****** *)
#typedef d2itm = $D2E.d2itm
(* ****** ****** *)
#typedef d2ecl = $D2E.d2ecl
(* ****** ****** *)
#typedef a2tdf = $D2E.a2tdf
(* ****** ****** *)
#typedef d2arg = $D2E.d2arg
(* ****** ****** *)
#typedef wths1exp = $D1E.wths1exp
#typedef wths2exp = $D2E.wths2exp
(* ****** ****** *)
#typedef teqd1exp = $D1E.teqd1exp
#typedef teqd2exp = $D2E.teqd2exp
(* ****** ****** *)
#typedef g1maclst = $G1M.g1maclst
(* ****** ****** *)
#typedef sort1lst = $S1E.sort1lst
#typedef sort1opt = $S1E.sort1opt
(* ****** ****** *)
#typedef s1arglst = $S1E.s1arglst
#typedef s1maglst = $S1E.s1maglst
(* ****** ****** *)
#typedef t1arglst = $S1E.t1arglst
#typedef t1maglst = $S1E.t1maglst
(* ****** ****** *)
#typedef s1qualst = $S1E.s1qualst
(* ****** ****** *)
#typedef s1explst = $S1E.s1explst
#typedef l1s1elst = $S1E.l1s1elst
(* ****** ****** *)
#typedef s1expopt = $S1E.s1expopt
(* ****** ****** *)
#typedef d1tcnlst = $S1E.d1tcnlst
#typedef d1typlst = $S1E.d1typlst
(* ****** ****** *)
#typedef sort2lst = $S2E.sort2lst
#typedef sort2opt = $S2E.sort2opt
(* ****** ****** *)
#typedef s2cstlst = $S2E.s2cstlst
#typedef s2varlst = $S2E.s2varlst
#typedef s2explst = $S2E.s2explst
#typedef l2s2elst = $S2E.l2s2elst
(* ****** ****** *)
#typedef s2cstopt = $S2E.s2cstopt
#typedef s2varopt = $S2E.s2varopt
#typedef s2expopt = $S2E.s2expopt
(* ****** ****** *)
#typedef f2envlst = $S2E.f2envlst
(* ****** ****** *)
#typedef q1arglst = $D1E.q1arglst
#typedef s1qaglst = $D1E.s1qaglst
#typedef t1qaglst = $D1E.t1qaglst
#typedef t1iaglst = $D1E.t1iaglst
(* ****** ****** *)
//
#typedef d1pidopt = $D1E.d1pidopt
//
(* ****** ****** *)
#typedef d1patlst = $D1E.d1patlst
#typedef l1d1plst = $D1E.l1d1plst
#typedef d1patopt = $D1E.d1patopt
(* ****** ****** *)
#typedef d1explst = $D1E.d1explst
#typedef l1d1elst = $D1E.l1d1elst
#typedef d1expopt = $D1E.d1expopt
(* ****** ****** *)
#typedef d1gualst = $D1E.d1gualst
#typedef d1clslst = $D1E.d1clslst
(* ****** ****** *)
//
#typedef d2conlst = $D2E.d2conlst
#typedef d2cstlst = $D2E.d2cstlst
#typedef d2varlst = $D2E.d2varlst
//
(* ****** ****** *)
//
#typedef d2conopt = $D2E.d2conopt
#typedef d2cstopt = $D2E.d2cstopt
#typedef d2varopt = $D2E.d2varopt
//
(* ****** ****** *)
#typedef s2qaglst = $D2E.s2qaglst
#typedef t2qaglst = $D2E.t2qaglst
#typedef t2iaglst = $D2E.t2iaglst
(* ****** ****** *)
//
#typedef d2patlst = $D2E.d2patlst
#typedef d2explst = $D2E.d2explst
#typedef l2d2plst = $D2E.l2d2plst
#typedef l2d2elst = $D2E.l2d2elst
//
(* ****** ****** *)
//
#typedef d2patopt = $D2E.d2patopt
#typedef d2expopt = $D2E.d2expopt
//
(* ****** ****** *)
#typedef f1arglst = $D1E.f1arglst
#typedef f2arglst = $D2E.f2arglst
(* ****** ****** *)
#typedef d2gualst = $D2E.d2gualst
#typedef d2clslst = $D2E.d2clslst
(* ****** ****** *)
//
#typedef d1eclist = $D1E.d1eclist
#typedef d2eclist = $D2E.d2eclist
//
(* ****** ****** *)
#typedef d1arglst = $D1E.d1arglst
#typedef d2arglst = $D2E.d2arglst
(* ****** ****** *)
//
#typedef d2topenv = $D2E.d2topenv
//
#typedef d1parsed = $D1E.d1parsed
#typedef d2parsed = $D2E.d2parsed
//
(* ****** ****** *)
#typedef d1valdcl = $D1E.d1valdcl
#typedef d1vardcl = $D1E.d1vardcl
#typedef d1fundcl = $D1E.d1fundcl
#typedef d1cstdcl = $D1E.d1cstdcl
(* ****** ****** *)
#typedef d2valdcl = $D2E.d2valdcl
#typedef d2vardcl = $D2E.d2vardcl
#typedef d2fundcl = $D2E.d2fundcl
#typedef d2cstdcl = $D2E.d2cstdcl
(* ****** ****** *)
#typedef d1valdclist = list(d1valdcl)
#typedef d1vardclist = list(d1vardcl)
#typedef d1fundclist = list(d1fundcl)
#typedef d1cstdclist = list(d1cstdcl)
(* ****** ****** *)
#typedef d2valdclist = list(d2valdcl)
#typedef d2vardclist = list(d2vardcl)
#typedef d2fundclist = list(d2fundcl)
#typedef d2cstdclist = list(d2cstdcl)
(* ****** ****** *)
#typedef d1explstopt = optn(d1explst)
#typedef d2explstopt = optn(d2explst)
(* ****** ****** *)
#typedef d1eclistopt = optn(d1eclist)
#typedef d2eclistopt = optn(d2eclist)
(* ****** ****** *)
#vwtpdef s2varopt_vt = optn_vt(s2var)
#vwtpdef s2cstopt_vt = optn_vt(s2cst)
(* ****** ****** *)
#typedef sort2lstlst = list(sort2lst)
#typedef s2varlstlst = list(s2varlst)
(* ****** ****** *)
#vwtpdef g1macopt_vt = optn_vt(g1mac)
#vwtpdef s2texopt_vt = optn_vt(s2tex)
#vwtpdef s2itmopt_vt = optn_vt(s2itm)
#vwtpdef d2itmopt_vt = optn_vt(d2itm)
(* ****** ****** *)
//
fun
s1exp_get_s2cstlst
( env0:
! tr12env
, s1e0: s1exp): s2cstlst
//
(* ****** ****** *)
//
fun
g1exp_nmspace
(g1e0: g1exp): optn(sym_t)
//
(* ****** ****** *)
//
fun
s2cst_select_any
(s2cs: s2cstlst): s2cstopt_vt
//
(* ****** ****** *)
//
fun
s2cst_select_bin
( s2cs
: s2cstlst
, sort2, sort2 ): s2cstopt_vt
fun
s2cst_select_list
( s2cs: s2cstlst,
  s2es: s2explst): s2cstopt_vt
//
(* ****** ****** *)
//
fun
s2cst_selects_bin
( s2cs
: s2cstlst
, sort2, sort2 ): ( s2cstlst )
fun
s2cst_selects_list
( s2cs: s2cstlst,
  s2es: s2explst): ( s2cstlst )
//
(* ****** ****** *)
//
fun
d2parsed_of_trans12
( dpar : d1parsed ): (d2parsed)
//
(* ****** ****** *)
//
fun
tr12env_make_nil
  ( (*void*) ) : tr12env
fun
tr12env_free_top
( env0 : tr12env ) : (d2topenv)
//
(* ****** ****** *)
//
fun
tr12env_add0_g1mac
( env0:
! tr12env
, key: sym_t, itm: g1mac): void
//
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
fun
tr12env_add1_f2env
( env0:
! tr12env
, gsym: sym_t, fenv: f2env): void
(* ****** ****** *)
//
fun
f2envlst_find_g1mac
(f2envlst, key:sym_t): g1macopt_vt
//
fun
f2envlst_find_s2tex
(f2envlst, key:sym_t): s2texopt_vt
fun
f2envlst_find_s2itm
(f2envlst, key:sym_t): s2itmopt_vt
fun
f2envlst_find_d2itm
(f2envlst, key:sym_t): d2itmopt_vt
//
(* ****** ****** *)
//
fun
tr12env_find_g1mac
( env:
! tr12env, key:sym_t): g1macopt_vt
//
fun
tr12env_find_s2tex
( env:
! tr12env, key:sym_t): s2texopt_vt
//
fun
tr12env_find_s2env
( env:
! tr12env, key:sym_t): s2itmopt_vt
fun
tr12env_find_s2qua
( env:
! tr12env, key:sym_t): s2itmopt_vt
//
fun
tr12env_find_s2itm
( env:
! tr12env, key:sym_t): s2itmopt_vt
//
fun
tr12env_find_d2itm
( env:
! tr12env, key:sym_t): d2itmopt_vt
//
(* ****** ****** *)
//
fun
tr12env_ofind_g1mac
( env:
! tr12env, key:sym_t): g1macopt_vt
//
fun
tr12env_ofind_s2tex
( env:
! tr12env, key:sym_t): s2texopt_vt
fun
tr12env_ofind_s2itm
( env:
! tr12env, key:sym_t): s2itmopt_vt
fun
tr12env_ofind_d2itm
( env:
! tr12env, key:sym_t): d2itmopt_vt
//
(* ****** ****** *)
//
fun
tr12env_qfind_s2tex
( env:
! tr12env
, qua:token,key:sym_t): s2texopt_vt
//
fun
tr12env_qfind_s2itm
( env:
! tr12env
, qua:token,key:sym_t): s2itmopt_vt
//
fun
tr12env_qfind_d2itm
( env:
! tr12env
, qua:token,key:sym_t): d2itmopt_vt
//
(* ****** ****** *)
//
fun
tr12env_pshlam0(env: !tr12env): void
fun
tr12env_poplam0(env: !tr12env): void
//
(* ****** ****** *)
//
fun
tr12env_pshlet0(env: !tr12env): void
fun
tr12env_poplet0(env: !tr12env): void
//
fun
tr12env_pshloc1(env: !tr12env): void
fun
tr12env_pshloc2(env: !tr12env): void
fun
tr12env_locjoin(env: !tr12env): void
//
(* ****** ****** *)
fun // HX: it does accumulative
tr12env_add1_s2cst // insertion
(env0: !tr12env , s2c0: s2cst): void
(* ****** ****** *)
fun // HX: insertion is not
tr12env_add0_s2var // accumulative
(env0: !tr12env , s2v0: s2var): void
fun // HX: insertion is not
tr12env_add0_s2qag // accumulative
(env0: !tr12env , sqa0: s2qag): void
fun // HX: insertion is not
tr12env_add0_t2qag // accumulative
(env0: !tr12env , tqa0: t2qag): void
(* ****** ****** *)
fun // HX: insertion is done
tr12env_add1_d2con // accumulatively
(env0: !tr12env , d2c0: d2con): void
fun // HX: insertion is done
tr12env_add1_d2cst // accumulatively
(env0: !tr12env , d2c0: d2cst): void
(* ****** ****** *)
fun
tr12env_add0_d2var
(env0: !tr12env , d2v0: d2var): void
fun
tr12env_add0_d2pat
(env0: !tr12env , d2p0: d2pat): void
fun
tr12env_add0_f2arg
(env0: !tr12env , f2a0: f2arg): void
fun
tr12env_add0_d2gpt
(env0: !tr12env , dgpt: d2gpt): void
(* ****** ****** *)
fun
tr12env_add0_s2varlst
(env0: !tr12env, s2vs: s2varlst): void
fun
tr12env_add0_s2qaglst
(env0: !tr12env, sqas: s2qaglst): void
fun
tr12env_add0_t2qaglst
(env0: !tr12env, tqas: t2qaglst): void
(* ****** ****** *)
fun
tr12env_add1_d2conlst
(env0: !tr12env, d2cs: d2conlst): void
fun
tr12env_add1_d2cstlst
(env0: !tr12env, d2cs: d2cstlst): void
(* ****** ****** *)
fun
tr12env_add0_d2varlst
(env0: !tr12env, d2vs: d2varlst): void
fun
tr12env_add0_d2varopt
(env0: !tr12env, opt0: d2varopt): void
(* ****** ****** *)
fun
tr12env_add0_d2patlst
(env0: !tr12env, d2ps: d2patlst): void
fun
tr12env_add0_l2d2plst
(env0: !tr12env, ldps: l2d2plst): void
fun
tr12env_add0_f2arglst
(env0: !tr12env, f2as: f2arglst): void
(* ****** ****** *)
#symload
tr12env_add0_s2vs with tr12env_add0_s2varlst
#symload
tr12env_add0_sqas with tr12env_add0_s2qaglst
#symload
tr12env_add0_tqas with tr12env_add0_t2qaglst
(* ****** ****** *)
#symload
tr12env_add1_d2cs with tr12env_add1_d2conlst
#symload
tr12env_add1_d2cs with tr12env_add1_d2cstlst
(* ****** ****** *)
#symload
tr12env_add0_d2vs with tr12env_add0_d2varlst
(* ****** ****** *)
#symload
tr12env_add0_d2ps with tr12env_add0_d2patlst
(* ****** ****** *)
#symload
tr12env_add0_f2as with tr12env_add0_f2arglst
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
fun
trans12_s1tex:
(!tr12env, sort1)->s2tex
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
fun
trans12_s1exp_impr
( env0:
! tr12env, s1e0: s1exp): s2exp
fun
trans12_s1exp_prgm
( env0:
! tr12env, s1e0: s1exp): s2exp
(* ****** ****** *)
fun
trans12_l1s1e_impr
( env0:
! tr12env, ls1e: l1s1e): l2s2e
fun
trans12_l1s1e_prgm
( env0:
! tr12env, ls1e: l1s1e): l2s2e
(* ****** ****** *)
fun
trans12_s1arg_tsub
( env0:
! tr12env
, s1a0: s1arg): (s2var, s2explst)
(* ****** ****** *)
//
fun
trans12_s1exp_stck
( env0:
! tr12env
, s1e1: s1exp,s2t2: sort2): s2exp
//
(* ****** ****** *)
//
fun
trans12_a1tdf_stck
( env0:
! tr12env
, atdf: a1tdf,s2t2: sort2): a2tdf
//
(* ****** ****** *)
//
fun
trans12_sort1lst
( env0:
! tr12env, s1ts: sort1lst): sort2lst
fun
trans12_sort1opt
( env0:
! tr12env, topt: sort1opt): sort2opt
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
trans12_s1qualst
( env0:
! tr12env
, s1qs: s1qualst): (s2varlst, s2explst)
//
(* ****** ****** *)
//
fun
trans12_s1explst
( env0:
! tr12env, s1es: s1explst): s2explst
//
fun
trans12_s1expopt
( env0:
! tr12env, sopt: s1expopt): s2expopt
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
//
fun
trans12_s1explst_stck1
(!tr12env, s1explst, sort2): s2explst
fun
trans12_s1explst_stcks
(!tr12env,s1explst,sort2lst): s2explst
//
(* ****** ****** *)
//
fun
trans12_d1pid
(env0: !tr12env, tok0: d1pid): d2var
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
trans12_f1arg
(env0: !tr12env, f1a0: f1arg): f2arg
//
(* ****** ****** *)
fun
trans12_d1gua
(env0: !tr12env, d1g0: d1gua): d2gua
fun
trans12_d1gpt
(env0: !tr12env, dgpt: d1gpt): d2gpt
fun
trans12_d1cls
(env0: !tr12env, d1c0: d1cls): d2cls
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
//
fun
trans12_q1arg
(env0: !tr12env, q1a0: q1arg): s2var
fun
trans12_s1qag
(env0: !tr12env, s1qa: s1qag): s2qag
fun
trans12_t1qag
(env0: !tr12env, t1qa: t1qag): t2qag
fun
trans12_t1iag
(env0: !tr12env, t1ia: t1iag): t2iag
//
(* ****** ****** *)
//
fun
trans12_s1eff
(env0: !tr12env, seff: s1eff): s2eff
fun
trans12_s1res
(env0: !tr12env, sres: s1res): s2res
//
(* ****** ****** *)
//
fun
trans12_d1ecl
(env0: !tr12env, d1cl: d1ecl): d2ecl
//
(* ****** ****** *)
//
fun
trans12_d1arg
(env0: !tr12env, darg: d1arg): d2arg
//
(* ****** ****** *)
//
fun
trans12_teqd1exp
( env0:
! tr12env, tdxp: teqd1exp): teqd2exp
//
fun
trans12_wths1exp
( env0:
! tr12env, wsxp: wths1exp): wths2exp
//
(* ****** ****** *)
fun
trans12_d1expseq
( env0:
! tr12env
, loc0: loc_t, d1es: d1explst): d2exp
(* ****** ****** *)
(*
//
// HX-2022-12-12:
// These cases are somewhat special!
//
fun
trans12_d1valdcl
(env0: !tr12env, dval: d1valdcl): d2valdcl
fun
trans12_d1vardcl
(env0: !tr12env, dvar: d1vardcl): d2vardcl
//
fun
trans12_d1fundcl
(env0: !tr12env, dfun: d1fundcl): d2fundcl
//
*)
(* ****** ****** *)
//
fun
trans12_d1typ
( env0:
! tr12env
, d1t0: d1typ, s2t0: sort2): s2cst
fun
trans12_d1typlst
( env0:
! tr12env
, d1ts: d1typlst, s2t0: sort2): s2cstlst
//
(* ****** ****** *)
//
fun
trans12_d1tsc
( env0:
! tr12env
, d1t0: d1typ, s2c0: s2cst): void
fun
trans12_d1tsclst
( env0:
! tr12env
, d1ts: d1typlst, s2cs: s2cstlst): void
//
fun
trans12_d1tcn
( env0:
! tr12env
, t1cn: d1tcn
, s2c0: s2cst
, tqas
: t2qaglst, svss: s2varlstlst): d2con
fun
trans12_d1tcnlst
( env0:
! tr12env
, tcns: d1tcnlst
, s2c0: s2cst, svss: s2varlstlst): d2conlst
//
(* ****** ****** *)
//
fun
trs2exp_g1mac
( env0
: !tr12env, loc_t, g1mac): s2exp
fun
trd2pat_g1mac
( env0
: !tr12env, loc_t, g1mac): d2pat
fun
trd2exp_g1mac
( env0
: !tr12env, loc_t, g1mac): d2exp
//
fun
trs2exp_g1maclst
( env0: !tr12env
, loc0
: loc_t, g1ms: g1maclst): s2explst
fun
trd2pat_g1maclst
( env0: !tr12env
, loc0
: loc_t, g1ms: g1maclst): d2patlst
fun
trd2exp_g1maclst
( env0: !tr12env
, loc0
: loc_t, g1ms: g1maclst): d2explst
//
(* ****** ****** *)
(*
// HX-2022-12-12:
// These functions are built
// on top of their trans11-version
*)
//
fun
trans12_g1mac
(env0: !tr12env, g1m0: g1mac): g1mac
//
fun
trans12_g1mac_apps
( env0:
! tr12env, g1f0: g1mac, g1ms: g1maclst): g1mac
//
(* ****** ****** *)
//
fun
trans12_d1pidopt:(!tr12env, d1pidopt)->d2varopt
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
trans12_f1arglst:(!tr12env, f1arglst)->f2arglst
//
(* ****** ****** *)
//
fun
trans12_d1gualst:(!tr12env, d1gualst)->d2gualst
fun
trans12_d1clslst:(!tr12env, d1clslst)->d2clslst
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
trans12_q1arglst:(!tr12env, q1arglst)->s2varlst
fun
trans12_s1qaglst:(!tr12env, s1qaglst)->s2qaglst
fun
trans12_t1qaglst:(!tr12env, t1qaglst)->t2qaglst
fun
trans12_t1iaglst:(!tr12env, t1iaglst)->t2iaglst
//
(* ****** ****** *)
//
fun
trans12_d1eclist:(!tr12env, d1eclist)->d2eclist
//
(* ****** ****** *)
//
fun
trans12_d1arglst:(!tr12env, d1arglst)->d2arglst
//
(* ****** ****** *)
//
fun
trans12_d1valdcl
( env0: 
! tr12env
, dpat: d2pat, dval: d1valdcl): d2valdcl
fun
trans12_d1valdclist
( env0:
! tr12env
, d2ps: d2patlst,d1vs: d1valdclist): d2valdclist
//
(* ****** ****** *)
//
fun
trans12_d1vardcl
(env0: !tr12env, dvar: d1vardcl): d2vardcl
fun
trans12_d1vardclist
(env0: !tr12env, d1vs: d1vardclist): d2vardclist
//
(* ****** ****** *)
//
fun
trans12_d1fundcl
( env0:
! tr12env
, dvar: d2var, dfun: d1fundcl): d2fundcl
fun
trans12_d1fundclist
( env0:
! tr12env
, d2vs: d2varlst, d1fs: d1fundclist): d2fundclist
//
(* ****** ****** *)
//
fun
trans12_d1cstdcl
( env0:
! tr12env
, tknd: (token)
, d1cs: d1cstdcl, tqas: t2qaglst): d2cstdcl
//
fun
trans12_d1cstdclist
( env0: !tr12env
, tknd: ( token )
, d1cs: d1cstdclist, tqas: t2qaglst): d2cstdclist
//
(* ****** ****** *)
//
fun
trans12_d1eclistopt
( env0
: !tr12env, dopt: d1eclistopt): d2eclistopt
//
(* ****** ****** *)
//
fun
trans02_from_fpath
(stadyn: sint, source: strn(*fpath*)): d2parsed
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_SATS_trans12.sats] *)
