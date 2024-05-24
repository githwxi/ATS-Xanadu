(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
//
Sat 02 Mar 2024 05:55:19 PM EST
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-03-14:
Types are erased!!!
*)
(* ****** ****** *)
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../../../SATS/xbasics.sats"
#staload
"./../../../SATS/xsymbol.sats"
#staload
"./../../../SATS/xlabel0.sats"
//
(* ****** ****** *)
//
#staload
"./../../../SATS/filpath.sats"
#staload
"./../../../SATS/locinfo.sats"
//
#staload // LEX =
"./../../../SATS/lexing0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#typedef stamp = stamp
#typedef sym_t = sym_t
#typedef label = label
(* ****** ****** *)
#typedef loctn = loctn
#typedef loc_t = loctn
#typedef lcsrc = lcsrc
(* ****** ****** *)
#typedef fpath = fpath
#typedef token = token
(* ****** ****** *)
#typedef fpathopt = fpathopt
(* ****** ****** *)
(* ****** ****** *)
#staload S1E =
"./../../../SATS/staexp1.sats"
(* ****** ****** *)
#staload D1E =
"./../../../SATS/dynexp1.sats"
(* ****** ****** *)
#staload S2E =
"./../../../SATS/staexp2.sats"
#staload T2P =
"./../../../SATS/statyp2.sats"
(* ****** ****** *)
#staload D2E =
"./../../../SATS/dynexp2.sats"
(* ****** ****** *)
#staload D3E =
"./../../../SATS/dynexp3.sats"
(* ****** ****** *)
(* ****** ****** *)
#typedef g1exp = $S1E.g1exp
(* ****** ****** *)
#typedef d1exp = $D1E.d1exp
(* ****** ****** *)
#typedef s2exp = $S2E.s2exp
#typedef s2typ = $S2E.s2typ
(* ****** ****** *)
#typedef s2vts = $T2P.s2vts
(* ****** ****** *)
#typedef d2con = $D2E.d2con
#typedef d2cst = $D2E.d2cst
#typedef d2var = $D2E.d2var
(* ****** ****** *)
(*
#typedef s2qag = $D2E.s2qag
#typedef t2qag = $D2E.t2qag
#typedef t2iag = $D2E.t2iag
#typedef t2jag = $D2E.t2jag
*)
(* ****** ****** *)
#typedef dimpl = $D2E.dimpl
(* ****** ****** *)
#typedef d3pat = $D3E.d3pat
#typedef d3exp = $D3E.d3exp
(* ****** ****** *)
#typedef l3d3p = $D3E.l3d3p
#typedef l3d3e = $D3E.l3d3e
(* ****** ****** *)
#typedef f3arg = $D3E.f3arg
(* ****** ****** *)
#typedef d3gua = $D3E.d3gua
#typedef d3gpt = $D3E.d3gpt
#typedef d3cls = $D3E.d3cls
(* ****** ****** *)
#typedef timpl = $D3E.timpl
(* ****** ****** *)
#typedef d3ecl = $D3E.d3ecl
(* ****** ****** *)
(* ****** ****** *)
#typedef s2explst = $S2E.s2explst
#typedef s2typlst = $S2E.s2typlst
(* ****** ****** *)
#typedef d2conlst = $D2E.d2conlst
#typedef d2cstlst = $D2E.d2cstlst
#typedef d2varlst = $D2E.d2varlst
(* ****** ****** *)
(*
#typedef s2qaglst = $D2E.s2qaglst
#typedef t2qaglst = $D2E.t2qaglst
#typedef t2iaglst = $D2E.t2iaglst
#typedef t2jaglst = $D2E.t2jaglst
*)
(* ****** ****** *)
#typedef d3patlst = $D3E.d3patlst
(* ****** ****** *)
#typedef d3explst = $D3E.d3explst
#typedef d3expopt = $D3E.d3expopt
(* ****** ****** *)
#typedef l3d3plst = $D3E.l3d3plst
#typedef l3d3elst = $D3E.l3d3elst
(* ****** ****** *)
#typedef f3arglst = $D3E.f3arglst
(* ****** ****** *)
#typedef d3gualst = $D3E.d3gualst
#typedef d3clslst = $D3E.d3clslst
(* ****** ****** *)
#typedef d3eclist = $D3E.d3eclist
(* ****** ****** *)
#typedef teqd3exp = $D3E.teqd3exp
(* ****** ****** *)
#typedef d3valdcl = $D3E.d3valdcl
#typedef d3vardcl = $D3E.d3vardcl
#typedef d3fundcl = $D3E.d3fundcl
(* ****** ****** *)
#typedef d3valdclist = $D3E.d3valdclist
#typedef d3vardclist = $D3E.d3vardclist
#typedef d3fundclist = $D3E.d3fundclist
(* ****** ****** *)
#typedef d3parsed = $D3E.d3parsed
(* ****** ****** *)
#typedef d3explstopt = $D3E.d3explstopt
#typedef d3eclistopt = $D3E.d3eclistopt
(* ****** ****** *)
(* ****** ****** *)
//
datatype
i0lab(x0:type) =
|
I0LAB of (label, x0(*elt*))
//
(* ****** ****** *)
//
fun
<x0:type>
i0lab_fprint
( out: FILR
, lab: i0lab( x0 )): (void)
//
(* ****** ****** *)
(* ****** ****** *)
#abstbox i0pat_tbox // p0tr
#typedef i0pat = i0pat_tbox
(* ****** ****** *)
#abstbox i0exp_tbox // p0tr
#typedef i0exp = i0exp_tbox
(* ****** ****** *)
#typedef l0i0p = i0lab(i0pat)
#typedef l0i0e = i0lab(i0exp)
(* ****** ****** *)
#abstbox fiarg_tbox // p0tr
#typedef fiarg = fiarg_tbox
(* ****** ****** *)
#typedef i0patlst = list(i0pat)
#typedef l0i0plst = list(l0i0p)
(* ****** ****** *)
#typedef i0expopt = optn(i0exp)
#typedef i0explst = list(i0exp)
#typedef l0i0elst = list(l0i0e)
(* ****** ****** *)
(* ****** ****** *)
//
datatype
fiarg_node =
|
FIARGdarg of i0patlst
//
#typedef
fiarglst = list(fiarg)
#typedef
fiarglstopt = optn(fiarglst)
//
(* ****** ****** *)
//
fun
fiarg_fprint
(out:FILR,fia0:fiarg): void
//
(* ****** ****** *)
fun
fiarg_get_lctn(fiarg): loc_t
fun
fiarg_get_node(fiarg): fiarg_node
(* ****** ****** *)
#symload lctn with fiarg_get_lctn
#symload node with fiarg_get_node
(* ****** ****** *)
fun
fiarg_make_node
(loc:loc_t, nod:fiarg_node):fiarg
#symload fiarg with fiarg_make_node
(* ****** ****** *)
(* ****** ****** *)
#abstbox i0gua_tbox // p0tr
#abstbox i0gpt_tbox // p0tr
#abstbox i0cls_tbox // p0tr
#typedef i0gua = i0gua_tbox
#typedef i0gpt = i0gpt_tbox
#typedef i0cls = i0cls_tbox
(* ****** ****** *)
#typedef i0gualst = list(i0gua)
#typedef i0clslst = list(i0cls)
(* ****** ****** *)
(* ****** ****** *)
#abstbox i0dcl_tbox // p0tr
#typedef i0dcl = i0dcl_tbox
(* ****** ****** *)
#abstbox t0imp_tbox // p0tr
#typedef t0imp = t0imp_tbox
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox i0valdcl_tbox//p0tr
#abstbox i0vardcl_tbox//p0tr
#abstbox i0fundcl_tbox//p0tr
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox i0parsed_tbox//p0tr
//
(* ****** ****** *)
(* ****** ****** *)
#typedef i0dclist = list(i0dcl)
(* ****** ****** *)
#typedef i0valdcl = i0valdcl_tbox
#typedef i0vardcl = i0vardcl_tbox
#typedef i0fundcl = i0fundcl_tbox
(* ****** ****** *)
#typedef i0parsed = i0parsed_tbox
(* ****** ****** *)
#typedef i0valdclist = list(i0valdcl)
#typedef i0vardclist = list(i0vardcl)
#typedef i0fundclist = list(i0fundcl)
(* ****** ****** *)
#typedef i0dclistopt = optn(i0dclist)
(* ****** ****** *)
(* ****** ****** *)
//
datatype
i0pat_node =
//
(* ****** ****** *)
//
(*
|I0Pnil of ()
*)
//
(* ****** ****** *)
//
|I0Pany of ()
|I0Pvar of d2var
//
(* ****** ****** *)
//
|I0Pint of token
|I0Pbtf of sym_t
|I0Pchr of token
|I0Pflt of token
|I0Pstr of token
//
(* ****** ****** *)
//
|I0Pcon of (d2con)
//
(* ****** ****** *)
//
|I0Pbang of (i0pat)
|I0Pflat of (i0pat)
|I0Pfree of (i0pat)
//
(* ****** ****** *)
//
|I0Pdapp of
( i0pat, i0patlst )
//
(* ****** ****** *)
//
|I0Ptup0 of (i0patlst)
|I0Ptup1 of (token, i0patlst)
|I0Prcd2 of (token, l0i0plst)
//
(* ****** ****** *)
//
|I0Pnone0 of ((*0*)) | I0Pnone1 of (d3pat)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0pat_fprint
(out:FILR, i0p0:i0pat): void
//
(* ****** ****** *)
//
fun
i0pat_get_lctn(i0pat):( loc_t )
fun
i0pat_get_node(i0pat):i0pat_node
//
(* ****** ****** *)
#symload lctn with i0pat_get_lctn
#symload node with i0pat_get_node
(* ****** ****** *)
fun
i0pat_var(dvar: d2var): (i0pat)
(* ****** ****** *)
fun
i0pat_none0(loc0: loctn): (i0pat)
fun
i0pat_none1(d3p0: d3pat): (i0pat)
(* ****** ****** *)
fun
i0pat_make_node
(loc:loctn, nod:i0pat_node): i0pat
(* ****** ****** *)
#symload i0pat with i0pat_make_node
(* ****** ****** *)
(* ****** ****** *)
//
datatype
i0exp_node =
//
|I0Eint of token
|I0Ebtf of sym_t
|I0Echr of token
|I0Eflt of token
|I0Estr of token
//
(* ****** ****** *)
|I0Etop of (sym_t)
(* ****** ****** *)
|I0Evar of (d2var)
(* ****** ****** *)
//
|I0Econ of (d2con)
|I0Ecst of (d2cst)
//
(* ****** ****** *)
//
|I0Etimp of
(i0exp(*tapp*), t0imp)
//
(* ****** ****** *)
//
|I0Etapp of (i0exp(*fun*))
|I0Etapq of (i0exp(*fun*))
//
(* ****** ****** *)
//
|I0Edapp of
(i0exp(*fun*), i0explst(*arg*))
//
(* ****** ****** *)
//
|I0Epcon of
( token(*tknd*)
, label(*LABint*), i0exp(*con*))
|I0Epflt of
( token(*tknd*)
, label(*intsym*), i0exp(*tup*))
|I0Eproj of
( token(*tknd*)
, label(*intsym*), i0exp(*tup*))
//
(* ****** ****** *)
//
|I0Elet0 of
(i0dclist(*dcls*), i0exp(*scp*))
//
(* ****** ****** *)
//
|I0Eift0 of
(i0exp(*test*)
,i0expopt(*th*), i0expopt(*el*))
//
|I0Ecas0 of
(token(*+/0/-*), i0exp, i0clslst)
//
(* ****** ****** *)
//
|I0Eseqn of
(i0explst(*init*), i0exp(*last*))
//
(* ****** ****** *)
//
|I0Etup0 of (i0explst)
|I0Etup1 of (token(*knd*), i0explst)
|I0Ercd2 of (token(*knd*), l0i0elst)
//
(* ****** ****** *)
//
|I0Elam0 of
(token(*knd*),fiarglst(*arg*), i0exp)
|I0Efix0 of
(token(*knd*)
,d2var(*fid*),fiarglst(*arg*), i0exp)
//
(* ****** ****** *)
//
|I0Eaddr of (i0exp)//left-val-address
|I0Eflat of (i0exp)//left-val-content
//
|I0Efold of (i0exp)//open-con-folding
|I0Efree of (i0exp)//free-builtin-fun
//
(* ****** ****** *)
(* ****** ****** *)
//
|I0Edl0az of (i0exp)//l0azy-eval-thunk
|I0Edl1az of (i0exp)//l1azy-eval-thunk
|I0Edp2tr of (i0exp)//p2tr-dereference
//
(* ****** ****** *)
//
|I0Ewhere of
(i0exp(*scope*), i0dclist)//end-in-let
//
(* ****** ****** *)
//
|I0Eassgn of
(i0exp(*l-val*),i0exp(*r-val*))//assign
//
|I0Eraise of (token, i0exp(*lin-exn*) )
//
|I0El0azy of // nonlin-lazy-eval
( d1exp(*$L0AZY*), i0exp(*non-thunk*) )
|I0El1azy of // linear-lazy-eval
( d1exp(*$LLAZY*)
, i0exp(*lin-thunk*), i0explst(*frees*))
//
(* ****** ****** *)
(* ****** ****** *)
//
|I0Enone0 of ((*0*)) |I0Enone1 of (d3exp)
//
// HX-2023-??-??: end-of-[datatype(i0exp_node)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0exp_fprint
(out:FILR, i0e0:i0exp): void
//
(* ****** ****** *)
//
fun
i0exp_get_lctn(i0exp):( loc_t )
fun
i0exp_get_node(i0exp):i0exp_node
//
(* ****** ****** *)
#symload lctn with i0exp_get_lctn
#symload node with i0exp_get_node
(* ****** ****** *)
fun
i0exp_none0(loc0: loctn): (i0exp)
fun
i0exp_none1(d3e0: d3exp): (i0exp)
(* ****** ****** *)
fun
i0exp_make_node
(loc:loctn, nod:i0exp_node): i0exp
(* ****** ****** *)
#symload i0exp with i0exp_make_node
(* ****** ****** *)
(* ****** ****** *)
//
datatype
i0gua_node =
| I0GUAexp of (i0exp)
| I0GUAmat of (i0exp, i0pat)
//
(* ****** ****** *)
//
datatype
i0cls_node =
| I0CLSgpt of i0gpt
| I0CLScls of (i0gpt, i0exp)
and
i0gpt_node =
| I0GPTpat of (i0pat)
| I0GPTgua of (i0pat, i0gualst)
//
(* ****** ****** *)
//
fun
i0gua_fprint:(FILR,i0gua)->void
fun
i0gpt_fprint:(FILR,i0gpt)->void
fun
i0cls_fprint:(FILR,i0cls)->void
//
(* ****** ****** *)
//
fun
i0gua_get_lctn(i0gua): loc_t
fun
i0gua_get_node(i0gua): i0gua_node
//
#symload lctn with i0gua_get_lctn
#symload node with i0gua_get_node
//
(* ****** ****** *)
//
fun
i0gpt_get_lctn(i0gpt): loc_t
fun
i0gpt_get_node(i0gpt): i0gpt_node
//
#symload lctn with i0gpt_get_lctn
#symload node with i0gpt_get_node
//
(* ****** ****** *)
//
fun
i0cls_get_lctn(i0cls): loc_t
fun
i0cls_get_node(i0cls): i0cls_node
//
#symload lctn with i0cls_get_lctn
#symload node with i0cls_get_node
//
(* ****** ****** *)
//
fun
i0gua_make_node
(loc0:loc_t,node:i0gua_node):i0gua
fun
i0gpt_make_node
(loc0:loc_t,node:i0gpt_node):i0gpt
fun
i0cls_make_node
(loc0:loc_t,node:i0cls_node):i0cls
//
#symload i0gua with i0gua_make_node
#symload i0gpt with i0gpt_make_node
#symload i0cls with i0cls_make_node
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
t0imp_node =
|T0IMPall1 of
(d2cst(*implment*), i0dclist)
|T0IMPallx of
(d2cst(*implment*), i0dclist)
//
(* ****** ****** *)
//
fun
t0imp_fprint
(
  out:FILR, timp:t0imp):(void)
//
(* ****** ****** *)
//
fun
t0imp_get_stmp
(timp: t0imp): stamp
fun
t0imp_get_node
(timp: t0imp): t0imp_node
//
#symload stmp with t0imp_get_stmp
#symload node with t0imp_get_node
//
fun
t0imp_make_node
(stm:stamp,nod:t0imp_node): t0imp
//
#symload t0imp with t0imp_make_node
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
teqi0exp =
|
TEQI0EXPnone of ((*void*))
|
TEQI0EXPsome of (token(*EQ0*), i0exp)
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
i0dcl_node =
//
(* ****** ****** *)
//
|I0Dd3ecl of (d3ecl)
//
(* ****** ****** *)
//
|I0Dextern of
(token(*kind*), i0dcl)
|I0Dstatic of
(token(*kind*), i0dcl)
//
(* ****** ****** *)
//
|I0Dtmpsub of
(s2vts(*tmpsub*), i0dcl)
//
(* ****** ****** *)
//
|I0Dlocal0 of
( i0dclist(*local-head*)
, i0dclist(*local-body*))
//
(* ****** ****** *)
//
|I0Dinclude of
(sint(*s/d*)
,token
,g1exp // src
,fpathopt
,i0dclistopt) // inclusion
//
(* ****** ****** *)
//
|I0Dvaldclst of
(token(*VAL(vlk)*), i0valdclist)
|I0Dvardclst of
(token(*VAR(vlk)*), i0vardclist)
//
(* ****** ****** *)
//
|I0Dfundclst of
(token(*knd*), d2cstlst, i0fundclist)
//
(* ****** ****** *)
//
|I0Dimplmnt0 of
( token(*knd*)
, stamp, dimpl, fiarglst, i0exp(*body*))
//
(* ****** ****** *)
//
|I0Dnone0 of ((*0*)) |I0Dnone1 of (d3ecl)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0dcl_fprint
(out:FILR, dcl0:i0dcl): void
//
(* ****** ****** *)
//
fun
i0dcl_get_lctn(i0dcl):( loc_t )
fun
i0dcl_get_node(i0dcl):i0dcl_node
//
(* ****** ****** *)
#symload lctn with i0dcl_get_lctn
#symload node with i0dcl_get_node
(* ****** ****** *)
fun
i0dcl_none0(loc0: loctn): (i0dcl)
fun
i0dcl_none1(d3e0: d3ecl): (i0dcl)
(* ****** ****** *)
fun
i0dcl_make_node
(loc:loctn, nod:i0dcl_node): i0dcl
(* ****** ****** *)
#symload i0dcl with i0dcl_make_node
(* ****** ****** *)
(* ****** ****** *)
fun
i0valdcl_fprint
(out: FILR, ival: i0valdcl): void
fun
i0vardcl_fprint
(out: FILR, ivar: i0vardcl): void
(* ****** ****** *)
fun
i0fundcl_fprint
(out: FILR, ifun: i0fundcl): void
(* ****** ****** *)
(* ****** ****** *)
fun
i0valdcl_get_lctn:(i0valdcl)->loc_t
fun
i0vardcl_get_lctn:(i0vardcl)->loc_t
fun
i0fundcl_get_lctn:(i0fundcl)->loc_t
(* ****** ****** *)
#symload lctn with i0valdcl_get_lctn
#symload lctn with i0vardcl_get_lctn
#symload lctn with i0fundcl_get_lctn
(* ****** ****** *)
(* ****** ****** *)
fun
i0valdcl_get_dpat:(i0valdcl)->i0pat
fun
i0valdcl_get_tdxp:(i0valdcl)->teqi0exp
(* ****** ****** *)
#symload dpat with i0valdcl_get_dpat
#symload tdxp with i0valdcl_get_tdxp(*opt*)
(* ****** ****** *)
fun
i0vardcl_get_dpid:(i0vardcl)->d2var
fun
i0vardcl_get_dini:(i0vardcl)->teqi0exp
(* ****** ****** *)
#symload dpid with i0vardcl_get_dpid
#symload dini with i0vardcl_get_dini(*opt*)
(* ****** ****** *)
(* ****** ****** *)
fun
i0fundcl_get_dpid:(i0fundcl)->d2var
fun
i0fundcl_get_farg:(i0fundcl)->fiarglst
fun
i0fundcl_get_tdxp:(i0fundcl)->teqi0exp
(* ****** ****** *)
#symload dpid with i0fundcl_get_dpid
#symload farg with i0fundcl_get_farg(*lst*)
#symload tdxp with i0fundcl_get_tdxp(*opt*)
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0valdcl_make_args
( lctn:loc_t
, ipat:i0pat, tdxp:teqi0exp):i0valdcl
fun
i0vardcl_make_args
( lctn:loc_t
, dpid:d2var, dini:teqi0exp):i0vardcl
//
(* ****** ****** *)
//
fun
i0fundcl_make_args
( lctn:loc_t
, dpid:d2var
, farg:fiarglst, tdxp:teqi0exp):i0fundcl
//
(* ****** ****** *)
//
#symload i0valdcl with i0valdcl_make_args
#symload i0vardcl with i0vardcl_make_args
#symload i0fundcl with i0fundcl_make_args
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0parsed_fprint
(out:FILR, ipar:i0parsed): void
//
(* ****** ****** *)
//
fun
i0parsed_get_stadyn:(i0parsed)->sint
fun
i0parsed_get_nerror:(i0parsed)->sint
//
fun
i0parsed_get_source:(i0parsed)->lcsrc
//
fun
i0parsed_get_parsed:(i0parsed)->i0dclistopt
//
(* ****** ****** *)
//
#symload stadyn with i0parsed_get_stadyn
#symload nerror with i0parsed_get_nerror
#symload source with i0parsed_get_source
#symload parsed with i0parsed_get_parsed
//
(* ****** ****** *)
//
fun
i0parsed_make_args
( stadyn:sint
, nerror:sint
, source:lcsrc
, parsed:i0dclistopt): i0parsed//end-fun
//
#symload i0parsed with i0parsed_make_args
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_SATS_intrep0.sats] *)
(***********************************************************************)
