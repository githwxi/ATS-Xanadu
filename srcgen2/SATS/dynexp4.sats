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
(*
HX-2023-12-26:
For linearity checking!!!
*)
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Tue Dec 26 22:03:40 EST 2023
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
//
#staload
LAB = "./xlabel0.sats"
#staload
TMP = "./xstamp0.sats"
//
#staload
FP0 = "./filpath.sats"
#staload
LOC = "./locinfo.sats"
//
#staload
SYM = "./xsymbol.sats"
#staload
MAP = "./xsymmap.sats"
//
(* ****** ****** *)
//
#staload
LEX = "./lexing0.sats"
//
(* ****** ****** *)
#staload
S1E = "./staexp1.sats"
#staload
D1E = "./dynexp1.sats"
#staload
G1M = "./gmacro1.sats"
(* ****** ****** *)
#staload
S2E = "./staexp2.sats"
#staload
T2P = "./statyp2.sats"
#staload
D2E = "./dynexp2.sats"
(* ****** ****** *)
#staload
D3E = "./dynexp3.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#typedef lab_t = $LAB.lab_t
#typedef label = $LAB.label
//
(* ****** ****** *)
#typedef stamp = $TMP.stamp
(* ****** ****** *)
#typedef sym_t = $SYM.sym_t
#typedef symbl = $SYM.symbl
(* ****** ****** *)
//
#typedef loc_t = $LOC.loc_t
#typedef loctn = $LOC.loctn
//
(* ****** ****** *)
#typedef lcsrc = $LOC.lcsrc
(* ****** ****** *)
//
#typedef
 fpath = ($FP0.fpath)
#typedef
 fpathopt = ($FP0.fpathopt)
//
(* ****** ****** *)
#typedef tnode = $LEX.tnode
#typedef token = $LEX.token
(* ****** ****** *)
#typedef g1exp = $G1M.g1exp
(* ****** ****** *)
#typedef s1exp = $S1E.s1exp
(* ****** ****** *)
#typedef s2var = $S2E.s2var
(* ****** ****** *)
#typedef s2exp = $S2E.s2exp
#typedef s2typ = $S2E.s2typ
(* ****** ****** *)
#typedef s2res = $D2E.s2res
(* ****** ****** *)
#typedef d2var = $D2E.d2var
#typedef d2con = $D2E.d2con
#typedef d2cst = $D2E.d2cst
(* ****** ****** *)
#typedef d3pat = $D3E.d3pat
#typedef d3exp = $D3E.d3exp
(* ****** ****** *)
#typedef f3arg = $D3E.f3arg
(* ****** ****** *)
#typedef d3ecl = $D3E.d3ecl
(* ****** ****** *)
(* ****** ****** *)
#abstbox d4pat_tbox // p0tr
#typedef d4pat = d4pat_tbox
(* ****** ****** *)
#abstbox d4exp_tbox // p0tr
#typedef d4exp = d4exp_tbox
(* ****** ****** *)
#abstbox f4arg_tbox // p0tr
#typedef f4arg = f4arg_tbox
(* ****** ****** *)
#abstbox d4gua_tbox // p0tr
#abstbox d4gpt_tbox // p0tr
#abstbox d4cls_tbox // p0tr
#typedef d4gua = d4gua_tbox
#typedef d4gpt = d4gpt_tbox
#typedef d4cls = d4cls_tbox
(* ****** ****** *)
#abstbox d4ecl_tbox // p0tr
#typedef d4ecl = d4ecl_tbox
(* ****** ****** *)
//
#abstbox d4valdcl_tbox//p0tr
#abstbox d4vardcl_tbox//p0tr
#abstbox d4fundcl_tbox//p0tr
//
(* ****** ****** *)
//
#abstbox d4parsed_tbox//p0tr
//
(* ****** ****** *)
#typedef d4patlst = list(d4pat)
#typedef d4patopt = optn(d4pat)
(* ****** ****** *)
#typedef d4explst = list(d4exp)
#typedef d4expopt = optn(d4exp)
(* ****** ****** *)
#typedef f4arglst = list(f4arg)
(* ****** ****** *)
#typedef d4gualst = list(d4gua)
#typedef d4clslst = list(d4cls)
(* ****** ****** *)
#typedef d4eclist = list(d4ecl)
(* ****** ****** *)
(* ****** ****** *)
#typedef s2varlst = $S2E.s2varlst
(* ****** ****** *)
#typedef s2explst = $S2E.s2explst
#typedef s2expopt = $S2E.s2expopt
(* ****** ****** *)
#typedef d2varopt = $D2E.d2varopt
#typedef d2varlst = $D2E.d2varlst
(* ****** ****** *)
#typedef d2conlst = $D2E.d2conlst
#typedef d2cstlst = $D2E.d2cstlst
(* ****** ****** *)
#typedef t2qaglst = $D2E.t2qaglst
(* ****** ****** *)
#typedef wths2exp = $D2E.wths2exp
(* ****** ****** *)
#typedef d4valdcl = d4valdcl_tbox
#typedef d4vardcl = d4vardcl_tbox
#typedef d4fundcl = d4fundcl_tbox
(* ****** ****** *)
#typedef d4parsed = d4parsed_tbox
(* ****** ****** *)
#typedef d4valdclist = list(d4valdcl)
#typedef d4vardclist = list(d4vardcl)
#typedef d4fundclist = list(d4fundcl)
(* ****** ****** *)
//
#typedef d4explstopt = optn(d4explst)
#typedef d4eclistopt = optn(d4eclist)
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
d4lab(itm:type) =
|D4LAB of
(label, itm(*elt*))
//
fun
<x0:t0>
d4lab_get_itm
(dlab: d4lab(x0)): x0
#symload
itm with d4lab_get_itm
//
(* ****** ****** *)
//
#typedef
d3lab(x0:t0)=$D3E.d3lab(x0)
//
(* ****** ****** *)
//
fun
<x0:type>
d4lab_fprint
( out
: FILR, lab: d4lab(x0)): void
//
(* ****** ****** *)
(* ****** ****** *)
#typedef l4d4p = d4lab(d4pat)
#typedef l4d4e = d4lab(d4exp)
(* ****** ****** *)
#typedef l4d4plst = list(l4d4p)
#typedef l4d4elst = list(l4d4e)
(* ****** ****** *)
(* ****** ****** *)
#typedef
d2vts = list@(d2var, s2typ)
(* ****** ****** *)
//
fun
d2vts_search_opt
( d2vts, d2var ): s2typopt_vt
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
d4pat_node =
//
|D4Pany of ()
|D4Pvar of d2var
//
|D4Pint of token
|D4Pbtf of sym_t
|D4Pchr of token
|D4Pflt of token
|D4Pstr of token
//
|D4Pcon of (d2con)
//
|D4Pbang of (d4pat)
|D4Pflat of (d4pat)
|D4Pfree of (d4pat)
//
(* ****** ****** *)
//
|D4Pannot of
(d4pat,s1exp(*given*),s2exp(*trans*))
//
(* ****** ****** *)
|D4Pt2pck of (d4pat, s2typ)//HX: casting
(* ****** ****** *)
//
|D4Pnone0 of ((*0*))
|D4Pnone1 of (d3pat) | D4Pnone2 of (d4pat)
//
|D4Perrck of
( sint(*lvl*), d4pat(*err*) ) // tread34-error
//
(* ****** ****** *)
fun
d4pat_fprint
(
  out:FILR, d4p0:d4pat):(void)
(* ****** ****** *)
//
fun
d4pat_get_lctn(d4pat): ( loc_t )
//
fun
d4pat_get_node(d4pat): d4pat_node
//
fun
d4pat_get_styp(d4pat): ( s2typ )
fun
d4pat_set_styp
(d4p0: d4pat, t2p0: s2typ): void
//
(* ****** ****** *)
#symload lctn with d4pat_get_lctn
#symload node with d4pat_get_node
#symload styp with d4pat_get_styp
#symload styp with d4pat_set_styp
(* ****** ****** *)
fun
d4pat_none0(loc0: loc_t): (d4pat)
fun
d4pat_none1(dpat: d3pat): (d4pat)
fun
d4pat_none2(dpat: d4pat): (d4pat)
(* ****** ****** *)
fun
d4pat_make_node
(loc:loc_t,nod:d4pat_node): d4pat
fun
d4pat_make_tpnd
(loc:loc_t
,typ:s2typ,nod:d4pat_node): d4pat
(* ****** ****** *)
#symload d4pat with d4pat_make_node
#symload d4pat with d4pat_make_tpnd
(* ****** ****** *)
(* ****** ****** *)
//
datatype
d4exp_node =
//
|D4Eint of token
|D4Ebtf of sym_t
|D4Echr of token
|D4Eflt of token
|D4Estr of token
//
(* ****** ****** *)
//
|D4Evar of (d2var)
//
|D4Econ of (d2con)
|D4Ecst of (d2cst)
//
(* ****** ****** *)
//
|D4Edvts of (d4exp, d2vts)
//
(* ****** ****** *)
//
|D4Edapp of
(d4exp,sint(*npf*),d4explst)
//
(* ****** ****** *)
//
|D4Elet0 of (d4eclist, d4exp)
//
(* ****** ****** *)
//
|D4Eift0 of
(
d4exp(*cond*),
d4expopt(*thn*), d4expopt(*els*))
//
(* ****** ****** *)
//
|D4Eseqn of
( d4explst(*init*), d4exp(*last*) )
//
|D4Etup0 of (sint(*npf*), d4explst)
|D4Etup1 of
(
token(*knd*), sint(*npf*), d4explst)
|D4Ercd2 of
(
token(*knd*), sint(*npf*), l4d4elst)
//
|D4El2bck of (d4exp, label)//HX: casting
|D4Et2pck of (d4exp, s2typ)//HX: casting
//
|D4Enone0 of ((*0*))
|D4Enone1 of (d3exp) | D4Enone2 of (d4exp)
//
|D4Eerrck of
( sint(*lvl*), d4exp(*err*) ) // tread34-error
//
(* ****** ****** *)
fun
d4exp_fprint
(
  out:FILR, d4e0:d4exp):(void)
(* ****** ****** *)
//
fun
d4exp_get_lctn(d4exp): ( loc_t )
//
fun
d4exp_get_node(d4exp): d4exp_node
//
fun
d4exp_get_styp(d4exp): ( s2typ )
fun
d4exp_set_styp
(d4e0: d4exp, t2p0: s2typ): void
//
(* ****** ****** *)
#symload lctn with d4exp_get_lctn
#symload node with d4exp_get_node
#symload styp with d4exp_get_styp
#symload styp with d4exp_set_styp
(* ****** ****** *)
fun
d4exp_none0(loc0: loc_t): (d4exp)
fun
d4exp_none1(dexp: d3exp): (d4exp)
fun
d4exp_none2(dexp: d4exp): (d4exp)
(* ****** ****** *)
fun
d4exp_make_node
(loc:loc_t,nod:d4exp_node): d4exp
fun
d4exp_make_tpnd
(loc:loc_t
,typ:s2typ,nod:d4exp_node): d4exp
(* ****** ****** *)
#symload d4exp with d4exp_make_node
#symload d4exp with d4exp_make_tpnd
(* ****** ****** *)
(* ****** ****** *)
//
datatype
f4arg_node =
//
(*
| F4ARGnone of (token)
*)
//
|
F4ARGdapp of
(sint(*npf*), d4patlst(*args*))
//
|
F4ARGsapp of
( s2varlst(*s2vs*)
, s2explst(*s2ps*) ) // static
//
|
F4ARGmets of (s2explst(*mets*))
//
(*
|
F4ARGsapq of (s2varlst(*synd*))
*)
//
(* ****** ****** *)
//
fun
f4arg_fprint:(FILR,f4arg)->void
//
(* ****** ****** *)
fun
f4arg_get_lctn(f4arg): loc_t
fun
f4arg_get_node(f4arg): f4arg_node
(* ****** ****** *)
#symload lctn with f4arg_get_lctn
#symload node with f4arg_get_node
(* ****** ****** *)
//
fun
f4arg_make_node
(loc:loc_t, nod:f4arg_node):f4arg
#symload f4arg with f4arg_make_node
//
(* ****** ****** *)
//
datatype
d4gua_node =
| D4GUAexp of (d4exp)
| D4GUAmat of (d4exp, d4pat)
//
(* ****** ****** *)
//
datatype
d4cls_node =
| D4CLSgpt of d4gpt
| D4CLScls of (d4gpt, d4exp)
and
d4gpt_node =
| D4GPTpat of (d4pat)
| D4GPTgua of (d4pat, d4gualst)
//
(* ****** ****** *)
//
fun
d4gua_fprint:(FILR,d4gua)->void
fun
d4gpt_fprint:(FILR,d4gpt)->void
fun
d4cls_fprint:(FILR,d4cls)->void
//
(* ****** ****** *)
//
fun
d4gua_get_lctn(d4gua): loc_t
fun
d4gua_get_node(d4gua): d4gua_node
//
#symload lctn with d4gua_get_lctn
#symload node with d4gua_get_node
//
(* ****** ****** *)
//
fun
d4gpt_get_lctn(d4gpt): loc_t
fun
d4gpt_get_node(d4gpt): d4gpt_node
//
#symload lctn with d4gpt_get_lctn
#symload node with d4gpt_get_node
//
(* ****** ****** *)
//
fun
d4cls_get_lctn(d4cls): loc_t
fun
d4cls_get_node(d4cls): d4cls_node
//
#symload lctn with d4cls_get_lctn
#symload node with d4cls_get_node
//
(* ****** ****** *)
//
fun
d4gua_make_node
(loc0:loc_t,node:d4gua_node):d4gua
fun
d4gpt_make_node
(loc0:loc_t,node:d4gpt_node):d4gpt
fun
d4cls_make_node
(loc0:loc_t,node:d4cls_node):d4cls
#symload d4gua with d4gua_make_node
#symload d4gpt with d4gpt_make_node
#symload d4cls with d4cls_make_node
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
teqd4exp =
|
TEQD4EXPnone of ((*void*))
|
TEQD4EXPsome of (token(*EQ0*), d4exp)
//
(* ****** ****** *)
//
datatype
d4ecl_node =
//
|D4Cd3ecl of (d3ecl)
//
|D4Cinclude of
( sint(*s/d*)
, token
, g1exp // src
, fpathopt
, d4eclistopt) // inclusion
//
|
D4Cvaldclst of
(token(*VAL(vlk)*), d4valdclist)
|
D4Cvardclst of
(token(*VAR(vrk)*), d4vardclist)
|
D4Cfundclst of
( token(*FUN(fnk)*)
, t2qaglst, d2cstlst, d4fundclist)
//
|
D4Cnone0 of ((*nil*))
|
D4Cnone1 of ( d3ecl ) | D4Cnone2 of ( d4ecl )
//
|
D4Cerrck of
( sint(*lvl*), d4ecl(*err*) ) // tread34-error
//
(* ****** ****** *)
fun
d4ecl_fprint
(
  out:FILR, d4cl:d4ecl):(void)
(* ****** ****** *)
//
fun
d4ecl_get_lctn(d4ecl): ( loc_t )
//
fun
d4ecl_get_node(d4ecl): d4ecl_node
//
(* ****** ****** *)
#symload lctn with d4ecl_get_lctn
#symload node with d4ecl_get_node
(* ****** ****** *)
fun
d4ecl_none0(loc0: loc_t): (d4ecl)
fun
d4ecl_none1(d3cl: d3ecl): (d4ecl)
(* ****** ****** *)
fun
d4ecl_make_node
(loc:loc_t,nod:d4ecl_node): d4ecl
(* ****** ****** *)
#symload d4ecl with d4ecl_make_node
(* ****** ****** *)
(* ****** ****** *)
fun
d4valdcl_fprint
(out: FILR, dval: d4valdcl): void
fun
d4vardcl_fprint
(out: FILR, dvar: d4vardcl): void
(* ****** ****** *)
fun
d4fundcl_fprint
(out: FILR, dfun: d4fundcl): void
(* ****** ****** *)
fun
d4valdcl_get_lctn:(d4valdcl)->loc_t
fun
d4vardcl_get_lctn:(d4vardcl)->loc_t
fun
d4fundcl_get_lctn:(d4fundcl)->loc_t
(* ****** ****** *)
#symload lctn with d4valdcl_get_lctn
#symload lctn with d4vardcl_get_lctn
#symload lctn with d4fundcl_get_lctn
(* ****** ****** *)
fun
d4valdcl_get_dpat:(d4valdcl)->d4pat
fun
d4valdcl_get_tdxp:(d4valdcl)->teqd4exp
fun
d4valdcl_get_wsxp:(d4valdcl)->wths2exp
(* ****** ****** *)
#symload dpat with d4valdcl_get_dpat
#symload tdxp with d4valdcl_get_tdxp(*opt*)
#symload wsxp with d4valdcl_get_wsxp(*opt*)
(* ****** ****** *)
fun
d4vardcl_get_dpid:(d4vardcl)->d2var
fun
d4vardcl_get_vpid:(d4vardcl)->d2varopt
fun
d4vardcl_get_sres:(d4vardcl)->s2expopt
fun
d4vardcl_get_dini:(d4vardcl)->teqd4exp
(* ****** ****** *)
#symload dpid with d4vardcl_get_dpid
#symload vpid with d4vardcl_get_vpid(*opt*)
#symload sres with d4vardcl_get_sres(*opt*)
#symload dini with d4vardcl_get_dini(*opt*)
(* ****** ****** *)
fun
d4fundcl_get_dpid:(d4fundcl)->d2var
fun
d4fundcl_get_farg:(d4fundcl)->f4arglst
fun
d4fundcl_get_sres:(d4fundcl)->s2res
fun
d4fundcl_get_tdxp:(d4fundcl)->teqd4exp
fun
d4fundcl_get_wsxp:(d4fundcl)->wths2exp
(* ****** ****** *)
#symload dpid with d4fundcl_get_dpid
#symload farg with d4fundcl_get_farg(*lst*)
#symload sres with d4fundcl_get_sres(*opt*)
#symload tdxp with d4fundcl_get_tdxp(*opt*)
#symload wsxp with d4fundcl_get_wsxp(*opt*)
(* ****** ****** *)
//
fun
d4valdcl_make_args
( lctn:loc_t
, dpat:d4pat
, tdxp:teqd4exp, wsxp:wths2exp):d4valdcl
fun
d4vardcl_make_args
( lctn:loc_t
, dpid:d2var
, vpid:d2varopt
, sres:s2expopt, dini:teqd4exp):d4vardcl
//
fun
d4fundcl_make_args
( lctn:loc_t
, dpid:d2var
, farg:f4arglst
, sres:s2res
, tdxp:teqd4exp, wsxp:wths2exp):d4fundcl
//
#symload d4valdcl with d4valdcl_make_args
#symload d4vardcl with d4vardcl_make_args
#symload d4fundcl with d4fundcl_make_args
//
(* ****** ****** *)
//
fun
d4parsed_fprint
(out:FILR, dpar:d4parsed): void
//
(* ****** ****** *)
#typedef d1topenv = $D1E.d1topenv
#typedef d2topenv = $D2E.d2topenv
#typedef d3topenv = $D3E.d3topenv
(* ****** ****** *)
//
fun
d4parsed_get_stadyn:(d4parsed)->sint
fun
d4parsed_get_nerror:(d4parsed)->sint
//
fun
d4parsed_get_source:(d4parsed)->lcsrc
//
#symload stadyn with d4parsed_get_stadyn
#symload nerror with d4parsed_get_nerror
#symload source with d4parsed_get_source
//
(* ****** ****** *)
//
fun
d4parsed_get_t1penv:(d4parsed)->d1topenv
fun
d4parsed_get_t2penv:(d4parsed)->d2topenv
//
fun
d4parsed_get_t3penv:(d4parsed)->d3topenv
//
fun
d4parsed_get_parsed
:(d4parsed(*dpar*))->d4eclistopt(*?err*)
//
#symload t1penv with d4parsed_get_t1penv
#symload t2penv with d4parsed_get_t2penv
#symload t3penv with d4parsed_get_t3penv
#symload parsed with d4parsed_get_parsed
//
(* ****** ****** *)
//
fun
d4parsed_make_args
( stadyn:sint
, nerror:sint
, source:lcsrc
, t1penv:d1topenv
, t2penv:d2topenv
, t3penv:d3topenv
, parsed:d4eclistopt): d4parsed//end-fun
//
#symload d4parsed with d4parsed_make_args
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_dynexp4.sats] *)
