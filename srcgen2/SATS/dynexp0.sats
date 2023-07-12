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
#typedef g0eid = $S0E.g0eid
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
#typedef g0mag = $S0E.g0mag
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
#typedef g0explst = list(g0exp)
#typedef g0expopt = optn(g0exp)
(* ****** ****** *)
#typedef g0maglst = list(g0mag)
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
//
#abstbox a0typ_tbox // ptr
#abstbox d0arg_tbox // ptr
(*
#abstbox d0ann_tbox // ptr
*)
(* ****** ****** *)
//
#abstbox d0pat_tbox // ptr
#abstbox d0exp_tbox // ptr
#abstbox d0ecl_tbox // ptr
//
#abstbox f0arg_tbox // ptr
#abstbox d0cls_tbox // ptr
#abstbox d0gua_tbox // ptr
#abstbox d0gpt_tbox // ptr
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
#typedef d0ecl = d0ecl_tbox
(* ****** ****** *)
#typedef f0arg = f0arg_tbox
#typedef d0cls = d0cls_tbox
#typedef d0gua = d0gua_tbox
#typedef d0gpt = d0gpt_tbox
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
#typedef d0pidopt = optn(d0pid)
//
(* ****** ****** *)
//
#typedef d0patlst = list(d0pat)
#typedef d0explst = list(d0exp)
#typedef d0eclist = list(d0ecl)
//
#typedef d0patopt = optn(d0pat)
#typedef d0expopt = optn(d0exp)
//
(* ****** ****** *)
#typedef f0arglst = list(f0arg)
#typedef d0clslst = list(d0cls)
#typedef d0gualst = list(d0gua)
#typedef d0gptlst = list(d0gpt)
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
fun
<x0:t0>
d0lab_get_itm
(dlab: d0lab(x0)): x0
#symload
itm with d0lab_get_itm
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
| D0Psarg of
  (token(*LB*), s0arglst, token)
//
| D0Plpar of
  (token, d0patlst, d0pat_RPAREN)
//
| D0Ptup1 of
  (token, tokenopt, d0patlst, d0pat_RPAREN)
| D0Prcd2 of
  (token, tokenopt, l0d0plst, l0d0p_RBRACE)
//
| D0Pannot of (d0pat, s0exp) // HX: annotation
//
| D0Pqual0 of (token, d0pat) // HX: qual-d0pat
//
|
(*
// HX-2022-06-20:
// D0Ptkerr(tok):
// tok is not consumed by the parser!
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
//
datatype
f0arg_node =
|
F0ARGnone of (token)
|
F0ARGdyn0 of (d0pat)
|
F0ARGsta0 of (token, s0qualst, token)
|
F0ARGmet0 of (token, s0explst, token)
//
(* ****** ****** *)
fun
d0pat_fprint(FILR, d0pat): void
fun
f0arg_fprint(FILR, f0arg): void
fun
d0pat_RPAREN_fprint
(out:FILR, drp0:d0pat_RPAREN): void
fun
l0d0p_RBRACE_fprint
(out:FILR, ldrb:l0d0p_RBRACE): void
(* ****** ****** *)
//
fun
d0pat_get_lctn(d0pat): loc_t
fun
f0arg_get_lctn(f0arg): loc_t
fun
d0pat_get_node(d0pat): d0pat_node
fun
f0arg_get_node(f0arg): f0arg_node
//
#symload lctn with d0pat_get_lctn
#symload lctn with f0arg_get_lctn
#symload node with d0pat_get_node
#symload node with f0arg_get_node
//
(* ****** ****** *)
fun
d0pat_annotopt
(d0p: d0pat, opt: s0expopt): d0pat
(* ****** ****** *)
fun
d0pat_make_node
(loc:loc_t, nod:d0pat_node): d0pat
#symload d0pat with d0pat_make_node
fun
f0arg_make_node
(loc:loc_t, nod:f0arg_node): f0arg
#symload f0arg with f0arg_make_node
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
| D0Esarg of // sexparg
  (token, s0explst, token)
| D0Etarg of // temparg
  (token, s0explst, token)
//
|
D0Elpar of
(token, d0explst, d0exp_RPAREN)
//
|
D0Eift0 of
( token
, d0exp
, d0exp_THEN, d0exp_ELSE(*opt*))
|
D0Eift1 of
( token
, d0exp
, d0exp_THEN, d0exp_ELSE, t0inv)
//
|
D0Ecas0 of
( token
, d0exp
, token(*OF*)
, tokenopt(*BAR*), d0clslst)
|
D0Ecas1 of
( token
, d0exp
, token(*OF*)
, tokenopt(*BAR*), d0clslst, t0inv)
//
|
D0Etup1 of // HX: tuple
( token
, tokenopt, d0explst, d0exp_RPAREN)
|
D0Ercd2 of // HX: tuple
( token
, tokenopt, l0d0elst, l0d0e_RBRACE)
//
|
D0Elet0 of
( token
, d0eclist
, tokenopt(*IN*), d0explst, token )
//
|
D0Ewhere of (d0exp, d0eclseq_WHERE)
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
, d0explst // SMCLN-sequence
, token(*WITH*)
, tokenopt(*BAR*), d0clslst, token )
//
|
D0Elam0 of
( token(*lam/lam@*)
, f0arglst(*arglst*)
, s0res, f0unarrw, d0exp, tokenopt )
|
D0Efix0 of
( token(*fix/fix@*)
, d0pid(*fixed-pnt*)
, f0arglst(*arglst*)
, s0res, f0unarrw, d0exp, tokenopt )
//
|
D0Eraise of (token, d0exp) // HX: raising
//
|
D0Eannot of (d0exp, s0exp) // HX: annotation
| // qualified-id
D0Equal0 of (token, d0exp) // HX: qual-d0exp
//
| // HX-2020-11-04: for specifying
D0Eextnam of (token, g0nam) // external names
|
D0Eexists of
( token // HX-2021-01-14: $exists{..}..{..}
, d0explst(*D0Esarglst*), d0exp ) // (d0exp)
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
s0eff =
| S0EFFnone of (token)
| S0EFFsome of // :<...>
  (token, s0explst, token)
and
s0res =
| S0RESnone of ((*void*))
| S0RESsome of (s0eff, s0exp)
//
(* ****** ****** *)
//
and
t0qua =
|
T0QUAnone of token
|
T0QUAsome of
(token, s0qualst, token)
//
and
t0inv =
|
T0INVnone of
( t0qualst, token )
|
T0INVsome of
(t0qualst,token,d0patlst,token)
//
(* ****** ****** *)
and
f0unarrw =
|
F0UNARRWnone of token(*err*)
|
F0UNARRWdflt of (token(*=>*))
|
F0UNARRWlist of
(token(*=<*),s0explst,token(*>*))
(* ****** ****** *)
//
and
d0exp_THEN =
|
d0exp_THEN_none of (token)
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
(*
|
tkend_WHERE_cons2 of (token, tokenopt)
*)
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
| // (d0es1 | d0es2)
d0exp_RPAREN_cons1 of (token,d0explst,token)
| // (d0es1 ; d0es2)
d0exp_RPAREN_cons2 of (token,d0explst,token)
//
and
l0d0e_RBRACE =
|
l0d0e_RBRACE_cons0 of token
|
l0d0e_RBRACE_cons1 of (token,l0d0elst,token)
//
(* ****** ****** *)
//
where
{
  #typedef
  t0qualst = list(t0qua) }
//
(* ****** ****** *)
//
datatype
d0gua_node =
|
D0GUAexp of (d0exp)
|
D0GUAmat of
(d0exp, token(*AS*), d0pat)
//
datatype
d0cls_node =
|
D0CLSgpt of (d0gpt)
|
D0CLScls of
(d0gpt, token(*EQGT*), d0exp)
and
d0gpt_node =
|
D0GPTpat of (d0pat)
|
D0GPTgua of
(d0pat, token(*WHEN*), d0gualst)
//
(* ****** ****** *)
//
fun
d0exp_fprint
(out:FILR, d0e:d0exp): void
//
(* ****** ****** *)
//
fun
d0cls_fprint
(out:FILR, dcl:d0cls): void
fun
d0gua_fprint
(out:FILR, d0g:d0gua): void
fun
d0gpt_fprint
(out:FILR, d0g:d0gpt): void
//
(* ****** ****** *)
//
fun
s0eff_fprint:(FILR,s0eff)->void
fun
s0res_fprint:(FILR,s0res)->void
//
(* ****** ****** *)
fun
t0qua_fprint: (FILR, t0qua)->void
fun
t0inv_fprint: (FILR, t0inv)->void
(* ****** ****** *)
fun
f0unarrw_fprint
(out: FILR, arrw: f0unarrw): void
(* ****** ****** *)
fun
d0exp_THEN_fprint
(out:FILR, dthn:d0exp_THEN): void
fun
d0exp_ELSE_fprint
(out:FILR, dels:d0exp_ELSE): void
(* ****** ****** *)
fun
tkend_WHERE_fprint
(out:FILR, twhr:tkend_WHERE): void
(* ****** ****** *)
fun
d0exp_RPAREN_fprint
(out:FILR, drp0:d0exp_RPAREN): void
fun
l0d0e_RBRACE_fprint
(out:FILR, ldrb:l0d0e_RBRACE): void
//
(* ****** ****** *)
fun
d0eclseq_WHERE_fprint
(out:FILR, dcls:d0eclseq_WHERE): void
(* ****** ****** *)
//
fun
d0exp_get_lctn: d0exp->loc_t
//
(* ****** ****** *)
//
fun
d0cls_get_lctn: d0cls->loc_t
fun
d0gua_get_lctn: d0gua->loc_t
fun
d0gpt_get_lctn: d0gpt->loc_t
//
(* ****** ****** *)
fun
d0exp_get_node: d0exp->d0exp_node
(* ****** ****** *)
fun
d0cls_get_node: d0cls->d0cls_node
fun
d0gua_get_node: d0gua->d0gua_node
fun
d0gpt_get_node: d0gpt->d0gpt_node
(* ****** ****** *)
//
#symload lctn with d0exp_get_lctn
#symload lctn with d0cls_get_lctn
//
#symload node with d0exp_get_node
#symload node with d0cls_get_node
#symload node with d0gua_get_node
#symload node with d0gpt_get_node
//
(* ****** ****** *)
//
fun
t0qua_get_lctn:t0qua->loc_t
fun
t0inv_get_lctn:t0inv->loc_t
//
(* ****** ****** *)
//
#symload lctn with t0qua_get_lctn
#symload lctn with t0inv_get_lctn
//
(* ****** ****** *)
fun
d0exp_annotopt
(d0e: d0exp, opt: s0expopt): d0exp
(* ****** ****** *)
//
fun
d0exp_make_node
(loc:loc_t, nod:d0exp_node): d0exp
//
#symload d0exp with d0exp_make_node
//
(* ****** ****** *)
fun
d0cls_make_node
(loc:loc_t, nod:d0cls_node): d0cls
fun
d0gua_make_node
(loc:loc_t, nod:d0gua_node): d0gua
fun
d0gpt_make_node
(loc:loc_t, nod:d0gpt_node): d0gpt
//
#symload d0cls with d0cls_make_node
#symload d0gua with d0gua_make_node
#symload d0gpt with d0gpt_make_node
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
(*
HX-2022-12-15:
This one uses dyn-binding.
Level-1 resolution is performed.
*)
|
D0Cdefine of
(
token(*tknd*),
g0eid(* fun *),
g0maglst(*arg*), g0edf(*def*))
(*
HX-2022-12-15:
This one uses sta-binding.
Level-2 resolution is performed.
*)
|
D0Cmacdef of
(
token(*tknd*),
g0eid(* fun *),
g0maglst(*arg*), d0edf(*def*))
//
|
D0Clocal0 of
( token(*LOCAL*)
, d0eclist(*head*)
, tokenopt(* IN *)
, d0eclist(*body*), token(*END*))
//
|
D0Cabssort of
(token(*ABSSORT*), s0tid(*name*))
//
|
D0Cstacst0 of
(
token,
s0eid(*name*),
t0maglst(*arg*), token(*:*), sort0)
//
|
D0Csortdef of
( token(*tknd*)
, s0tid(*name*), token(*=*), s0tdf)
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
, s0eid(*name*)
, t0maglst, sort0opt, a0tdf(*def*))
|
D0Cabsopen of
(
token(*ABSOPEN*), s0qid(*qual-id*))
|
D0Cabsimpl of
( token
, s0qid
, s0maglst, sort0opt, token, s0exp)
//
|
D0Csymload of
( token
, s0ymb
, token(*WITH*)
, d0qid(*qual-id*), g0expopt(*prec*))
//
|
D0Cinclude of
(sint(*s/d*), token, g0exp)//inclusion
|
D0Cstaload of
(sint(*s/d*), token, g0exp)//staloading
|
D0Cdyninit of (token, g0exp)//initization
//
|
D0Cdatasort of
(token(*DATASORT*), d0tstlst)
//
|
D0Cvaldclst of
(token(*VAL(vlk)*), d0valdclist)
|
D0Cvardclst of
(token(*VAR(vrk)*), d0vardclist)
|
D0Cfundclst of
(token(*FUN(fnk)*), t0qaglst, d0fundclist)
//
|
D0Cimplmnt0 of
( token(*implknd*)
, s0qaglst // {...}
, t0qaglst // <...>
, d0qid, t0iaglst, f0arglst
, s0res, token(*EQ0*), d0exp(*body*))
//
|
D0Cexcptcon of
(token(*EXCPTCON*), tokenopt, d0tcnlst)
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
[tok] is not consumed by the parser!
*) // HX: This one is an indication
|
D0Ctkerr of (token) // of some syn error
//
(*
HX-2019-??-??:
D0Ctkskp(tok):
for skipping synerr:
*) // HX: Note that [tok] is consumed and
|
D0Ctkskp of (token) // parsing is to continue
//
|
D0Cerrck of (sint(*lvl*), d0ecl)//pread0x-error
//
// HX-2022-06-22: end-of-[ datatype(d0ecl_node) ]
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
and g0edf =
| G0EDFnone of ()
| G0EDFsome of (tokenopt, g0exp(*def*))
//
and d0edf =
| D0EDFnone of ()
| D0EDFsome of (tokenopt, d0exp(*def*))
//
(* ****** ****** *)
//
and a0tdf =
|
A0TDFsome of () // unspecified
|
A0TDFlteq of (token(*"<="*), s0exp(*def*))
|
A0TDFeqeq of (token(*"=="*), s0exp(*def*))
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
  #typedef d0fundclist = list(  d0fundcl  )
  #typedef d0valdclist = list(  d0valdcl  )
  #typedef d0vardclist = list(  d0vardcl  )
  #typedef d0cstdclist = list(  d0cstdcl  )
} (*where*) // end-of-[datatype ... and ...]
//
(* ****** ****** *)
fun
d0ecl_fprint
(out:FILR, dcl:d0ecl): void
(* ****** ****** *)
fun
g0edf_fprint
(out:FILR, gedf:g0edf): void
fun
d0edf_fprint
(out:FILR, dedf:d0edf): void
fun
a0tdf_fprint
(out:FILR, atdf:a0tdf): void
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
//
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
D0ARGdyn1 of (d0pid)
|
D0ARGdyn2 of
(token
,a0typlst,a0typlstopt,token)
//
where
{
#typedef
a0typlstopt = optn(a0typlst) }
//
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
datatype d0res =
|
D0RESnone of ((*void*))
|
D0RESsome of (token(*T_EQ0*),d0exp)
//
(* ****** ****** *)
//
fun
d0res_fprint: (FILR, d0res) -> void
//
(* ****** ****** *)
//
datatype
teqd0exp =
|
TEQD0EXPnone of ((*void*))
|
TEQD0EXPsome of (token(*EQ0*), d0exp)
datatype
wths0exp =
|
WTHS0EXPnone of ((*void*))
|
WTHS0EXPsome of (token(*WTH*), s0exp)
//
(* ****** ****** *)
fun
d0valdcl_fprint
(out: FILR, d0cl: d0valdcl): void
fun
d0vardcl_fprint
(out: FILR, d0cl: d0vardcl): void
fun
d0fundcl_fprint
(out: FILR, d0cl: d0fundcl): void
(* ****** ****** *)
fun
d0valdcl_get_lctn:(d0valdcl)->loc_t
fun
d0vardcl_get_lctn:(d0vardcl)->loc_t
fun
d0fundcl_get_lctn:(d0fundcl)->loc_t
(* ****** ****** *)
#symload lctn with d0valdcl_get_lctn
#symload lctn with d0vardcl_get_lctn
#symload lctn with d0fundcl_get_lctn
(* ****** ****** *)
fun
d0valdcl_get_dpat:(d0valdcl)->d0pat
fun
d0valdcl_get_tdxp:(d0valdcl)->teqd0exp
fun
d0valdcl_get_wsxp:(d0valdcl)->wths0exp
(* ****** ****** *)
#symload dpat with d0valdcl_get_dpat
#symload tdxp with d0valdcl_get_tdxp
#symload wsxp with d0valdcl_get_wsxp
(* ****** ****** *)
fun
d0vardcl_get_dpid:(d0vardcl)->d0pid
fun
d0vardcl_get_vpid:(d0vardcl)->d0pidopt
fun
d0vardcl_get_sres:(d0vardcl)->s0expopt
fun
d0vardcl_get_dini:(d0vardcl)->teqd0exp
(* ****** ****** *)
#symload dpid with d0vardcl_get_dpid
#symload vpid with d0vardcl_get_vpid
#symload sres with d0vardcl_get_sres
#symload dini with d0vardcl_get_dini
(* ****** ****** *)
fun
d0fundcl_get_dpid:(d0fundcl)->d0pid
fun
d0fundcl_get_farg:(d0fundcl)->f0arglst
fun
d0fundcl_get_sres:(d0fundcl)->s0res
fun
d0fundcl_get_tdxp:(d0fundcl)->teqd0exp
fun
d0fundcl_get_wsxp:(d0fundcl)->wths0exp
(* ****** ****** *)
#symload dpid with d0fundcl_get_dpid
#symload farg with d0fundcl_get_farg
#symload sres with d0fundcl_get_sres
#symload tdxp with d0fundcl_get_tdxp
#symload wsxp with d0fundcl_get_wsxp
(* ****** ****** *)
//
fun
d0valdcl_make_args
( lctn:loc_t
, dpat:d0pat
, tdxp:teqd0exp, wsxp:wths0exp):d0valdcl
fun
d0vardcl_make_args
( lctn:loc_t
, dpid:d0pid
, vpid:d0pidopt
, sres:s0expopt, dini:teqd0exp):d0vardcl
//
fun
d0fundcl_make_args
( lctn:loc_t
, dpid:d0pid
, farg:f0arglst
, sres:s0res
, tdxp:teqd0exp, wsxp:wths0exp):d0fundcl
//
#symload d0valdcl with d0valdcl_make_args
#symload d0vardcl with d0vardcl_make_args
#symload d0fundcl with d0fundcl_make_args
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

#abstbox d0parsed_tbox // ptr
#typedef d0parsed = d0parsed_tbox

(* ****** ****** *)
//
#typedef
d0eclistopt = optn(d0eclist)
//
fun
d0parsed_fprint
(out: FILR, dpar: d0parsed): void
//
fun
d0parsed_get_stadyn:(d0parsed)->sint
fun
d0parsed_get_nerror:(d0parsed)->sint
fun
d0parsed_get_source:(d0parsed)->lcsrc
fun
d0parsed_get_parsed:(d0parsed)->d0eclistopt
//
#symload stadyn with d0parsed_get_stadyn
#symload nerror with d0parsed_get_nerror
#symload source with d0parsed_get_source
#symload parsed with d0parsed_get_parsed
//
fun
d0parsed_make_args
( stadyn:sint
, nerror:sint
, source:lcsrc
, parsed:d0eclistopt): d0parsed//end-fun
//
#symload d0parsed with d0parsed_make_args
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_dynexp0.sats] *)
