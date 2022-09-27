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
LOC = "./locinfo.sats"
//
#typedef lab_t = $LAB.lab_t
#typedef label = $LAB.label
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
LEX = "./lexing0.sats"
//
#typedef sym_t = $SYM.sym_t
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
#typedef d2conlst = list(d2con)
#typedef d2cstlst = list(d2cst)
#typedef d2varlst = list(d2var)
(* ****** ****** *)
(*
#typedef q2arglst = list(q2arg)
*)
#typedef s2qaglst = list(s2qag)
#typedef t2qaglst = list(t2qag)
#typedef t2iaglst = list(t2iag)
(* ****** ****** *)
#typedef d2patlst = list(d2pat)
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
//
datatype
d2lab(x0:type) =
|
D2LAB of
(label, x0(*elt*))
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
| D2Pnone0 of () | D2Pnone1 of (d1pat)
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
d2pat_none1(d1p0:d1pat): d2pat
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
| D2Enone0 of () | D2Enone1 of (d1exp)
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
d2exp_none1(d1e0:d1exp): d2exp
(* ****** ****** *)
fun
d2exp_make_node
(loc:loc_t,nod:d2exp_node): d2exp
#symload d2exp with d2exp_make_node
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
|D2Clocal of
 (d2eclist(*local*), d2eclist)
//
|D2Cabssort of (sym_t)
//
|D2Cstacst0 of (s2cst, sort2)
//
|D2Csexpdef of (s2cst, s2exp)
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
(* ****** ****** *)
fun
d2ecl_fprint:(FILR,d2ecl)->void
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

(* end of [ATS3/XATSOPT_srcgen2_dynexp2.sats] *)
