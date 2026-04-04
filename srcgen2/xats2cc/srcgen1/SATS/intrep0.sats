(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
Sat Mar  7 09:24:25 AM EST 2026
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2026-03-12:
Thu Mar 12 02:43:33 PM EDT 2026
In INTREP0, the following issues
are addressed:
1. Tail-recursive call marking
2. Closure-formation preparation
*)
(* ****** ****** *)
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
#staload
"./../../../SATS/locinfo.sats"
#staload
"./../../../SATS/filpath.sats"
#staload
"./../../../SATS/lexing0.sats"
//
(* ****** ****** *)
#staload S1E =
"./../../../SATS/staexp1.sats"
#staload D1E =
"./../../../SATS/dynexp1.sats"
(* ****** ****** *)
#staload S2E =
"./../../../SATS/staexp2.sats"
#staload T2P =
"./../../../SATS/statyp2.sats"
#staload D2E =
"./../../../SATS/dynexp2.sats"
#staload D3E =
"./../../../SATS/dynexp3.sats"
(* ****** ****** *)
(* ****** ****** *)
#typedef loc_t = loc_t
#typedef loctn = loctn
(* ****** ****** *)
(* ****** ****** *)
#typedef g1nam = $S1E.g1nam
#typedef g1exp = $S1E.g1exp
(* ****** ****** *)
#typedef s1exp = $S1E.s1exp
(* ****** ****** *)
#typedef d1exp = $D1E.d1exp
(* ****** ****** *)
#typedef sort2 = $S2E.sort2
#typedef s2cst = $S2E.s2cst
#typedef s2var = $S2E.s2var
#typedef s2exp = $S2E.s2exp
#typedef s2typ = $T2P.s2typ
(* ****** ****** *)
#typedef d2var = $D2E.d2var
(* ****** ****** *)
#typedef d2con = $D2E.d2con
#typedef d2cst = $D2E.d2cst
(* ****** ****** *)
//
(*
#typedef s2qag = $D2E.s2qag
*)
#typedef t2qag = $D2E.t2qag
#typedef t2iag = $D2E.t2iag
#typedef t2jag = $D2E.t2jag
//
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
#typedef d3ecl = $D3E.d3ecl
(* ****** ****** *)
#typedef s2cstlst = list(s2cst)
#typedef s2varlst = list(s2var)
#typedef s2explst = list(s2exp)
#typedef s2typlst = list(s2typ)
(* ****** ****** *)
#typedef d2varlst = list(d2var)
(* ****** ****** *)
#typedef d2conlst = list(d2con)
#typedef d2cstlst = list(d2cst)
(* ****** ****** *)
(*
#typedef s2qaglst = list(s2qag)
*)
#typedef t2qaglst = list(t2qag)
#typedef t2iaglst = list(t2iag)
#typedef t2jaglst = list(t2jag)
(* ****** ****** *)
#typedef d3patlst = list(d3pat)
#typedef l3d3plst = list(l3d3p)
(* ****** ****** *)
#typedef d3explst = list(d3exp)
#typedef d3expopt = optn(d3exp)
#typedef l3d3elst = list(l3d3e)
(* ****** ****** *)
#typedef f3arglst = list(f3arg)
(* ****** ****** *)
#typedef d3gualst = list(d3gua)
#typedef d3clslst = list(d3cls)
(* ****** ****** *)
#typedef d3eclist = list(d3ecl)
(* ****** ****** *)
#typedef teqd3exp = $D3E.teqd3exp
(* ****** ****** *)
#typedef d3valdcl = $D3E.d3valdcl
#typedef d3vardcl = $D3E.d3vardcl
#typedef d3fundcl = $D3E.d3fundcl
(* ****** ****** *)
#typedef d3parsed = $D3E.d3parsed
(* ****** ****** *)
#typedef d3valdclist = list(d3valdcl)
#typedef d3vardclist = list(d3vardcl)
#typedef d3fundclist = list(d3fundcl)
(* ****** ****** *)
#typedef d3explstopt = optn(d3explst)
#typedef d3eclistopt = optn(d3eclist)
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
(lab
:i0lab(x0), out:FILR): void
//
(* ****** ****** *)
(* ****** ****** *)
#abstbox i0typ_tbox // p0tr
#typedef i0typ = i0typ_tbox
(* ****** ****** *)
#abstbox i0jag_tbox // p0tr
#typedef i0jag = i0jag_tbox
(* ****** ****** *)
(* ****** ****** *)
#abstbox i0pat_tbox // p0tr
#typedef i0pat = i0pat_tbox
(* ****** ****** *)
#abstbox i0var_tbox // p0tr
#abstbox i0exp_tbox // p0tr
#typedef i0var = i0var_tbox
#typedef i0exp = i0exp_tbox
(* ****** ****** *)
#abstbox fiarg_tbox // p0tr
#typedef fiarg = fiarg_tbox
(* ****** ****** *)
#abstbox i0gua_tbox // p0tr
#abstbox i0gpt_tbox // p0tr
#abstbox i0cls_tbox // p0tr
#typedef i0gua = i0gua_tbox
#typedef i0gpt = i0gpt_tbox
#typedef i0cls = i0cls_tbox
(* ****** ****** *)
#abstbox i0dcl_tbox // p0tr
#typedef i0dcl = i0dcl_tbox
(* ****** ****** *)
#abstbox t0imp_tbox // p0tr
#typedef t0imp = t0imp_tbox
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox i0parsed_tbox//p0tr
//
(* ****** ****** *)
//
(*
HX-2026-03-28:
For funsets of i0var
*)
#abstbox i0varfst_tbox//p0tr
//
(* ****** ****** *)
//
#abstbox i0valdcl_tbox//p0tr
#abstbox i0vardcl_tbox//p0tr
#abstbox i0fundcl_tbox//p0tr
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef l0i0t = i0lab(i0typ)
#typedef l0i0p = i0lab(i0pat)
#typedef l0i0e = i0lab(i0exp)
//
(* ****** ****** *)
(* ****** ****** *)
#typedef i0typlst = list(i0typ)
#typedef l0i0tlst = list(l0i0t)
(* ****** ****** *)
#typedef i0jaglst = list(i0jag)
(* ****** ****** *)
#typedef i0patlst = list(i0pat)
#typedef l0i0plst = list(l0i0p)
(* ****** ****** *)
#typedef i0varlst = list(i0var)
(* ****** ****** *)
#typedef i0expopt = optn(i0exp)
#typedef i0explst = list(i0exp)
#typedef l0i0elst = list(l0i0e)
(* ****** ****** *)
#typedef fiarglst = list(fiarg)
(* ****** ****** *)
#typedef i0gualst = list(i0gua)
#typedef i0clslst = list(i0cls)
(* ****** ****** *)
#typedef i0dclopt = optn(i0dcl)
#typedef i0dclist = list(i0dcl)
(* ****** ****** *)
(* ****** ****** *)
#typedef i0parsed = i0parsed_tbox
(* ****** ****** *)
(*
HX: fst: functional set
*)
#typedef i0varfst = i0varfst_tbox
(* ****** ****** *)
#typedef i0valdcl = i0valdcl_tbox
#typedef i0vardcl = i0vardcl_tbox
#typedef i0fundcl = i0fundcl_tbox
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
i0typ_node =
(* ****** ****** *)
//
(*
|I0Tbas of sym_t // type
*)
//
|I0Tcst of s2cst // constant
|I0Tvar of s2var // variable
//
(* ****** ****** *)
//
|I0Tlft of (i0typ)//left-value
//
(* ****** ****** *)
//
|
I0Ttop0 of (i0typ)//uninitized
|
I0Ttop1 of (i0typ)//delineared
//
(* ****** ****** *)
//
|I0Tapps of
(i0typ(*fun*), i0typlst)//inst.
|I0Tlam1 of
(s2varlst(*arg*), i0typ)//abst.
//
(* ****** ****** *)
//
|I0Ttext of // external
(string(*name*), i0typlst(*arg*))
//
(* ****** ****** *)
//
|I0Texi0 of // exists quantifier
(s2varlst(*vars*), i0typ(*body*))
|I0Tuni0 of // forall quantifier
(s2varlst(*vars*), i0typ(*body*))
//
(* ****** ****** *)
//
|I0Ttcon of (d2con, i0typlst)
|I0Ttrcd of
(trcdknd(*knd*), sint(*npf*), l0i0tlst)
//
(* ****** ****** *)
|I0Tnone0 of ((*0*)) | I0Tnone1 of (s2typ)
(* ****** ****** *)
(*
|I0Terrck of (int(*lvl*), i0typ)//HX:tread-error
*)
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0typ_sort$get
(ityp: i0typ): sort2
fun
i0typ_node$get
(ityp: i0typ): i0typ_node
//
#symload sort with i0typ_sort$get
#symload node with i0typ_node$get
//
(* ****** ****** *)
//
fun
i0typ_fprint
(ityp: i0typ, out0: FILR): void
#symload fprint with i0typ_fprint
//
(* ****** ****** *)
//
(*
fun
i0typ_none0((*void*)): i0typ
*)
fun
i0typ_none1(t2p0: s2typ): i0typ
//
fun
i0typ_make_node
(s2t0
:sort2, node:i0typ_node): i0typ
#symload i0typ with i0typ_make_node
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0jag_lctn$get:(i0jag)->loc_t
fun
i0jag_i0ts$get:(i0jag)->i0typlst
//
#symload lctn with i0jag_lctn$get
#symload i0ts with i0jag_i0ts$get
//
fun
i0jag_fprint
(ijag: i0jag, out0: FILR): void
#symload fprint with i0jag_fprint
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
i0pat_node =
(* ****** ****** *)
//
|I0Pany of ()
|I0Pvar of d2var
//
(* ****** ****** *)
|I0Pint of token
|I0Pbtf of sym_t
|I0Pchr of token
|I0Pflt of token
|I0Pstr of token
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
|I0Ptapq of
( i0pat, i0jaglst )
(* ****** ****** *)
//
|I0Pdap1 of (i0pat)
|I0Pdapp of
( i0pat//fun
, sint(*npf1*)
, i0patlst(*arglst*))
//
(* ****** ****** *)
//
|I0Prfpt of
( i0pat, i0pat(*rfdpt*))
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
(*
|I0Perrck of (int(*lvl*), i0pat)//HX:tread-error
*)
(* ****** ****** *)
//
fun
i0pat_lctn$get
(ipat: i0pat): loc_t
fun
i0pat_ityp$get
(ipat: i0pat): i0typ
fun
i0pat_node$get
(ipat: i0pat): i0pat_node
//
#symload lctn with i0pat_lctn$get
#symload ityp with i0pat_ityp$get
#symload node with i0pat_node$get
//
(* ****** ****** *)
//
fun
i0pat_make_ityp$node
( loc0: loctn
, ityp: i0typ
, node: i0pat_node): i0pat
#symload
 i0pat with i0pat_make_ityp$node
//
(* ****** ****** *)
//
fun
i0pat_fprint
(ipat:i0pat, out0:FILR): void
#symload fprint with i0pat_fprint
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-04-02:
BVK:
bound variable kind!
*)
#define I0BVKtop 0
(*
#define I0BVKarg 1
*)
#define I0BVKlam 1
#define I0BVKlet 2
#define I0BVKfix 3
#define I0BVKerr -1
//
(* ****** ****** *)
//
datatype
i0exp_node =
//
(* ****** ****** *)
//
|I0Eint of token
|I0Ebtf of sym_t
|I0Echr of token
|I0Eflt of token
|I0Estr of token
//
(* ****** ****** *)
|I0Etop of symbl
(* ****** ****** *)
|I0Evar of i0var
(* ****** ****** *)
//
|I0Econ of d2con
|I0Ecst of d2cst
//
(* ****** ****** *)
//
|I0Esapp of
(i0exp(*fun*), s2explst)
|I0Esapq of
(i0exp(*fun*), i0typlst)
//
(* ****** ****** *)
//
|I0Etapp of
(i0exp(*fun*), s2explst)
|I0Etapq of
(i0exp(*fun*), i0jaglst)
//
(* ****** ****** *)
//
|I0Edap0 of
(i0exp(*fun*))//HX:nullary?
|I0Edapp of
(i0exp,sint(*npf*),i0explst)
//
(* ****** ****** *)
//
|I0Epcon of
(token, label, i0exp(*con*))
|I0Eproj of
(token, label, i0exp(*tup*))
//
(* ****** ****** *)
//
|I0Elet0 of (i0dclist, i0exp)
//
(* ****** ****** *)
//
|I0Eift0 of
(i0exp(*test*)
,i0expopt(*th*), i0expopt(*el*))
//
(* ****** ****** *)
//
|I0Eseqn of
(i0explst(*init*), i0exp(*last*))
//
(* ****** ****** *)
//
|I0Etup0 of
(sint(*npf*),i0explst) // HX:flat
|I0Etup1 of
(
token(*knd*),sint(*npf*),i0explst)
|I0Ercd2 of
(
token(*knd*),sint(*npf*),l0i0elst)
//
(* ****** ****** *)
//
|I0Elam0 of
(sint(*lvl*)
,token(*knd*)
,fiarglst(*arg*), i0exp, i0varfst)
|I0Efix0 of
(sint(*lvl*)
,token(*knd*)
,d2var(*fid*)
,fiarglst(*arg*), i0exp, i0varfst)
//
(* ****** ****** *)
//
|I0Edp2tr of (i0exp)//p2tr-dereference
|I0Edl0az of (i0exp)//l0azy-eval-thunk
|I0Edl1az of (i0exp)//l1azy-eval-thunk
//
(* ****** ****** *)
//
|I0Ewhere of
(i0exp(*scope*), i0dclist)//end-in-let
//
(* ****** ****** *)
//
|I0Eannot of
(i0exp, s1exp(*given*), s2exp(*trans*))
//
(* ****** ****** *)
//
|I0Elabck of (i0exp, label)//HX: casting
//
|I0Et2pck of (i0exp, s2typ)//HX: casting
|I0Et2ped of (i0exp, s2typ)//HX: checked
//
(* ****** ****** *)
|I0Enone0 of ((*0*)) | I0Enone1 of (d3exp)
(* ****** ****** *)
(*
|I0Eerrck of (int(*lvl*), i0exp)//HX:tread-error
*)
(* ****** ****** *)
//
fun
i0var_lamq
(ivar: i0var): bool
fun
i0var_letq
(ivar: i0var): bool
fun
i0var_fixq
(ivar: i0var): bool
//
fun
i0var_lvl0$get
(ivar: i0var): sint
fun
i0var_bvk0$get
(ivar: i0var): sint
fun
i0var_dvar$get
(ivar: i0var): d2var
fun
i0var_ityp$get
(ivar: i0var): i0typ
//
#symload dvar with i0var_dvar$get
#symload lvl0 with i0var_lvl0$get
#symload bvk0 with i0var_bvk0$get
#symload ityp with i0var_ityp$get
//
(* ****** ****** *)
//
fun
i0exp_lctn$get
(iexp: i0exp): loc_t
fun
i0exp_ityp$get
(iexp: i0exp): i0typ
fun
i0exp_node$get
(iexp: i0exp): i0exp_node
//
#symload lctn with i0exp_lctn$get
#symload ityp with i0exp_ityp$get
#symload node with i0exp_node$get
//
(* ****** ****** *)
//
fun
i0var_none1
(d2v0: d2var): i0var
fun
i0exp_none1
(d3e0: d3exp): i0exp
//
fun
i0var_make_dvar$info
( dvar: d2var
, lvl0: ( sint )
, bvk0: ( sint )
, ityp: ( i0typ ) ): i0var
fun
i0exp_make_ityp$node
( loc0: loctn
, ityp: ( i0typ )
, node: i0exp_node): i0exp
//
#symload
 i0var with i0var_make_dvar$info
#symload
 i0exp with i0exp_make_ityp$node
//
(* ****** ****** *)
//
fun
i0var_fprint
(ivar:i0var, out0:FILR): void
fun
i0exp_fprint
(iexp:i0exp, out0:FILR): void
//
#symload fprint with i0var_fprint
#symload fprint with i0exp_fprint
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
fiarg_node =
|FIARGsapp of
(s2varlst(*s2vs*)
,s2explst(*s2ps*))
|FIARGmets of
(s2explst(*mets*))
|FIARGdapp of
(sint(*npf*), i0patlst)
//
#typedef
fiarglst = list( fiarg )
#typedef
fiarglstopt = optn(fiarglst)
//
(* ****** ****** *)
//
fun
fiarg_make_node
( loc0: loc_t,
  node: fiarg_node): fiarg
#symload
  fiarg with fiarg_make_node
//
(* ****** ****** *)
//
fun
fiarg_fprint
(fia0:fiarg,out0:FILR): void
#symload fprint with fiarg_fprint
//
(* ****** ****** *)
//
fun
fiarg_lctn$get(fiarg): loc_t
fun
fiarg_node$get(fiarg): fiarg_node
//
#symload lctn with fiarg_lctn$get
#symload node with fiarg_node$get
//
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
i0gua_make_node
( loc0: loc_t,
  node: i0gua_node): i0gua
#symload
  i0gua with i0gua_make_node
fun
i0gpt_make_node
( loc0: loc_t,
  node: i0gpt_node): i0gpt
#symload
  i0gpt with i0gpt_make_node
fun
i0cls_make_node
( loc0: loc_t,
  node: i0cls_node): i0cls
#symload
  i0cls with i0cls_make_node
//
(* ****** ****** *)
//
fun
i0gua_fprint:(i0gua,FILR)->void
fun
i0gpt_fprint:(i0gpt,FILR)->void
fun
i0cls_fprint:(i0cls,FILR)->void
//
(* ****** ****** *)
//
fun
i0gua_lctn$get(i0gua): loc_t
fun
i0gua_node$get(i0gua): i0gua_node
//
#symload lctn with i0gua_lctn$get
#symload node with i0gua_node$get
//
(* ****** ****** *)
//
fun
i0gpt_lctn$get(i0gpt): loc_t
fun
i0gpt_node$get(i0gpt): i0gpt_node
//
#symload lctn with i0gpt_lctn$get
#symload node with i0gpt_node$get
//
(* ****** ****** *)
//
fun
i0cls_lctn$get(i0cls): loc_t
fun
i0cls_node$get(i0cls): i0cls_node
//
#symload lctn with i0cls_lctn$get
#symload node with i0cls_node$get
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
(* ****** ****** *)
//
|I0Dd3ecl of (d3ecl)
//
(* ****** ****** *)
|I0Dstatic of
(token(*STATIC*), i0dcl)
|I0Dextern of
(token(*EXTERN*), i0dcl)
(* ****** ****** *)
//
|I0Ddclst0 of (i0dclist)
|I0Dlocal0 of
( i0dclist(*local-head*)
, i0dclist(*local-body*))
//
(* ****** ****** *)
//
|
I0Dinclude of
(sint(*s/d*)
,token(*knd*)
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
(token(*FUN(fnk)*)
,t2qaglst, d2cstlst, i0fundclist)
//
(* ****** ****** *)
//
|I0Dimplmnt0 of
(
token(*knd*), sint(*lvl0*),
stamp, dimpl, fiarglst, i0exp, i0varlst)
//
(* ****** ****** *)
//
|I0Dnone0 of ((*0*)) |I0Dnone1 of ( d3ecl )
//
(* ****** ****** *)
(*
|I0Derrck of (int(*lvl*), i0dcl)//HX:tread-error
*)
(* ****** ****** *)
//
fun
i0dcl_lctn$get
(idcl: i0dcl): loc_t
fun
i0dcl_node$get
(idcl: i0dcl): i0dcl_node
//
#symload lctn with i0dcl_lctn$get
#symload node with i0dcl_node$get
//
(* ****** ****** *)
//
fun
i0dcl_fprint
(idcl:i0dcl, out0:FILR): void
#symload fprint with i0dcl_fprint
//
(* ****** ****** *)
//
fun
i0dcl_none0(loc0: loctn): (i0dcl)
fun
i0dcl_none1(d3e0: d3ecl): (i0dcl)
//
fun
i0dcl_make_node(
loc0:loctn, node:i0dcl_node): i0dcl
#symload i0dcl with i0dcl_make_node
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0valdcl_fprint
(ival: i0valdcl, out0: FILR): void
fun
i0vardcl_fprint
(ivar: i0vardcl, out0: FILR): void
//
(* ****** ****** *)
fun
i0valdcl_lctn$get:(i0valdcl)->loc_t
fun
i0vardcl_lctn$get:(i0vardcl)->loc_t
(* ****** ****** *)
#symload lctn with i0valdcl_lctn$get
#symload lctn with i0vardcl_lctn$get
(* ****** ****** *)
(* ****** ****** *)
fun
i0valdcl_ipat$get:(i0valdcl)->i0pat
fun
i0valdcl_tdxp$get:(i0valdcl)->teqi0exp
(* ****** ****** *)
fun
i0vardcl_dpid$get:(i0vardcl)->d2var
fun
i0vardcl_dini$get:(i0vardcl)->teqi0exp
(* ****** ****** *)
//
fun
i0valdcl_make_args
(lctn:loc_t
,ipat:i0pat, tdxp:teqi0exp):i0valdcl
fun
i0vardcl_make_args
(lctn:loc_t
,dpid:d2var, dini:teqi0exp):i0vardcl
//
(* ****** ****** *)
//
#symload ipat with i0valdcl_ipat$get
#symload tdxp with i0valdcl_tdxp$get(*opt*)
#symload dpid with i0vardcl_dpid$get
#symload dini with i0vardcl_dini$get(*opt*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0fundcl_fprint
(ifun: i0fundcl, out0: FILR): void
//
(* ****** ****** *)
fun
i0fundcl_lctn$get:(i0fundcl)->loc_t
(* ****** ****** *)
//
fun
i0fundcl_lvl0$get:(i0fundcl)->(sint)
fun
i0fundcl_dpid$get:(i0fundcl)->(d2var)
fun
i0fundcl_farg$get:(i0fundcl)->fiarglst
fun
i0fundcl_tdxp$get:(i0fundcl)->teqi0exp
fun
i0fundcl_i0vs$get:(i0fundcl)->i0varlst
//
(* ****** ****** *)
//
fun
i0fundcl_make_args
(lctn:loc_t
,lvl0:(sint)
,dpid:(d2var)
,farg:fiarglst
,tdxp:teqi0exp, i0vs:i0varlst):i0fundcl
//
(* ****** ****** *)
//
#symload dpid with i0fundcl_dpid$get
#symload farg with i0fundcl_farg$get(*lst*)
#symload tdxp with i0fundcl_tdxp$get(*opt*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0parsed_fprint
(ipar: i0parsed, out0: FILR): void
//
(* ****** ****** *)
//
fun
i0parsed_stadyn$get:(i0parsed)->sint
fun
i0parsed_nerror$get:(i0parsed)->sint
//
fun
i0parsed_source$get:(i0parsed)->lcsrc
//
fun
i0parsed_parsed$get:(i0parsed)->i0dclistopt
//
(* ****** ****** *)
//
#symload stadyn with i0parsed_stadyn$get
#symload nerror with i0parsed_nerror$get
#symload source with i0parsed_source$get
#symload parsed with i0parsed_parsed$get
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
(*
HX-2026-04-02:
Some fset operations
Thu Apr  2 12:07:41 PM EDT 2026
*)
//
fun
i0varfst_mknil
( (* void *) ): i0varfst
fun
i0varfst_mklst
(i0vs: i0varlst): i0varfst
//
fun
i0varfst_membrq
(i0vs: i0varlst, ivar: i0var): bool
//
fun
i0varfst_fprint
(ivst:i0varfst, out0:FILR): void
fun
i0varfst_strmize
( fst0: i0varfst ): strm_vt( i0var )
//
fun
i0varfst_addvar
( fst0: i0varfst, ivar: i0var): i0varfst
fun
i0varfst_addset
( fst1: i0varfst, fst2: i0varfst): i0varfst
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_SATS_intrep0.sats] *)
(***********************************************************************)
