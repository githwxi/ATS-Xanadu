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
Sun Aug 14 15:47:10 EDT 2022
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
//
#typedef sym_t = $SYM.sym_t
//
(* ****** ****** *)
#staload
LEX = "./lexing0.sats"
//
#typedef token = $LEX.token
//
(* ****** ****** *)
#staload
S1E = "./staexp1.sats"
#staload
D1E = "./dynexp1.sats"
#staload
S2E = "./staexp2.sats"
(* ****** ****** *)
#typedef d1qid = $S1E.d1qid
#typedef s1exp = $S1E.s1exp
(* ****** ****** *)
#typedef d1pat = $D1E.d1pat
#typedef d1exp = $D1E.d1exp
#typedef d1ecl = $D1E.d1ecl
(* ****** ****** *)
#typedef sort2 = $S2E.sort2
#typedef s2tex = $S2E.s2tex
(* ****** ****** *)
#typedef s2cst = $S2E.s2cst
#typedef s2var = $S2E.s2var
#typedef s2exp = $S2E.s2exp
(* ****** ****** *)
#abstbox d2con_tbox // ptr
#abstbox d2cst_tbox // ptr
#abstbox d2var_tbox // ptr
#typedef d2con = d2con_tbox
#typedef d2cst = d2cst_tbox
#typedef d2var = d2var_tbox
(* ****** ****** *)
#abstbox d2itm_tbox // ptr
#typedef d2itm = d2itm_tbox
(* ****** ****** *)
//
(*
#abstbox q2arg_tbox // ptr
#typedef q2arg = q2arg_tbox
*)
#abstbox s2qag_tbox // ptr
#abstbox t2qag_tbox // ptr
#typedef s2qag = s2qag_tbox
#typedef t2qag = t2qag_tbox
//
#abstbox t2iag_tbox // ptr
#typedef t2iag = t2iag_tbox
//
(* ****** ****** *)
#abstbox d2pat_tbox // ptr
#abstbox d2exp_tbox // ptr
#abstbox d2ecl_tbox // ptr
#typedef d2pat = d2pat_tbox
#typedef d2exp = d2exp_tbox
#typedef d2ecl = d2ecl_tbox
(* ****** ****** *)
#abstbox f2arg_tbox // ptr
#typedef f2arg = f2arg_tbox
(* ****** ****** *)
#abstbox d2gua_tbox // ptr
#abstbox d2gpt_tbox // ptr
#abstbox d2cls_tbox // ptr
#typedef d2gua = d2gua_tbox
#typedef d2gpt = d2gpt_tbox
#typedef d2cls = d2cls_tbox
(* ****** ****** *)
//
#abstbox d2valdcl_tbox // ptr
#abstbox d2vardcl_tbox // ptr
#abstbox d2fundcl_tbox // ptr
#abstbox i2mpldcl_tbox // ptr
#abstbox d2cstdcl_tbox // ptr
//
(* ****** ****** *)
#typedef sort2lst = list(sort2)
(* ****** ****** *)
#typedef s2cstlst = list(s2cst)
#typedef s2varlst = list(s2var)
#typedef s2explst = list(s2exp)
(* ****** ****** *)
#typedef s2cstopt = optn(s2cst)
#typedef s2varopt = optn(s2var)
#typedef s2expopt = optn(s2exp)
(* ****** ****** *)
#typedef d2conlst = list(d2con)
#typedef d2cstlst = list(d2cst)
#typedef d2varlst = list(d2var)
(* ****** ****** *)
#typedef d2conopt = optn(d2con)
#typedef d2cstopt = optn(d2cst)
#typedef d2varopt = optn(d2var)
(* ****** ****** *)
(*
#typedef q2arglst = list(q2arg)
*)
#typedef s2qaglst = list(s2qag)
#typedef t2qaglst = list(t2qag)
#typedef t2iaglst = list(t2iag)
(* ****** ****** *)
#typedef d2patlst = list(d2pat)
#typedef d2patopt = optn(d2pat)
(* ****** ****** *)
#typedef f2arglst = list(f2arg)
(* ****** ****** *)
#typedef d2gualst = list(d2gua)
#typedef d2clslst = list(d2cls)
(* ****** ****** *)
#typedef d2explst = list(d2exp)
#typedef d2expopt = optn(d2exp)
(* ****** ****** *)
#typedef d2eclist = list(d2ecl)
(* ****** ****** *)
#typedef d2valdcl = d2valdcl_tbox
#typedef d2vardcl = d2vardcl_tbox
#typedef d2fundcl = d2fundcl_tbox
#typedef i2mpldcl = i2mpldcl_tbox
#typedef d2cstdcl = d2cstdcl_tbox
(* ****** ****** *)
#typedef d2valdclist = list(d2valdcl)
#typedef d2vardclist = list(d2vardcl)
#typedef d2fundclist = list(d2fundcl)
#typedef i2mpldclist = list(i2mpldcl)
#typedef d2cstdclist = list(d2cstdcl)
(* ****** ****** *)
#typedef d2eclistopt = optn(d2eclist)
(* ****** ****** *)
//
datatype
d2lab(x0:type) =
|
D2LAB of
(label, x0(*elt*))
//
fun
<x0:t0>
d2lab_get_itm
(dlab: d2lab(x0)): x0
#symload
itm with d2lab_get_itm
//
(* ****** ****** *)
#typedef
d1lab(x0:t0)=$D1E.d1lab(x0)
(* ****** ****** *)
//
fun
<x0:type>
d2lab_fprint
(out: FILR, lab: d2lab(x0)): void
//
(* ****** ****** *)
#typedef l2d2p = d2lab(d2pat)
#typedef l2d2e = d2lab(d2exp)
(* ****** ****** *)
#typedef l2d2plst = list(l2d2p)
#typedef l2d2elst = list(l2d2e)
(* ****** ****** *)
fun
d2con_fprint:(FILR,d2con)->void
fun
d2cst_fprint:(FILR,d2cst)->void
fun
d2var_fprint:(FILR,d2var)->void
(* ****** ****** *)
//
fun
d2var_new1_tokn
(tok0: token): d2var
fun
d2var_new2_name
(loc0: loc_t, name: sym_t): d2var
//
fun
d2var_get_lctn:(d2var) -> loc_t
fun
d2var_get_name:(d2var) -> sym_t
fun
d2var_get_stmp:(d2var) -> stamp
//
(* ****** ****** *)
//
datatype
d2itm =
//
| D2ITMvar of (d2var)
| D2ITMcon of (d2conlst)
| D2ITMcst of (d2cstlst)
//
| D2ITMsym of (sym_t, d2ptmlst)
//
and // datatype
d2ptm =
|
D2PTMnone of (d1qid)
|
D2PTMsome of (int(*pval*), d2itm)
//
where
{
#typedef d2itmlst = list(d2itm)
#typedef d2itmopt = optn(d2itm)
#typedef d2ptmlst = list(d2ptm)
}
//
(* ****** ****** *)
fun
d2itm_fprint:(FILR,d2itm)->void
fun
d2ptm_fprint:(FILR,d2ptm)->void
(* ****** ****** *)
fun
s2qag_fprint:(FILR,s2qag)->void
fun
t2qag_fprint:(FILR,t2qag)->void
fun
t2iag_fprint:(FILR,t2iag)->void
(* ****** ****** *)
fun
t2qag_get_s2vs:(t2qag)->s2varlst
#symload s2vs with t2qag_get_s2vs
(* ****** ****** *)
//
datatype
d2pat_node =
//
|D2Pnil of ()
|D2Pany of ()
|D2Parg of ()
//
|D2Pvar of d2var
//
|D2Pint of (token)
|D2Pbtf of (token)
|D2Pchr of (token)
|D2Pflt of (token)
|D2Pstr of (token)
//
|D2Pi00 of (sint) // sint
|D2Pb00 of (bool) // bool
|D2Pc00 of (char) // char
|D2Ps00 of (strn) // string
//
|D2Pcon1 of (d2con)
|D2Pcon2 of (d2conlst)
//
|D2Pbang of (d2pat) // !
|D2Pflat of (d2pat) // @
|D2Pfree of (d2pat) // ~
//
|D2Psym0 of
 (d1pat(*sym*), d2itmlst)
//
|D2Psapp of
 (d2pat, s2varlst(*sarg*))
//
|D2Pd0ap of (d2pat) // nullary
|D2Pd1ap of (d2pat) // argless
//
|
D2Pdapp of
( d2pat
, int(*npf*), d2patlst(*darg*))
//
|
D2Pdtup of
( token, sint(*npf*), d2patlst)
|
D2Pdrcd of
( token, sint(*npf*), l2d2plst)
//
| D2Panno of (d2pat, s1exp, s2exp)
//
(*
| D2Pg1mac of (g1mac) // HX: error!
*)
//
|
D2Pnone0 of ((*void*)) | D2Pnone1 of (d1pat)
//
|
D2Perrck of (sint(*lvl*), d2pat)//HX:tread12-error
//
// end of [d1exp_node] // end of [ datatype(...) ]
//
(* ****** ****** *)
fun
d2pat_fprint:(FILR,d2pat)->void
(* ****** ****** *)
fun
d2pat_get_lctn(d2pat): loc_t
fun
d2pat_get_node(d2pat): d2pat_node
(* ****** ****** *)
#symload lctn with d2pat_get_lctn
#symload node with d2pat_get_node
(* ****** ****** *)
fun
d2pat_none0(loc0:loc_t): d2pat
fun
d2pat_none1(d1p0:d1pat): d2pat
(* ****** ****** *)
fun
d2pat_var
(loc0: loc_t, d2v1: d2var): d2pat
fun
d2pat_btf
(loc0: loc_t, sym1: sym_t): d2pat
fun
d2pat_any
(loc0: loc_t, sym1: sym_t): d2pat
(* ****** ****** *)
fun
d2pat_make_node
(loc:loc_t,nod:d2pat_node): d2pat
#symload d2pat with d2pat_make_node
(* ****** ****** *)
//
datatype
d2gua_node =
| D2GUAexp of (d2exp)
| D2GUAmat of (d2exp, d2pat)
//
(* ****** ****** *)
//
datatype
d2cls_node =
| D2CLSgpt of d2gpt
| D2CLScls of (d2gpt, d2exp)
and
d2gpt_node =
| D2GPTpat of (d2pat)
| D2GPTgua of (d2pat, d2gualst)
//
(* ****** ****** *)
//
fun
d2gua_fprint:(FILR,d2gua)->void
fun
d2gpt_fprint:(FILR,d2gpt)->void
fun
d2cls_fprint:(FILR,d2cls)->void
//
(* ****** ****** *)
//
fun
d2gua_get_lctn(d2gua): loc_t
fun
d2gua_get_node(d2gua): d2gua_node
//
#symload lctn with d2gua_get_lctn
#symload node with d2gua_get_node
//
(* ****** ****** *)
//
fun
d2gpt_get_lctn(d2gpt): loc_t
fun
d2gpt_get_node(d2gpt): d2gpt_node
//
#symload lctn with d2gpt_get_lctn
#symload node with d2gpt_get_node
//
(* ****** ****** *)
//
fun
d2cls_get_lctn(d2cls): loc_t
fun
d2cls_get_node(d2cls): d2cls_node
//
#symload lctn with d2cls_get_lctn
#symload node with d2cls_get_node
//
(* ****** ****** *)
//
datatype
d2exp_node =
//
|D2Eint of token
|D2Ebtf of token
|D2Echr of token
|D2Eflt of token
|D2Estr of token
//
|D2Ei00 of (sint) // sint
|D2Eb00 of (bool) // bool
|D2Ec00 of (char) // char
|D2Ef00 of (char) // float
|D2Es00 of (strn) // string
//
|D2Etop of (token)
//
|D2Evar of (d2var)
//
|D2Econ1 of (d2con)
|D2Ecst1 of (d2cst)
|D2Econ2 of (d2conlst)
|D2Ecst2 of (d2cstlst)
//
|D2Esapp of (d2exp, s2explst)
|D2Etapp of (d2exp, s2explst)
//
|D2Ed0ap of (d2exp)
|D2Edapp of
(d2exp, int(*npf*), d2explst)
//
|D2Elet0 of (d2eclist, d2exp)
|D2Ewhere of (d2exp, d2eclist)
//
|D2Eseqn of
(d2explst(*semi*), d2exp(*last*))
//
|
D2Eif0 of
(d2exp(*cond*)
,d2expopt(*then*),d2expopt(*else*))
//
|
D2Ecas0 of
( token(*+/0/-*), d2exp, d2clslst )
//
|
D2Etup0 of (int(*npf*), d2explst)
|
D2Ercd0 of (int(*npf*), l2d2elst)
|
D2Etup1 of // HX: tuple
(token(*knd*), int(*npf*), d2explst)
|
D2Ercd2 of // HX: record
(token(*knd*), int(*npf*), l2d2elst)
//
|
D2Etry0 of
(token(*TRY*)
,d2exp(*value*), d2clslst(*clauses*))
//
|
D2Eanno of
(d2exp,s1exp(*given*),s2exp(*trans*))
//
|
D2Eexists of
(s2explst(*witness*), d2exp(*scoped*))
//
|
D2Enone0 of ((*void*)) | D2Enone1 of (d1exp)
//
|
D2Eerrck of (sint(*lvl*), d2exp)//HX:tread12-error
//
// end of [d1exp_node] // end of [ datatype(...) ]
//
(* ****** ****** *)
fun
d2exp_fprint:(FILR,d2exp)->void
(* ****** ****** *)
fun
d2exp_get_lctn(d2exp): loc_t
fun
d2exp_get_node(d2exp): d2exp_node
(* ****** ****** *)
#symload lctn with d2exp_get_lctn
#symload node with d2exp_get_node
(* ****** ****** *)
fun
d2exp_none0(loc0:loc_t): d2exp
fun
d2exp_none1(d1e0:d1exp): d2exp
(* ****** ****** *)
fun
d2exp_var
(loc0: loc_t, d2v1: d2var): d2exp
fun
d2exp_btf
(loc0: loc_t, sym1: sym_t): d2exp
fun
d2exp_top
(loc0: loc_t, sym1: sym_t): d2exp
(* ****** ****** *)
fun
d2exp_make_node
(loc:loc_t,nod:d2exp_node): d2exp
#symload d2exp with d2exp_make_node
(* ****** ****** *)
//
datatype
teqd2exp =
|
TEQD2EXPnone of ((*void*))
|
TEQD2EXPsome of (token(*EQ0*), d2exp)
datatype
wths2exp =
|
WTHS2EXPnone of ((*void*))
|
WTHS2EXPsome of (token(*WTH*), s2exp)
//
(* ****** ****** *)
//
datatype
d2ecl_node =
//
|D2Cd1ecl of (d1ecl)
//
|D2Cstatic of
 (token(*STATIC*), d2ecl)
|D2Cextern of
 (token(*EXTERN*), d2ecl)
//
|D2Clocal0 of
 ( d2eclist(*local-head*)
 , d2eclist(*local-body*))
//
|D2Cabssort of (sym_t)
//
|D2Cstacst0 of (s2cst, sort2)
//
|D2Csortdef of (sym_t, s2tex)
//
|D2Csexpdef of (s2cst, s2exp)
//
|D2Cabstype of (s2cst, a2tdf)
//
|
D2Csymload of
(token, sym_t(*loaded*), d2ptm)
//
|D2Cdatasort of (d1ecl, sort2lst)
//
|
D2Cvaldclst of
(token(*VAL(vlk)*), d2valdclist)
|
D2Cvardclst of
(token(*VAR(vrk)*), d2vardclist)
|
D2Cfundclst of
(token(*FUN(fnk)*), t2qaglst, d2fundclist)
//
|D2Cexcptcon of (d2ecl, d2conlst)
|D2Cdatatype of (d2ecl, s2cstlst)
//
|D2Cdynconst of
(token(*fnk//vlk*), t2qaglst, d2cstdclist)
//
|
D2Cnone0 of ((*void*)) | D2Cnone1 of (d1ecl)
//
|
D2Cerrck of (sint(*lvl*), d2ecl)//tread01-error
//
// HX-2022-??-??: end-of-[ datatype(d2ecl_node) ]
//
(* ****** ****** *)
//
and a2tdf =
| A2TDFsome of () // unspecified
| A2TDFlteq of (s2exp) // ty-erasure
| A2TDFeqeq of (s2exp) // definition
//
(* ****** ****** *)
fun
d2ecl_fprint:(FILR,d2ecl)->void
(* ****** ****** *)
fun
a2tdf_fprint:(FILR,a2tdf)->void
(* ****** ****** *)
fun
d2ecl_get_lctn(d2ecl): loc_t
fun
d2ecl_get_node(d2ecl): d2ecl_node
(* ****** ****** *)
#symload lctn with d2ecl_get_lctn
#symload node with d2ecl_get_node
(* ****** ****** *)
fun
d2ecl_make_node
(loc:loc_t,nod:d2ecl_node): d2ecl
#symload d2ecl with d2ecl_make_node
(* ****** ****** *)
fun
d2valdcl_fprint:(FILR,d2valdcl)->void
fun
d2vardcl_fprint:(FILR,d2vardcl)->void
(* ****** ****** *)
fun
d2fundcl_fprint:(FILR,d2fundcl)->void
(* ****** ****** *)
fun
d2cstdcl_fprint:(FILR,d2cstdcl)->void
(* ****** ****** *)
fun
d2valdcl_get_lctn:(d2valdcl)->loc_t
fun
d2vardcl_get_lctn:(d2vardcl)->loc_t
fun
d2fundcl_get_lctn:(d2fundcl)->loc_t
(* ****** ****** *)
#symload lctn with d2valdcl_get_lctn
#symload lctn with d2vardcl_get_lctn
#symload lctn with d2fundcl_get_lctn
(* ****** ****** *)
fun
d2valdcl_get_dpat:(d2valdcl)->d2pat
fun
d2valdcl_get_tdxp:(d2valdcl)->teqd2exp
fun
d2valdcl_get_wsxp:(d2valdcl)->wths2exp
(* ****** ****** *)
#symload dpat with d2valdcl_get_dpat
#symload tdxp with d2valdcl_get_tdxp(*opt*)
#symload wsxp with d2valdcl_get_wsxp(*opt*)
(* ****** ****** *)
fun
d2vardcl_get_dpid:(d2vardcl)->d2var
fun
d2vardcl_get_vpid:(d2vardcl)->d2varopt
fun
d2vardcl_get_sres:(d2vardcl)->s2expopt
fun
d2vardcl_get_dini:(d2vardcl)->teqd2exp
(* ****** ****** *)
#symload dpid with d2vardcl_get_dpid
#symload vpid with d2vardcl_get_vpid(*opt*)
#symload sres with d2vardcl_get_sres(*opt*)
#symload dini with d2vardcl_get_dini(*opt*)
(* ****** ****** *)
//
fun
d2valdcl_make_args
( lctn:loc_t
, dpat:d2pat
, tdxp:teqd2exp, wsxp:wths2exp):d2valdcl
fun
d2vardcl_make_args
( lctn:loc_t
, dpid:d2var
, vpid:d2varopt
, sres:s2expopt, dini:teqd2exp):d2vardcl
//
(* ****** ****** *)

#abstbox d2parsed_tbox // ptr
#typedef d2parsed = d2parsed_tbox

(* ****** ****** *)
//
fun
d2parsed_fprint
(out: FILR, dpar: d2parsed): void
//
(* ****** ****** *)
fun
d2parsed_get_stadyn:(d2parsed)->sint
fun
d2parsed_get_nerror:(d2parsed)->sint
fun
d2parsed_get_source:(d2parsed)->lcsrc
fun
d2parsed_get_parsed:(d2parsed)->d2eclistopt
//
#symload stadyn with d2parsed_get_stadyn
#symload nerror with d2parsed_get_nerror
#symload source with d2parsed_get_source
#symload parsed with d2parsed_get_parsed
//
fun
d2parsed_make_args
( stadyn:sint
, nerror:sint
, source:lcsrc
, parsed:d2eclistopt): d2parsed//end-fun
//
#symload d2parsed with d2parsed_make_args
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_dynexp2.sats] *)
