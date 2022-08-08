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
S0E = "./staexp0.sats"
#staload
D0E = "./dynexp0.sats"
//
(* ****** ****** *)
#staload "./xbasics.sats"
#staload "./staexp1.sats"
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
#abstype d1pat_tbox // ptr
#abstype d1exp_tbox // ptr
#abstype d1ecl_tbox // ptr
//
#abstbox d1gua_tbox // ptr
#abstbox d1gpt_tbox // ptr
#abstbox d1cls_tbox // ptr
//
#abstbox d1cstdcl_tbox // ptr
#abstbox d1fundcl_tbox // ptr
#abstbox d1valdcl_tbox // ptr
#abstbox d1vardcl_tbox // ptr
#abstbox i1mpldcl_tbox // ptr
//
(* ****** ****** *)
//
#typedef d1pid = token
#typedef d1eid = token
#typedef d0pid = $S0E.d0pid
#typedef d0eid = $S0E.d0eid
//
(* ****** ****** *)
//
#typedef d0pat = $D0E.d0pat
#typedef d0exp = $D0E.d0exp
#typedef d0ecl = $D0E.d0ecl
//
#typedef d1pat = d1pat_tbox
#typedef d1exp = d1exp_tbox
#typedef d1ecl = d1ecl_tbox
//
(* ****** ****** *)
//
#typedef s1qag = s1qag_tbox
#typedef t1qag = t1qag_tbox
#typedef t1iag = t1iag_tbox
//
(* ****** ****** *)
#typedef s1qaglst = list(s1qag)
#typedef t1qaglst = list(t1qag)
#typedef t1iaglst = list(t1iag)
(* ****** ****** *)
//
#typedef a1typ = a1typ_tbox
#typedef d1arg = d1arg_tbox
//
#typedef a1typlst = list(a1typ)
#typedef d1arglst = list(d1arg)
//
(* ****** ****** *)
//
#typedef d0pidopt = optn(d0pid)
#typedef d1pidopt = optn(d1pid)
//
#typedef d1patlst = list(d1pat)
#typedef d1patopt = optn(d1pat)
#typedef d1explst = list(d1exp)
#typedef d1expopt = optn(d1exp)
//
(* ****** ****** *)
#typedef
l0d1p = $D0E.d0lab(d1pat)
#typedef
l0d1e = $D0E.d0lab(d1exp)
#typedef l0d1plst = list(l0d1p)
#typedef l0d1elst = list(l0d1e)
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

#typedef d1valdcl = d1valdcl_tbox
#typedef d1vardcl = d1vardcl_tbox
#typedef d1fundcl = d1fundcl_tbox
#typedef d1cstdcl = d1cstdcl_tbox

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
| D1Pid0 of token
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
  (token(*knd*), l0d1plst)
| D1Pr2cd of
  (token(*knd*), l0d1plst, l0d1plst)
//
| D1Panno of
  ( d1pat
  , s1exp(*given*)) // HX: annotation
//
| D1Pnone0 of () | D1Pnone1 of (d0pat)
//
// end of [d1pat_node] // end of [datatype]
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
t1qua =
|
T1QUAsome of
(loc_t, s1qualst)
where
#typedef
t1qualst = list(t1qua)
endwhre
//
datatype
t1inv =
|
T1INVsome of
(loc_t, t1qualst, d1patlst)
//
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
| D1Eid0 of token
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
| D1Enone of ()//HX: emptiness?
//
| D1Eseqn of
  (d1explst, d1explst)//sequencing
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
  , l0d1elst(*prop/type*))
| D1Er2cd of // HX: record2
  ( token
  , l0d1elst(*prop*), l0d1elst(*type*))
//
| D1Ebrack of (d1explst)
| D1Edtsel of (label, d1expopt)
//
| D1Elet0 of
  (d1eclist, d1explst(*semi*))
| D1Ewhere of (d1exp, d1eclist)
//
| D1Eif0 of
  ( d1exp(*cond*)
  , d1expopt, d1expopt(*else*))
| D1Eif1 of
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
|
D1Elam0 of
( token(*LAM*)
, f1arglst(*arg*)
, effs1expopt, f1unarrw, d1exp(*body*))
|
D1Efix0 of
( token(*FIX*)
, token(*fid*)
, f1arglst(*arg*)
, effs1expopt, f1unarrw, d1exp(*body*))
//
|
D1Etry0 of
( token(*TRY*)
, d1exp(*value*), d1clslst(*clauses*) )
// D1Etry0
//
|
D1Eanno of
( d1exp, s1exp(*anno*) ) // HX: type-anno
//
|
D1Equal of
( token(*NS*), d1exp(*deid*) )//qual-d1exp
//
| // HX: for temp-names that
D1Eextnam of (g1nam) // are to be expanded
|
D1Eexists of // HX-2021-01-14: $exists{..}..{..}
(token, d1explst(*D1Esarglst*), d1exp) // (d1exp)
//
| D1Enone0 of ((*void*)) | D1Enone1 of ( d0exp )
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
|
S1QAGnone of token
*)
|
S1QAGsome of // {...}
(token, q1arglst, token)
//
datatype
t1qag_node =
(*
|
T1QAGnone of token
*)
|
T1QAGsome of // <...>
(token, q1arglst, token)
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
WTHS1EXPsome of (token(*WTP*), s1exp)
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
fun
d1valdcl_fprint
(out: FILR, d1cl: d1valdcl): void
fun
d1vardcl_fprint
(out: FILR, d1cl: d1vardcl): void
fun
d1fundcl_fprint
(out: FILR, d1cl: d1fundcl): void
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
| D1Clocal of
  ( d1eclist(*head*)
  , d1eclist(*body*))
//
| D1Cdefine of
  ( token
  , g0eid
  , g1maglst(*arg*), g1expopt)
| D1Cmacdef of
  ( token
  , g0eid
  , g1maglst(*arg*), d1expopt)
//
| D1Cabssort of
  (token, token(*s0tid*))
//
| D1Cstacst0 of
  ( token // STACST0
  , token, t1maglst, sort1)
//
| D1Csortdef of
  ( token, token(*s0tid*), s1tdf)
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
  , s1qid, s1maglst, sort1opt, s1exp)
//
|
D1Cdatasort of
(token(*DATASORT*), d1tstlst)
//
|
D1Cvaldclst of
(token(*VAL(vlk)*), d1valdclist)
|
D1Cvardclst of
(token(*VAR(vrk)*), d1vardclist)
|
D1Cfundclst of
(token(*FUN(fnk)*), t1qaglst, d1fundclist)
//
|
D1Cimplmnt0 of
( token(*implknd*)
, s1qaglst // {...}
, t1qaglst // <...>
, d0qid, t1iaglst, f1arglst
, s1res, token(*EQ0*), d1exp(*body*))
//
|
D1Cdatatype of
(token(*DATATYPE*), d1typlst, wd1eclseq)
//
|
D1Cdynconst of
(token(*fnk//vlk*), t1qaglst, d1cstdclist)
//
| D1Cnone0 of ((*void*)) | D1Cnone1 of (d0ecl)
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
d1ecl_none1(d0cl:d0ecl): d1ecl
//
fun
d1ecl_make_node
(loc:loc_t,nod:d1ecl_node): d1ecl
#symload d1ecl with d1ecl_make_node
//
(* ****** ****** *)
fun
d1valdcl_get_dpat:(d1valdcl)->d1pat
fun
d1valdcl_get_tdxp:(d1valdcl)->teqd1exp
fun
d1valdcl_get_wsxp:(d1valdcl)->wths1exp
(* ****** ****** *)
#symload dpat with d1valdcl_get_dpat
#symload tdxp with d1valdcl_get_tdxp
#symload wsxp with d1valdcl_get_wsxp
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
#symload vpid with d1vardcl_get_vpid
#symload sres with d1vardcl_get_sres
#symload dini with d1vardcl_get_dini
(* ****** ****** *)
fun
d1fundcl_get_dpid:(d1fundcl)->d0pid
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
#symload farg with d1fundcl_get_farg
#symload sres with d1fundcl_get_sres
#symload tdxp with d1fundcl_get_tdxp
#symload wsxp with d1fundcl_get_wsxp
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
, sres:s0res
, tdxp:teqd1exp, wsxp:wths1exp):d1fundcl
//
#symload d1valdcl with d1valdcl_make_args
#symload d1vardcl with d0vardcl_make_args
#symload d0fundcl with d0fundcl_make_args
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
, dpid= token
, darg= d1arglst
, sres= s1res, dres= d1res
} (*d1cstdcl*)
*)
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

#abstbox d1parsed_tbox // ptr
#typedef d1parsed = d1parsed_tbox

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
d1parsed_get_parsed:(d1parsed)->d1eclistopt
//
#symload stadyn with d1parsed_get_stadyn
#symload nerror with d1parsed_get_nerror
#symload source with d1parsed_get_source
#symload parsed with d1parsed_get_parsed
//
fun
d1parsed_make_args
( stadyn:sint
, nerror:sint
, source:lcsrc
, parsed:d1eclistopt): d1parsed//end-fun
//
#symload d1parsed with d1parsed_make_args
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_dynexp1.sats] *)
