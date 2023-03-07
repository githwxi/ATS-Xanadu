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
#staload
MAP = "./xsymmap.sats"
//
#typedef sym_t = $SYM.sym_t
//
(* ****** ****** *)
//
#staload
LEX = "./lexing0.sats"
//
#typedef tnode = $LEX.tnode
#typedef token = $LEX.token
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
(* ****** ****** *)
#typedef s1qid = $S1E.s1qid
#typedef d1qid = $S1E.d1qid
(* ****** ****** *)
#typedef s1exp = $S1E.s1exp
(* ****** ****** *)
#typedef d1pat = $D1E.d1pat
#typedef d1exp = $D1E.d1exp
#typedef d1ecl = $D1E.d1ecl
(* ****** ****** *)
#typedef g1mac = $G1M.g1mac
(* ****** ****** *)
#typedef sort2 = $S2E.sort2
#typedef s2tex = $S2E.s2tex
(* ****** ****** *)
#typedef s2cst = $S2E.s2cst
#typedef s2var = $S2E.s2var
#typedef s2exp = $S2E.s2exp
#typedef s2typ = $S2E.s2typ
(* ****** ****** *)
#typedef s2itm = $S2E.s2itm
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
#abstbox d2pat_tbox // ptr
#abstbox d2exp_tbox // ptr
#typedef d2pat = d2pat_tbox
#typedef d2exp = d2exp_tbox
(* ****** ****** *)
#abstbox d2rpt_tbox // ptr
#abstbox d2rxp_tbox // ptr
#typedef d2rpt = d2rpt_tbox
#typedef d2rxp = d2rxp_tbox
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
#abstbox d2ecl_tbox // ptr
#typedef d2ecl = d2ecl_tbox
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
#typedef s2qas = list(s2qag)
#typedef t2qas = list(t2qag)
#typedef t2ias = list(t2iag)
//
(* ****** ****** *)
#abstbox d2arg_tbox // ptr
#typedef d2arg = d2arg_tbox
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
#typedef d2arglst = list(d2arg)
(* ****** ****** *)
#typedef f1unarrw = $D1E.f1unarrw
#typedef d1topenv = $D1E.d1topenv
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
#typedef d2explstopt = optn(d2explst)
#typedef d2eclistopt = optn(d2eclist)
(* ****** ****** *)
#vwtpdef d2patlst_vt = list_vt(d2pat)
#vwtpdef d2explst_vt = list_vt(d2exp)
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
d2con_get_lctn:(d2con) -> loc_t
fun
d2con_get_name:(d2con) -> sym_t
fun
d2con_get_tqas:(d2con) -> t2qas
fun
d2con_get_sexp:(d2con) -> s2exp
fun
d2con_get_styp:(d2con) -> s2typ
fun
d2con_get_stmp:(d2con) -> stamp
//
#symload lctn with d2con_get_lctn
#symload name with d2con_get_name
#symload tqas with d2con_get_tqas
#symload sexp with d2con_get_sexp
#symload styp with d2con_get_styp
#symload stmp with d2con_get_stmp
//
fun
d2con_set_sexp
(d2c0: d2con, s2e0: s2exp): void
fun
d2con_set_styp
(d2c0: d2con, t2p0: s2typ): void
//
#symload sexp with d2con_set_sexp
#symload styp with d2con_set_styp
//
(* ****** ****** *)
//
fun
d2con_get_narg(d2c0:d2con): sint
//
#symload narg with d2con_get_narg
//
(* ****** ****** *)
//
fun
d2cst_get_lctn:(d2cst) -> loc_t
fun
d2cst_get_name:(d2cst) -> sym_t
fun
d2cst_get_tknd:(d2cst) -> tnode
fun
d2cst_get_tqas:(d2cst) -> t2qas
fun
d2cst_get_sexp:(d2cst) -> s2exp
fun
d2cst_get_styp:(d2cst) -> s2typ
fun
d2cst_get_stmp:(d2cst) -> stamp
//
#symload lctn with d2cst_get_lctn
#symload name with d2cst_get_name
#symload tknd with d2cst_get_tknd
#symload tqas with d2cst_get_tqas
#symload sexp with d2cst_get_sexp
#symload styp with d2cst_get_styp
#symload stmp with d2cst_get_stmp
//
fun
d2cst_set_sexp
(d2c0: d2cst,s2e0: s2exp): void
fun
d2cst_set_styp
(d2c0: d2cst,t2p0: s2typ): void
//
#symload sexp with d2cst_set_sexp
#symload styp with d2cst_set_styp
//
(* ****** ****** *)
//
fun
d2cst_make_dvar
( dvar: d2var ): d2cst
fun
d2con_make_idtp
(tok0: token
,tqas: t2qas, sexp: s2exp): d2con
fun
d2cst_make_idtp
(tok0: token
,tqas: t2qas, sexp: s2exp): d2cst
//
#symload d2cst with d2cst_make_dvar
#symload d2con with d2con_make_idtp
#symload d2cst with d2cst_make_idtp
//
(* ****** ****** *)
//
fun
d2var_get_lctn:(d2var) -> loc_t
fun
d2var_get_name:(d2var) -> sym_t
fun
d2var_get_stmp:(d2var) -> stamp
//
#symload lctn with d2var_get_lctn
#symload name with d2var_get_name
#symload stmp with d2var_get_stmp
//
(* ****** ****** *)
//
fun
d2var_get_styp:(d2var) -> s2typ
fun
d2var_set_styp
(d2v0: d2var, t2p0: s2typ): void
//
#symload styp with d2var_get_styp
#symload styp with d2var_set_styp
//
(* ****** ****** *)
//
fun
d2var_new1_tokn
(tok0: token): d2var
fun
d2var_new2_name
(loc0: loc_t, name: sym_t): d2var
//
#symload d2var with d2var_new1_tokn
#symload d2var with d2var_new2_name
(* ****** ****** *)
//
datatype
d2itm =
//
|D2ITMvar of (d2var)
//
|D2ITMcon of (d2conlst)
|D2ITMcst of (d2cstlst)
//
|D2ITMsym of (sym_t, d2ptmlst)
//
and // datatype
d2ptm =
|
D2PTMnone of (d1qid)
|
D2PTMsome of (int(*pval*),d2itm)
//
where
{
#typedef d2itmlst = list(d2itm)
#typedef d2itmopt = optn(d2itm)
#typedef d2ptmlst = list(d2ptm)
#typedef d2ptmopt = optn(d2ptm)
} (*where*) //end-of-(  d2ptm  )
//
(* ****** ****** *)
fun
d2itm_fprint: (FILR,d2itm)->void
fun
d2ptm_fprint: (FILR,d2ptm)->void
(* ****** ****** *)
fun
s2qag_fprint: (FILR,s2qag)->void
fun
t2qag_fprint: (FILR,t2qag)->void
fun
t2iag_fprint: (FILR,t2iag)->void
(* ****** ****** *)
//
fun
s2qag_get_lctn:(s2qag)->loc_t
fun
s2qag_get_s2vs:(s2qag)->s2varlst
//
#symload lctn with s2qag_get_lctn
#symload s2vs with s2qag_get_s2vs
//
(* ****** ****** *)
//
fun
t2qag_get_lctn:(t2qag)->loc_t
fun
t2qag_get_s2vs:(t2qag)->s2varlst
//
#symload lctn with t2qag_get_lctn
#symload s2vs with t2qag_get_s2vs
//
(* ****** ****** *)
//
fun
t2iag_get_lctn:(t2iag)->loc_t
fun
t2iag_get_s2es:(t2iag)->s2explst
fun
t2iag_set_s2es
(t2i0:t2iag,s2es:s2explst): void
//
#symload lctn with t2iag_get_lctn
#symload s2es with t2iag_get_s2es
#symload s2es with t2iag_set_s2es
//
(* ****** ****** *)
fun
s2qag_make_s2vs
(loc0:loc_t,s2vs:s2varlst):s2qag
#symload t2qag with s2qag_make_s2vs
fun
t2qag_make_s2vs
(loc0:loc_t,s2vs:s2varlst):t2qag
#symload t2qag with t2qag_make_s2vs
fun
t2iag_make_s2es
(loc0:loc_t,s2es:s2explst):t2iag
#symload t2iag with t2iag_make_s2es
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
|D2Pint of token
|D2Pbtf of sym_t
|D2Pchr of token
|D2Pflt of token
|D2Pstr of token
//
|D2Pi00 of (sint) // sint
|D2Pb00 of (bool) // bool
|D2Pc00 of (char) // char
|D2Ps00 of (strn) // string
//
|D2Pcon of (d2con)
|D2Pcons of (d2conlst)
//
|D2Pbang of (d2pat) // !
|D2Pflat of (d2pat) // @
|D2Pfree of (d2pat) // ~
//
|D2Psym0 of
( d2rpt(*ref*)
, d1pat(*sym*), d2ptmlst)
//
|D2Psapp of
 (d2pat, s2varlst(*sarg*))
//
|D2Pdap0 of (d2pat) // nullary
|D2Pdap1 of (d2pat) // argless
//
|
D2Pdapp of
( d2pat
, sint(*npf*), d2patlst(*darg*)
) (* D2Pdapp *)
//
|
D2Ptup0 of (sint(*npf*), d2patlst)
//
|
D2Ptup1 of
(
token(*knd*), sint(*npf*), d2patlst)
|
D2Prcd2 of
(
token(*knd*), sint(*npf*), l2d2plst)
//
|
D2Pannot of
(d2pat,s1exp(*given*),s2exp(*trans*))
//
|
D2Pg1mac of
(g1mac(*unknown*))//HX: temp or error!
//
|
D2Pt2pck of (d2pat, s2typ)//HX: casting
//
|
D2Pnone0 of ((*0*))
|
D2Pnone1 of (d1pat) | D2Pnone2 of (d2pat)
//
|
D2Perrck of (sint(*lvl*), d2pat)//HX:tread12-error
//
// end of [d1exp_node] // end of [ datatype(...) ]
//
(* ****** ****** *)
fun
d2pat_fprint:(FILR,d2pat)->void
fun
d2rpt_fprint:(FILR,d2rpt)->void
(* ****** ****** *)
fun
d2pat_get_lctn(d2pat): loc_t
fun
d2pat_get_node(d2pat): d2pat_node
(* ****** ****** *)
#symload lctn with d2pat_get_lctn
#symload node with d2pat_get_node
(* ****** ****** *)
//
fun
d2rpt_new1(loc:loc_t): d2rpt
//
fun
d2rpt_get_dpat(d2rpt): d2pat
fun
d2rpt_set_dpat
(drpt: d2rpt, d2p0: d2pat): void
#symload dpat with d2rpt_get_dpat
#symload dpat with d2rpt_set_dpat
//
(* ****** ****** *)
//
fun
d2pat_get_styp:(d2pat)->s2typ
fun
d2pat_set_styp
(d2p0: d2pat, t2p0: s2typ): void
//
#symload styp with d2pat_get_styp
#symload styp with d2pat_set_styp
//
(* ****** ****** *)
fun
d2pat_none0(loc0:loc_t): d2pat
fun
d2pat_none1(d1p0:d1pat): d2pat
fun
d2pat_none2(d2p0:d2pat): d2pat
(* ****** ****** *)
fun
d2pat_btf
(loc0: loc_t, sym1: sym_t): d2pat
(* ****** ****** *)
fun
d2pat_any
(loc0: loc_t, sym1: sym_t): d2pat
fun
d2pat_var
(loc0: loc_t, d2v1: d2var): d2pat
(* ****** ****** *)
fun
d2pat_sym0
( loc0: loc_t
, drpt: d2rpt(*ref*)
, d1p0: d1pat(*sym*)
, dpis: d2ptmlst(*opts*) ): d2pat
(* ****** ****** *)
fun
d2pat_con
(loc0: loc_t, d2c1: d2con): d2pat
fun
d2pat_cons
(loc0: loc_t, d2cs: d2conlst): d2pat
(* ****** ****** *)
//
fun
d2pat_sapp
( loc0: loc_t
, d2f0: d2pat(*fun*)
, s2vs: s2varlst(*arg*) ) : d2pat
fun
d2pat_dapp
( loc0: loc_t
, d2f0: d2pat(*fun*)
, npf0: (sint)
, d2ps: d2patlst(*arg*) ) : d2pat
//
(* ****** ****** *)
fun
d2pat_make_node
(loc:loc_t,nod:d2pat_node): d2pat
#symload d2pat with d2pat_make_node
(* ****** ****** *)
//
datatype
f2arg_node =
//
(*
| F2ARGnone of (token)
*)
//
|
F2ARGsta0 of
( s2varlst(*s2vs*)
, s2explst(*s2ps*)) // static
//
|
F2ARGdyn0 of
(int(*npf*), d2patlst(*farglst*))
//
|
F2ARGmet0 of (s2explst(*metrics*))
//
(* ****** ****** *)
//
fun
f2arg_fprint:(FILR,f2arg)->void
//
(* ****** ****** *)
fun
f2arg_get_lctn(f2arg): loc_t
fun
f2arg_get_node(f2arg): f2arg_node
(* ****** ****** *)
#symload lctn with f2arg_get_lctn
#symload node with f2arg_get_node
(* ****** ****** *)
//
fun
f2arg_make_node
(loc0:loc_t,node:f2arg_node):f2arg
#symload f2arg with f2arg_make_node
//
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
fun
d2gua_make_node
(loc0:loc_t,node:d2gua_node):d2gua
fun
d2gpt_make_node
(loc0:loc_t,node:d2gpt_node):d2gpt
fun
d2cls_make_node
(loc0:loc_t,node:d2cls_node):d2cls
#symload d2gua with d2gua_make_node
#symload d2gpt with d2gpt_make_node
#symload d2cls with d2cls_make_node
//
(* ****** ****** *)
//
datatype
d2exp_node =
//
|D2Eint of token
|D2Ebtf of sym_t
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
|D2Econ of (d2con)
|D2Ecst of (d2cst)
//
|D2Econs of (d2conlst)
|D2Ecsts of (d2cstlst)
//
|D2Esym0 of
( d2rxp(*ref*)
, d1exp(*sym*), d2ptmlst )
//
|D2Esapp of (d2exp, s2explst)
|D2Etapp of (d2exp, s2explst)
//
|D2Edap0 of (d2exp)
|D2Edapp of
(d2exp, sint(*npf*), d2explst)
//
|D2Elet0 of (d2eclist, d2exp)
|D2Ewhere of (d2exp, d2eclist)
//
|
D2Eassgn of
(d2exp(*l-val*), d2exp(*r-val*))
|
D2Ebrckt of
(d2ptmlst(*[]*), d2explst(*arg*))
|
D2Edtsel of
(token
,label
,d2ptmlst
,sint(*npf*), d2explstopt(*arg*))
//
|
D2Eift0 of
(d2exp(*cond*)
,d2expopt(*then*),d2expopt(*else*))
//
|
D2Ecas0 of
( token(*+/0/-*), d2exp, d2clslst )
//
|
D2Eseqn of
( d2explst(*init*), d2exp(*last*) )
//
|D2Etup0 of (sint(*npf*), d2explst)
(*
|D2Ercd0 of (sint(*npf*), l2d2elst)
*)
|
D2Etup1 of // HX: tuple
(
token(*knd*), sint(*npf*), d2explst)
|
D2Ercd2 of // HX: record
(
token(*knd*), sint(*npf*), l2d2elst)
//
|
D2Elam0 of
( token(*knd*)
, f2arglst, s2res, f1unarrw, d2exp )
|
D2Efix0 of
( token(*knd*)
, d2var(*fid*)
, f2arglst, s2res, f1unarrw, d2exp )
//
|
D2Etry0 of
( token(*TRY*)
, d2exp(*norm*), d2clslst(*excptn*))
//
| D2Eaddr of d2exp(*left-val*)
| D2Efold of d2exp(*open-con*)
| D2Eeval of d2exp(*ptr/lazy*)
| D2Efree of d2exp(*free-con*)
//
| D2Eraise of d2exp(*lin-exn*)
//
|
D2Elazy0 of
( d2exp(*thunk*) ) // non-linear
|
D2Elazy1 of // linear-lazy-eval
( d2exp(*thunk*), d2explst(*frees*))
//
|
D2Eannot of
(d2exp,s1exp(*given*),s2exp(*trans*))
//
|
D2Eexists of
(s2explst(*witness*), d2exp(*scoped*))
//
|
D2Eg1mac of
(g1mac(*unknown*))//HX: temp or error!
//
|
D2Et2pck of (d2exp, s2typ)//HX: casting
//
|D2Enone0 of ((*0*))
|D2Enone1 of (d1exp) | D2Enone2 of (d2exp)
//
|
D2Eerrck of (sint(*lvl*), d2exp)//HX:tread12-error
//
// end of [d1exp_node] // end of [ datatype(...) ]
//
(* ****** ****** *)
//
and
s2eff =
| S2EFFnone of ()
| S2EFFsome of s2explst
and
s2res =
| S2RESnone of ((*void*))
| S2RESsome of (s2eff, s2exp)
//
(* ****** ****** *)
fun
d2exp_fprint:(FILR,d2exp)->void
fun
d2rxp_fprint:(FILR,d2rxp)->void
(* ****** ****** *)
fun
s2eff_fprint:(FILR,s2eff)->void
fun
s2res_fprint:(FILR,s2res)->void
(* ****** ****** *)
fun
d2exp_get_lctn(d2exp): loc_t
fun
d2exp_get_node(d2exp): d2exp_node
(* ****** ****** *)
#symload lctn with d2exp_get_lctn
#symload node with d2exp_get_node
(* ****** ****** *)
//
fun
d2rxp_new1(loc:loc_t): d2rxp
//
fun
d2rxp_get_dexp(d2rxp): d2exp
fun
d2rxp_set_dexp
(drxp: d2rxp, d2e0: d2exp): void
#symload dexp with d2rxp_get_dexp
#symload dexp with d2rxp_set_dexp
(* ****** ****** *)
//
fun
d2exp_get_styp:(d2exp)->s2typ
fun
d2exp_set_styp
(d2e0: d2exp, t2p0: s2typ): void
//
#symload styp with d2exp_get_styp
#symload styp with d2exp_set_styp
//
(* ****** ****** *)
fun
d2exp_none0(loc0:loc_t): d2exp
fun
d2exp_none1(d1e0:d1exp): d2exp
fun
d2exp_none2(d2e0:d2exp): d2exp
(* ****** ****** *)
fun
d2exp_var
(loc0: loc_t, d2v1: d2var): d2exp
(* ****** ****** *)
fun
d2exp_btf
(loc0: loc_t, sym1: sym_t): d2exp
fun
d2exp_top
(loc0: loc_t, sym1: sym_t): d2exp
(* ****** ****** *)
fun
d2exp_sym0
( loc0: loc_t
, drxp: d2rxp(*ref*)
, d1e0: d1exp(*sym*)
, dpis: d2ptmlst(*opts*) ): d2exp
(* ****** ****** *)
fun
d2exp_con
(loc0: loc_t, d2c1: d2con): d2exp
fun
d2exp_cons
(loc0: loc_t, d2cs: d2conlst): d2exp
fun
d2exp_cst
(loc0: loc_t, d2c1: d2cst): d2exp
fun
d2exp_csts
(loc0: loc_t, d2cs: d2cstlst): d2exp
(* ****** ****** *)
fun
d2exp_sapp
( loc0: loc_t
, d2f0: d2exp(*fun*)
, s2es: s2explst(*args*) ): d2exp
fun
d2exp_tapp
( loc0: loc_t
, d2f0: d2exp(*fun*)
, s2es: s2explst(*args*) ): d2exp
(* ****** ****** *)
fun
d2exp_a2pp
( loc0: loc_t
, d2f0: d2exp
, d2e1: d2exp, d2e2: d2exp): d2exp
fun
d2exp_dapp
( loc0: loc_t
, d2f0: d2exp
, npf1: (sint), d2es: d2explst): d2exp
(* ****** ****** *)
//
fun
d2exp_make_node
(loc:loc_t,nod:d2exp_node): d2exp
//
#symload d2exp with d2exp_make_node
//
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
|D2Cabsopen of
 ( token(*absopen*) , simpl )
|D2Cabsimpl of
 ( token(*abskind*)
 , simpl, s2exp(*definition*))
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
|
D2Cimplmnt0 of
( token(*impkind*)
, s2qaglst // s2vs
, t2qaglst // s2vs+t2is
, dimpl, t2iaglst, f2arglst, s2res, d2exp)
//
|D2Cexcptcon of (d1ecl, d2conlst)
|D2Cdatatype of (d1ecl, s2cstlst)
//
|D2Cdynconst of
(token(*fnk//vlk*), t2qaglst, d2cstdclist)
//
|
D2Cnone0 of ((*nil*))
|
D2Cnone1 of ( d1ecl ) | D2Cnone2 of ( d2ecl )
//
|
D2Cerrck of (sint(*lvl*), d2ecl)//tread12-error
//
// HX-2022-??-??: end-of-[ datatype(d2ecl_node) ]
//
(* ****** ****** *)
//
and simpl =
|
SIMPLall1 of
(s1qid, s2cstlst)
|
SIMPLopt2 of
(s1qid, s2cstlst, s2cstlst)
//
and dimpl =
|
DIMPLall1 of
(d1qid, d2cstlst)
|
DIMPLopt2 of
(d1qid, d2cstlst, d2cstlst)
//
(* ****** ****** *)
//
and a2tdf =
|
A2TDFsome of ()//unspecified
|
A2TDFlteq of s2exp//ty-erasure
|
A2TDFeqeq of s2exp//definition
|
A2TDFdefn of s2exp//definition
//
(* ****** ****** *)
fun
d2ecl_fprint:(FILR,d2ecl)->void
(* ****** ****** *)
fun
simpl_fprint:(FILR,simpl)->void
fun
dimpl_fprint:(FILR,dimpl)->void
(* ****** ****** *)
fun
a2tdf_fprint:(FILR,a2tdf)->void
(* ****** ****** *)
fun
d2ecl_get_lctn(d2ecl): loc_t
fun
d2ecl_get_node(d2ecl): d2ecl_node
(* ****** ****** *)
fun
d2ecl_none1(d1cl:d1ecl): d2ecl
(* ****** ****** *)
fun
d2ecl_make_node
(loc:loc_t,nod:d2ecl_node): d2ecl
(* ****** ****** *)
#symload lctn with d2ecl_get_lctn
#symload node with d2ecl_get_node
(* ****** ****** *)
#symload d2ecl with d2ecl_make_node
(* ****** ****** *)
//
datatype
d2arg_node =
//
(*
| D1ARGnone of token
*)
|
D2ARGsta0 of
(s2varlst, s2explst(*prop*))
|
D2ARGdyn1 of (s2exp(*dpid*))
|
D2ARGdyn2 of (sint(*npf*), s2explst)
//
(* ****** ****** *)
fun
d2arg_fprint:(FILR,d2arg)->void
(* ****** ****** *)
//
fun
d2arg_get_lctn(d2arg): loc_t
fun
d2arg_get_node(d2arg): d2arg_node
//
#symload lctn with d2arg_get_lctn
#symload node with d2arg_get_node
//
(* ****** ****** *)
fun
d2arg_make_node
(loc:loc_t,nod:d2arg_node): d2arg
#symload d2arg with d2arg_make_node
(* ****** ****** *)
//
fun
s2cst_get_atdf
( s2c0
: s2cst ): optn_vt(a2tdf)
fun
s2cst_set_atdf
(s2c0: s2cst, atdf: a2tdf):void
#symload atdf with s2cst_get_atdf
#symload atdf with s2cst_set_atdf
//
fun
s2cst_get_d2cs
( s2c0
: s2cst ): optn_vt(d2conlst)
fun
s2cst_set_d2cs
(s2c0:s2cst,d2cs:d2conlst):void
#symload d2cs with s2cst_get_d2cs
#symload d2cs with s2cst_set_d2cs
//
(* ****** ****** *)
fun
d2valdcl_fprint
(out: FILR, dval: d2valdcl): void
fun
d2vardcl_fprint
(out: FILR, dvar: d2vardcl): void
(* ****** ****** *)
fun
d2fundcl_fprint
(out: FILR, dfun: d2fundcl): void
(* ****** ****** *)
fun
d2cstdcl_fprint
(out: FILR, dcst: d2cstdcl): void
(* ****** ****** *)
fun
d2valdcl_get_lctn:(d2valdcl)->loc_t
fun
d2vardcl_get_lctn:(d2vardcl)->loc_t
fun
d2fundcl_get_lctn:(d2fundcl)->loc_t
fun
d2cstdcl_get_lctn:(d2cstdcl)->loc_t
(* ****** ****** *)
#symload lctn with d2valdcl_get_lctn
#symload lctn with d2vardcl_get_lctn
#symload lctn with d2fundcl_get_lctn
#symload lctn with d2cstdcl_get_lctn
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
fun
d2fundcl_get_dpid:(d2fundcl)->d2var
fun
d2fundcl_get_farg:(d2fundcl)->f2arglst
fun
d2fundcl_get_sres:(d2fundcl)->s2res
fun
d2fundcl_get_tdxp:(d2fundcl)->teqd2exp
fun
d2fundcl_get_wsxp:(d2fundcl)->wths2exp
(* ****** ****** *)
#symload dpid with d2fundcl_get_dpid
#symload farg with d2fundcl_get_farg(*lst*)
#symload sres with d2fundcl_get_sres(*opt*)
#symload tdxp with d2fundcl_get_tdxp(*opt*)
#symload wsxp with d2fundcl_get_wsxp(*opt*)
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
fun
d2fundcl_make_args
( lctn:loc_t
, dpid:d2var
, farg:f2arglst
, sres:s2res
, tdxp:teqd2exp, wsxp:wths2exp):d2fundcl
//
#symload d2valdcl with d2valdcl_make_args
#symload d2vardcl with d2vardcl_make_args
#symload d2fundcl with d2fundcl_make_args
//
(* ****** ****** *)
//
#typedef d2res = teqd2exp
//
(* ****** ****** *)
//
fun
d2cstdcl_get_dpid:(d2cstdcl)->d2cst
fun
d2cstdcl_get_darg:(d2cstdcl)->d2arglst
fun
d2cstdcl_get_sres:(d2cstdcl)->s2res(*opt*)
fun
d2cstdcl_get_dres:(d2cstdcl)->d2res(*opt*)
//
#symload dpid with d2cstdcl_get_dpid
#symload darg with d2cstdcl_get_darg(*lst*)
#symload sres with d2cstdcl_get_sres(*opt*)
#symload dres with d2cstdcl_get_dres(*opt*)
//
fun
d2cstdcl_make_args
( lctn: loc_t
, dpid: d2cst
, darg: d2arglst, s2res, d2res):d2cstdcl
//
#symload d2cstdcl with d2cstdcl_make_args
//
(* ****** ****** *)
//
datatype
d2topenv =
D2TOPENV of
( $MAP.topmap(g1mac)
, $MAP.topmap(s2tex)
, $MAP.topmap(s2itm)
, $MAP.topmap(d2itm))
//
(* ****** ****** *)
//
#abstbox d2parsed_tbox // ptr
#typedef d2parsed = d2parsed_tbox
//
(* ****** ****** *)
//
fun
d2parsed_fprint
(out: FILR, dpar: d2parsed): void
//
(* ****** ****** *)
//
fun
d2parsed_get_stadyn:(d2parsed)->sint
fun
d2parsed_get_nerror:(d2parsed)->sint
fun
d2parsed_get_source:(d2parsed)->lcsrc
fun
d2parsed_get_t1penv:(d2parsed)->d1topenv
fun
d2parsed_get_t2penv:(d2parsed)->d2topenv
fun
d2parsed_get_parsed:(d2parsed)->d2eclistopt
//
#symload stadyn with d2parsed_get_stadyn
#symload nerror with d2parsed_get_nerror
#symload source with d2parsed_get_source
#symload t1penv with d2parsed_get_t1penv
#symload t2penv with d2parsed_get_t2penv
#symload parsed with d2parsed_get_parsed
//
fun
d2parsed_make_args
( stadyn:sint
, nerror:sint
, source:lcsrc
, t1penv:d1topenv
, t2penv:d2topenv
, parsed:d2eclistopt): d2parsed//end-fun
//
#symload d2parsed with d2parsed_make_args
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_dynexp2.sats] *)
