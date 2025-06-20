(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Sun May 11 09:05:29 AM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"xatslib\
/libcats\
/HATS/libcats_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload
"./../SATS/staexp1.sats"
#staload
"./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload
"./../SATS/statyp2.sats"
#staload
"./../SATS/dynexp2.sats"
(* ****** ****** *)
(* ****** ****** *)
#staload
SYM = "./\
../../../SATS/xsymbol.sats"
#staload
FIL = "./\
../../../SATS/filpath.sats"
#staload
LOC = "./\
../../../SATS/locinfo.sats"
#staload
LEX = "./\
../../../SATS/lexing0.sats"
(* ****** ****** *)
#staload
D2E = "./\
../../../SATS/dynexp2.sats"
#staload
D3E = "./\
../../../SATS/dynexp3.sats"
(* ****** ****** *)
(* ****** ****** *)
#typedef sym_t = $SYM.sym_t
#typedef symbl = $SYM.symbl
(* ****** ****** *)
#typedef fpath = $FIL.fpath
(* ****** ****** *)
#typedef lcsrc = $LOC.lcsrc
#typedef loctn = $LOC.loctn
(* ****** ****** *)
#typedef token = $LEX.token
(* ****** ****** *)
#typedef d2cst = $D2E.d2cst
#typedef s2qag = $D2E.s2qag
#typedef t2qag = $D2E.t2qag
#typedef t2iag = $D2E.t2iag
(* ****** ****** *)
#typedef d3pat = $D3E.d3pat
#typedef d3exp = $D3E.d3exp
#typedef d3ecl = $D3E.d3ecl
(* ****** ****** *)
(* ****** ****** *)
#abstbox d3pat1_tbox // p0tr
#typedef d3pat1 = d3pat1_tbox
(* ****** ****** *)
#abstbox d3exp1_tbox // p0tr
#typedef d3exp1 = d3exp1_tbox
(* ****** ****** *)
#abstbox f3arg1_tbox // p0tr
#typedef f3arg1 = f3arg1_tbox
(* ****** ****** *)
#abstbox d3ecl1_tbox // p0tr
#typedef d3ecl1 = d3ecl1_tbox
(* ****** ****** *)
//
#abstbox d3valdcl1_tbox//p0tr
#abstbox d3vardcl1_tbox//p0tr
#abstbox d3fundcl1_tbox//p0tr
//
(* ****** ****** *)
//
#abstbox d3parsed1_tbox//p0tr
//
(* ****** ****** *)
(* ****** ****** *)
#typedef fpathopt = optn(fpath)
#typedef d2cstlst = list(d2cst)
#typedef s2qaglst = list(s2qag)
#typedef t2qaglst = list(t2qag)
#typedef t2iaglst = list(t2iag)
#typedef d3patlst = list(d3pat)
#typedef d3explst = list(d3exp)
#typedef d3eclist = list(d3ecl)
(* ****** ****** *)
#typedef d3pat1lst = list(d3pat1)
#typedef d3exp1lst = list(d3exp1)
#typedef d3ecl1lst = list(d3ecl1)
(* ****** ****** *)
#typedef d3pat1opt = optn(d3pat1)
#typedef d3exp1opt = optn(d3exp1)
#typedef d3ecl1opt = optn(d3ecl1)
(* ****** ****** *)
#typedef f3arg1lst = list(f3arg1)
(* ****** ****** *)
#typedef d3valdcl1 = d3valdcl1_tbox
#typedef d3vardcl1 = d3vardcl1_tbox
#typedef d3fundcl1 = d3fundcl1_tbox
(* ****** ****** *)
#typedef d3parsed1 = d3parsed1_tbox
(* ****** ****** *)
#typedef d3valdcl1lst = list(d3valdcl1)
#typedef d3vardcl1lst = list(d3vardcl1)
#typedef d3fundcl1lst = list(d3fundcl1)
(* ****** ****** *)
#typedef d3ecl1lstopt = optn(d3ecl1lst)
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3pat_fprint
(dpat: d3pat, out0: FILR): void
fun
d3exp_fprint
(dexp: d3exp, out0: FILR): void
fun
d3ecl_fprint
(d3cl: d3ecl, out0: FILR): void
//
#symload
fprint with d3pat_fprint of 1000
#symload
fprint with d3exp_fprint of 1000
#symload
fprint with d3ecl_fprint of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
d3pat1_node =
//
|D3P1any of ()
|D3P1var of d2var
//
|D3P1int of token
|D3P1btf of sym_t
|D3P1chr of token
|D3P1flt of token
|D3P1str of token
//
|D3P1dapp of
(d3pat
,sint(*npf*), d3pat1lst(*darg*)
) (* D3P1dapp *)
//
|D3P1rfpt of
(d3pat1,token(*AS*),d3pat1(*aspt*))
//
|D3P1tup0 of (sint(*npf*), d3pat1lst)
//
|D3P1tup1 of
(
token(*knd*), sint(*npf*), d3pat1lst)
//
|D3P1d3pat of (d3pat)//yet-to-be-copied
//
|D3P1errck of (sint(*lvl*), d3pat1(*err*))
//
(* ****** ****** *)
//
fun
d3pat1_lctn$get
(dpat: d3pat1): loctn
#symload lctn with d3pat1_lctn$get
fun
d3pat1_styp$get
(dpat: d3pat1): s2typ
#symload styp with d3exp1_styp$get
fun
d3pat1_node$get
(dpat: d3pat1): d3pat1_node
#symload node with d3pat1_node$get
//
fun
d3pat1_fprint
(dpat: d3pat1, out0: FILR): void
#symload fprint with d3pat1_fprint of 1000
//
(* ****** ****** *)
//
fun
d3pat1_make_lctn$node
(loc0: loctn, node: d3pat1_node): d3pat1
fun
d3pat1_make_lctn$styp$node
(loc0: loctn
,t2p0: s2typ, node: d3pat1_node): d3pat1
#symload d3pat1 with d3pat1_make_lctn$node
#symload d3pat1 with d3pat1_make_lctn$styp$node
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
d3exp1_node =
//
(* ****** ****** *)
//
|D3E1int of token
|D3E1btf of sym_t
|D3E1chr of token
|D3E1flt of token
|D3E1str of token
//
(* ****** ****** *)
//
|D3E1d3exp of (d3exp)//yet-to-be-copied
//
|D3E1errck of (sint(*lvl*), d3exp1(*err*))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp1_lctn$get
(dexp: d3exp1): loctn
#symload lctn with d3exp1_lctn$get
fun
d3exp1_styp$get
(dexp: d3exp1): s2typ
#symload styp with d3exp1_styp$get
fun
d3exp1_node$get
(dexp: d3exp1): d3exp1_node
#symload node with d3exp1_node$get
//
(* ****** ****** *)
//
fun
d3exp1_fprint
(dexp: d3exp1, out0: FILR): void
#symload fprint with d3exp1_fprint of 1000
//
(* ****** ****** *)
//
fun
d3exp1_make_lctn$node
(loc0: loctn, node: d3exp1_node): d3exp1
fun
d3exp1_make_lctn$styp$node
(loc0: loctn
,t2p0: s2typ, node: d3exp1_node): d3exp1
#symload d3exp1 with d3exp1_make_lctn$node
#symload d3exp1 with d3exp1_make_lctn$styp$node
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
teqd3exp1 =
|
TEQD3EXP1none of ((*void*))
|
TEQD3EXP1some of (token(*EQ0*), d3exp1)
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
d3ecl1_node =
//
(* ****** ****** *)
//
//yet-to-be-copied
|D3C1d3ecl of (d3ecl)
(* ****** ****** *)
//
|D3C1static of
(token(*STATIC*), d3ecl1)
|D3C1extern of
(token(*EXTERN*), d3ecl1)
//
(* ****** ****** *)
//
|D3C1dclst0 of (d3ecl1lst)
//
|D3C1local0 of
( d3ecl1lst(*local-head*)
, d3ecl1lst(*local-body*))
//
(* ****** ****** *)
//
|D3C1include of
( sint(*s/d*)
, token
, g1exp // src
, fpathopt
, d3ecl1lstopt) // inclusion
//
(* ****** ****** *)
//
|D3C1valdclst of
(token(*VAL(vlk)*), d3valdcl1lst)
|D3C1vardclst of
(token(*VAR(vrk)*), d3vardcl1lst)
//
|D3C1fundclst of
( token(*FUN(fnk)*)
, t2qaglst, d2cstlst, d3fundcl1lst)
//
(* ****** ****** *)
//
|D3C1errck of (sint(*lvl*), d3ecl1(*err*))
//
(* ****** ****** *)
//
fun
d3ecl1_lctn$get
(decl: d3ecl1): loctn
#symload lctn with d3ecl1_lctn$get
fun
d3ecl1_node$get
(decl: d3ecl1): d3ecl1_node
#symload node with d3ecl1_node$get
//
fun
d3ecl1_fprint
(decl: d3ecl1, out0: FILR): void
#symload fprint with d3ecl1_fprint of 1000
//
(* ****** ****** *)
//
fun
d3ecl1_make_lctn$node
(loc0: loctn, node: d3ecl1_node): d3ecl1
#symload d3ecl1 with d3ecl1_make_lctn$node
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3fundcl1_get_dpid:(d3fundcl1)->d2var
fun
d3fundcl1_get_sres:(d3fundcl1)->s2res
fun
d3fundcl1_get_wsxp:(d3fundcl1)->wths2exp
fun
d3fundcl1_get_farg:(d3fundcl1)->f3arg1lst
fun
d3fundcl1_get_tdxp:(d3fundcl1)->teqd3exp1
//
#symload dpid with d3fundcl1_dpid$get
#symload sres with d3fundcl1_sres$get(*opt*)
#symload wsxp with d3fundcl1_wsxp$get(*opt*)
#symload farg with d3fundcl1_farg$get(*lst*)
#symload tdxp with d3fundcl1_tdxp$get(*opt*)
//
(* ****** ****** *)
//
fun
d3fundcl1_make_args
( lctn:loc_t
, dpid:d2var
, farg:f3arg1lst, sres:s2res
, tdxp:teqd3exp1, wsxp:wths2exp):d3fundcl1
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3parsed1_fprint
(dpar: d3parsed1, out0: FILR): void
//
(* ****** ****** *)
//
fun
d3parsed1_stadyn$get:(d3parsed1)->sint
fun
d3parsed1_nerror$get:(d3parsed1)->sint
//
fun
d3parsed1_source$get:(d3parsed1)->lcsrc
//
fun
d3parsed1_parsed$get:(d3parsed1)->d3ecl1lstopt
//
(* ****** ****** *)
//
fun
d3parsed1_make_args
(stadyn: sint
,nerror: sint
,source: lcsrc
,parsed: d3ecl1lstopt): d3parsed1//end-fun
//
#symload d3parsed1 with d3parsed1_make_args
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_SATS_dynexp3.sats] *)
(***********************************************************************)
