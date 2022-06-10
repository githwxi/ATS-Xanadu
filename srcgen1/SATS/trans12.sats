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
// Start Time: October, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt"
(* ****** ****** *)
//
#staload "./xbasics.sats"
#staload "./xsymbol.sats"
#staload "./xsymmap.sats"
//
(* ****** ****** *)
//
#staload
  FP0 = "./filpath.sats"
#staload
  LOC = "./locinfo.sats"
//
typedef loc_t = $LOC.loc_t
//
(* ****** ****** *)
typedef fpath = $FP0.filpath
typedef filpath = $FP0.filpath
(* ****** ****** *)

#staload LEX = "./lexing0.sats"
#staload S1E = "./staexp1.sats"
#staload D1E = "./dynexp1.sats"
#staload S2E = "./staexp2.sats"
#staload D2E = "./dynexp2.sats"

(* ****** ****** *)
typedef token = $LEX.token
(* ****** ****** *)
typedef s1exp = $S1E.s1exp
typedef d1exp = $D1E.d1exp
(* ****** ****** *)
(*
symintr trans12 // too much?
*)
(* ****** ****** *)
//
typedef g1exp = $S1E.g1exp
//
typedef g1mac = $S1E.g1mac
(*
HX-2020-10-17:
Note that g1mac is defined
in the [g1maro_define.dats]
*)
//
(* ****** ****** *)
fun
trans11_g1exp(g1exp): g1mac
fun
trans11_g1mac(g1mac): g1mac
//
(* ****** ****** *)
typedef g1maclst = List0(g1mac)
(* ****** ****** *)
fun
trans11_g1mac_apps
(g1f0: g1mac, g1ms: g1maclst): g1mac
(* ****** ****** *)
fun
trans11_g1mdef
( gmas: $S1E.g1marglst
, def1: $S1E.g1expopt): g1mac
(* ****** ****** *)
//
vtypedef g1menv = symmap(g1mac)
//
(* ****** ****** *)
//
typedef sort1 = $S1E.sort1
typedef s1arg = $S1E.s1arg
typedef s1exp = $S1E.s1exp
(*
typedef s1eff = $S1E.s1eff
*)
typedef s1qua = $S1E.s1qua
//
(* ****** ****** *)
//
typedef s1marg = $S1E.s1marg
typedef s1rtcon = $S1E.s1rtcon
//
(* ****** ****** *)
//
typedef sort1opt = $S1E.sort1opt
typedef sort1lst = $S1E.sort1lst
//
typedef s1arglst = $S1E.s1arglst
//
typedef s1expopt = $S1E.s1expopt
typedef s1explst = $S1E.s1explst
//
typedef s1qualst = $S1E.s1qualst
//
(* ****** ****** *)
//
typedef d1atcon = $S1E.d1atcon
typedef d1atype = $S1E.d1atype
typedef d1atconlst = $S1E.d1atconlst
typedef d1atypelst = $S1E.d1atypelst
//
(* ****** ****** *)
//
typedef labs1exp = $S1E.labs1exp
typedef labs1explst = $S1E.labs1explst
//
(* ****** ****** *)
//
typedef effs1expopt = $S1E.effs1expopt
//
(* ****** ****** *)
//
typedef sort2 = $S2E.sort2
typedef sort2opt = $S2E.sort2opt
typedef sort2lst = $S2E.sort2lst
//
(* ****** ****** *)
//
typedef s2cst = $S2E.s2cst
typedef s2var = $S2E.s2var
//
typedef s2cstlst = $S2E.s2cstlst
typedef s2varlst = $S2E.s2varlst
//
(* ****** ****** *)

typedef s2varlstlst = List0(s2varlst)

(* ****** ****** *)
//
typedef s2exp = $S2E.s2exp
(*
typedef s2eff = $S2E.s2eff
*)
typedef s2expopt = $S2E.s2expopt
typedef s2explst = $S2E.s2explst
//
typedef labs2exp = $S2E.labs2exp
typedef labs2explst = $S2E.labs2explst
//
(* ****** ****** *)

typedef effs2expopt = $S2E.effs2expopt

(* ****** ****** *)
//
typedef s2txt = $S2E.s2txt
typedef s2txtopt = $S2E.s2txtopt
//
(* ****** ****** *)
//
vtypedef
  g1macopt_vt = Option_vt(g1mac)
//
(* ****** ****** *)
//
vtypedef
  s2cstlst_vt = $S2E.s2cstlst_vt
vtypedef
  s2varlst_vt = $S2E.s2varlst_vt
vtypedef
  s2explst_vt = $S2E.s2explst_vt
//
(* ****** ****** *)
//
vtypedef
  s2cstopt_vt = $S2E.s2cstopt_vt
vtypedef
  s2varopt_vt = $S2E.s2varopt_vt
vtypedef
  s2expopt_vt = $S2E.s2expopt_vt
vtypedef
  s2txtopt_vt = $S2E.s2txtopt_vt
//
(* ****** ****** *)
//
typedef
  fmodenv = $S2E.fmodenv
typedef
  fmodenvopt = $S2E.fmodenvopt
vtypedef
  fmodenvopt_vt = $S2E.fmodenvopt_vt
//
(* ****** ****** *)
//
typedef a1typ = $D1E.a1typ
typedef a1typlst = $D1E.a1typlst
//
(* ****** ****** *)
//
typedef q1arg = $D1E.q1arg
typedef sq1arg = $D1E.sq1arg
typedef tq1arg = $D1E.tq1arg
typedef ti1arg = $D1E.ti1arg
//
typedef q1arglst = $D1E.q1arglst
typedef sq1arglst = $D1E.sq1arglst
typedef tq1arglst = $D1E.tq1arglst
typedef ti1arglst = $D1E.ti1arglst
//
(* ****** ****** *)
typedef d1typ = $D1E.d1typ
typedef d1typlst = $D1E.d1typlst
(* ****** ****** *)

typedef d1pat = $D1E.d1pat
typedef d1patlst = $D1E.d1patlst
typedef d1patopt = $D1E.d1patopt

(* ****** ****** *)

typedef f1arg = $D1E.f1arg
typedef f1arglst = $D1E.f1arglst

(* ****** ****** *)
typedef st1inv = $D1E.st1inv
typedef st1qua = $D1E.st1qua
(* ****** ****** *)

typedef d1exp = $D1E.d1exp
typedef d1explst = $D1E.d1explst
typedef d1expopt = $D1E.d1expopt

(* ****** ****** *)

typedef d1gua = $D1E.d1gua
typedef d1clau = $D1E.d1clau
typedef d1gpat = $D1E.d1gpat

typedef d1gualst = $D1E.d1gualst
typedef d1claulst = $D1E.d1claulst

(* ****** ****** *)

typedef d1ecl = $D1E.d1ecl
typedef d1eclist = $D1E.d1eclist

(* ****** ****** *)
//
typedef d2con = $D2E.d2con
typedef d2cst = $D2E.d2cst
typedef d2var = $D2E.d2var
//
typedef d2conlst = $D2E.d2conlst
typedef d2cstlst = $D2E.d2cstlst
typedef d2varlst = $D2E.d2varlst
//
(* ****** ****** *)

typedef sq2arg = $D2E.sq2arg
typedef tq2arg = $D2E.tq2arg
typedef ti2arg = $D2E.ti2arg
typedef sq2arglst = $D2E.sq2arglst
typedef tq2arglst = $D2E.tq2arglst
typedef ti2arglst = $D2E.ti2arglst

(* ****** ****** *)

typedef d2typ = $D2E.d2typ
typedef d2typlst = $D2E.d2typlst

(* ****** ****** *)

typedef d2pat = $D2E.d2pat
typedef d2patlst = $D2E.d2patlst
typedef d2patopt = $D2E.d2patopt

(* ****** ****** *)

typedef f2arg = $D2E.f2arg
typedef f2arglst = $D2E.f2arglst

(* ****** ****** *)

typedef d2gua = $D2E.d2gua
typedef d2clau = $D2E.d2clau
typedef d2gpat = $D2E.d2gpat

typedef d2gualst = $D2E.d2gualst
typedef d2claulst = $D2E.d2claulst

(* ****** ****** *)

typedef st2inv = $D2E.st2inv
typedef st2qua = $D2E.st2qua

(* ****** ****** *)

typedef d2exp = $D2E.d2exp
typedef d2explst = $D2E.d2explst
typedef d2expopt = $D2E.d2expopt

(* ****** ****** *)

typedef d2ecl = $D2E.d2ecl
typedef d2eclist = $D2E.d2eclist

(* ****** ****** *)
//
typedef s2itm = $S2E.s2itm
typedef d2itm = $D2E.d2itm
//
typedef s2itmopt = $S2E.s2itmopt
typedef d2itmopt = $D2E.d2itmopt
//
vtypedef
s2itmopt_vt = $S2E.s2itmopt_vt
vtypedef
d2itmopt_vt = $D2E.d2itmopt_vt
//
(* ****** ****** *)
//
vtypedef s2tmap = symmap(s2txt)
vtypedef s2imap = symmap(s2itm)
vtypedef d2imap = symmap(d2itm)
//
(* ****** ****** *)
//
fun
sargid_new((*void*)): sym_t
fun
dargid_new((*void*)): sym_t
//
(* ****** ****** *)

fun
fmodenv_make
( fp: fpath
, env0: g1menv
(*
, env1: d2menv
*)
, map0: s2tmap
, map1: s2imap
, map2: d2imap
, d2cs: d2eclist) : fmodenv

(* ****** ****** *)
fun
fmodenv_get_g1menv
( menv
: fmodenv
) :
[
  l:addr
]
( g1menv@l
, minus_v(fmodenv, g1menv@l) | ptr(l))
(* ****** ****** *)
//
(*
HX-2018-11-18:
Not waterproof but seems adequate
*)
fun
fmodenv_get_s2tmap
( menv
: fmodenv
) :
[
  l:addr
]
( s2tmap@l
, minus_v(fmodenv, s2tmap@l) | ptr(l))
fun
fmodenv_get_s2imap
( menv
: fmodenv
) :
[
  l:addr
]
( s2imap@l
, minus_v(fmodenv, s2imap@l) | ptr(l))
fun
fmodenv_get_d2imap
( menv
: fmodenv
) :
[
  l:addr
]
( d2imap@l
, minus_v(fmodenv, d2imap@l) | ptr(l))
//
(* ****** ****** *)
//
fun
fmodenv_get_d2eclist(fmodenv): d2eclist
//
(* ****** ****** *)
//
abstype d3eclist = ptr
abstype t3imptbl = ptr
typedef d3eclistopt = Option(d3eclist)
typedef t3imptblopt = Option(t3imptbl)
//
(* ****** ****** *)
//
fun
fmodenv_get_d3eclist
  (env: fmodenv): d3eclistopt
fun
fmodenv_set_d3eclist
  (menv: fmodenv, htbl: d3eclist): void
//
fun
fmodenv_get_t3imptbl
  (env: fmodenv): t3imptblopt
fun
fmodenv_set_t3imptbl
  (menv: fmodenv, htbl: t3imptbl): void
//
(* ****** ****** *)
//
fun
the_nmspace_open
  (menv: fmodenv): void
//
(* ****** ****** *)
//
fun
the_qualist_find
  (qua: token): fmodenvopt_vt
fun
the_qualist_find_sym
  (qua: sym_t): fmodenvopt_vt
//
(* ****** ****** *)
//
fun
the_gmacenv_add
(gid: sym_t, def: g1mac): void
(*
fun
the_gmacenv_padd
(gid: sym_t, def: g1mac): void
*)
//
fun
the_gmacenv_find
  ( gid: sym_t ) : g1macopt_vt
fun
the_gmacenv_qfind
  ( qua: token
  , gid: sym_t ) : g1macopt_vt
//
(* ****** ****** *)
absview gmacenv_view
viewdef gmacenv_v = gmacenv_view
(* ****** ****** *)
//
fun
the_gmacenv_pop
  (gmacenv_v | (*none*)): g1menv
fun
the_gmacenv_popfree
  (gmacenv_v | (*none*)): (void)
fun
the_gmacenv_pushnil
  ((*void*)): (gmacenv_v | void)
//
fun
the_gmacenv_locjoin
(
  pf1: gmacenv_v
, pf2: gmacenv_v | (*none*)
) : void // end of [the_gmacenv_locjoin]
//
fun // p: pervasive
the_gmacenv_pjoinwth0(map: g1menv): void
fun // p: pervasive
the_gmacenv_pjoinwth1(map: !g1menv): void
//
(* ****** ****** *)
fun
the_gmacenv_fprint(FILEref): void
fun
the_gmacenv_println((*void*)): void
(* ****** ****** *)
//
fun
the_sortenv_add
(tid: sym_t, s2t: s2txt): void
fun
the_sortenv_padd
(tid: sym_t, s2t: s2txt): void
//
fun
the_sortenv_find
  ( tid: sym_t ) : s2txtopt_vt
fun
the_sortenv_qfind
  ( qua: token
  , tid: sym_t ) : s2txtopt_vt
//
(* ****** ****** *)
absview sortenv_view
viewdef sortenv_v = sortenv_view
(* ****** ****** *)
//
fun
the_sortenv_pop
  (sortenv_v | (*none*)): s2tmap
fun
the_sortenv_popfree
  (sortenv_v | (*none*)): (void)
fun
the_sortenv_pushnil
  ((*void*)): (sortenv_v | void)
//
fun
the_sortenv_locjoin
(
  pf1: sortenv_v
, pf2: sortenv_v | (*none*)
) : void // end of [the_sortenv_locjoin]
//
fun // p: pervasive
the_sortenv_pjoinwth0(map: s2tmap): void
fun // p: pervasive
the_sortenv_pjoinwth1(map: !s2tmap): void
//
(* ****** ****** *)
//
fun
the_sortenv_fprint(FILEref): void
fun
the_sortenv_println((*void*)): void
//
(* ****** ****** *)
//
fun
the_sexpenv_add
(tid: sym_t, s2i: s2itm): void
fun
the_sexpenv_add_cst(s2c: s2cst): void
fun
the_sexpenv_add_var(s2v: s2var): void
fun
the_sexpenv_add_csts(s2cs: s2cstlst): void
fun
the_sexpenv_add_s2vs(s2vs: s2varlst): void
fun
the_sexpenv_add_tqas(tqas: tq2arglst): void
fun
the_sexpenv_add_svss(svss: s2varlstlst): void
//
fun
the_sexpenv_find
  ( sym: sym_t ) : s2itmopt_vt
fun // pervasive
the_sexpenv_pfind
  ( sym: sym_t ) : s2itmopt_vt
fun
the_sexpenv_qfind
  ( qua: token
  , sym: sym_t ) : s2itmopt_vt
//
(* ****** ****** *)
absview sexpenv_view
viewdef sexpenv_v = sexpenv_view
(* ****** ****** *)
//
fun
the_sexpenv_pop
  (sexpenv_v | (*none*)): s2imap
fun
the_sexpenv_popfree
  (sexpenv_v | (*none*)): (void)
fun
the_sexpenv_pushnil
  ((*void*)): (sexpenv_v | void)
//
fun
the_sexpenv_locjoin
(
  pf1: sexpenv_v
, pf2: sexpenv_v | (*none*)
) : void // end of [the_sexpenv_locjoin]
//
fun // p: pervasive
the_sexpenv_pjoinwth0(map: s2imap): void
fun // p: pervasive
the_sexpenv_pjoinwth1(map: !s2imap): void
//
(* ****** ****** *)
//
fun
the_sexpenv_fprint(FILEref): void
fun
the_sexpenv_println((*void*)): void
//
(* ****** ****** *)
//
fun
s2cst_select_any
( s2cs
: s2cstlst): Option_vt(s2cst)
//
fun
s2cst_select_bin
( s2cs
: s2cstlst
, arg1: sort2
, arg2: sort2): Option_vt(s2cst)
//
fun
s2cst_select_list
( s2cs: s2cstlst
, s2es: s2explst): Option_vt(s2cst)
//
(* ****** ****** *)
//
fun
s1imp_get_lin(s1exp): int
fun
s1imp_get_fc2(s1exp): funclo2
(*
fun
s1imp_get_eff(s1exp): (s2eff)
*)
//
fun
s1explst_get_lin(s1explst): int
fun
s1explst_get_fc2(s1explst): funclo2
(*
fun
s1explst_get_eff(s1explst): (s2eff)
*)
//
(* ****** ****** *)
//
fun
s1exp_get_s2cstlst(s1exp): s2cstlst
//
(* ****** ****** *)
//
fun
trans12_sort: sort1 -> sort2 
fun
trans12_sortopt: sort1opt -> sort2opt
fun
trans12_sortlst: sort1lst -> sort2lst
//
(*
overload trans12 with trans12_sort
overload trans12 with trans12_sortopt
overload trans12 with trans12_sortlst
*)
//
(* ****** ****** *)
//
fun
trans12_sarg: s1arg -> s2var
fun
trans12_smarg: s1marg -> s2varlst
//
fun
trans12_sarglst: s1arglst -> s2varlst
//
(* ****** ****** *)
//
fun
trans12_stxt: sort1 -> s2txt
//
(* ****** ****** *)
//
fun
trans12_squalst
( s1qs: s1qualst
, s2vs: &s2varlst_vt >> _
, s2ps: &s2explst_vt >> _): void
//
(* ****** ****** *)
//
fun
trans12_sexp: s1exp -> s2exp 
//
fun
trans12_seid: s1exp -> s2exp 
//
fun
trs1exp_gmac: s1exp -> g1mac
fun
trg1mac_sexp: (loc_t, g1mac) -> s2exp
//
(* ****** ****** *)
//
fun
trans12_sexpopt: s1expopt -> s2expopt
fun
trans12_sexplst: s1explst -> s2explst
//
(*
overload trans12 with trans12_sexp
overload trans12 with trans12_sexpopt
overload trans12 with trans12_sexplst
*)
//
(* ****** ****** *)
//
// HX:
// checking for impredicativity
//
fun
trans12_sexp_ci(s1e0: s1exp): s2exp
fun
trans12_sexplst_ci(s1es: s1explst): s2explst
fun
trans12_sexp_cp(s1e0: s1exp): s2exp
fun
trans12_sexplst_cp(s1es: s1explst): s2explst
fun
trans12_sexp_ct(s1e0: s1exp): s2exp
fun
trans12_sexplst_ct(s1es: s1explst): s2explst
//
(* ****** ****** *)
//
fun
trans12_sexp_ck
  (s1e0: s1exp, s2t0: sort2): s2exp
fun
trans12_sexplst_ck
  (s1es: s1explst, s2t0: sort2): s2explst
fun
trans12_sexplst_cks
  ( loc0: loc_t
  , s1es: s1explst, s2ts: sort2lst): s2explst
//
(* ****** ****** *)
//
fun
trans12_labsexplst_ci
  (ls1es: labs1explst): labs2explst
fun
trans12_labsexplst_cp
  (ls1es: labs1explst): labs2explst
fun
trans12_labsexplst_ct
  (ls1es: labs1explst): labs2explst
//
(* ****** ****** *)
//
(*
fun
trans12_seff: s1eff -> s2eff
*)
//
fun
trans12_effsexpopt
( opt0: effs1expopt ) : effs2expopt
//
(* ****** ****** *)
//
fun
the_dexpenv_add
(tid: sym_t, d2i: d2itm): void
fun
the_dexpenv_add_con(d2c: d2con): void
fun
the_dexpenv_add_cst(d2c: d2cst): void
fun
the_dexpenv_add_var(d2v: d2var): void
fun
the_dexpenv_add_cons(d2cs: d2conlst): void
fun
the_dexpenv_add_csts(d2cs: d2cstlst): void
fun
the_dexpenv_add_d2vs(d2vs: d2varlst): void
//
fun
the_dexpenv_find
  ( sym: sym_t ) : d2itmopt_vt
fun
the_dexpenv_qfind
  ( qua: token
  , sym: sym_t ) : d2itmopt_vt
//
(* ****** ****** *)
absview dexpenv_view
viewdef dexpenv_v = dexpenv_view
(* ****** ****** *)
//
fun
the_dexpenv_pop
  (dexpenv_v | (*none*)): d2imap
fun
the_dexpenv_popfree
  (dexpenv_v | (*none*)): (void)
fun
the_dexpenv_pushnil
  ((*void*)): (dexpenv_v | void)
//
fun
the_dexpenv_locjoin
( pf1: dexpenv_v
, pf2: dexpenv_v | (*none*)): void
//
fun // p: pervasive
the_dexpenv_pjoinwth0(map: d2imap): void
fun // p: pervasive
the_dexpenv_pjoinwth1(map: !d2imap): void
//
(* ****** ****** *)
//
fun
the_dexpenv_fprint(FILEref): void
fun
the_dexpenv_println((*void*)): void
//
(* ****** ****** *)
//
fun
the_fmodenvmap_add
(fid: sym_t, env: fmodenv): void
//
fun
the_fmodenvmap_find
  (fid: sym_t): Option_vt(fmodenv)
//
(* ****** ****** *)
absview trans12_view
viewdef trans12_v = trans12_view
(* ****** ****** *)
//
fun
the_trans12_popfree
  (trans12_v | (*none*)): (void)
fun
the_trans12_pushnil
  ((*void*)): (trans12_v | void)
//
fun
the_trans12_locjoin
( pf1: trans12_v
, pf2: trans12_v | (*none*)): void
//
(* ****** ****** *)
//
fun
the_trans12_pjoinwth0
( pf0: trans12_v | (*void*)): (void)
fun
the_trans12_pjoinwth1
( pf0: trans12_v
| fp0: fpath, d2cs: d2eclist): (void)
//
(* ****** ****** *)
//
absview
trans12_save_view
viewdef
trans12_save_v = trans12_save_view
//
(* ****** ****** *)
//
fun
the_trans12_savecur
((*none*))
:
(trans12_save_v | void)
fun
the_trans12_restore
(trans12_save_v | (*none*))
:
( g1menv, s2tmap, s2imap, d2imap )
//
(* ****** ****** *)
//
fun
the_trans12_add_pat(d2p: d2pat): void
fun
the_trans12_add_patlst(d2ps: d2patlst): void
//
fun
the_trans12_add_gua(d2g: d2gua): void
fun
the_trans12_add_gpat(d2gp: d2gpat): void
fun
the_trans12_add_gualst(d2gs: d2gualst): void
//
(* ****** ****** *)
//
fun
trans12_dtyp: d1typ -> d2typ
//
(* ****** ****** *)
//
fun
trans12_dpat: d1pat -> d2pat
//
fun
trans12_dpid: d1pat -> d2pat 
//
fun
trd1pat_gmac: d1pat -> g1mac
fun
trg1mac_dpat: (loc_t, g1mac) -> d2pat
//
(* ****** ****** *)
//
fun
trans12_dpatlst: d1patlst -> d2patlst
//
(* ****** ****** *)
//
fun
trans12_farg: f1arg -> f2arg
fun
trans12_farglst: f1arglst -> f2arglst
//
(* ****** ****** *)
//
fun
trans12_stinv
  ( tinv : st1inv ) : st2inv
fun
trans12_stqua
  ( st1q : st1qua ) : st2qua
//
(* ****** ****** *)
//
fun
trans12_dexp: d1exp -> d2exp 
//
fun
trans12_deid: d1exp -> d2exp 
//
fun
trd1exp_gmac: d1exp -> g1mac
//
fun
trg1mac_dexp
(loc: loc_t, g1m: g1mac): d2exp
//
(* ****** ****** *)
//
fun
trans12_dexpopt: d1expopt -> d2expopt
fun
trans12_dexplst: d1explst -> d2explst
//
(*
overload trans12 with trans12_dexp
overload trans12 with trans12_dexpopt
overload trans12 with trans12_dexplst
*)
//
(* ****** ****** *)

fun
trans12_dexpseq
(loc0: loc_t, d1es: d1explst): d2exp

(* ****** ****** *)
//
fun
trans12_dgua: d1gua -> d2gua
fun
trans12_dclau: d1clau -> d2clau
fun
trans12_dgpat: d1gpat -> d2gpat
//
fun
trans12_dgualst: d1gualst -> d2gualst
fun
trans12_dclaulst: d1claulst -> d2claulst
//
(* ****** ****** *)
//
fun
trans12_decl: d1ecl -> d2ecl
fun
trans12_declist: d1eclist -> d2eclist
//
(*
overload trans12 with trans12_decl
overload trans12 with trans12_declopt
*)
//
(* ****** ****** *)
//
typedef
s2varlstlst = List0(s2varlst)
typedef
s2explstlst = List0(s2explst)
//
(* ****** ****** *)
//
fun
trans12_datype
( s2t0: sort2
, d1t0: d1atype): s2cst
fun
trans12_datypelst
( s2t0: sort2
, d1ts: d1atypelst): s2cstlst
//
fun
trans12_datcon
( s2c0: s2cst
, tqas: tq2arglst
, s2varlstlst, d1atcon): d2con
fun
trans12_datconlst
( s2c0: s2cst
, s2varlstlst, d1atconlst): d2conlst
//
fun
trans12_tag_d2conlst
(s2c0: s2cst, d2cs: d2conlst): void
//
(* ****** ****** *)
//
fun
trans12_atyp(x0: a1typ): s2exp
fun
trans12_atyplst(x0: a1typlst): s2explst
//
(* ****** ****** *)
//
fun
trans12_qarg
  (q1a: q1arg): s2var
fun
trans12_qarglst
  (q1as: q1arglst): s2varlst
//
(* ****** ****** *)
//
fun
trans12_sqarg(sq1a: sq1arg): sq2arg
fun
trans12_tqarg(tq1a: tq1arg): tq2arg
fun
trans12_tiarg(ti1a: ti1arg): ti2arg
//
fun
trans12_sqarglst(sqas: sq1arglst): sq2arglst
fun
trans12_tqarglst(tqas: tq1arglst): tq2arglst
fun
trans12_tiarglst(tias: ti1arglst): ti2arglst
//
(* ****** ****** *)

fun
g1exp_nmspace
(g1e0: g1exp): symbolopt_vt

(* ****** ****** *)
//
fun
(*
the_fmodenvmap_add
*)
trans12_staload_add
(fp: filpath, menv: fmodenv): void
//
fun
(*
the_fmodenvmap_find
*)
trans12_staload_find
  (fp0: filpath): Option_vt(fmodenv)
//
(* ****** ****** *)

(* end of [xats_trans12.sats] *)
