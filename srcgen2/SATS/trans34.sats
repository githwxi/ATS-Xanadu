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
Wed Dec 27 11:25:36 EST 2023
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
tr34env_vtbx
#vwtpdef
tr34env = tr34env_vtbx
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
#staload
LOC = "./locinfo.sats"
#staload
LEX = "./lexing0.sats"
(* ****** ****** *)
#staload
S1E = "./staexp1.sats"
(* ****** ****** *)
#staload
S2E = "./staexp2.sats"
#staload
T2P = "./statyp2.sats"
(* ****** ****** *)
#staload
D2E = "./dynexp2.sats"
#staload
D3E = "./dynexp3.sats"
#staload
D4E = "./dynexp4.sats"
(* ****** ****** *)
(* ****** ****** *)
#typedef sym_t = $SYM.sym_t
(* ****** ****** *)
//
#typedef loc_t = $LOC.loc_t
//
#typedef token = $LEX.token
//
(* ****** ****** *)
#typedef s1exp = $S1E.s1exp
(* ****** ****** *)
#typedef s2var = $S2E.s2var
#typedef s2cst = $S2E.s2cst
(* ****** ****** *)
#typedef s2exp = $S2E.s2exp
#typedef s2typ = $S2E.s2typ
(* ****** ****** *)
#typedef d2var = $D2E.d2var
(* ****** ****** *)
(* ****** ****** *)
#typedef d3pat = $D3E.d3pat
#typedef l3d3p = $D3E.l3d3p
(* ****** ****** *)
#typedef d3exp = $D3E.d3exp
#typedef l3d3e = $D3E.l3d3e
(* ****** ****** *)
#typedef f3arg = $D3E.f3arg
(* ****** ****** *)
#typedef d3ecl = $D3E.d3ecl
(* ****** ****** *)
(* ****** ****** *)
#typedef d2vts = $D4E.d2vts
(* ****** ****** *)
#typedef d4pat = $D4E.d4pat
#typedef l4d4p = $D4E.l4d4p
(* ****** ****** *)
#typedef d4exp = $D4E.d4exp
#typedef l4d4e = $D4E.l4d4e
(* ****** ****** *)
#typedef f4arg = $D4E.f4arg
(* ****** ****** *)
#typedef d4ecl = $D4E.d4ecl
(* ****** ****** *)
(* ****** ****** *)
#typedef s2typlst = $S2E.s2typlst
(* ****** ****** *)
#typedef d2varlst = $D2E.d2varlst
(* ****** ****** *)
#typedef d3patlst = $D3E.d3patlst
#typedef l3d3plst = $D3E.l3d3plst
(* ****** ****** *)
#typedef d3explst = $D3E.d3explst
#typedef d3expopt = $D3E.d3expopt
#typedef l3d3elst = $D3E.l3d3elst
(* ****** ****** *)
#typedef f3arglst = $D3E.f3arglst
(* ****** ****** *)
#typedef d3eclist = $D3E.d3eclist
(* ****** ****** *)
#typedef teqd3exp = $D3E.teqd3exp
(* ****** ****** *)
#typedef d3valdcl = $D3E.d3valdcl
#typedef d3vardcl = $D3E.d3vardcl
#typedef d3fundcl = $D3E.d3fundcl
(* ****** ****** *)
#typedef d3parsed = $D3E.d3parsed
(* ****** ****** *)
(* ****** ****** *)
#typedef d4patlst = $D4E.d4patlst
#typedef l4d4plst = $D4E.l4d4plst
(* ****** ****** *)
#typedef d4explst = $D4E.d4explst
#typedef d4expopt = $D4E.d4expopt
#typedef l4d4elst = $D4E.l4d4elst
(* ****** ****** *)
#typedef f4arglst = $D4E.f4arglst
(* ****** ****** *)
#typedef d4eclist = $D4E.d4eclist
(* ****** ****** *)
#typedef teqd4exp = $D4E.teqd4exp
(* ****** ****** *)
#typedef d4valdcl = $D4E.d4valdcl
#typedef d4vardcl = $D4E.d4vardcl
#typedef d4fundcl = $D4E.d4fundcl
(* ****** ****** *)
#typedef d4parsed = $D4E.d4parsed
(* ****** ****** *)
(* ****** ****** *)
#vwtpdef s2typopt_vt = optn_vt(s2typ)
(* ****** ****** *)
#typedef d3valdclist = $D3E.d3valdclist
#typedef d3vardclist = $D3E.d3vardclist
#typedef d3fundclist = $D3E.d3fundclist
(* ****** ****** *)
#typedef d4valdclist = $D4E.d4valdclist
#typedef d4vardclist = $D4E.d4vardclist
#typedef d4fundclist = $D4E.d4fundclist
(* ****** ****** *)
#typedef d3explstopt = $D3E.d3explstopt
#typedef d4explstopt = $D4E.d4explstopt
(* ****** ****** *)
#typedef d3eclistopt = $D3E.d3eclistopt
#typedef d4eclistopt = $D4E.d4eclistopt
(* ****** ****** *)
(* ****** ****** *)
//
fun
s2typlst_of_d4patlst:
  (d4patlst) -> s2typlst
fun
s2typlst_of_d4explst:
  (d4explst) -> s2typlst
//
#symload
s2typlst
  with s2typlst_of_d4patlst
#symload
s2typlst
  with s2typlst_of_d4explst
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d4parsed_of_trans34
( dpar : d3parsed ): (d4parsed)
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
d4lft =
//
|D4LFTval of d2var
|D4LFTvar of d2var
(*
|D4LFTpcon of
(tnode(*kind*), label, d4lft)
|D4LFTproj of
(tnode(*kind*), label, d4lft)
*)
//
(* ****** ****** *)
//
fun
d4lft_fprint
(out: FILR, dlft: d4lft): void
//
(* ****** ****** *)
//
datatype
d4typ =
//
|D4TYPstp of s2typ
|D4TYPpat of d4pat
(*
|
D4TYPpcon of (d2con, d4typlst)
|
D4TYPproj of (tnode, d4typlst)
*)
//
where
{
#typedef
d4typlst = list(d4typ)
#vwtpdef
d4typopt_vt = optn_vt(d4typ)
}
//
(* ****** ****** *)
fun
d4typ_get_styp(d4typ): s2typ
(* ****** ****** *)
//
fun
d4typ_fprint
(out: FILR, dtyp: d4typ): void
//
(* ****** ****** *)
(* ****** ****** *)
//
#absvtbx linstk_vtbx // ptr
#vwtpdef linstk = linstk_vtbx
//
(* ****** ****** *)
//
fun
linstk_lamvars
  ( stk: !linstk ): d2varlst
fun
linstk_letvars
  ( stk: !linstk ): d2varlst
//
(* ****** ****** *)
//
fun
linstk_poptop0
  ( stk: &linstk >> _ ): sint
//
(* ****** ****** *)
//
fun
linstk_pshlam0
  ( stk: &linstk >> _ ): void
fun
linstk_pshlet0
  ( stk: &linstk >> _ ): void
//
fun
linstk_poplam0
  ( stk: &linstk >> _ ): sint
fun
linstk_poplet0
  ( stk: &linstk >> _ ): sint
//
(* ****** ****** *)
//
fun
linstk_pshift0
  ( stk: &linstk >> _ ): void
fun
linstk_pshcas0
  ( stk: &linstk >> _ ): void
//
fun
linstk_popift0
  ( stk: &linstk >> _ ): sint
fun
linstk_popcas0
  ( stk: &linstk >> _ ): sint
//
(* ****** ****** *)
//
(*
HX-2024-02-17:
Maybe [pop] and [get] can be
merged into a single function
*)
//
fun
linstk_getlam0
  ( stk: &linstk >> _ ): d2vts
fun
linstk_getlet0
  ( stk: &linstk >> _ ): d2vts
//
fun
linstk_getift0
  ( stk: &linstk >> _ ): d2vts
fun
linstk_getcas0
  ( stk: &linstk >> _ ): d2vts
//
(* ****** ****** *)
//
fun
linstk_d2vins_dvar
(stk:
&linstk >> _, d2var, d4typ):void
fun
linstk_d2vins_denv
(stk:
&linstk >> _, d2var, d4typ):void
//
fun
linstk_d2vins_dget
(stk:
&linstk >> _, d2var, d4typ):void
fun
linstk_d2vins_dset
(stk:
&linstk >> _, d2var, d4typ):void
//
fun
linstk_d2vins_dvtp
(stk:
&linstk >> _, d2var, d4typ):void
//
(*
fun
linstk_d2vins_dlft
(stk:
&linstk >> _, d2var, d4lft):void
*)
//
(* ****** ****** *)
//
fun
linstk_search_dvar
(stk:
!linstk, d2v: d2var): s2typopt_vt
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d2vts_z2merge
(xts1:d2vts, xts2:d2vts): (d2vts)
//
(* ****** ****** *)
//
(*
HX-2024-02-17:
It is a special utility function:
Note that only the last entry for
each d2var is kept in the output!
*)
//
fun
d2vdtplst_d2vtize
( dvts
: list_vt@(d2var,d4typ)): (d2vts)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
tr34env_make_nil((*nil*)):tr34env
fun
tr34env_free_top(tr34env):d2varlst
//
(* ****** ****** *)
//
fun
tr34env_pshlam0
(env0: !tr34env): void//end-fun
fun
tr34env_pshlet0
(env0: !tr34env): void//end-fun
//
fun
tr34env_poplam0
(env0: !tr34env): void//end-fun
fun
tr34env_poplet0
(env0: !tr34env): void//end-fun
//
(* ****** ****** *)
//
fun
tr34env_pshift0
(env0: !tr34env): void//end-fun
fun
tr34env_pshcas0
(env0: !tr34env): void//end-fun
//
fun
tr34env_popift0
(env0: !tr34env): void//end-fun
fun
tr34env_popcas0
(env0: !tr34env): void//end-fun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
tr34env_getlam0
(env0: !tr34env): d2vts//end-fun
fun
tr34env_getlet0
(env0: !tr34env): d2vts//end-fun
//
fun
tr34env_getift0
(env0: !tr34env): d2vts//end-fun
fun
tr34env_getcas0
(env0: !tr34env): d2vts//end-fun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
tr34env_evstyp_cst
(env0:
!tr34env, s2c0: s2cst): s2typopt_vt
//
(* ****** ****** *)
//
fun
tr34env_d2vins_dvar
( env0:
! tr34env
, d2v0: d2var, stp0: s2typ): (void)
fun
tr34env_d2vins_denv
( env0:
! tr34env
, d2v0: d2var, dtp0: d4typ): (void)
//
fun
tr34env_d2vins_dget
( env0:
! tr34env
, d2v0: d2var, dtp0: d4typ): (void)
fun
tr34env_d2vins_dset
( env0:
! tr34env
, d2v0: d2var, dtp0: d4typ): (void)
//
fun
tr34env_d2vins_dvtp // dvtp->dput?
( env0:
! tr34env
, d2v0: d2var, t2p0: s2typ): (void)
//
(*
fun
tr34env_d2vins_dlft
(env0:
!tr34env
,d2v0: d2var, dlft: d4lft): (void)
*)
//
(* ****** ****** *)
//
fun
tr34env_insert_dpat
( env0:
! tr34env, d4p0: d4pat): (void)
fun
tr34env_insert_farg
( env0:
! tr34env, farg: f4arg): (void)
//
fun
tr34env_insert_dpatlst
( env0:
! tr34env, d4ps: d4patlst): (void)
fun
tr34env_insert_farglst
( env0:
! tr34env, f4as: f4arglst): (void)
//
(* ****** ****** *)
//
fun
tr34env_search_dvar
( env0:
! tr34env, d2v0: d2var): s2typopt_vt
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
list_trans34_fnp
( e1:
! tr34env
, xs: list(x0)
, (!tr34env, x0) -> y0 ) : list(y0)
fun
<x0:t0>
<y0:t0>
optn_trans34_fnp
( e1:
! tr34env
, xs: optn(x0)
, (!tr34env, x0) -> y0 ) : optn(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
trans34_d3pat
(env0: !tr34env, d3p0: d3pat): d4pat
fun
trans34_l3d3p
(env0: !tr34env, ld3p: l3d3p): l4d4p
//
(* ****** ****** *)
//
fun
trans34_d3exp
(env0: !tr34env, d3e0: d3exp): d4exp
fun
trans34_l3d3e
(env0: !tr34env, ld3e: l3d3e): l4d4e
//
(* ****** ****** *)
//
fun
trans34_d3thn
( env0:
! tr34env, dthn: d3expopt): d4expopt
fun
trans34_d3els
( env0:
! tr34env, dthn: d3expopt): d4expopt
//
(* ****** ****** *)
//
fun
trans34_f3arg
(env0: !tr34env, farg: f3arg): f4arg
//
(* ****** ****** *)
//
fun
trans34_d3ecl
(env0: !tr34env, d3cl: d3ecl): d4ecl
//
(* ****** ****** *)
//
fun
trans34_d3patlst
( env0:
! tr34env, d3ps: d3patlst): d4patlst
//
fun
trans34_l3d3plst
( env0:
! tr34env, ldps: l3d3plst): l4d4plst
//
(* ****** ****** *)
//
fun
trans34_d3explst
( env0:
! tr34env, d3es: d3explst): d4explst
fun
trans34_d3expopt
( env0:
! tr34env, dopt: d3expopt): d4expopt
//
fun
trans34_l3d3elst
( env0:
! tr34env, ldes: l3d3elst): l4d4elst
//
(* ****** ****** *)
//
fun
trans34_f3arglst
( env0:
! tr34env, f3as: f3arglst): f4arglst
//
(* ****** ****** *)
//
fun
trans34_d3eclist
( env0:
! tr34env, dcls: d3eclist): d4eclist
//
(* ****** ****** *)
//
fun
trans34_teqd3exp
( env0: 
! tr34env, tdxp: teqd3exp): teqd4exp
//
(* ****** ****** *)
//
fun
trans34_d3valdcl
( env0: 
! tr34env, dval: d3valdcl): d4valdcl
fun
trans34_d3vardcl
( env0: 
! tr34env, dvar: d3vardcl): d4vardcl
//
(* ****** ****** *)
//
fun
trans34_d3fundcl
( env0: 
! tr34env, dfun: d3fundcl): d4fundcl
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
trans34_d3valdclist
( env0: 
! tr34env, d3vs: d3valdclist): d4valdclist
//
fun
trans34_d3vardclist
( env0: 
! tr34env, d3vs: d3vardclist): d4vardclist
//
(* ****** ****** *)
//
fun
trans34_d3fundclist
( env0: 
! tr34env, d3fs: d3fundclist): d4fundclist
//
(* ****** ****** *)
//
fun
trans34_d3explstopt
( env0:
! tr34env, dopt: d3explstopt): d4explstopt
//
fun
trans34_d3eclistopt
( env0:
! tr34env, dopt: d3eclistopt): d4eclistopt
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
unify34_s2typ // effectful
( env0:
! tr34env
, t2p1: s2typ, t2p2: s2typ): bool
fun
unify34_s2typlst // effectful
( env0:
! tr34env
, tps1: s2typlst, tps2: s2typ): bool
//
#symload unify34 with unify34_s2typ
#symload unify34 with unify34_s2typlst
//
(* ****** ****** *)
(*
//
fun
match34_s2typ // testing-only
( env0:
! tr34env
, t2p1:s2typ, t2p2:s2typ): bool
fun
match34_s2typlst // testing-only
( env0:
! tr34env
, tps1:s2typlst, tps2:s2typlst): bool
//
#symload match34 with match34_s2typ
#symload match34 with match34_s2typlst
//
*)
(* ****** ****** *)
(* ****** ****** *)
//
fun
trans34_d3pat_tpck
( env0: !tr34env
, d3p0: d3pat, t2p0: s2typ): d4pat
fun
trans34_d3exp_tpck
( env0: !tr34env
, d3e0: d3exp, t2p0: s2typ): d4exp
//
(* ****** ****** *)
//
fun
trans34_d4pat_tpck
( env0: !tr34env
, d4p0: d4pat, t2p0: s2typ): d4pat
fun
trans34_d4exp_tpck
( env0: !tr34env
, d4e0: d4exp, t2p0: s2typ): d4exp
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
trans34_d4exp_ptck
( env0: !tr34env
, d4e0: d4exp, t2p0: s2typ): d4exp
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-02-18:
It checks that
[env0] matches the given [dvts]
*)
fun
trans34_d4exp_vtck
( env0: !tr34env
, d4e0: d4exp, dvts: d2vts): d4exp
//
(* ****** ****** *)
//
fun
trans34_d4ift_dvts
( env0: !tr34env
, d4e0: d4exp, dvts: d2vts): d4exp
fun
trans34_d4cas_dvts
( env0: !tr34env
, d4e0: d4exp, dvts: d2vts): d4exp
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
trans34_d4explst_ptcks
( env0:
! tr34env
, loc0: loc_t
, d4es: d4explst, t2ps: s2typlst): d4explst
//
fun
trans34_d4explst_tpcks
( env0:
! tr34env
, loc0: loc_t
, d4es: d4explst, t2ps: s2typlst): d4explst
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d4parsed_from_fpath
(stadyn: sint, source: strn(*fpath*)): d4parsed
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans34.sats] *)
