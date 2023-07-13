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
Tue 14 Feb 2023 12:30:09 PM EST
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
#staload
LOC = "./locinfo.sats"
//
#typedef lab_t = $LAB.lab_t
#typedef label = $LAB.label
//
#typedef stamp = $TMP.stamp
//
#typedef loc_t = $LOC.loc_t
#typedef loctn = $LOC.loctn
#typedef lcsrc = $LOC.lcsrc
//
(* ****** ****** *)
//
#staload
SYM = "./xsymbol.sats"
#staload
MAP = "./xsymmap.sats"
//
#typedef
sym_t = $SYM.sym_t
//
(* ****** ****** *)
//
#staload
FP0 = "./filpath.sats"
//
#typedef
fpath = $FP0.fpath
#typedef
fpathopt = $FP0.fpathopt
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
D2E = "./dynexp2.sats"
(* ****** ****** *)
#typedef tnode = $LEX.tnode
#typedef token = $LEX.token
(* ****** ****** *)
#typedef g1exp = $S1E.g1exp
#typedef s1exp = $S1E.s1exp
(* ****** ****** *)
#typedef d1exp = $D1E.d1exp
(* ****** ****** *)
#typedef s2cst = $S2E.s2cst
#typedef s2var = $S2E.s2var
(* ****** ****** *)
#typedef s2exp = $S2E.s2exp
#typedef s2typ = $S2E.s2typ
(* ****** ****** *)
#typedef s2qag = $D2E.s2qag
#typedef t2qag = $D2E.t2qag
#typedef t2iag = $D2E.t2iag
(* ****** ****** *)
#typedef t2jag = $D2E.t2jag
(* ****** ****** *)
#typedef d2var = $D2E.d2var
#typedef d2con = $D2E.d2con
#typedef d2cst = $D2E.d2cst
(* ****** ****** *)
#typedef d2pat = $D2E.d2pat
#typedef d2exp = $D2E.d2exp
(* ****** ****** *)
#typedef d2ecl = $D2E.d2ecl
(* ****** ****** *)
#typedef s2res = $D2E.s2res
(* ****** ****** *)
#typedef simpl = $D2E.simpl
#typedef dimpl = $D2E.dimpl
(* ****** ****** *)
#abstbox d3pat_tbox // ptr
#typedef d3pat = d3pat_tbox
(* ****** ****** *)
#abstbox d3exp_tbox // ptr
#typedef d3exp = d3exp_tbox
(* ****** ****** *)
#abstbox f3arg_tbox // ptr
#typedef f3arg = f3arg_tbox
(* ****** ****** *)
#abstbox d3gua_tbox // ptr
#abstbox d3gpt_tbox // ptr
#abstbox d3cls_tbox // ptr
#typedef d3gua = d3gua_tbox
#typedef d3gpt = d3gpt_tbox
#typedef d3cls = d3cls_tbox
(* ****** ****** *)
#abstbox d3ecl_tbox // ptr
#typedef d3ecl = d3ecl_tbox
(* ****** ****** *)
//
#abstbox d3valdcl_tbox // ptr
#abstbox d3vardcl_tbox // ptr
#abstbox d3fundcl_tbox // ptr
#abstbox i3mpldcl_tbox // ptr
//
(* ****** ****** *)
#typedef s2varlst = list(s2var)
(* ****** ****** *)
#typedef s2explst = list(s2exp)
#typedef s2expopt = optn(s2exp)
(* ****** ****** *)
#typedef s2typlst = list(s2typ)
#typedef s2typopt = optn(s2typ)
(* ****** ****** *)
#typedef s2qaglst = list(s2qag)
#typedef t2qaglst = list(t2qag)
#typedef t2iaglst = list(t2iag)
(* ****** ****** *)
#typedef t2jaglst = list(t2jag)
(* ****** ****** *)
#typedef d2conlst = list(d2con)
#typedef d2cstlst = list(d2cst)
(* ****** ****** *)
#typedef d2varopt = optn(d2var)
#typedef d2varlst = list(d2var)
(* ****** ****** *)
#typedef d3patlst = list(d3pat)
#typedef d3patopt = optn(d3pat)
(* ****** ****** *)
#typedef d3explst = list(d3exp)
#typedef d3expopt = optn(d3exp)
(* ****** ****** *)
#typedef f3arglst = list(f3arg)
(* ****** ****** *)
#typedef d3gptlst = list(d3gpt)
#typedef d3gualst = list(d3gua)
#typedef d3clslst = list(d3cls)
(* ****** ****** *)
#typedef d3eclist = list(d3ecl)
(* ****** ****** *)
#typedef f1unarrw = $D1E.f1unarrw
(* ****** ****** *)
#typedef wths2exp = $D2E.wths2exp
(* ****** ****** *)
#typedef d3valdcl = d3valdcl_tbox
#typedef d3vardcl = d3vardcl_tbox
#typedef d3fundcl = d3fundcl_tbox
#typedef i3mpldcl = i3mpldcl_tbox
(* ****** ****** *)
#typedef d3valdclist = list(d3valdcl)
#typedef d3vardclist = list(d3vardcl)
#typedef d3fundclist = list(d3fundcl)
#typedef i3mpldclist = list(i3mpldcl)
(* ****** ****** *)
#typedef d3explstopt = optn(d3explst)
#typedef d3eclistopt = optn(d3eclist)
(* ****** ****** *)
#typedef s2taloadopt = $D2E.s2taloadopt
(* ****** ****** *)
//
datatype
d3lab(x0:type) =
|
D3LAB of
(label, x0(*elt*))
//
fun
<x0:t0>
d3lab_get_itm
(dlab: d3lab(x0)): x0
#symload
itm with d3lab_get_itm
//
(* ****** ****** *)
#typedef
d2lab(x0:t0)=$D2E.d2lab(x0)
(* ****** ****** *)
//
fun
<x0:type>
d3lab_fprint
(out: FILR, lab: d3lab(x0)): void
//
(* ****** ****** *)
#typedef l3d3p = d3lab(d3pat)
#typedef l3d3e = d3lab(d3exp)
(* ****** ****** *)
#typedef l3d3plst = list(l3d3p)
#typedef l3d3elst = list(l3d3e)
(* ****** ****** *)
//
datatype
d3pat_node =
//
|D3Pany of ()
|D3Pvar of d2var
//
|D3Pint of token
|D3Pbtf of sym_t
|D3Pchr of token
|D3Pflt of token
|D3Pstr of token
//
|D3Pcon of (d2con)
(*
|D3Pcons of
 (d2conlst(*~(1)*))
*)
//
|D3Pbang of (d3pat)
|D3Pfree of (d3pat)
//
|D3Psapp of
 (d3pat, s2varlst(*sarg*))
|D3Psapq of
 (d3pat, s2varlst(*sarg*))
//
|D3Ptapq of (d3pat, t2jaglst)
//
|
D3Pdapp of
( d3pat
, sint(*npf*), d3patlst(*darg*)
) (* D3Pdapp *)
//
|
D3Ptup0 of (sint(*npf*), d3patlst)
//
|
D3Ptup1 of
(
token(*knd*), sint(*npf*), d3patlst)
|
D3Prcd2 of
(
token(*knd*), sint(*npf*), l3d3plst)
//
|
D3Pannot of
(d3pat,s1exp(*given*),s2exp(*trans*))
//
|
D3Pt2pck of (d3pat, s2typ)//HX: casting
//
|D3Pnone0 of ((*0*))
|D3Pnone1 of (d2pat) | D3Pnone2 of (d3pat)
//
|
D3Perrck of (sint(*lvl*),d3pat)//tread23-error
//
// HX-2023-??-??: end-of-[datatype(d3pat_node)]
//
(* ****** ****** *)
fun
d3pat_fprint:(FILR,d3pat)->void
(* ****** ****** *)
fun
d3pat_get_lctn(d3pat): loc_t
fun
d3pat_get_node(d3pat): d3pat_node
(* ****** ****** *)
#symload lctn with d3pat_get_lctn
#symload node with d3pat_get_node
(* ****** ****** *)
//
fun
d3pat_get_styp:(d3pat)->s2typ
fun
d3pat_set_styp
(d3p0: d3pat, t2p0: s2typ): void
//
#symload styp with d3pat_get_styp
#symload styp with d3pat_set_styp
//
(* ****** ****** *)
fun
d3pat_none0(loc0:loc_t): d3pat
fun
d3pat_none1(d2p0:d2pat): d3pat
(* ****** ****** *)
//
fun
d3pat_make_node
(loc:loc_t,nod:d3pat_node): d3pat
fun
d3pat_make_styp_node
(loc:loc_t
,t2p:s2typ,nod:d3pat_node): d3pat
//
#symload d3pat with d3pat_make_node
#symload d3pat with d3pat_make_styp_node
//
(* ****** ****** *)
//
datatype
f3arg_node =
//
(*
| F3ARGnone of (token)
*)
//
|
F3ARGsta0 of
( s2varlst(*s2vs*)
, s2explst(*s2ps*)) // static
//
|
F3ARGdyn0 of
(int(*npf*), d3patlst(*farglst*))
//
|
F3ARGmet0 of (s2explst(*metrics*))
//
(* ****** ****** *)
//
fun
f3arg_fprint:(FILR,f3arg)->void
//
(* ****** ****** *)
fun
f3arg_get_lctn(f3arg): loc_t
fun
f3arg_get_node(f3arg): f3arg_node
(* ****** ****** *)
#symload lctn with f3arg_get_lctn
#symload node with f3arg_get_node
(* ****** ****** *)
//
fun
f3arg_make_node
(loc0:loc_t,node:f3arg_node):f3arg
#symload f3arg with f3arg_make_node
//
(* ****** ****** *)
//
datatype
d3gua_node =
| D3GUAexp of (d3exp)
| D3GUAmat of (d3exp, d3pat)
//
(* ****** ****** *)
//
datatype
d3cls_node =
| D3CLSgpt of d3gpt
| D3CLScls of (d3gpt, d3exp)
and
d3gpt_node =
| D3GPTpat of (d3pat)
| D3GPTgua of (d3pat, d3gualst)
//
(* ****** ****** *)
//
fun
d3gua_fprint:(FILR,d3gua)->void
fun
d3gpt_fprint:(FILR,d3gpt)->void
fun
d3cls_fprint:(FILR,d3cls)->void
//
(* ****** ****** *)
//
fun
d3gua_get_lctn(d3gua): loc_t
fun
d3gua_get_node(d3gua): d3gua_node
//
#symload lctn with d3gua_get_lctn
#symload node with d3gua_get_node
//
(* ****** ****** *)
//
fun
d3gpt_get_lctn(d3gpt): loc_t
fun
d3gpt_get_node(d3gpt): d3gpt_node
//
#symload lctn with d3gpt_get_lctn
#symload node with d3gpt_get_node
//
(* ****** ****** *)
//
fun
d3cls_get_lctn(d3cls): loc_t
fun
d3cls_get_node(d3cls): d3cls_node
//
#symload lctn with d3cls_get_lctn
#symload node with d3cls_get_node
//
(* ****** ****** *)
//
fun
d3gua_make_node
(loc0:loc_t,node:d3gua_node):d3gua
fun
d3gpt_make_node
(loc0:loc_t,node:d3gpt_node):d3gpt
fun
d3cls_make_node
(loc0:loc_t,node:d3cls_node):d3cls
#symload d3gua with d3gua_make_node
#symload d3gpt with d3gpt_make_node
#symload d3cls with d3cls_make_node
//
(* ****** ****** *)

datatype
d3exp_node =
//
|D3Eint of token
|D3Ebtf of sym_t
|D3Echr of token
|D3Eflt of token
|D3Estr of token
//
|D3Ei00 of (sint) // sint
|D3Eb00 of (bool) // bool
|D3Ec00 of (char) // char
|D3Ef00 of (char) // float
|D3Es00 of (strn) // string
//
|D3Etop of (token)
//
|D3Evar of (d2var)
//
|D3Econ of (d2con)
|D3Ecst of (d2cst)
//
|D3Esapp of (d3exp, s2explst)
|D3Esapq of (d3exp, s2typlst)
//
|D3Etapp of (d3exp, s2explst)
|D3Etapq of (d3exp, t2jaglst)
//
|D3Edap0 of (d3exp)
|D3Edapp of
 (d3exp,sint(*npf*),d3explst)
//
|D3Eproj of
 (token, label, d3exp(*tup*))
//
|D3Elet0 of (d3eclist, d3exp)
//
|D3Eift0 of
(d3exp(*cond*)
,d3expopt(*thn*), d3expopt(*els*) )
//
|D3Ecas0 of
( token(*+/0/-*), d3exp, d3clslst )
//
|D3Eseqn of
( d3explst(*init*), d3exp(*last*) )
//
|D3Etup0 of (sint(*npf*), d3explst)
|D3Etup1 of
(
token(*knd*), sint(*npf*), d3explst)
|D3Ercd2 of
(
token(*knd*), sint(*npf*), l3d3elst)
//
|D3Elam0 of
( token(*knd*)
, f3arglst, s2res, f1unarrw, d3exp )
|D3Efix0 of
( token(*knd*)
, d2var(*fid*)
, f3arglst, s2res, f1unarrw, d3exp )
//
|D3Etry0 of
( token(*$TRY*)
, d3exp(*norm*), d3clslst(*handles*))
//
(*
HX-2023-07-05:
two attributes of left values
*)
|D3Eaddr of (d3exp)//left-val-address
|D3Eflat of (d3exp)//left-val-content
//
|D3Efold of (d3exp)//open-con-folding
//
|D3Eeval of (d3exp)//eval-builtin-fun
|D3Efree of (d3exp)//free-builtin-fun
//
|D3Edp2tr of (d3exp)//p2tr-dereference
|D3Edl0az of (d3exp)//l0azy-eval-thunk
|D3Edl1az of (d3exp)//l1azy-eval-thunk
//
|D3Ewhere of ( d3exp, d3eclist )
//
|D3Eassgn of
( d3exp(*l-val*), d3exp(*r-val*) )
//
|D3Eraise of (token, d3exp(*lin-exn*) )
//
|D3El0azy of // nonlin-lazy-eval
( d1exp(*$L0AZY*), d3exp(*non-thunk*) )
|D3El1azy of // linear-lazy-eval
( d1exp(*$LLAZY*)
, d3exp(*lin-thunk*), d3explst(*frees*))
//
|D3El2bck of (d3exp, label)//HX: casting
|D3Et2pck of (d3exp, s2typ)//HX: casting
//
|D3Enone0 of ((*0*))
|D3Enone1 of (d2exp) | D3Enone2 of (d3exp)
//
|
D3Eerrck of (sint(*lvl*),d3exp)//tread23-error
//
// HX-2023-??-??: end-of-[datatype(d3exp_node)]
//
(* ****** ****** *)
fun
d3exp_fprint:(FILR,d3exp)->void
(* ****** ****** *)
fun
d3exp_get_lctn(d3exp): loc_t
fun
d3exp_get_node(d3exp): d3exp_node
(* ****** ****** *)
#symload lctn with d3exp_get_lctn
#symload node with d3exp_get_node
(* ****** ****** *)
//
fun
d3exp_get_styp:(d3exp)->s2typ
fun
d3exp_set_styp
(d3p0: d3exp, t2p0: s2typ): void
//
#symload styp with d3exp_get_styp
#symload styp with d3exp_set_styp
//
(* ****** ****** *)
fun
d3exp_none0(loc0:loc_t): d3exp
fun
d3exp_none1(d2e0:d2exp): d3exp
(* ****** ****** *)
//
fun
d3exp_make_node
(loc:loc_t,nod:d3exp_node): d3exp
fun
d3exp_make_styp_node
(loc:loc_t
,t2p:s2typ,nod:d3exp_node): d3exp
//
#symload d3exp with d3exp_make_node
#symload d3exp with d3exp_make_styp_node
//
(* ****** ****** *)
//
datatype
teqd3exp =
|
TEQD3EXPnone of ((*void*))
|
TEQD3EXPsome of (token(*EQ0*), d3exp)
//
(* ****** ****** *)
//
datatype
d3ecl_node =
//
|D3Cd2ecl of (d2ecl)
//
|D3Cstatic of
 (token(*STATIC*), d3ecl)
|D3Cextern of
 (token(*EXTERN*), d3ecl)
//
|D3Clocal0 of
 ( d3eclist(*local-head*)
 , d3eclist(*local-body*))
//
|D3Cinclude of
( sint(*s/d*)
, token
, g1exp // src
, fpathopt
, d3eclistopt) // inclusion
//
|D3Cstaload of
( sint(*s/d*)
, token
, g1exp // src
, fpathopt
, s2taloadopt) // staloading
//
|
D3Cvaldclst of
(token(*VAL(vlk)*), d3valdclist)
|
D3Cvardclst of
(token(*VAR(vrk)*), d3vardclist)
|
D3Cfundclst of
( token(*FUN(fnk)*)
, t2qaglst, d2cstlst, d3fundclist)
//
|
D3Cimplmnt0 of
( token(*impkind*)
, s2qaglst // s2vs
, t2qaglst // s2vs+t2is
, dimpl, t2iaglst, f3arglst, s2res, d3exp)
//
|
D3Cnone0 of ((*nil*))
|
D3Cnone1 of ( d2ecl ) | D3Cnone2 of ( d3ecl )
//
|
D3Cerrck of (sint(*lvl*), d3ecl)//tread23-error
//
//HX-2023-??-??: end-of-[datatype( d3ecl_node )]
//
(* ****** ****** *)
fun
d3ecl_fprint:(FILR,d3ecl)->void
(* ****** ****** *)
fun
d3ecl_get_lctn(d3ecl): loc_t
fun
d3ecl_get_node(d3ecl): d3ecl_node
(* ****** ****** *)
fun
d3ecl_none0(loc0:loc_t): d3ecl
fun
d3ecl_none1(d2cl:d2ecl): d3ecl
(* ****** ****** *)
fun
d3ecl_make_node
(loc:loc_t,nod:d3ecl_node): d3ecl
(* ****** ****** *)
#symload lctn with d3ecl_get_lctn
#symload node with d3ecl_get_node
(* ****** ****** *)
#symload d3ecl with d3ecl_make_node
(* ****** ****** *)
fun
d3valdcl_fprint
(out: FILR, dval: d3valdcl): void
fun
d3vardcl_fprint
(out: FILR, dvar: d3vardcl): void
(* ****** ****** *)
fun
d3fundcl_fprint
(out: FILR, dfun: d3fundcl): void
(* ****** ****** *)
fun
d3valdcl_get_lctn:(d3valdcl)->loc_t
fun
d3vardcl_get_lctn:(d3vardcl)->loc_t
fun
d3fundcl_get_lctn:(d3fundcl)->loc_t
(* ****** ****** *)
#symload lctn with d3valdcl_get_lctn
#symload lctn with d3vardcl_get_lctn
#symload lctn with d3fundcl_get_lctn
(* ****** ****** *)
fun
d3valdcl_get_dpat:(d3valdcl)->d3pat
fun
d3valdcl_get_tdxp:(d3valdcl)->teqd3exp
fun
d3valdcl_get_wsxp:(d3valdcl)->wths2exp
(* ****** ****** *)
#symload dpat with d3valdcl_get_dpat
#symload tdxp with d3valdcl_get_tdxp(*opt*)
#symload wsxp with d3valdcl_get_wsxp(*opt*)
(* ****** ****** *)
fun
d3vardcl_get_dpid:(d3vardcl)->d2var
fun
d3vardcl_get_vpid:(d3vardcl)->d2varopt
fun
d3vardcl_get_sres:(d3vardcl)->s2expopt
fun
d3vardcl_get_dini:(d3vardcl)->teqd3exp
(* ****** ****** *)
#symload dpid with d3vardcl_get_dpid
#symload vpid with d3vardcl_get_vpid(*opt*)
#symload sres with d3vardcl_get_sres(*opt*)
#symload dini with d3vardcl_get_dini(*opt*)
(* ****** ****** *)
fun
d3fundcl_get_dpid:(d3fundcl)->d2var
fun
d3fundcl_get_farg:(d3fundcl)->f3arglst
fun
d3fundcl_get_sres:(d3fundcl)->s2res
fun
d3fundcl_get_tdxp:(d3fundcl)->teqd3exp
fun
d3fundcl_get_wsxp:(d3fundcl)->wths2exp
(* ****** ****** *)
#symload dpid with d3fundcl_get_dpid
#symload farg with d3fundcl_get_farg(*lst*)
#symload sres with d3fundcl_get_sres(*opt*)
#symload tdxp with d3fundcl_get_tdxp(*opt*)
#symload wsxp with d3fundcl_get_wsxp(*opt*)
(* ****** ****** *)
//
fun
d3valdcl_make_args
( lctn:loc_t
, dpat:d3pat
, tdxp:teqd3exp, wsxp:wths2exp):d3valdcl
fun
d3vardcl_make_args
( lctn:loc_t
, dpid:d2var
, vpid:d2varopt
, sres:s2expopt, dini:teqd3exp):d3vardcl
//
fun
d3fundcl_make_args
( lctn:loc_t
, dpid:d2var
, farg:f3arglst
, sres:s2res
, tdxp:teqd3exp, wsxp:wths2exp):d3fundcl
//
#symload d3valdcl with d3valdcl_make_args
#symload d3vardcl with d3vardcl_make_args
#symload d3fundcl with d3fundcl_make_args
//
(* ****** ****** *)
(*
//
HX-2023-02-19:
Note that [d3parsed] is for storing
results obtained from template resolution.
It is a suitable datatype for JSONIZATION.
//
*)
(* ****** ****** *)
//
#abstbox d3parsed_tbox // ptr
#typedef d3parsed = d3parsed_tbox
//
(* ****** ****** *)
//
fun
d3parsed_fprint
(out: FILR, dpar: d3parsed): void
//
(* ****** ****** *)
#typedef d1topenv = $D1E.d1topenv
#typedef d2topenv = $D2E.d2topenv
(* ****** ****** *)
//
fun
d3parsed_get_stadyn:(d3parsed)->sint
fun
d3parsed_get_nerror:(d3parsed)->sint
fun
d3parsed_get_source:(d3parsed)->lcsrc
fun
d3parsed_get_t1penv:(d3parsed)->d1topenv
fun
d3parsed_get_t2penv:(d3parsed)->d2topenv
fun
d3parsed_get_parsed:(d3parsed)->d3eclistopt
//
#symload stadyn with d3parsed_get_stadyn
#symload nerror with d3parsed_get_nerror
#symload source with d3parsed_get_source
#symload t1penv with d3parsed_get_t1penv
#symload t2penv with d3parsed_get_t2penv
#symload parsed with d3parsed_get_parsed
//
fun
d3parsed_make_args
( stadyn:sint
, nerror:sint
, source:lcsrc
, t1penv:d1topenv
, t2penv:d2topenv
, parsed:d3eclistopt): d3parsed//end-fun
//
#symload d3parsed with d3parsed_make_args
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_dynexp3.sats] *)
