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
(*
HX: for [FILR]
*)
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
LAB = "./\
../../../SATS/xlabel0.sats"
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
//
#staload
S1E = "./\
../../../SATS/staexp1.sats"
#staload
D1E = "./\
../../../SATS/dynexp1.sats"
//
(* ****** ****** *)
//
#staload
S2E = "./\
../../../SATS/staexp2.sats"
#staload
D2E = "./\
../../../SATS/dynexp2.sats"
//
#staload
D3E = "./\
../../../SATS/dynexp3.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#typedef sym_t = $SYM.sym_t
#typedef symbl = $SYM.symbl
(* ****** ****** *)
#typedef label = $LAB.label
(* ****** ****** *)
#typedef fpath = $FIL.fpath
(* ****** ****** *)
#typedef lcsrc = $LOC.lcsrc
#typedef loc_t = $LOC.loc_t
#typedef loctn = $LOC.loctn
(* ****** ****** *)
#typedef token = $LEX.token
(* ****** ****** *)
#typedef s1exp = $S1E.s1exp
#typedef d1exp = $D1E.d1exp
(* ****** ****** *)
#typedef sort2 = $S2E.sort2
#typedef s2var = $S2E.s2var
#typedef s2exp = $S2E.s2exp
#typedef s2typ = $S2E.s2typ
(* ****** ****** *)
#typedef s2res = $D2E.s2res
(* ****** ****** *)
#typedef s2qag = $D2E.s2qag
#typedef t2qag = $D2E.t2qag
#typedef t2iag = $D2E.t2iag
#typedef t2jag = $D2E.t2jag
(* ****** ****** *)
#typedef d2var = $D2E.d2var
#typedef d2con = $D2E.d2con
#typedef d2cst = $D2E.d2cst
#typedef d2exp = $D2E.d2exp
(* ****** ****** *)
#sexpdef d3lab = $D3E.d3lab
(* ****** ****** *)
#typedef d3pat = $D3E.d3pat
#typedef d3exp = $D3E.d3exp
#typedef d3ecl = $D3E.d3ecl
(* ****** ****** *)
(* ****** ****** *)
#abstbox d3pat1_tbox // p0tr
#typedef d3pat1 = d3pat1_tbox
(* ****** ****** *)
#abstbox d3typ1_tbox // p0tr
#typedef d3typ1 = d3typ1_tbox
(* ****** ****** *)
#abstbox d3exp1_tbox // p0tr
#typedef d3exp1 = d3exp1_tbox
(* ****** ****** *)
#typedef l3d3p1 = d3lab(d3pat1)
#typedef l3d3e1 = d3lab(d3exp1)
(* ****** ****** *)
#abstbox f3arg1_tbox // p0tr
#typedef f3arg1 = f3arg1_tbox
(* ****** ****** *)
#abstbox d3gua1_tbox // p0tr
#abstbox d3gpt1_tbox // p0tr
#abstbox d3cls1_tbox // p0tr
#typedef d3gua1 = d3gua1_tbox
#typedef d3gpt1 = d3gpt1_tbox
#typedef d3cls1 = d3cls1_tbox
(* ****** ****** *)
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
(* ****** ****** *)
#typedef s2varlst = list(s2var)
#typedef s2explst = list(s2exp)
#typedef s2typlst = list(s2typ)
(* ****** ****** *)
#typedef s2expopt = optn(s2exp)
(* ****** ****** *)
#typedef s2qaglst = list(s2qag)
#typedef t2qaglst = list(t2qag)
#typedef t2iaglst = list(t2iag)
#typedef t2jaglst = list(t2jag)
(* ****** ****** *)
#typedef d2varlst = list(d2var)
#typedef d2conlst = list(d2con)
#typedef d2cstlst = list(d2cst)
(* ****** ****** *)
#typedef d2varopt = optn(d2var)
(* ****** ****** *)
#typedef d3patlst = list(d3pat)
#typedef d3explst = list(d3exp)
#typedef d3eclist = list(d3ecl)
(* ****** ****** *)
#typedef f1unarrw = $D1E.f1unarrw
#typedef wths2exp = $D2E.wths2exp
(* ****** ****** *)
(* ****** ****** *)
#typedef d3pat1lst = list(d3pat1)
#typedef d3exp1lst = list(d3exp1)
(* ****** ****** *)
#typedef d3pat1opt = optn(d3pat1)
#typedef d3exp1opt = optn(d3exp1)
(* ****** ****** *)
#typedef l3d3p1lst = list(l3d3p1)
#typedef l3d3e1lst = list(l3d3e1)
(* ****** ****** *)
#typedef d3ecl1lst = list(d3ecl1)
(* ****** ****** *)
#typedef f3arg1lst = list(f3arg1)
(* ****** ****** *)
#typedef d3gua1lst = list(d3gua1)
#typedef d3cls1lst = list(d3cls1)
(* ****** ****** *)
#typedef d3ecl1opt = optn(d3ecl1)
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
(* ****** ****** *)
//
|D3P1dapp of
(d3pat1
,sint(*npf*), d3pat1lst(*darg*)
) (* D3P1dapp *)
//
(* ****** ****** *)
//
|D3P1rfpt of
(d3pat1,token(*AS*),d3pat1(*aspt*))
//
(* ****** ****** *)
//
|D3P1tup0 of (sint(*npf*),d3pat1lst)
|D3P1tup1 of
(token(*knd*),sint(*npf*),d3pat1lst)
|D3P1rcd2 of
(token(*knd*),sint(*npf*),l3d3p1lst)
//
(* ****** ****** *)
|
D3P1annot of
(d3pat1,s1exp(*given*),s2exp(*trans*))
//
(* ****** ****** *)
//
|D3P1d3pat of (d3pat)//yet-to-be-copied
//
(* ****** ****** *)
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
(dpat: d3pat1): s2typ1
#symload styp with d3pat1_styp$get
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
(*
fun
d3pat1_make_lctn$node
(loc0: loctn, node: d3pat1_node): d3pat1
#symload d3pat1 with d3pat1_make_lctn$node
*)
fun
d3pat1_make_lctn$styp$node
(loc0: loctn
,t2p0: s2typ1, node: d3pat1_node): d3pat1
#symload d3pat1 with d3pat1_make_lctn$styp$node
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
d3typ1_node =
//
|T3Ps2typ of s2typ1
|T3Pd3pat of d3pat1
//
#typedef d3typ1lst = list(d3typ1)
#typedef d3typ1opt = optn(d3typ1)
//
(* ****** ****** *)
//
d3typ1_sort$get
(dtyp: d3typ1): sort2
#symload sort with d3typ1_sort$get
fun
d3typ1_node$get
(dtyp: d3typ1): d3typ1_node
#symload node with d3typ1_node$get
//
(* ****** ****** *)
//
fun
d3typ1_fprint
(dtyp: d3typ1, out0: FILR): void
#symload fprint with d3typ1_fprint of 1000
//
(* ****** ****** *)
//
fun
d3typ1_make_sort$node
(sort: sort2, node: d3typ1_node): d3typ1
#symload d3typ1 with d3typ1_make_sort$node
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
|D3E1var of (d2var)
//
|D3E1con of (d2con)
|D3E1cst of (d2cst)
//
(* ****** ****** *)
//
|D3E1sapp of
(d3exp1(*fun*), s2explst)
|D3E1sapq of
(d3exp1(*fun*), s2typlst)
//
(* ****** ****** *)
//
|D3E1tapp of
(d3exp1(*cst*), s2explst)
|D3E1tapq of
(d3exp1(*cst*), t2jaglst)
//
(* ****** ****** *)
//
|D3E1dap0 of
(d3exp1(*fun*))//HX:nullary?
|D3E1dapp of
(d3exp1, sint(*npf*), d3exp1lst)
//
(* ****** ****** *)
//
|D3E1let0 of (d3ecl1lst, d3exp1)
//
(* ****** ****** *)
//
|D3E1ift0 of
(
d3exp1(*cond*),
d3exp1opt(*thn*), d3exp1opt(*els*))
|D3E1cas0 of
(token(*+/0/-*), d3exp1, d3cls1lst)
//
(* ****** ****** *)
//
|D3E1seqn of
(d3exp1lst(*init*), d3exp1(*last*))
//
(* ****** ****** *)
//
|D3E1tup0 of
(sint(*npf*), d3exp1lst)
|D3E1tup1 of
(token(*knd*),sint(*npf*),d3exp1lst)
|D3E1rcd2 of
(token(*knd*),sint(*npf*),l3d3e1lst)
//
(* ****** ****** *)
//
|D3E1lam0 of
(token(*knd*)
,f3arg1lst, s2res, f1unarrw, d3exp1)
|D3E1fix0 of
(token(*knd*)
,d2var(*fid*)
,f3arg1lst, s2res, f1unarrw, d3exp1)
//
(* ****** ****** *)
//
|D3E1try0 of
(token(*$TRY*)
,d3exp1(*norm*),d3cls1lst(*handles*))
//
(* ****** ****** *)
//
|D3E1addr of (d3exp1)//lval-addr
|D3E1view of (d3exp1)//lval-view
|D3E1flat of (d3exp1)//lval-deref
//
(* ****** ****** *)
//
|D3E1eval of (d3exp1)//evaling...
|D3E1fold of (d3exp1)//folding...
|D3E1free of (d3exp1)//freeing...
//
(* ****** ****** *)
//
|D3E1dp2tr of (d3exp1)//p2tr-deref
//
|D3E1dl0az of (d3exp1)//l0azy-eval
|D3E1dl1az of (d3exp1)//l1azy-eval
//
(* ****** ****** *)
//
|D3E1where of
(
d3exp1(*scope*),d3ecl1lst(*decls*))
//
(* ****** ****** *)
//
|D3E1assgn of
(
d3exp1(*l-val*), d3exp1(*r-val*))
//
|D3E1raise of
(token(*$RAISE*), d3exp1(*excptn*))
//
(* ****** ****** *)
//
|D3E1l0azy of // nonlin-lazy-eval
(
d1exp(*$L0AZY*), d3exp1(*non-thunk*))
|D3E1l1azy of // linear-lazy-eval
(
d1exp(*$LLAZY*),
d3exp1(*lin-thunk*),d3exp1lst(*frees*))
//
(* ****** ****** *)
//
|D3E1labck of (d3exp1, label)//lb-cast
//
|D3E1t2pck of (d3exp1, s2typ)//tp-cast
//
(* ****** ****** *)
//
|D3E1annot of
(
  d3exp1,s1exp(*given*),s2exp(*trans*))
//
(* ****** ****** *)
//
|D3E1d3exp of (d3exp)//yet-to-be-copied
//
(* ****** ****** *)
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
(dexp: d3exp1): s2typ1
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
(*
fun
d3exp1_make_lctn$node
(loc0: loctn, node: d3exp1_node): d3exp1
*)
fun
d3exp1_make_lctn$styp$node
(loc0: loctn
,t2p0: s2typ1, node: d3exp1_node): d3exp1
//
#symload d3exp1 with d3exp1_make_lctn$node
#symload d3exp1 with d3exp1_make_lctn$styp$node
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
f3arg1_node =
//
(*
| F3ARG1none of (token)
*)
//
|
F3ARG1dapp of
(
sint(*npf*), d3pat1lst(*args*))
//
|
F3ARG1sapp of
( s2varlst(*s2vs*)
, s2explst(*s2ps*) ) // static
//
|
F3ARG1mets of (s2explst(*mets*))
//
(* ****** ****** *)
//
fun
f3arg1_fprint
(farg: f3arg1, out0: FILR): void
#symload fprint with f3arg1_fprint of 1000
//
(* ****** ****** *)
fun
f3arg1_lctn$get(f3arg1): loc_t
fun
f3arg1_node$get(f3arg1): f3arg1_node
(* ****** ****** *)
#symload lctn with f3arg1_lctn$get
#symload node with f3arg1_node$get
(* ****** ****** *)
//
fun
f3arg1_make_lctn$node
(loc:loc_t, nod:f3arg1_node):f3arg1
#symload f3arg1 with f3arg1_make_lctn$node
//
(* ****** ****** *)
//
//
datatype
d3gua1_node =
| D3GUA1exp of (d3exp1)
| D3GUA1mat of (d3exp1, d3pat1)
//
(* ****** ****** *)
//
datatype
d3cls1_node =
| D3CLS1gpt of (d3gpt1)
| D3CLS1cls of (d3gpt1, d3exp1)
and
d3gpt1_node =
| D3GPT1pat of (d3pat1)
| D3GPT1gua of (d3pat1, d3gua1lst)
//
(* ****** ****** *)
//
fun
d3gua1_fprint
(dgua: d3gua1, out0: FILR): void
fun
d3gpt1_fprint
(dgpt: d3gpt1, out0: FILR): void
fun
d3cls1_fprint
(dcls: d3cls1, out0: FILR): void
//
(* ****** ****** *)
//
fun
d3gua1_lctn$get: d3gua1 -> loc_t
fun
d3gpt1_lctn$get: d3gpt1 -> loc_t
fun
d3cls1_lctn$get: d3cls1 -> loc_t
//
#symload lctn with d3gua1_lctn$get
#symload lctn with d3gpt1_lctn$get
#symload lctn with d3cls1_lctn$get
//
fun
d3gua1_node$get
  ( dgua : d3gua1 ) : d3gua1_node
fun
d3gpt1_node$get
  ( dgpt : d3gpt1 ) : d3gpt1_node
fun
d3cls1_node$get
  ( dcls : d3cls1 ) : d3cls1_node
//
#symload node with d3gua1_node$get
#symload node with d3gpt1_node$get
#symload node with d3cls1_node$get
//
(* ****** ****** *)
//
fun
d3gua1_make_lctn$node
(loc0:loc_t,node:d3gua1_node):d3gua1
fun
d3gpt1_make_lctn$node
(loc0:loc_t,node:d3gpt1_node):d3gpt1
fun
d3cls1_make_lctn$node
(loc0:loc_t,node:d3cls1_node):d3cls1
//
#symload d3gua1 with d3gua1_make_lctn$node
#symload d3gpt1 with d3gpt1_make_lctn$node
#symload d3cls1 with d3cls1_make_lctn$node
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
teqd3exp1 =
|TEQD3EXP1none of ((*void*))
|TEQD3EXP1some of (token(*EQ0*), d3exp1)
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
d3valdcl1_fprint
(dval: d3valdcl1, out0: FILR): void
fun
d3vardcl1_fprint
(dvar: d3vardcl1, out0: FILR): void
fun
d3fundcl1_fprint
(dfun: d3fundcl1, out0: FILR): void
//
#symload
fprint with d3valdcl1_fprint of 1000
#symload
fprint with d3vardcl1_fprint of 1000
#symload
fprint with d3fundcl1_fprint of 1000
//
(* ****** ****** *)
//
fun
d3valdcl1_lctn$get:(d3valdcl1)->loc_t
fun
d3vardcl1_lctn$get:(d3vardcl1)->loc_t
fun
d3fundcl1_lctn$get:(d3fundcl1)->loc_t
//
#symload lctn with d3valdcl1_lctn$get
#symload lctn with d3vardcl1_lctn$get
#symload lctn with d3fundcl1_lctn$get
//
(* ****** ****** *)
fun
d3valdcl1_dpat$get:(d3valdcl1)->d3pat1
fun
d3valdcl1_wsxp$get:(d3valdcl1)->wths2exp
fun
d3valdcl1_tdxp$get:(d3valdcl1)->teqd3exp1
(* ****** ****** *)
#symload dpat with d3valdcl1_get_dpat
#symload wsxp with d3valdcl1_get_wsxp(*opt*)
#symload tdxp with d3valdcl1_get_tdxp(*opt*)
(* ****** ****** *)
fun
d3vardcl1_dpid$get:(d3vardcl1)->d2var
fun
d3vardcl1_vpid$get:(d3vardcl1)->d2varopt
fun
d3vardcl1_sres$get:(d3vardcl1)->s2expopt
fun
d3vardcl1_dini$get:(d3vardcl1)->teqd3exp1
(* ****** ****** *)
#symload dpid with d3vardcl1_get_dpid
#symload vpid with d3vardcl1_get_vpid(*opt*)
#symload sres with d3vardcl1_get_sres(*opt*)
#symload dini with d3vardcl1_get_dini(*opt*)
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3fundcl1_dpid$get:(d3fundcl1)->d2var
fun
d3fundcl1_sres$get:(d3fundcl1)->s2res
fun
d3fundcl1_wsxp$get:(d3fundcl1)->wths2exp
fun
d3fundcl1_farg$get:(d3fundcl1)->f3arg1lst
fun
d3fundcl1_tdxp$get:(d3fundcl1)->teqd3exp1
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
d3valdcl1_make_args
( lctn:loc_t
, dpat:d3pat1
, tdxp:teqd3exp1, wsxp:wths2exp):d3valdcl1
//
fun
d3vardcl1_make_args
( lctn:loc_t
, dpid:d2var
, vpid:d2varopt
, sres:s2expopt, dini:teqd3exp1):d3vardcl1
//
#symload d3valdcl1 with d3valdcl1_make_args
#symload d3vardcl1 with d3vardcl1_make_args
//
(* ****** ****** *)
//
fun
d3fundcl1_make_args
( lctn:loc_t
, dpid:d2var
, farg:f3arg1lst, sres:s2res
, tdxp:teqd3exp1, wsxp:wths2exp):d3fundcl1
#symload d3fundcl1 with d3fundcl1_make_args
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
