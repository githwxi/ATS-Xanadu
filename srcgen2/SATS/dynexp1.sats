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
Sun Jul 24 17:59:26 EDT 2022
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
#staload
LEX = "./lexing0.sats"
#typedef token = $LEX.token
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
MAP = "./xsymmap.sats"
#staload
FIX = "./xfixity.sats"
//
(* ****** ****** *)
//
#staload
S0E = "./staexp0.sats"
#staload
D0E = "./dynexp0.sats"
//
(* ****** ****** *)
#staload "./xbasics.sats"
(* ****** ****** *)
#staload "./staexp1.sats"
(* ****** ****** *)
//
#abstbox d1pat_tbox // ptr
#abstbox d1exp_tbox // ptr
#abstbox d1ecl_tbox // ptr
//
(* ****** ****** *)
//
#abstbox f1arg_tbox // ptr
#abstbox d1gua_tbox // ptr
#abstbox d1gpt_tbox // ptr
#abstbox d1cls_tbox // ptr
//
(* ****** ****** *)
//
#abstbox q1arg_tbox // ptr
#abstbox s1qag_tbox // ptr
#abstbox t1qag_tbox // ptr
#abstbox t1iag_tbox // ptr
//
(* ****** ****** *)
//
#abstbox a1typ_tbox // ptr
#abstbox d1arg_tbox // ptr
//
(* ****** ****** *)
//
#abstbox d1valdcl_tbox // ptr
#abstbox d1vardcl_tbox // ptr
#abstbox d1fundcl_tbox // ptr
#abstbox i1mpldcl_tbox // ptr
//
#abstbox d1cstdcl_tbox // ptr
//
(* ****** ****** *)
//
datatype
d1lab(itm:type) =
|D1LAB of
(label, itm(*elt*))
//
fun
<x0:t0>
d1lab_get_itm
(dlab: d1lab(x0)): x0
#symload
itm with d1lab_get_itm
//
(* ****** ****** *)
#typedef
d0lab(x0:t0)=$D0E.d0lab(x0)
(* ****** ****** *)
//
fun
<x0:type>
d1lab_fprint
(out
:FILR, lab:d1lab(x0)): void
//
(* ****** ****** *)
//
#typedef g1eid = token
//
(* ****** ****** *)
//
#typedef d1pid = token
#typedef d0pid = $S0E.d0pid
//
(*
#typedef d1eid = token
#typedef d0eid = $S0E.d0eid
*)
//
(* ****** ****** *)
(*
#typedef
d0parsed = $D0E.d0parsed
*)
(* ****** ****** *)
//
#typedef d0pat = $D0E.d0pat
#typedef d0exp = $D0E.d0exp
#typedef d0ecl = $D0E.d0ecl
//
(* ****** ****** *)
//
#typedef d1pat = d1pat_tbox
#typedef d1exp = d1exp_tbox
#typedef d1ecl = d1ecl_tbox
//
(* ****** ****** *)
#typedef l1d1p = d1lab(d1pat)
#typedef l1d1e = d1lab(d1exp)
(* ****** ****** *)
#typedef f1arg = f1arg_tbox
#typedef d1gua = d1gua_tbox
#typedef d1gpt = d1gpt_tbox
#typedef d1cls = d1cls_tbox
(* ****** ****** *)
//
#typedef q1arg = q1arg_tbox
#typedef s1qag = s1qag_tbox
#typedef t1qag = t1qag_tbox
#typedef t1iag = t1iag_tbox
//
(* ****** ****** *)
//
#typedef a1typ = a1typ_tbox
#typedef d1arg = d1arg_tbox
//
(* ****** ****** *)
//
#typedef d0pidopt = optn(d0pid)
#typedef d1pidopt = optn(d1pid)
//
(* ****** ****** *)
#typedef d1patlst = list(d1pat)
#typedef d1patopt = optn(d1pat)
#typedef l1d1plst = list(l1d1p)
(* ****** ****** *)
//
#typedef f1arglst = list(f1arg)
#typedef d1clslst = list(d1cls)
//
(* ****** ****** *)
//
#typedef q1arglst = list(q1arg)
#typedef s1qaglst = list(s1qag)
#typedef t1qaglst = list(t1qag)
#typedef t1iaglst = list(t1iag)
//
(* ****** ****** *)
//
#typedef a1typlst = list(a1typ)
#typedef d1arglst = list(d1arg)
//
(* ****** ****** *)
#typedef d1explst = list(d1exp)
#typedef d1expopt = optn(d1exp)
#typedef l1d1elst = list(l1d1e)
(* ****** ****** *)
//
#typedef d1eclist = list(d1ecl)
#typedef d1eclopt = optn(d1ecl)
//
(* ****** ****** *)
//
#typedef d1gua = d1gua_tbox
#typedef d1gpt = d1gpt_tbox
#typedef d1cls = d1cls_tbox
//
#typedef d1gualst = list(d1gua)
#typedef d1clslst = list(d1cls)
//
(* ****** ****** *)
//
#typedef d1valdcl = d1valdcl_tbox
#typedef d1vardcl = d1vardcl_tbox
#typedef d1fundcl = d1fundcl_tbox
//
#typedef d1cstdcl = d1cstdcl_tbox
//
(* ****** ****** *)
#abstbox d1parsed_tbox // ptr
#typedef d1parsed = d1parsed_tbox
(* ****** ****** *)
//
#vwtpdef d1eclist_vt = list_vt(d1ecl)
#typedef d1eclistopt = optn(d1eclist)
//
(* ****** ****** *)
//
datatype
d1pat_node =
//
| D1Pid0 of sym_t
//
| D1Pint of token
| D1Pchr of token
| D1Pflt of token
| D1Pstr of token
//
| D1Pb0sh of () // bslash
| D1Pb1sh of d1pat // bslash
//
| D1Pa0pp of ((*nil*))
//
| D1Pa1pp of
  (d1pat(*fun*), d1pat)
| D1Pa2pp of
  (d1pat(*fun*), d1pat, d1pat)
//
| D1Psarg of
  (s1arglst(*static*))
//
| D1Pl1st of d1patlst // temp-list
| D1Pl2st of
  (d1patlst, d1patlst) // temp-list
//
| D1Pt1up of
  (token(*knd*), d1patlst)
| D1Pt2up of
  (token(*knd*), d1patlst, d1patlst)
//
| D1Pr1cd of
  (token(*knd*), l1d1plst)
| D1Pr2cd of
  (token(*knd*), l1d1plst, l1d1plst)
//
|
D1Pannot of
(d1pat, s1exp(*annot*))//HX:type-annot
//
|
D1Pqual0 of
(token(*NS*), d1pat(*dpid*))//qual-d1pat
//
(*
|
D1Pg1mac of (g1mac) // HX: temp or error!
*)
//
|
D1Pnone0 of ((*void*)) | D1Pnone1 of (d0pat)
//
|
D1Perrck of (sint(*lvl*), d1pat)//HX:tread01-error
//
// end of [d1exp_node] // end of [ datatype(...) ]
//
(* ****** ****** *)
fun
d1pat_fprint:(FILR,d1pat)->void
(* ****** ****** *)
//
fun
d1pat_get_lctn(d1pat): loc_t
fun
d1pat_get_node(d1pat): d1pat_node
//
#symload lctn with d1pat_get_lctn
#symload node with d1pat_get_node
//
(* ****** ****** *)
//
fun
d1pat_none0(loc0:loc_t): d1pat
fun
d1pat_none1(dpat:d0pat): d1pat
//
fun
d1pat_make_node
(loc:loc_t,nod:d1pat_node): d1pat
#symload d1pat with d1pat_make_node
//
(* ****** ****** *)
//
datatype
f1arg_node =
(*
| F1ARGnone of (token)
*)
//
| F1ARGdapp of (d1pat)
//
| F1ARGsapp of (s1qualst)
| F1ARGmets of (s1explst)
//
(* ****** ****** *)
fun
f1arg_fprint:(FILR,f1arg)->void
(* ****** ****** *)
//
fun
f1arg_get_lctn(f1arg): loc_t
fun
f1arg_get_node(f1arg): f1arg_node
//
#symload lctn with f1arg_get_lctn
#symload node with f1arg_get_node
//
(* ****** ****** *)
fun
f1arg_make_node
(loc:loc_t,nod:f1arg_node): f1arg
#symload f1arg with f1arg_make_node
(* ****** ****** *)
//
datatype
t1qua =
|
T1QUAsome of
(loc_t, s1qualst)
where
#typedef
t1qualst = list(t1qua)
endwhere
//
datatype
t1inv =
|
T1INVsome of
(loc_t, t1qualst, d1patlst)
//
(* ****** ****** *)
fun
t1qua_get_lctn(t1qua): loc_t
fun
t1inv_get_lctn(t1inv): loc_t
#symload lctn with t1qua_get_lctn
#symload lctn with t1inv_get_lctn
(* ****** ****** *)
datatype
f1unarrw =
|
F1UNARRWdflt of (loc_t)
|
F1UNARRWlist of
(loc_t, s1explst(*modlst*))
(* ****** ****** *)
fun
f1unarrw_get_lctn(f1unarrw): loc_t
#symload lctn with f1unarrw_get_lctn
(* ****** ****** *)
//
datatype
d1gua_node =
| D1GUAexp of (d1exp)
| D1GUAmat of (d1exp, d1pat)
//
(* ****** ****** *)
//
datatype
d1cls_node =
| D1CLSgpt of d1gpt
| D1CLScls of (d1gpt, d1exp)
and
d1gpt_node =
| D1GPTpat of (d1pat)
| D1GPTgua of (d1pat, d1gualst)
//
(* ****** ****** *)
//
fun
d1gua_fprint:(FILR,d1gua)->void
fun
d1gpt_fprint:(FILR,d1gpt)->void
fun
d1cls_fprint:(FILR,d1cls)->void
//
(* ****** ****** *)
//
fun
d1gua_get_lctn(d1gua): loc_t
fun
d1gua_get_node(d1gua): d1gua_node
//
#symload lctn with d1gua_get_lctn
#symload node with d1gua_get_node
//
(* ****** ****** *)
//
fun
d1gpt_get_lctn(d1gpt): loc_t
fun
d1gpt_get_node(d1gpt): d1gpt_node
//
#symload lctn with d1gpt_get_lctn
#symload node with d1gpt_get_node
//
(* ****** ****** *)
//
fun
d1cls_get_lctn(d1cls): loc_t
fun
d1cls_get_node(d1cls): d1cls_node
//
#symload lctn with d1cls_get_lctn
#symload node with d1cls_get_node
//
(* ****** ****** *)
//
fun
d1gua_make_node
(loc:loc_t,nod:d1gua_node): d1gua
#symload d1gua with d1gua_make_node
fun
d1gpt_make_node
(loc:loc_t,nod:d1gpt_node): d1gpt
#symload d1gpt with d1gpt_make_node
fun
d1cls_make_node
(loc:loc_t,nod:d1cls_node): d1cls
#symload d1cls with d1cls_make_node
//
(* ****** ****** *)
//
datatype
d1exp_node =
//
| D1Eid0 of sym_t
//
| D1Eint of token
| D1Echr of token
| D1Eflt of token
| D1Estr of token
//
| D1Eb0sh of () // bslash
| D1Eb1sh of d1exp // bslash
//
| D1Ea0pp of ((*nil*)) // apply
//
| D1Ea1pp of
  (d1exp(*fun*), d1exp)
| D1Ea2pp of
  (d1exp(*fun*), d1exp, d1exp)
//
| D1Esarg of s1explst
| D1Etarg of s1explst
//
| D1El1st of d1explst // temp.
| D1El2st of
  (d1explst, d1explst) // temp.
//
| D1Es1eq of d1explst//sequencing
| D1Es2eq of
  (d1explst, d1explst)//sequencing
//
|
D1Eift0 of
( d1exp(*cond*)
, d1expopt, d1expopt(*else*))
|
D1Eift1 of
( d1exp(*cond*)
, d1expopt, d1expopt(*else*), t1inv)
//
|
D1Ecas0 of
( token(*+/0/-*), d1exp, d1clslst)
|
D1Ecas1 of
( token(*+/0/-*), d1exp, d1clslst, t1inv)
//
| D1Elet0 of (d1eclist, d1exp)
| D1Ewhere of (d1exp, d1eclist)
//
|
D1Ebrckt of (d1explst)
|
D1Edtsel of
(token(*kind*), label, d1expopt)
//
| D1Et1up of // HX: tuple1
  ( token
  , d1explst(*prop/type*))
| D1Et2up of // HX: tuple2
  ( token
  , d1explst(*prop*), d1explst(*type*))
//
| D1Er1cd of // HX: record1
  ( token
  , l1d1elst(*prop/type*))
| D1Er2cd of // HX: record2
  ( token
  , l1d1elst(*prop*), l1d1elst(*type*))
//
|
D1Elam0 of
( token(*LAM*)
, f1arglst(*arg*)
, s1res, f1unarrw, d1exp(*body*))
|
D1Efix0 of
( token(*FIX*)
, token(*fid*)
, f1arglst(*arg*)
, s1res, f1unarrw, d1exp(*body*))
//
|
D1Etry0 of
( token(*TRY*)
, d1exp(*value*), d1clslst(*clauses*) )
// D1Etry0
//
|
D1Eraise of
(token, d1exp(*excpt*))//HX:raising
//
|
D1Eannot of
(d1exp, s1exp(*annot*))//HX:type-annot
//
|
D1Equal0 of
(token(*NS*), d1exp(*deid*))//qual-d1exp
//
(*
|
D1Eg1mac of (g1mac) // HX: temp or error!
*)
//
| // HX: for temp-names that are
D1Eextnam of (token, g1nam) // to be expanded
|
D1Eexists of
( // HX-2021-01-14: $exists{..}..{..}(d1exp)
token, d1explst(*D1Esarglst*), d1exp(*scope*))
//
| D1Enone0 of ((*void*)) | D1Enone1 of (d0exp)
//
|
D1Eerrck of (sint(*lvl*), d1exp)//HX:tread01-error
//
// end of [d1exp_node] // end of [ datatype(...) ]
//
(* ****** ****** *)
//
and
s1eff =
| S1EFFnone of ()
| S1EFFsome of s1explst
and
s1res =
| S1RESnone of ((*void*))
| S1RESsome of (s1eff, s1exp)
//
(* ****** ****** *)
fun
d1exp_fprint:(FILR,d1exp)->void
(* ****** ****** *)
//
fun
s1eff_fprint:(FILR,s1eff)->void
fun
s1res_fprint:(FILR,s1res)->void
//
(* ****** ****** *)
fun
t1qua_fprint: (FILR, t1qua)->void
fun
t1inv_fprint: (FILR, t1inv)->void
(* ****** ****** *)
fun
f1unarrw_fprint
(out: FILR, arrw: f1unarrw): void
(* ****** ****** *)
//
fun
d1exp_get_lctn(d1exp): loc_t
fun
d1exp_get_node(d1exp): d1exp_node
//
#symload lctn with d1exp_get_lctn
#symload node with d1exp_get_node
//
(* ****** ****** *)
//
fun
d1exp_none0(loc0:loc_t): d1exp
fun
d1exp_none1(dexp:d0exp): d1exp
//
fun
d1exp_make_node
(loc:loc_t,nod:d1exp_node): d1exp
#symload d1exp with d1exp_make_node
//
(* ****** ****** *)
//
datatype
q1arg_node =
(*
|
Q1ARGnone of token
*)
|
Q1ARGsome of
(i1dnt(*tok*), sort1opt)
//
(* ****** ****** *)
//
datatype
s1qag_node =
(*
|S1QAGnone of token
*)
|S1QAGsome of (q1arglst)//{...}
//
datatype
t1qag_node =
(*
|
T1QAGnone of token
*)
|T1QAGsome of (q1arglst)//<...>
//
(* ****** ****** *)
fun
q1arg_fprint(FILR, q1arg): void
fun
s1qag_fprint(FILR, s1qag): void
fun
t1qag_fprint(FILR, t1qag): void
(* ****** ****** *)
//
fun
q1arg_get_lctn(q1arg): loc_t
fun
s1qag_get_lctn(s1qag): loc_t
fun
t1qag_get_lctn(t1qag): loc_t
#symload lctn with q1arg_get_lctn
#symload lctn with s1qag_get_lctn
#symload lctn with t1qag_get_lctn
//
(* ****** ****** *)
//
fun
q1arg_get_node(q1arg): q1arg_node
fun
s1qag_get_node(s1qag): s1qag_node
fun
t1qag_get_node(t1qag): t1qag_node
#symload node with q1arg_get_node
#symload node with s1qag_get_node
#symload node with t1qag_get_node
//
(* ****** ****** *)
//
fun
q1arg_make_node
(loc:loc_t, nod:q1arg_node): q1arg
fun
s1qag_make_node
(loc:loc_t, nod:s1qag_node): s1qag
fun
t1qag_make_node
(loc:loc_t, nod:t1qag_node): t1qag
#symload q1arg with q1arg_make_node
#symload s1qag with s1qag_make_node
#symload t1qag with t1qag_make_node
//
(* ****** ****** *)
//
datatype
t1iag_node =
(*
|
T1IAGnone of token
*)
|T1IAGsome of (s1explst)//<...>
//
(* ****** ****** *)
fun
t1iag_fprint(FILR, t1iag): void
(* ****** ****** *)
fun
t1iag_get_lctn(t1iag): loc_t
fun
t1iag_get_node(t1iag): t1iag_node
//
#symload lctn with t1iag_get_lctn
#symload node with t1iag_get_node
//
(* ****** ****** *)
//
fun
t1iag_make_node
(loc:loc_t, nod:t1iag_node): t1iag
#symload t1iag with t1iag_make_node
//
(* ****** ****** *)
//
datatype
teqd1exp =
|
TEQD1EXPnone of ((*void*))
|
TEQD1EXPsome of (token(*EQ0*), d1exp)
datatype
wths1exp =
|
WTHS1EXPnone of ((*void*))
|
WTHS1EXPsome of (token(*WTH*), s1exp)
//
(* ****** ****** *)
(*
(*
HX-2022-07-25:
Directly implemented in xatsopt_tmplib
*)
fun
teqd1exp_fprint:(FILR, teqd1exp)->void
fun
wths1exp_fprint:(FILR, wths1exp)->void
*)
(* ****** ****** *)
//
datatype
d1ecl_node =
//
| D1Cd0ecl of (d0ecl)
//
(*
| D1Cfixity of (d0ecl)
  // updating fixity env
| D1Cnonfix of (d0ecl)
  // updating fixity env
*)
//
| D1Cstatic of
  (token, d1ecl) // locally
| D1Cextern of
  (token, d1ecl) // globally
//
| D1Clocal0 of
  ( d1eclist(*local-head*)
  , d1eclist(*local-body*))
//
|
D1Cdefine of
( token
, g1eid
, g1maglst(*arg*), g1expopt)
|
D1Cmacdef of
( token
, g1eid
, g1maglst(*arg*), d1expopt)
//
| D1Cabssort of
  (token, token(*s0tid*))
//
| D1Cstacst0 of
  ( token // STACST0
  , token, t1maglst, sort1)
//
|
D1Csortdef of
(token, token(*s0tid*), s1tdf)
//
| D1Csexpdef of
  ( token // kind
  , token // s0eid
  , s1maglst, sort1opt, s1exp)
//
| D1Cabstype of
  ( token // kind
  , token // s0eid
  , t1maglst, sort1opt, a1tdf)
| D1Cabsopen of (token, s1qid)
| D1Cabsimpl of
  ( token // kind
  , s1qid
  , s1maglst, sort1opt, s1exp)
//
|
D1Csymload of
( token
, sym_t
, d1qid(*qual-id*), g1expopt )
//
// (*
|
D1Cinclude of
( sint(*s/d*)
, token
, g1exp(*src*)
, fpathopt, d1eclistopt)//include
// *)
|
D1Cstaload of
( sint(*s/d*)
, token
, g1exp(*src*)
, fpathopt, optn
  @(sint(*shared*), d1parsed))//staload
//
|
D1Cdyninit of
(token(*DYNLOAD*), g1exp(*fpath*))
//
|
D1Cdatasort of
(token(*DATASORT*), d1tstlst(*def*))
//
|
D1Cvaldclst of
(token(*VAL(vlk)*), d1valdclist(*def*))
|
D1Cvardclst of
(token(*VAR(vrk)*), d1vardclist(*def*))
|
D1Cfundclst of
(token(*FUN(fnk)*), t1qaglst, d1fundclist)
//
|
D1Cimplmnt0 of
( token(*implknd*)
, s1qaglst // {...}
, t1qaglst // <...>
, d1qid, t1iaglst
, f1arglst, s1res, d1exp(*body*))
//
|
D1Cexcptcon of
(token(*EXCPTCON*), d1tcnlst)
|
D1Cdatatype of
(token(*DATATYPE*), d1typlst, wd1eclseq)
//
|
D1Cdynconst of
(token(*fnk//vlk*), t1qaglst, d1cstdclist)
//
|
D1Cnone0 of ((*void*)) | D1Cnone1 of (d0ecl)
//
|
D1Cerrck of (sint(*lvl*), d1ecl)//tread0x-error
//
// HX-2022-??-??: end-of-[ datatype(d1ecl_node) ]
//
(* ****** ****** *)
//
and a1tdf =
| A1TDFsome of () // unspecified
| A1TDFlteq of (s1exp) // ty-erasure
| A1TDFeqeq of (s1exp) // definition
//
(* ****** ****** *)
//
and
wd1eclseq =
|
WD1CSnone of () | WD1CSsome of (d1eclist)
//
(* ****** ****** *)
//
where
{
  #typedef d1fundclist = list(  d1fundcl  )
  #typedef d1valdclist = list(  d1valdcl  )
  #typedef d1vardclist = list(  d1vardcl  )
  #typedef d1cstdclist = list(  d1cstdcl  )
} (*where*) // end-of-[datatype ... and ...]
//
(* ****** ****** *)
fun
d1ecl_fprint:(FILR,d1ecl)->void
(* ****** ****** *)
fun
a1tdf_fprint:(FILR,a1tdf)->void
(* ****** ****** *)
fun
wd1eclseq_fprint:(FILR,wd1eclseq)->void
(* ****** ****** *)
//
fun
d1ecl_get_lctn(d1ecl): loc_t
fun
d1ecl_get_node(d1ecl): d1ecl_node
//
#symload lctn with d1ecl_get_lctn
#symload node with d1ecl_get_node
//
(* ****** ****** *)
//
fun
d1ecl_none0(loc0:loc_t): d1ecl
fun
d1ecl_none1(d0cl:d0ecl): d1ecl
//
fun
d1ecl_make_node
(loc:loc_t,nod:d1ecl_node): d1ecl
#symload d1ecl with d1ecl_make_node
//
(* ****** ****** *)
//
datatype
a1typ_node =
(*
| A1TYPnone of token
*)
| A1TYPsome of (s1exp,tokenopt)
//
datatype
d1arg_node =
//
(*
| D1ARGnone of token
*)
|
D1ARGsta0 of (s1qualst)
|
D1ARGdyn1 of token // d0pid
|
D1ARGdyn2 of
(
a1typlst, a1typlstopt(*argopt2*)
)
//
where
{ #typedef
  a1typlstopt = optn(a1typlst) }
//
(* ****** ****** *)
//
fun
a1typ_fprint(FILR, a1typ): void
fun
d1arg_fprint(FILR, d1arg): void
//
(* ****** ****** *)
fun
a1typ_get_lctn:(a1typ)->loc_t
fun
d1arg_get_lctn:(d1arg)->loc_t
fun
a1typ_get_node:(a1typ)->a1typ_node
fun
d1arg_get_node:(d1arg)->d1arg_node
(* ****** ****** *)
#symload lctn with a1typ_get_lctn
#symload node with a1typ_get_node
#symload lctn with d1arg_get_lctn
#symload node with d1arg_get_node
(* ****** ****** *)
fun
a1typ_make_node
(loc:loc_t,nod:a1typ_node): a1typ
#symload a1typ with a1typ_make_node
fun
d1arg_make_node
(loc:loc_t,nod:d1arg_node): d1arg
#symload d1arg with d1arg_make_node
(* ****** ****** *)
fun
d1valdcl_fprint
(out: FILR, dval: d1valdcl): void
fun
d1vardcl_fprint
(out: FILR, dvar: d1vardcl): void
fun
d1fundcl_fprint
(out: FILR, dfun: d1fundcl): void
(* ****** ****** *)
fun
d1valdcl_get_lctn:(d1valdcl)->loc_t
fun
d1vardcl_get_lctn:(d1vardcl)->loc_t
fun
d1fundcl_get_lctn:(d1fundcl)->loc_t
(* ****** ****** *)
#symload lctn with d1valdcl_get_lctn
#symload lctn with d1vardcl_get_lctn
#symload lctn with d1fundcl_get_lctn
(* ****** ****** *)
fun
d1valdcl_get_dpat:(d1valdcl)->d1pat
fun
d1valdcl_get_tdxp:(d1valdcl)->teqd1exp
fun
d1valdcl_get_wsxp:(d1valdcl)->wths1exp
(* ****** ****** *)
#symload dpat with d1valdcl_get_dpat
#symload tdxp with d1valdcl_get_tdxp(*opt*)
#symload wsxp with d1valdcl_get_wsxp(*opt*)
(* ****** ****** *)
fun
d1vardcl_get_dpid:(d1vardcl)->d1pid
fun
d1vardcl_get_vpid:(d1vardcl)->d1pidopt
fun
d1vardcl_get_sres:(d1vardcl)->s1expopt
fun
d1vardcl_get_dini:(d1vardcl)->teqd1exp
(* ****** ****** *)
#symload dpid with d1vardcl_get_dpid
#symload vpid with d1vardcl_get_vpid(*opt*)
#symload sres with d1vardcl_get_sres(*opt*)
#symload dini with d1vardcl_get_dini(*opt*)
(* ****** ****** *)
fun
d1fundcl_get_dpid:(d1fundcl)->d1pid
fun
d1fundcl_get_farg:(d1fundcl)->f1arglst
fun
d1fundcl_get_sres:(d1fundcl)->s1res
fun
d1fundcl_get_tdxp:(d1fundcl)->teqd1exp
fun
d1fundcl_get_wsxp:(d1fundcl)->wths1exp
(* ****** ****** *)
#symload dpid with d1fundcl_get_dpid
#symload farg with d1fundcl_get_farg(*lst*)
#symload sres with d1fundcl_get_sres(*opt*)
#symload tdxp with d1fundcl_get_tdxp(*opt*)
#symload wsxp with d1fundcl_get_wsxp(*opt*)
(* ****** ****** *)
//
fun
d1valdcl_make_args
( lctn:loc_t
, dpat:d1pat
, tdxp:teqd1exp, wsxp:wths1exp):d1valdcl
fun
d1vardcl_make_args
( lctn:loc_t
, dpid:d1pid
, vpid:d1pidopt
, sres:s1expopt, dini:teqd1exp):d1vardcl
//
fun
d1fundcl_make_args
( lctn:loc_t
, dpid:d1pid
, farg:f1arglst
, sres:s1res
, tdxp:teqd1exp, wsxp:wths1exp):d1fundcl
//
#symload d1valdcl with d1valdcl_make_args
#symload d1vardcl with d1vardcl_make_args
#symload d1fundcl with d1fundcl_make_args
//
(* ****** ****** *)
//
#typedef d1res = teqd1exp
//
(*
datatype
d1cstdcl =
D1CSTDCL of @{
 lctn= loc_t
,dpid= token
,darg= d1arglst
,sres= s1res, dres= d1res
} (* datatype(d1cstdcl) *)
*)
//
(* ****** ****** *)
//
fun
d1cstdcl_fprint
(out: FILR, dcst: d1cstdcl): void
//
(* ****** ****** *)
//
fun
d1cstdcl_get_lctn:(d1cstdcl)->loc_t
fun
d1cstdcl_get_dpid:(d1cstdcl)->d1pid(*nam*)
fun
d1cstdcl_get_darg:(d1cstdcl)->d1arglst
fun
d1cstdcl_get_sres:(d1cstdcl)->s1res(*opt*)
fun
d1cstdcl_get_dres:(d1cstdcl)->d1res(*opt*)
//
#symload lctn with d1cstdcl_get_lctn
#symload dpid with d1cstdcl_get_dpid
#symload darg with d1cstdcl_get_darg(*lst*)
#symload sres with d1cstdcl_get_sres(*opt*)
#symload dres with d1cstdcl_get_dres(*opt*)
//
(* ****** ****** *)
//
fun
d1cstdcl_make_args
( loc0:loc_t
, dpid:d1pid
, args:d1arglst, sres:s1res, dres:d1res
) : d1cstdcl//end-of(d1cstdcl_make_node)
#symload d1cstdcl with d1cstdcl_make_args
//
(* ****** ****** *)
//
datatype
d1topenv =
D1TOPENV of
($MAP.topmap($FIX.fixty))
//
(*
#abstbox d1topenv_tbox // ptr
#typedef d1topenv = d1topenv_tbox
*)
//
(* ****** ****** *)
//
fun
d1parsed_fprint
(out: FILR, dpar: d1parsed): void
//
fun
d1parsed_get_stadyn:(d1parsed)->sint
fun
d1parsed_get_nerror:(d1parsed)->sint
fun
d1parsed_get_source:(d1parsed)->lcsrc
fun
d1parsed_get_topenv:(d1parsed)->d1topenv
fun
d1parsed_get_parsed:(d1parsed)->d1eclistopt
//
#symload stadyn with d1parsed_get_stadyn
#symload nerror with d1parsed_get_nerror
#symload source with d1parsed_get_source
#symload topenv with d1parsed_get_topenv
#symload parsed with d1parsed_get_parsed
//
fun
d1parsed_make_args
( stadyn:sint
, nerror:sint
, source:lcsrc
, topenv:d1topenv
, parsed:d1eclistopt): d1parsed//end-fun
//
#symload d1parsed with d1parsed_make_args
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_dynexp1.sats] *)
