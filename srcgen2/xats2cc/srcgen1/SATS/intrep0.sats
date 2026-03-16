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
"./../../../SATS/lexing0.sats"
//
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
#typedef sort0 = $S2E.sort0
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
#typedef t2jag = $D2E.t2jag
(* ****** ****** *)
#typedef d3pat = $D3E.d3pat
#typedef d3exp = $D3E.d3exp
(* ****** ****** *)
#typedef l3d3p = $D3E.l3d3p
#typedef l3d3e = $D3E.l3d3e
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
#typedef t2jaglst = list(t2jag)
(* ****** ****** *)
#typedef d3patlst = list(d3pat)
#typedef l3d3plst = list(l3d3p)
(* ****** ****** *)
#typedef d3explst = list(d3exp)
#typedef d3expopt = optn(d3exp)
#typedef l3d3elst = list(l3d3e)
(* ****** ****** *)
#typedef d3gualst = list(d3gua)
#typedef d3clslst = list(d3cls)
(* ****** ****** *)
#typedef d3eclist = list(d3ecl)
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
#abstbox i0exp_tbox // p0tr
#typedef i0exp = i0exp_tbox
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
#abstbox fiarg_tbox // p0tr
#typedef fiarg = fiarg_tbox
(* ****** ****** *)
(* ****** ****** *)
//
#typedef l0i0t = i0lab(i0typ)
#typedef l0i0p = i0lab(i0pat)
#typedef l0i0e = i0lab(i0exp)
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox i0valdcl_tbox//p0tr
#abstbox i0vardcl_tbox//p0tr
#abstbox i0fundcl_tbox//p0tr
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
#typedef i0expopt = optn(i0exp)
#typedef i0explst = list(i0exp)
#typedef l0i0elst = list(l0i0e)
(* ****** ****** *)
#typedef i0gualst = list(i0gua)
#typedef i0clslst = list(i0cls)
(* ****** ****** *)
#typedef i0dclopt = optn(i0dcl)
#typedef i0dclist = list(i0dcl)
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox i0parsed_tbox//p0tr
//
(* ****** ****** *)
(* ****** ****** *)
#typedef i0parsed = i0parsed_tbox
(* ****** ****** *)
#typedef i0valdcl = i0valdcl_tbox
#typedef i0vardcl = i0vardcl_tbox
#typedef i0fundcl = i0fundcl_tbox
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
|I0Tlft of (i0typ) // left-value
//
(* ****** ****** *)
//
|I0Ttop0 of (i0typ) // uninitized
|I0Ttop1 of (i0typ) // delineared
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
//
|I0Terrck of (int(*lvl*), i0typ)//HX:tread-error
//
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
(* ****** ****** *)
//
fun
i0typ_fprint
(ityp: i0typ, out0: FILR): void
#symload fprint with i0typ_fprint
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
|I0Evar of d2var
(* ****** ****** *)
//
|I0Econ of d2con
|I0Ecst of d2cst
//
(* ****** ****** *)
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
i0exp_make_ityp$node
( loc0: loctn
, ityp: i0typ
, node: i0exp_node): i0exp
#symload
 i0exp with i0exp_make_ityp$node
//
(* ****** ****** *)
//
fun
i0exp_fprint
(iexp:i0exp, out0:FILR): void
#symload fprint with i0exp_fprint
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
i0dcl_node =
//
|I0Dd3ecl of (d3ecl)
//
|I0Dstatic of
(token(*STATIC*), i0dcl)
|I0Dextern of
(token(*EXTERN*), i0dcl)
//
(* ****** ****** *)
//
|I0Dnone0 of ((*0*)) |I0Dnone1 of (d3ecl)
//
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
i0dcl_make_node
(loc0
:loctn, node:i0dcl_node): i0dcl
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
fun
i0fundcl_fprint
(ifun: i0fundcl, out0: FILR): void
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
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_SATS_intrep0.sats] *)
(***********************************************************************)
