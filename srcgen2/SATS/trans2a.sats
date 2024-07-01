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
Sat 19 Nov 2022 01:54:56 PM EST
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
(*
HX-2022-11-19: pre-type-inference
The main purpose of this translation
is for resolving overloaded symbols!
*)
(* ****** ****** *)
#absvtbx
tr2aenv_vtbx // = ptr
#vwtpdef
tr2aenv = tr2aenv_vtbx
(*
#abstbox
ms2ct2p_tbox // = ptr
#typedef
ms2ct2p = ms2ct2p_tbox
*)
(* ****** ****** *)
#staload
BAS = "./xbasics.sats"
#typedef
f2clknd = $BAS.f2clknd
(* ****** ****** *)
//
#staload
LAB = "./xlabel0.sats"
#staload
LOC = "./locinfo.sats"
#staload
SYM = "./xsymbol.sats"
#staload
LEX = "./lexing0.sats"
//
#typedef lab_t = $LAB.lab_t
#typedef loc_t = $LOC.loc_t
#typedef sym_t = $SYM.sym_t
#typedef token = $LEX.token
//
(* ****** ****** *)
#staload S2E = "./staexp2.sats"
#staload T2P = "./statyp2.sats"
#staload D2E = "./dynexp2.sats"
(* ****** ****** *)
#typedef s2cst = $S2E.s2cst
(* ****** ****** *)
#typedef s2exp = $S2E.s2exp
#typedef s2typ = $S2E.s2typ
#typedef l2s2e = $S2E.l2s2e
#typedef l2t2p = $S2E.l2t2p
(* ****** ****** *)
#typedef x2t2p = $T2P.x2t2p
#typedef s2vts = $T2P.s2vts
(* ****** ****** *)
#typedef d2var = $D2E.d2var
#typedef d2con = $D2E.d2con
#typedef d2cst = $D2E.d2cst
(* ****** ****** *)
#typedef d2itm = $D2E.d2itm
#typedef d2ptm = $D2E.d2ptm
(* ****** ****** *)
#typedef d2pat = $D2E.d2pat
#typedef d2exp = $D2E.d2exp
(* ****** ****** *)
#typedef l2d2p = $D2E.l2d2p
#typedef l2d2e = $D2E.l2d2e
(* ****** ****** *)
#typedef f2arg = $D2E.f2arg
(* ****** ****** *)
#typedef d2gua = $D2E.d2gua
#typedef d2gpt = $D2E.d2gpt
#typedef d2cls = $D2E.d2cls
(* ****** ****** *)
#typedef d2ecl = $D2E.d2ecl
(* ****** ****** *)
#typedef s2qag = $D2E.s2qag
#typedef t2qag = $D2E.t2qag
#typedef t2iag = $D2E.t2iag
(* ****** ****** *)
#typedef t2qas = $D2E.t2qas
#typedef t2ias = $D2E.t2ias
(* ****** ****** *)
#typedef d2arg = $D2E.d2arg
(* ****** ****** *)
#typedef dimpl = $D2E.dimpl
(* ****** ****** *)
#typedef teqd2exp = $D2E.teqd2exp
(* ****** ****** *)
#typedef s2cstlst = $S2E.s2cstlst
(* ****** ****** *)
#typedef s2explst = $S2E.s2explst
#typedef s2typlst = $S2E.s2typlst
#typedef l2s2elst = $S2E.l2s2elst
#typedef l2t2plst = $S2E.l2t2plst
(* ****** ****** *)
#typedef d2varlst = $D2E.d2varlst
#typedef d2conlst = $D2E.d2conlst
#typedef d2cstlst = $D2E.d2cstlst
(* ****** ****** *)
#typedef d2itmopt = $D2E.d2itmopt
#typedef d2itmlst = $D2E.d2itmlst
(* ****** ****** *)
#typedef d2ptmopt = $D2E.d2ptmopt
#typedef d2ptmlst = $D2E.d2ptmlst
(* ****** ****** *)
#typedef d2patlst = $D2E.d2patlst
(* ****** ****** *)
#typedef d2explst = $D2E.d2explst
#typedef d2expopt = $D2E.d2expopt
(* ****** ****** *)
#typedef l2d2plst = $D2E.l2d2plst
#typedef l2d2elst = $D2E.l2d2elst
(* ****** ****** *)
#typedef f2arglst = $D2E.f2arglst
(* ****** ****** *)
#typedef d2gualst = $D2E.d2gualst
#typedef d2clslst = $D2E.d2clslst
(* ****** ****** *)
#typedef d2eclist = $D2E.d2eclist
(* ****** ****** *)
#typedef s2qaglst = $D2E.s2qaglst
#typedef t2qaglst = $D2E.t2qaglst
#typedef t2iaglst = $D2E.t2iaglst
(* ****** ****** *)
#typedef d2arglst = $D2E.d2arglst
(* ****** ****** *)
#typedef d2valdcl = $D2E.d2valdcl
#typedef d2vardcl = $D2E.d2vardcl
#typedef d2fundcl = $D2E.d2fundcl
#typedef d2cstdcl = $D2E.d2cstdcl
(* ****** ****** *)
#typedef d2parsed = $D2E.d2parsed
(* ****** ****** *)
#vwtpdef s2cstopt_vt = optn_vt(s2cst)
(* ****** ****** *)
#vwtpdef s2typopt_vt = optn_vt(s2typ)
(* ****** ****** *)
#typedef d2valdclist = $D2E.d2valdclist
#typedef d2vardclist = $D2E.d2vardclist
#typedef d2fundclist = $D2E.d2fundclist
(* ****** ****** *)
#typedef d2cstdclist = $D2E.d2cstdclist
(* ****** ****** *)
#typedef d2explstopt = $D2E.d2explstopt
#typedef d2eclistopt = $D2E.d2eclistopt
(* ****** ****** *)
//
fun
x2t2p_make_dvar
( d2v0 : d2var): x2t2p
#symload
x2t2p with x2t2p_make_dvar
//
(* ****** ****** *)
//
fun
d2exp_sym0_styp
( loc0:loc_t
, name:sym_t
, dpis
: d2ptmlst, t2p0:s2typ):d2exp
//
(* ****** ****** *)
//
fun
s2typ_fun1_f2arglst
(f2as
:f2arglst
,f2cl:f2clknd,tres:s2typ):s2typ
//
(* ****** ****** *)
//
fun
s2typlst_of_d2patlst
( d2ps: d2patlst ): s2typlst
#symload
s2typlst with s2typlst_of_d2patlst
//
fun
s2typlst_of_d2explst
( d2es: d2explst ): s2typlst
#symload
s2typlst with s2typlst_of_d2explst
//
(* ****** ****** *)
//
fun
l2t2plst_of_l2d2plst
( ldps: l2d2plst ): l2t2plst
#symload
l2t2plst with l2t2plst_of_l2d2plst
//
fun
l2t2plst_of_l2d2elst
( ldes: l2d2elst ): l2t2plst
#symload
l2t2plst with l2t2plst_of_l2d2elst
//
(* ****** ****** *)
//
fun
d2parsed_of_trans2a
( dpar : d2parsed ): (d2parsed)
//
(* ****** ****** *)
//
fun
tr2aenv_make_nil((*0*)):tr2aenv
//
fun
tr2aenv_free_top(tr2aenv):(void)
(*
fun
tr2aenv_free_top(tr2aenv):md2ct2p
*)
//
(* ****** ****** *)
//
fun
tr2aenv_pshlet0
(env0: !tr2aenv): void//end-fun
fun
tr2aenv_poplet0
(env0: !tr2aenv): void//end-fun
//
fun
tr2aenv_pshloc1
(env0: !tr2aenv): void//end-fun
fun
tr2aenv_pshloc2
(env0: !tr2aenv): void//end-fun
//
fun
tr2aenv_locjoin
(env0: !tr2aenv): void//end-fun
//
(* ****** ****** *)
//
fun
tr2aenv_s2crch_opt
( env0:
! tr2aenv,s2c0:s2cst): s2cstlst
fun
tr2aenv_s2cins_any
( env0:
! tr2aenv,s2c0:s2cst): ( void )
//
fun
tr2aenv_evstyp_cst
( env0:
! tr2aenv,s2c0:s2cst): s2typopt_vt
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
list_trans2a_fnp
( e1:
! tr2aenv
, xs
: list(x0)
, fopr:
  (!tr2aenv,x0)->y0): list(y0)
fun
<x0:t0>
<y0:t0>
optn_trans2a_fnp
( e1:
! tr2aenv
, xs
: optn(x0)
, fopr:
  (!tr2aenv,x0)->y0): optn(y0)
//
(* ****** ****** *)
//
fun
tr2aenv_s2typ
( env0:
! tr2aenv,t2p0:s2typ):s2typ//fun
//
(* ****** ****** *)
//
fun
d2con2a_s2typ
(
loc0:loc_t,dcon:d2con):s2typ//fun
fun
d2cst2a_s2typ
(
loc0:loc_t,dcst:d2cst):s2typ//fun
//
(* ****** ****** *)
//
fun
trans2a_d2pat
( env0:
! tr2aenv,d2p0:d2pat):d2pat//fun
//
fun
trans2a_d2exp
( env0:
! tr2aenv,d2e0:d2exp):d2exp//fun
//
(* ****** ****** *)
//
fun
trans2a_l2d2p
( env0:
! tr2aenv,ld2p:l2d2p):l2d2p//fun
//
fun
trans2a_l2d2e
( env0:
! tr2aenv,ld2e:l2d2e):l2d2e//fun
//
(* ****** ****** *)
//
fun
trans2a_f2arg
( env0:
! tr2aenv,f2a0:f2arg):f2arg//fun
//
(* ****** ****** *)
//
fun
trans2a_d2gua
( env0:
! tr2aenv,dgua:d2gua):d2gua//fun
//
fun
trans2a_d2gpt_tpck
( env0:
! tr2aenv
, dgpt:d2gpt,targ:s2typ):d2gpt//f
//
fun
trans2a_d2cls_tpck
( env0:
! tr2aenv
, dcls:d2cls
, targ:s2typ,tres:s2typ):d2cls//f
//
(* ****** ****** *)
//
fun
trans2a_d2ecl
( env0:
! tr2aenv,d2cl:d2ecl):d2ecl//fun
//
(* ****** ****** *)
//
fun
trans2a_s2qag
( env0:
! tr2aenv,s2qa:s2qag):s2qag//fun
fun
trans2a_t2qag
( env0:
! tr2aenv,t2qa:t2qag):t2qag//fun
//
fun
trans2a_t2iag
( env0:
! tr2aenv,t2ia:t2iag):t2iag//fun
//
(* ****** ****** *)
//
fun
trans2a_d2arg
( env0:
! tr2aenv,darg:d2arg):d2arg//fun
//
(* ****** ****** *)
fun
tr2aenv_s2typlst
( env0:
! tr2aenv, t2p0: s2typlst): s2typlst
fun
tr2aenv_l2t2plst
( env0:
! tr2aenv, ltps: l2t2plst): l2t2plst
(* ****** ****** *)
//
fun
trans2a_d2patlst
( env0:
! tr2aenv, d2ps: d2patlst): d2patlst
//
(* ****** ****** *)
//
fun
trans2a_d2expopt
( env0:
! tr2aenv, dopt: d2expopt): d2expopt
//
fun
trans2a_d2explst
( env0:
! tr2aenv, d2es: d2explst): d2explst
//
(* ****** ****** *)
//
fun
trans2a_l2d2plst
( env0:
! tr2aenv, ldps: l2d2plst): l2d2plst
//
fun
trans2a_l2d2elst
( env0:
! tr2aenv, ldes: l2d2elst): l2d2elst
//
(* ****** ****** *)
//
fun
trans2a_f2arglst
( env0:
! tr2aenv, f2as: f2arglst): f2arglst
//
(* ****** ****** *)
//
fun
trans2a_d2gualst
( env0:
! tr2aenv, d2gs: d2gualst): d2gualst
fun
trans2a_d2clslst_tpck1
(env0:
!tr2aenv
,dcls: d2clslst
,targ: s2typ, tres: s2typ): d2clslst
//
(* ****** ****** *)
//
fun
trans2a_d2eclist
( env0:
! tr2aenv, dcls: d2eclist): d2eclist
//
(* ****** ****** *)
//
fun
trans2a_s2qaglst
( env0:
! tr2aenv, sqas: s2qaglst): s2qaglst
fun
trans2a_t2qaglst
( env0:
! tr2aenv, tqas: t2qaglst): t2qaglst
//
fun
trans2a_t2iaglst
( env0:
! tr2aenv, tias: t2iaglst): t2iaglst
//
(* ****** ****** *)
//
fun
trans2a_d2arglst
( env0:
! tr2aenv, d2as: d2arglst): d2arglst
//
(* ****** ****** *)
//
fun
trans2a_d2valdcl
( env0: 
! tr2aenv, dval: d2valdcl): d2valdcl
fun
trans2a_d2vardcl
( env0: 
! tr2aenv, dvar: d2vardcl): d2vardcl
//
(* ****** ****** *)
//
fun
trans2a_d2fundcl
( env0: 
! tr2aenv, dfun: d2fundcl): d2fundcl
//
(* ****** ****** *)
//
fun
trans2a_d2cstdcl
( env0: 
! tr2aenv, dcst: d2cstdcl): d2cstdcl
//
(* ****** ****** *)
//
fun
trans2a_d2valdclist
( env0:
! tr2aenv, d2vs: d2valdclist): d2valdclist
fun
trans2a_d2vardclist
( env0:
! tr2aenv, d2vs: d2vardclist): d2vardclist
//
fun
trans2a_d2fundclist
( env0:
! tr2aenv, d2fs: d2fundclist): d2fundclist
//
(* ****** ****** *)
//
fun
trans2a_d2cstdclist
( env0:
! tr2aenv, d2cs: d2cstdclist): d2cstdclist
//
(* ****** ****** *)
//
fun
trans2a_d2explstopt
( env0:
! tr2aenv, dopt: d2explstopt): d2explstopt
//
fun
trans2a_d2eclistopt
( env0:
! tr2aenv, dopt: d2eclistopt): d2eclistopt
//
(* ****** ****** *)
//
fun
unify2a_s2typ // effectful
( env0:
! tr2aenv
, t2p1:s2typ, t2p2:s2typ): (bool)
fun
unify2a_s2typlst // effectful
( env0:
! tr2aenv
, tps1:s2typlst, tps2:s2typ): bool
//
fun
match2a_s2typ // testing-only
( env0:
! tr2aenv
, t2p1:s2typ, t2p2:s2typ): bool
fun
match2a_s2typlst // testing-only
( env0:
! tr2aenv
, tps1:s2typlst, tps2:s2typlst): bool
//
#symload unify2a with unify2a_s2typ
#symload match2a with match2a_s2typ
#symload unify2a with unify2a_s2typlst
#symload match2a with match2a_s2typlst
//
(* ****** ****** *)
//
fun
trans2a_d2pat_tpck // regular
( env0:
! tr2aenv, d2p0:d2pat, t2p0:s2typ): d2pat
fun
trans2a_d2pat_tpkc // reversed
( env0:
! tr2aenv, d2p0:d2pat, t2p0:s2typ): d2pat
//
fun
trans2a_d2exp_tpck
( env0:
! tr2aenv, d2e0:d2exp, t2p0:s2typ): d2exp
//
(* ****** ****** *)
//
fun
trans2a_d2explst_tpck1
( env0:
! tr2aenv,d2es:d2explst,t2p0:s2typ): d2explst
//
(* ****** ****** *)
//
fun
trans2a_d2patlst_tpcks// HX: regular
( env0:
! tr2aenv,d2ps:d2patlst,t2ps:s2typlst): d2patlst
fun
trans2a_d2patlst_tpkcs // HX: reversed
( env0:
! tr2aenv,d2ps:d2patlst,t2ps:s2typlst): d2patlst
//
(*
fun
trans2a_d2explst_tpcks
( env0:
! tr2aenv,d2es:d2explst,t2ps:s2typlst): d2explst
*)
//
(* ****** ****** *)
//
fun
trans2a_d2cst_elim
( env0:
! tr2aenv
, loc0: loc_t
, d2c0: d2cst
, tqas: t2qas, tias: t2ias): (s2vts, s2typ)
//
fun
trans2a_f2arglst_elim
( env0:
! tr2aenv
, loc0: loc_t
, f2as:f2arglst, tfun:s2typ): (f2arglst,s2typ)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_SATS_trans2a.sats] *)
