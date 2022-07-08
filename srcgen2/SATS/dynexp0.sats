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
Start Time: May 28th, 2022
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
#typedef loc_t = $LOC.loc_t
#typedef loctn = $LOC.loctn
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
//
#staload
S0E = "./staexp0.sats"
//
(* ****** ****** *)
#typedef l0abl = $S0E.l0abl
(* ****** ****** *)
#typedef s0ymb = $S0E.s0ymb
(* ****** ****** *)
#typedef i0dnt = $S0E.i0dnt
(* ****** ****** *)
#typedef t0int = $S0E.t0int
#typedef t0chr = $S0E.t0chr
#typedef t0flt = $S0E.t0flt
#typedef t0str = $S0E.t0str
(* ****** ****** *)
#typedef s0tid = $S0E.s0tid
#typedef s0aid = $S0E.s0aid
#typedef s0eid = $S0E.s0eid
#typedef s0qid = $S0E.s0qid
(* ****** ****** *)
#typedef d0pid = $S0E.d0pid
#typedef d0eid = $S0E.d0eid
#typedef d0qid = $S0E.d0qid
(* ****** ****** *)
#typedef g0nam = $S0E.g0nam
#typedef g0exp = $S0E.g0exp
(* ****** ****** *)
//
#typedef sort0 = $S0E.sort0
#typedef s0exp = $S0E.s0exp
//
#typedef d0tst = $S0E.d0tst
#typedef s0tdf = $S0E.s0tdf
//
(* ****** ****** *)
#typedef d0tcn = $S0E.d0tcn
#typedef d0typ = $S0E.d0typ
(* ****** ****** *)
//
#typedef s0arg = $S0E.s0arg
#typedef s0mag = $S0E.s0mag
#typedef t0arg = $S0E.t0arg
#typedef t0mag = $S0E.t0mag
#typedef s0qua = $S0E.s0qua
//
(* ****** ****** *)
#typedef tokenlst = list(token)
#typedef tokenopt = optn(token)
(* ****** ****** *)
#typedef i0dntlst = list(i0dnt)
(* ****** ****** *)
#typedef sort0lst = list(sort0)
#typedef sort0opt = optn(sort0)
(* ****** ****** *)
#typedef s0explst = list(s0exp)
#typedef s0expopt = optn(s0exp)
(* ****** ****** *)
#typedef d0tstlst = list(d0tst)
(* ****** ****** *)
#typedef s0arglst = list(s0arg)
#typedef s0maglst = list(s0mag)
#typedef t0arglst = list(t0arg)
#typedef t0maglst = list(t0mag)
#typedef s0qualst = list(s0qua)
(* ****** ****** *)
#typedef d0tcnlst = list(d0tcn)
#typedef d0typlst = list(d0typ)
(* ****** ****** *)
//
#abstbox q0arg_tbox // ptr
#abstbox s0qag_tbox // ptr
#abstbox t0qag_tbox // ptr
#abstbox t0iag_tbox // ptr
//
(* ****** ****** *)
#abstbox a0typ_tbox // ptr
#abstbox d0arg_tbox // ptr
(* ****** ****** *)
//
#abstbox d0pat_tbox // ptr
#abstbox d0exp_tbox // ptr
#abstbox d0cls_tbox // ptr
#abstbox d0ecl_tbox // ptr
//
#abstbox d0cstdcl_tbox // ptr
#abstbox d0fundcl_tbox // ptr
#abstbox d0valdcl_tbox // ptr
#abstbox d0vardcl_tbox // ptr
#abstbox i0mpldcl_tbox // ptr
//
(* ****** ****** *)
#typedef q0arg = q0arg_tbox
#typedef s0qag = s0qag_tbox
#typedef t0qag = t0qag_tbox
#typedef t0iag = t0iag_tbox
(* ****** ****** *)
#typedef a0typ = a0typ_tbox
#typedef d0arg = d0arg_tbox
(* ****** ****** *)
#typedef d0pat = d0pat_tbox
#typedef d0exp = d0exp_tbox
#typedef d0cls = d0cls_tbox
#typedef d0ecl = d0ecl_tbox
(* ****** ****** *)
#typedef q0arglst = list(q0arg)
#typedef s0qaglst = list(s0qag)
#typedef t0qaglst = list(t0qag)
#typedef t0iaglst = list(t0iag)
(* ****** ****** *)
#typedef a0typlst = list(a0typ)
#typedef d0arglst = list(d0arg)
(* ****** ****** *)
//
#typedef d0patlst = list(d0pat)
#typedef d0explst = list(d0exp)
#typedef d0clslst = list(d0cls)
#typedef d0eclist = list(d0ecl)
//
#typedef d0patopt = optn(d0pat)
#typedef d0expopt = optn(d0exp)
//
(* ****** ****** *)
//
#typedef d0cstdcl = d0cstdcl_tbox
#typedef d0fundcl = d0fundcl_tbox
#typedef d0valdcl = d0valdcl_tbox
#typedef d0vardcl = d0vardcl_tbox
#typedef i0mpldcl = i0mpldcl_tbox
//
(* ****** ****** *)
//
datatype
d0lab(x0:type) =
|
D0LAB of
(l0abl, token, x0(*elt*))
//
(* ****** ****** *)
//
fun
<x0:type>
d0lab_fprint
(out: FILR, lab: d0lab(x0)): void
//
(* ****** ****** *)
//
(*
//HX:l0d0p:labd0pat
*)
#typedef
l0d0p = d0lab(d0pat)
#typedef
l0d0plst = list(d0lab(d0pat))
//
(* ****** ****** *)
//
datatype
d0pat_node =
//
| D0Pid0 of d0pid
//
| D0Pint of t0int
| D0Pchr of t0chr
| D0Pflt of t0flt
| D0Pstr of t0str
//
| D0Papps of d0patlst
//
| D0Psqarg of
  (token(*LB*), s0arglst, token)
// end of [D0Psqarg]
| D0Plpar of
  (token, d0patlst, d0pat_RPAREN)
//
| D0Ptup1 of
  (token, tokenopt, d0patlst, d0pat_RPAREN)
| D0Prcd2 of
  (token, tokenopt, l0d0plst, l0d0p_RBRACE)
//
| D0Pqual of (token, d0pat) // HX: qual-d0pat
//
|
(*
HX-2022-06-20:
D0Ptkerr(tok):
tok is not consumed by the parser!
*)
D0Ptkerr of (token) // HX: parsing error
|
D0Perrck of (int(*lvl*), d0pat)//HX:pread-error
//
// HX-2022-06-20: end-of-[datatype(d0pat_node)]
//
and
d0pat_RPAREN =
|
d0pat_RPAREN_cons0 of token
|
d0pat_RPAREN_cons1 of (token, d0patlst, token)
//
and
l0d0p_RBRACE =
|
l0d0p_RBRACE_cons0 of token
|
l0d0p_RBRACE_cons1 of (token, l0d0plst, token)
//
(* ****** ****** *)
fun
d0pat_fprint(FILR, d0pat): void
(* ****** ****** *)
//
fun
d0pat_get_lctn(d0pat): loc_t
fun
d0pat_get_node(d0pat): d0pat_node
//
#symload lctn with d0pat_get_lctn
#symload node with d0pat_get_node
//
(* ****** ****** *)
fun
d0pat_anno_opt
(d0p: d0pat, opt: s0expopt): d0pat
(* ****** ****** *)
fun
d0pat_make_node
(loc:loc_t, nod:d0pat_node): d0pat
#symload d0pat with d0pat_make_node
(* ****** ****** *)
//
(*
//HX:l0d0p:labd0pat
*)
#typedef
l0d0e = d0lab(d0exp)
#typedef
l0d0elst = list(d0lab(d0exp))
//
(* ****** ****** *)
//
datatype
d0exp_node =
//
| D0Eid0 of i0dnt
//
| D0Eint of t0int
| D0Echr of t0chr
| D0Eflt of t0flt
| D0Estr of t0str
//
| D0Eopid of d0eid
//
| D0Eapps of d0explst
//
| D0Esqarg of // sexparg
  (token, s0explst, token)
| D0Etqarg of // temparg
  (token, s0explst, token)
//
|
D0Elpar of
(token, d0explst, d0exp_RPAREN)
//
| D0Eif0 of
  ( token
  , d0exp
  , d0exp_THEN, d0exp_ELSE)
//
|
D0Elet0 of
( token
, d0eclist
, tokenopt(*IN*), d0explst, token)
//
(*
|
D0Ewhere of (d0exp, d0eclseq_WHERE)
*)
//
|
D0Ebrckt of
(token(*LB*), d0explst, token(*RB*))
|
D0Edtsel of
(token
(*DOT/MGT*), l0abl, d0expopt(*arg*))
//
|
D0Etry0 of
( token
, d0exp, token(*WITH*)
, tokenopt, d0clslst, tokenopt(*END*))
//
//
|
D0Eanno of (d0exp, s0exp) // HX: annotation
| // qualified-id
D0Equal of (token, d0exp) // HX: qual-d0exp
//
| // HX-2020-11-04: for specifying
D0Eextnam of (g0nam) // external names
|
D0Eexists of
( token // HX-2021-01-14: $exists{..}..{..}
, d0explst(*D0Esqarglst*), d0exp) // (d0exp)
//
|
(*
HX-2022-06-20:
D0Etkerr(tok):
tok is not consumed by the parser!
*)
D0Etkerr of (token) // HX: parsing error
|
D0Eerrck of (int(*lvl*), d0exp)//HX:pread-error
//
// HX-2022-06-20: end-of-[datatype(d0exp_node)]
//
(* ****** ****** *)
//
and
d0exp_THEN =
|
d0exp_THEN_some of (token, d0exp)
and
d0exp_ELSE =
|
d0exp_ELSE_none of (token)
|
d0exp_ELSE_some of (token, d0exp)
//
(* ****** ****** *)
//
and
tkend_WHERE =
|
tkend_WHERE_cons1 of token
|
tkend_WHERE_cons2 of (token, tokenopt)
//
and
d0eclseq_WHERE =
|
d0eclseq_WHERE of
(token, tokenopt, d0eclist, tkend_WHERE)
//
(* ****** ****** *)
//
and
d0exp_RPAREN =
|
d0exp_RPAREN_cons0 of (token)
|
d0exp_RPAREN_cons1 of (token, d0explst, token)
//
and
l0d0e_RBRACE =
|
l0d0e_RBRACE_cons0 of token
|
l0d0e_RBRACE_cons1 of (token, l0d0elst, token)
//
(* ****** ****** *)
//
fun
d0exp_fprint
(out:FILR, d0e:d0exp): void
//
fun
d0cls_fprint
(out:FILR, dcl:d0cls): void
//
(* ****** ****** *)
//
fun
d0exp_get_lctn
  (dexp: d0exp): loc_t
fun
d0cls_get_lctn
  (dcl1: d0cls): loc_t
//
(* ****** ****** *)
//
fun
d0exp_THEN_get_lctn
  (dthn: d0exp_THEN): loc_t
fun
d0exp_ELSE_get_lctn
  (dels: d0exp_THEN): loc_t
fun
d0exp_RPAREN_get_lctn
  (dels: d0exp_RPAREN): loc_t
//
(* ****** ****** *)
#symload lctn with d0exp_get_lctn
#symload lctn with d0cls_get_lctn
(* ****** ****** *)
//
#symload lctn with d0exp_THEN_get_lctn
#symload lctn with d0exp_ELSE_get_lctn
#symload lctn with d0exp_RPAREN_get_lctn
//
(* ****** ****** *)
fun
d0exp_get_node(d0exp): d0exp_node
#symload node with d0exp_get_node
//
(* ****** ****** *)
fun
d0exp_make_node
(loc:loc_t, nod:d0exp_node): d0exp
//
#symload d0exp with d0exp_make_node
//
(* ****** ****** *)
//
datatype
q0arg_node =
(*
| Q0ARGnone of token
*)
| Q0ARGsome of (i0dnt,sort0opt)
//
(* ****** ****** *)
fun
q0arg_fprint(FILR, q0arg): void
(* ****** ****** *)
//
fun
q0arg_get_lctn(q0arg): loc_t
fun
q0arg_get_node(q0arg): q0arg_node
//
#symload lctn with q0arg_get_lctn
#symload node with q0arg_get_node
//
fun
q0arg_make_node
(loc:loc_t, nod:q0arg_node): q0arg
#symload q0arg with q0arg_make_node
//
(* ****** ****** *)
//
datatype
s0qag_node =
|
S0QAGnone of token
|
S0QAGsome of // {...}
(token, q0arglst, token)
//
datatype
t0qag_node =
|
T0QAGnone of token
|
T0QAGsome of // <...>
(token, q0arglst, token)
//
(* ****** ****** *)
fun
s0qag_fprint(FILR, s0qag): void
fun
t0qag_fprint(FILR, t0qag): void
(* ****** ****** *)
//
fun
s0qag_get_lctn(s0qag): loc_t
fun
s0qag_get_node(s0qag): s0qag_node
//
#symload lctn with s0qag_get_lctn
#symload node with s0qag_get_node
//
fun
t0qag_get_lctn(t0qag): loc_t
fun
t0qag_get_node(t0qag): t0qag_node
//
#symload lctn with t0qag_get_lctn
#symload node with t0qag_get_node
//
(* ****** ****** *)
//
fun
s0qag_make_node
(loc:loc_t, nod:s0qag_node): s0qag
#symload s0qag with s0qag_make_node
//
fun
t0qag_make_node
(loc:loc_t, nod:t0qag_node): t0qag
#symload t0qag with t0qag_make_node
//
(* ****** ****** *)
datatype
t0iag_node =
|
T0IAGnone of token
|
T0IAGsome of // <...>
(token, s0explst, token)
(* ****** ****** *)
fun
t0iag_fprint(FILR, t0iag): void
(* ****** ****** *)
fun
t0iag_get_lctn(t0iag): loc_t
fun
t0iag_get_node(t0iag): t0iag_node
//
#symload lctn with t0iag_get_lctn
#symload node with t0iag_get_node
//
(* ****** ****** *)
//
fun
t0iag_make_node
(loc:loc_t, nod:t0iag_node): t0iag
#symload t0iag with t0iag_make_node
//
(* ****** ****** *)
//
datatype
d0ecl_node =
//
|
D0Cnonfix of
(token, i0dntlst)
|
D0Cfixity of
(token, i0dntlst, precopt)
//
|
D0Cstatic of (token, d0ecl)
|
D0Cextern of (token, d0ecl)
//
|
D0Clocal of
( token(*LOCAL*)
, d0eclist(*head*)
, tokenopt(* IN *)
, d0eclist(*body*), token(*END*))
//
|
D0Cabssort of (token, s0tid)
//
|
D0Cstacst0 of
( token
, s0eid
, t0maglst, token(*:*), sort0)
//
|
D0Csortdef of
( token(*tknd*)
, s0tid, token(*=*), s0tdf(*def*))
//
|
D0Csexpdef of
( token(*tknd*)
, s0eid(*name*)
, s0maglst, sort0opt, token, s0exp)
//
|
D0Cabstype of
( token
, s0eid
, t0maglst
, sort0opt, a0tdf(*def*))
|
D0Cabsopen of
(token(*ABSOPEN*), s0qid)
|
D0Cabsimpl of
( token
, s0qid
, s0maglst, sort0opt, token, s0exp)
//
|
D0Cinclude of (token, g0exp)
|
D0Cstaload of (token, g0exp)
//
|
D0Csymload of
( token
, s0ymb
, token(*WITH*)
, d0qid(*qual-id*), precopt)
//
|
D0Cdatasort of
(token(*DATASORT*), d0tstlst)
//
|
D0Cdatatype of
(token(*DATATYPE*), d0typlst, wd0eclseq)
//
|
D0Cdynconst of
(token(*fnk//vlk*), t0qaglst, d0cstdclist)
//
(*
HX-2022-06-20:
D0Ctkerr(tok):
tok is not consumed by the parser!
*) // HX:This one is an indication
| D0Ctkerr of (token) // of some error
//
(*
HX-2019:
D0Ctkskp(tok):
for skipping synerr:
*)//HX:Note that [tok] is consumed
| D0Ctkskp of (token) // by the parser
//
|
D0Cerrck of (int(*lvl*), d0ecl)//HX:pread-error
//
// HX-2022-06-22: end-of-[datatype(d0ecl_node)]
//
(* ****** ****** *)
//
and
precopt =
| PRECnil0 of ()
| PRECint1 of (token)
| PRECopr2 of (i0dnt, precmod)
and
precmod =
| PMODnone of ()
| PMODsome of
  (token(*LP*), precint, token(*RP*))
and
precint =
| PINTint1 of (token(*int*))
| PINTopr2 of (token(*opr*), token(*int*))
//
(* ****** ****** *)
//
and a0tdf =
| A0TDFsome of () // unspecified
| A0TDFlteq of (token(*"<="*), s0exp)
| A0TDFeqeq of (token(*"=="*), s0exp)
//
(* ****** ****** *)
//
and
wd0eclseq =
|
WD0CSnone of ()
|
WD0CSsome of
(token(*where*), tokenopt, d0eclist, token)
//
(* ****** ****** *)
//
where
{
  #typedef d0cstdclist = list(  d0cstdcl  )
  #typedef d0fundclist = list(  d0fundcl  )
  #typedef d0valdclist = list(  d0valdcl  )
  #typedef d0vardclist = list(  d0vardcl  )
} (*where*) // end-of-[datatype ... and ...]
//
(* ****** ****** *)
fun
d0ecl_fprint
(out:FILR, dcl:d0ecl): void
(* ****** ****** *)
fun
a0tdf_fprint
(out:FILR, tdf:a0tdf): void
(* ****** ****** *)
fun
precopt_fprint
(out:FILR, opt:precopt): void
fun
precmod_fprint
(out:FILR, pmd:precmod): void
fun
precint_fprint
(out:FILR, int:precint): void
(* ****** ****** *)
fun
wd0eclseq_fprint
(out:FILR, wdcs:wd0eclseq): void
(* ****** ****** *)
//
fun
d0ecl_get_lctn(d0ecl): loc_t
fun
d0ecl_get_node(d0ecl): d0ecl_node
//
#symload lctn with d0ecl_get_lctn
#symload node with d0ecl_get_node
//
(* ****** ****** *)
fun
d0ecl_make_node
(loc:loc_t, nod:d0ecl_node): d0ecl
#symload d0ecl with d0ecl_make_node
(* ****** ****** *)
datatype
a0typ_node =
(*
|
A0TYPnone of token
*)
|
A0TYPsome of
( s0exp
, tokenopt(*comment*))
//
datatype
d0arg_node =
|
D0ARGnone of token
|
D0ARGsta0 of
(token, s0qualst, token)
|
D0ARGdyn1 of (s0eid)
|
D0ARGdyn2 of
(token
,a0typlst,a0typlstopt,token)
//
where
{
#typedef
a0typlstopt = optn(a0typlst)
}
(* ****** ****** *)
fun
a0typ_fprint(FILR, a0typ): void
fun
d0arg_fprint(FILR, d0arg): void
(* ****** ****** *)
//
fun
a0typ_get_lctn(a0typ): loc_t
fun
d0arg_get_lctn(d0arg): loc_t
fun
a0typ_get_node(a0typ): a0typ_node
fun
d0arg_get_node(d0arg): d0arg_node
//
#symload lctn with a0typ_get_lctn
#symload lctn with d0arg_get_lctn
//
#symload node with a0typ_get_node
#symload node with d0arg_get_node
//
(* ****** ****** *)
//
fun
a0typ_make_node
(loc:loc_t, nod:a0typ_node): a0typ
fun
d0arg_make_node
(loc:loc_t, nod:d0arg_node): d0arg
//
#symload a0typ with a0typ_make_node
#symload d0arg with d0arg_make_node
//
(* ****** ****** *)
//
datatype
s0eff =
| S0EFFnone of (token)
| S0EFFsome of // :<...>
  (token, s0explst, token)
datatype
s0res =
| S0RESnone of ((*void*))
| S0RESsome of (s0eff, s0exp)
//
(* ****** ****** *)
//
fun s0eff_fprint: (FILR, s0eff) -> void
fun s0res_fprint: (FILR, s0res) -> void
//
(* ****** ****** *)
//
datatype d0res =
|
D0RESnone of ((*void*))
|
D0RESsome of (token(*T_EQ0*), d0exp)
//
datatype w0s0e =
|
W0S0Enone of ((*void*))
|
W0S0Esome of (token(*WITHTYPE*), s0exp)
//
(* ****** ****** *)
//
fun d0res_fprint: (FILR, d0res) -> void
fun w0s0e_fprint: (FILR, w0s0e) -> void
//
(* ****** ****** *)
//
(*
datatype
d0cstdcl =
D0CSTDCL of @{
  lctn= loc_t
, dpid= d0pid
, darg= d0arglst
, sres= s0res, dres= d0res
}
*)
//
fun
d0cstdcl_fprint
(out: FILR,dcst: d0cstdcl): void
//
fun
d0cstdcl_get_lctn:(d0cstdcl)->loc_t
fun
d0cstdcl_get_dpid:(d0cstdcl)->d0pid(*nam*)
fun
d0cstdcl_get_darg:(d0cstdcl)->d0arglst
fun
d0cstdcl_get_sres:(d0cstdcl)->s0res(*opt*)
fun
d0cstdcl_get_dres:(d0cstdcl)->d0res(*opt*)
//
#symload lctn with d0cstdcl_get_lctn
#symload dpid with d0cstdcl_get_dpid
#symload darg with d0cstdcl_get_darg(*lst*)
#symload sres with d0cstdcl_get_sres(*opt*)
#symload dres with d0cstdcl_get_dres(*opt*)
//
(* ****** ****** *)
//
fun
d0cstdcl_make_args
( loc0:loc_t
, dpid:d0pid
, args:d0arglst, sres:s0res, dres:d0res
) : d0cstdcl//end-of(d0cstdcl_make_node)
#symload d0cstdcl with d0cstdcl_make_args
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_dynexp0.sats] *)
