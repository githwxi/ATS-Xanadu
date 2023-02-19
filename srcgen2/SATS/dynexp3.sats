(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
Tue 14 Feb 2023 12:30:09 PM EST
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
#staload
D2E = "./dynexp2.sats"
(* ****** ****** *)
#typedef s2cst = $S2E.s2cst
#typedef s2var = $S2E.s2var
(* ****** ****** *)
#typedef s2exp = $S2E.s2exp
#typedef s2typ = $S2E.s2typ
(* ****** ****** *)
#typedef s2qag = $D2E.s2qag
#typedef t2qag = $D2E.t2qag
#typedef t2iag = $D2E.t2iag
(* ****** ****** *)
#typedef d2var = $D2E.d2var
#typedef d2con = $D2E.d2con
#typedef d2cst = $D2E.d2cst
(* ****** ****** *)
#typedef d2pat = $D2E.d2pat
#typedef d2exp = $D2E.d2exp
(* ****** ****** *)
#typedef d2ecl = $D2E.d2ecl
(* ****** ****** *)
#typedef s2res = $D2E.s2res
(* ****** ****** *)
#typedef simpl = $D2E.simpl
#typedef dimpl = $D2E.dimpl
(* ****** ****** *)
#abstbox d3pat_tbox // ptr
#typedef d3pat = d3pat_tbox
(* ****** ****** *)
#abstbox d3exp_tbox // ptr
#typedef d3exp = d3exp_tbox
(* ****** ****** *)
#abstbox f3arg_tbox // ptr
#typedef f3arg = f3arg_tbox
(* ****** ****** *)
#abstbox d3ecl_tbox // ptr
#typedef d3ecl = d3ecl_tbox
(* ****** ****** *)
//
#abstbox d3valdcl_tbox // ptr
#abstbox d3vardcl_tbox // ptr
#abstbox d3fundcl_tbox // ptr
#abstbox i3mpldcl_tbox // ptr
#abstbox d3cstdcl_tbox // ptr
//
(* ****** ****** *)
#typedef s2varlst = list(s2var)
(* ****** ****** *)
#typedef s2explst = list(s2exp)
(* ****** ****** *)
#typedef s2qaglst = list(s2qag)
#typedef t2qaglst = list(t2qag)
#typedef t2iaglst = list(t2iag)
(* ****** ****** *)
#typedef d3patlst = list(d3pat)
#typedef d3patopt = optn(d3pat)
(* ****** ****** *)
#typedef d3explst = list(d3exp)
#typedef d3expopt = optn(d3exp)
(* ****** ****** *)
#typedef f3arglst = list(f3arg)
(* ****** ****** *)
#typedef d3eclist = list(d3ecl)
(* ****** ****** *)
#typedef d3valdcl = d3valdcl_tbox
#typedef d3vardcl = d3vardcl_tbox
#typedef d3fundcl = d3fundcl_tbox
#typedef i3mpldcl = i3mpldcl_tbox
#typedef d3cstdcl = d3cstdcl_tbox
(* ****** ****** *)
#typedef d3valdclist = list(d3valdcl)
#typedef d3vardclist = list(d3vardcl)
#typedef d3fundclist = list(d3fundcl)
#typedef i3mpldclist = list(i3mpldcl)
#typedef d3cstdclist = list(d3cstdcl)
(* ****** ****** *)
#typedef d3explstopt = optn(d3explst)
#typedef d3eclistopt = optn(d3eclist)
(* ****** ****** *)
//
datatype
d3lab(x0:type) =
|
D3LAB of
(label, x0(*elt*))
//
fun
<x0:t0>
d3lab_get_itm
(dlab: d3lab(x0)): x0
#symload
itm with d3lab_get_itm
//
(* ****** ****** *)
#typedef
d2lab(x0:t0)=$D2E.d2lab(x0)
(* ****** ****** *)
//
fun
<x0:type>
d3lab_fprint
(out: FILR, lab: d3lab(x0)): void
//
(* ****** ****** *)
#typedef l3d3p = d3lab(d3pat)
#typedef l3d3e = d3lab(d3exp)
(* ****** ****** *)
#typedef l3d3plst = list(l3d3p)
#typedef l3d3elst = list(l3d3e)
(* ****** ****** *)
//
datatype
d3pat_node =
//
|D3Pvar of d2var
//
|D3Pint of token
|D3Pbtf of sym_t
|D3Pchr of token
|D3Pflt of token
|D3Pstr of token
//
|D3Pcon of (d2con)
//
|D3Psapp of
 (d3pat, s2varlst(*sarg*))
//
|
D3Pdapp of
( d3pat
, sint(*npf*), d3patlst(*darg*)
) (* D3Pdapp *)
//
|
D3Perrck of (sint(*lvl*),d3pat)//tread23-error
//
// HX-2023-??-??: end-of-[datatype(d3pat_node)]
//
(* ****** ****** *)
fun
d3pat_fprint:(FILR,d3pat)->void
(* ****** ****** *)
fun
d3pat_get_lctn(d3pat): loc_t
fun
d3pat_get_node(d3pat): d3pat_node
(* ****** ****** *)
#symload lctn with d3pat_get_lctn
#symload node with d3pat_get_node
(* ****** ****** *)
//
fun
d3pat_get_styp:(d3pat)->s2typ
fun
d3pat_set_styp
(d3p0: d3pat, t2p0: s2typ): void
//
#symload styp with d3pat_get_styp
#symload styp with d3pat_set_styp
//
(* ****** ****** *)
//
datatype
d3exp_node =
//
|D3Eint of token
|D3Ebtf of sym_t
|D3Echr of token
|D3Eflt of token
|D3Estr of token
//
|D3Ei00 of (sint) // sint
|D3Eb00 of (bool) // bool
|D3Ec00 of (char) // char
|D3Ef00 of (char) // float
|D3Es00 of (strn) // string
//
|D3Etop of (token)
//
|D3Evar of (d2var)
//
|D3Econ of (d2con)
|D3Ecst of (d2cst)
//
|D3Esapp of (d3exp, s2explst)
|D3Etapp of (d3exp, s2explst)
//
|
D3Eerrck of (sint(*lvl*),d3exp)//tread23-error
//
// HX-2023-??-??: end-of-[datatype(d3exp_node)]
//
(* ****** ****** *)
fun
d3exp_fprint:(FILR,d3exp)->void
(* ****** ****** *)
fun
d3exp_get_lctn(d3exp): loc_t
fun
d3exp_get_node(d3exp): d3exp_node
(* ****** ****** *)
#symload lctn with d3exp_get_lctn
#symload node with d3exp_get_node
(* ****** ****** *)
//
fun
d3exp_get_styp:(d3exp)->s2typ
fun
d3exp_set_styp
(d3p0: d3exp, t2p0: s2typ): void
//
#symload styp with d3exp_get_styp
#symload styp with d3exp_set_styp
//
(* ****** ****** *)
//
datatype
d3ecl_node =
//
|D3Cd2ecl of (d2ecl)
//
|D3Cstatic of
 (token(*STATIC*), d3ecl)
|D3Cextern of
 (token(*EXTERN*), d3ecl)
//
|D3Clocal0 of
 ( d3eclist(*local-head*)
 , d3eclist(*local-body*))
//
|
D3Cvaldclst of
(token(*VAL(vlk)*),d3valdclist )
|
D3Cvardclst of
(token(*VAR(vrk)*), d3vardclist)
|
D3Cfundclst of
(token(*FUN(fnk)*), t2qaglst, d3fundclist)
//
|
D3Cimplmnt0 of
( token(*impkind*)
, s2qaglst // s2vs
, t2qaglst // s2vs+t2is
, dimpl, t2iaglst, f3arglst, s2res, d3exp)
//
|
D3Cerrck of (sint(*lvl*), d3ecl)//tread23-error
//
//HX-2023-??-??: end-of-[datatype( d3ecl_node )]
//
(* ****** ****** *)
fun
d3ecl_fprint:(FILR,d3ecl)->void
(* ****** ****** *)
fun
d3ecl_get_lctn(d3ecl): loc_t
fun
d3ecl_get_node(d3ecl): d3ecl_node
(* ****** ****** *)
#symload lctn with d3ecl_get_lctn
#symload node with d3ecl_get_node
(* ****** ****** *)
fun
d3valdcl_fprint
(out: FILR, dval: d3valdcl): void
fun
d3vardcl_fprint
(out: FILR, dvar: d3vardcl): void
(* ****** ****** *)
fun
d3fundcl_fprint
(out: FILR, dfun: d3fundcl): void
(* ****** ****** *)
fun
d3cstdcl_fprint
(out: FILR, dcst: d3cstdcl): void
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_dynexp3.sats] *)