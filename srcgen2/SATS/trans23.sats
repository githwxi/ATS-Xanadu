(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
Tue 14 Feb 2023 12:03:53 PM EST
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
tr23env_vtbx
#vwtpdef
tr23env = tr23env_vtbx
(* ****** ****** *)
#staload
BAS = "./xbasics.sats"
#typedef
f2clknd = $BAS.f2clknd
(* ****** ****** *)
//
#staload
SYM = "./xsymbol.sats"
//
(*
#staload
MAP = "./xsymmap.sats"
*)
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
#typedef label = $LAB.label
//
#typedef loc_t = $LOC.loc_t
//
#typedef token = $LEX.token
//
(* ****** ****** *)
(*
#staload S1E = "./staexp1.sats"
*)
#staload D1E = "./dynexp1.sats"
(* ****** ****** *)
#staload S2E = "./staexp2.sats"
(* ****** ****** *)
#staload D2E = "./dynexp2.sats"
#staload D3E = "./dynexp3.sats"
(* ****** ****** *)
#typedef s2cst = $S2E.s2cst
#typedef s2exp = $S2E.s2exp
#typedef s2typ = $S2E.s2typ
(* ****** ****** *)
#typedef d2var = $D2E.d2var
#typedef d2con = $D2E.d2con
#typedef d2cst = $D2E.d2cst
(* ****** ****** *)
#typedef d2pat = $D2E.d2pat
#typedef l2d2p = $D2E.l2d2p
#typedef d2exp = $D2E.d2exp
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
#typedef t2jag = $D3E.t2jag
(* ****** ****** *)
#typedef d3pat = $D3E.d3pat
#typedef l3d3p = $D3E.l3d3p
#typedef d3exp = $D3E.d3exp
#typedef l3d3e = $D3E.l3d3e
(* ****** ****** *)
#typedef f3arg = $D3E.f3arg
(* ****** ****** *)
#typedef d3gua = $D3E.d3gua
#typedef d3gpt = $D3E.d3gpt
#typedef d3cls = $D3E.d3cls
(* ****** ****** *)
#typedef d3ecl = $D3E.d3ecl
(* ****** ****** *)
//
#typedef s2cstlst = $S2E.s2cstlst
#typedef s2explst = $S2E.s2explst
#typedef s2typlst = $S2E.s2typlst
#typedef l2t2plst = $S2E.l2t2plst
//
(* ****** ****** *)
#typedef d2varlst = $D2E.d2varlst
#typedef d2conlst = $D2E.d2conlst
#typedef d2cstlst = $D2E.d2cstlst
(* ****** ****** *)
//
#typedef d2patlst = $D2E.d2patlst
#typedef d2patopt = $D2E.d2patopt
#typedef l2d2plst = $D2E.l2d2plst
//
#typedef d2explst = $D2E.d2explst
#typedef d2expopt = $D2E.d2expopt
#typedef l2d2elst = $D2E.l2d2elst
//
(* ****** ****** *)
#typedef t2jaglst = $D3E.t2jaglst
(* ****** ****** *)
//
#typedef d3patlst = $D3E.d3patlst
#typedef d3patopt = $D3E.d3patopt
#typedef l3d3plst = $D3E.l3d3plst
//
#typedef d3explst = $D3E.d3explst
#typedef d3expopt = $D3E.d3expopt
#typedef l3d3elst = $D3E.l3d3elst
//
(* ****** ****** *)
#typedef f2arglst = $D2E.f2arglst
#typedef f3arglst = $D3E.f3arglst
(* ****** ****** *)
#typedef d2gualst = $D2E.d2gualst
#typedef d2clslst = $D2E.d2clslst
#typedef d3gualst = $D3E.d3gualst
#typedef d3clslst = $D3E.d3clslst
(* ****** ****** *)
#typedef d2eclist = $D2E.d2eclist
#typedef d3eclist = $D3E.d3eclist
(* ****** ****** *)
#typedef teqd2exp = $D2E.teqd2exp
#typedef teqd3exp = $D3E.teqd3exp
(* ****** ****** *)
#typedef d2valdcl = $D2E.d2valdcl
#typedef d2vardcl = $D2E.d2vardcl
#typedef d2fundcl = $D2E.d2fundcl
(* ****** ****** *)
#typedef d3valdcl = $D3E.d3valdcl
#typedef d3vardcl = $D3E.d3vardcl
#typedef d3fundcl = $D3E.d3fundcl
(* ****** ****** *)
#typedef d1topenv = $D1E.d1topenv
#typedef d2topenv = $D2E.d2topenv
(* ****** ****** *)
#typedef d2parsed = $D2E.d2parsed
#typedef d3parsed = $D3E.d3parsed
(* ****** ****** *)
#vwtpdef s2typopt_vt = optn_vt(s2typ)
(* ****** ****** *)
#typedef d2valdclist = $D2E.d2valdclist
#typedef d2vardclist = $D2E.d2vardclist
#typedef d2fundclist = $D2E.d2fundclist
(* ****** ****** *)
#typedef d3valdclist = $D3E.d3valdclist
#typedef d3vardclist = $D3E.d3vardclist
#typedef d3fundclist = $D3E.d3fundclist
(* ****** ****** *)
(*
#typedef d2cstdclist = $D2E.d2cstdclist
#typedef d3cstdclist = $D3E.d3cstdclist
*)
(* ****** ****** *)
#typedef d2explstopt = $D2E.d2explstopt
#typedef d3explstopt = $D3E.d3explstopt
(* ****** ****** *)
#typedef d2eclistopt = $D2E.d2eclistopt
#typedef d3eclistopt = $D3E.d3eclistopt
(* ****** ****** *)
//
(*
HX:
[tfun] is for providing
funclo information here:
*)
fun
s2typ_fun1_f3arglst
(f3as
:f3arglst
,tfun:s2typ,tres:s2typ): s2typ
//
(* ****** ****** *)
//
fun
s2typlst_of_d3patlst
( d3ps: d3patlst ): s2typlst
#symload
s2typlst with s2typlst_of_d3patlst
//
fun
s2typlst_of_d3explst
( d3es: d3explst ): s2typlst
#symload
s2typlst with s2typlst_of_d3explst
//
(* ****** ****** *)
//
fun
l2t2plst_of_l3d3plst
( ldps: l3d3plst ): l2t2plst
#symload
l2t2plst with l2t2plst_of_l3d3plst
//
fun
l2t2plst_of_l3d3elst
( ldes: l3d3elst ): l2t2plst
#symload
l2t2plst with l2t2plst_of_l3d3elst
//
(* ****** ****** *)
//
fun
d3parsed_of_trans23
( dpar : d2parsed ): (d3parsed)
//
(* ****** ****** *)
//
fun
tr23env_make_nil((*nil*)):tr23env
fun
tr23env_free_top(tr23env): (void)
//
(* ****** ****** *)
//
fun
tr23env_poplet0(env0: !tr23env): void
fun
tr23env_pshlet0(env0: !tr23env): void
fun
tr23env_pshloc1(env0: !tr23env): void
fun
tr23env_pshloc2(env0: !tr23env): void
//
fun
tr23env_locjoin(env0: !tr23env): void
//
(* ****** ****** *)
//
fun
tr23env_search_opt
( env0:
! tr23env
, s2c0: s2cst): s2cstlst
fun
tr23env_insert_any
( env0: !tr23env, s2c0: s2cst): void
//
fun
tr23env_evstyp_cst
( env0:
! tr23env, s2c0: s2cst): s2typopt_vt
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
list_trans23_fnp
( e1:
! tr23env
, xs: list(x0)
, (!tr23env, x0) -> y0): list(y0)
fun
<x0:t0>
<y0:t0>
optn_trans23_fnp
( e1:
! tr23env
, xs: optn(x0)
, (!tr23env, x0) -> y0): optn(y0)
//
(* ****** ****** *)
//
fun
d2con23_tjagize
( loc0: loc_t
, dcon: d2con): (t2jaglst, s2typ)
fun
d2con23_tapqize
(loc0: loc_t, dcon: d2con): d3exp
//
fun
d2cst23_tapqize
(loc0: loc_t, dcst: d2cst): d3exp
//
(* ****** ****** *)
//
fun
d3pat_sapqize(d3p0: d3pat): d3pat
fun
d3exp_sapqize(d3e0: d3exp): d3exp
//
(* ****** ****** *)
//
fun
trans23_d2pat
(env0: !tr23env, d2p0: d2pat): d3pat
fun
trans23_l2d2p
(env0: !tr23env, ld2p: l2d2p): l3d3p
//
(* ****** ****** *)
//
fun
trans23_d2exp
(env0: !tr23env, d2e0: d2exp): d3exp
fun
trans23_l2d2e
(env0: !tr23env, ld2e: l2d2e): l3d3e
//
(* ****** ****** *)
//
fun
trans23_f2arg
(env0: !tr23env, f2a0: f2arg): f3arg
//
(* ****** ****** *)
//
fun
trans23_d2gua
(env0: !tr23env, d2g0: d2gua): d3gua
fun
trans23_d2gpt_tpck
( env0:
! tr23env
, dgpt : d2gpt, targ : s2typ): d3gpt
fun
trans23_d2cls_tpck
( env0:
! tr23env
, dcls : d2cls
, targ : s2typ, tres : s2typ): d3cls
//
(* ****** ****** *)
//
fun
trans23_d2ecl
(env0: !tr23env, d3cl: d2ecl): d3ecl
//
(* ****** ****** *)
//
fun
trans23_d2patlst
( env0:
! tr23env, d2ps: d2patlst): d3patlst
//
fun
trans23_l2d2plst
( env0:
! tr23env, ldps: l2d2plst): l3d3plst
//
(* ****** ****** *)
//
fun
trans23_d2explst
( env0:
! tr23env, d2es: d2explst): d3explst
//
fun
trans23_d2expopt
( env0:
! tr23env, dopt: d2expopt): d3expopt
//
fun
trans23_l2d2elst
( env0:
! tr23env, ldes: l2d2elst): l3d3elst
//
(* ****** ****** *)
//
fun
trans23_f2arglst
( env0:
! tr23env, f2as: f2arglst): f3arglst
//
(* ****** ****** *)
//
fun
trans23_d2gualst
( env0:
! tr23env, d2gs: d2gualst): d3gualst
fun
trans23_d2clslst_tpck1
(env0:
!tr23env
,dcls: d2clslst
,targ: s2typ, tres: s2typ): d3clslst
//
(* ****** ****** *)
//
fun
trans23_d2eclist
( env0:
! tr23env, dcls: d2eclist): d3eclist
//
(* ****** ****** *)
//
fun
trans23_teqd2exp
( env0: 
! tr23env, tdxp: teqd2exp): teqd3exp
//
(* ****** ****** *)
//
fun
trans23_d2valdcl
( env0: 
! tr23env, dval: d2valdcl): d3valdcl
fun
trans23_d2vardcl
( env0: 
! tr23env, dvar: d2vardcl): d3vardcl
//
(* ****** ****** *)
//
fun
trans23_d2fundcl
( env0: 
! tr23env, dfun: d2fundcl): d3fundcl
//
(* ****** ****** *)
//
fun
trans23_d2valdclist
( env0:
! tr23env, d2vs: d2valdclist): d3valdclist
fun
trans23_d2vardclist
( env0:
! tr23env, d2vs: d2vardclist): d3vardclist
//
fun
trans23_d2fundclist
( env0:
! tr23env, d2fs: d2fundclist): d3fundclist
//
(* ****** ****** *)
//
(*
fun
trans23_d2cstdclist
( env0:
! tr23env, d2cs: d2cstdclist): d3cstdclist
*)
//
(* ****** ****** *)
//
fun
trans23_d2explstopt
( env0:
! tr23env, dopt: d2explstopt): d3explstopt
//
fun
trans23_d2eclistopt
( env0:
! tr23env, dopt: d2eclistopt): d3eclistopt
//
(* ****** ****** *)
//
fun
unify23_s2typ // effectful
( env0:
! tr23env
, t2p1: s2typ, t2p2: s2typ): bool
fun
unify23_s2typlst // effectful
( env0:
! tr23env
, tps1: s2typlst, tps2: s2typ): bool
//
#symload unify23 with unify23_s2typ
#symload unify23 with unify23_s2typlst
//
(* ****** ****** *)
(*
//
fun
match23_s2typ // testing-only
( env0:
! tr23env
, t2p1:s2typ, t2p2:s2typ): bool
fun
match23_s2typlst // testing-only
( env0:
! tr23env
, tps1:s2typlst, tps2:s2typlst): bool
//
#symload match23 with match23_s2typ
#symload match23 with match23_s2typlst
//
*)
(* ****** ****** *)
(*
HX-2023-02-25:
For type-checking level-3 dynexps
*)
(* ****** ****** *)
fun
trans23_d2pat_tpck
( env0: !tr23env
, d2p0: d2pat, t2p0: s2typ): d3pat
(* ****** ****** *)
fun
trans23_d2exp_tpck
( env0: !tr23env
, d2e0: d2exp, t2p0: s2typ): d3exp
(* ****** ****** *)
fun
trans23_d3pat_tpck
( env0: !tr23env
, d3p0: d3pat, t2p0: s2typ): d3pat
(* ****** ****** *)
fun
trans23_d3exp_tpck
( env0: !tr23env
, d3e0: d3exp, t2p0: s2typ): d3exp
(* ****** ****** *)
fun
trans23_d2patlst_tpck1
( env0:
! tr23env
, d2ps: d2patlst, t2p0: s2typ): d3patlst
fun
trans23_d3patlst_tpck1
( env0:
! tr23env
, d3ps: d3patlst, t2p0: s2typ): d3patlst
fun
trans23_d3patlst_tpcks
( env0:
! tr23env
, loc0: loc_t
, d3ps: d3patlst, t2ps: s2typlst): d3patlst
(* ****** ****** *)
fun
trans23_d2explst_tpck1
( env0:
! tr23env
, d2es: d2explst, t2p0: s2typ): d3explst
fun
trans23_d3explst_tpck1
( env0:
! tr23env
, d3es: d3explst, t2p0: s2typ): d3explst
fun
trans23_d3explst_tpcks
( env0:
! tr23env
, loc0: loc_t
, d3es: d3explst, t2ps: s2typlst): d3explst
(* ****** ****** *)
//
fun
d3parsed_from_fpath
(stadyn: sint, source: strn(*fpath*)): d3parsed
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans23.sats] *)
