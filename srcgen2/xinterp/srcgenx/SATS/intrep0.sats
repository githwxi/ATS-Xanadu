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
//
Fri Nov 24 03:22:05 EST 2023
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
//
(*
HX-2023-11-24:
level-0 intermediate representation
*)
//
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
"./../../../SATS/locinfo.sats"
//
(* ****** ****** *)
//
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
(* ****** ****** *)
#staload D3E =
"./../../../SATS/dynexp3.sats"
(* ****** ****** *)
(* ****** ****** *)
#typedef stamp = stamp
#typedef sym_t = sym_t
#typedef label = label
#typedef loctn = loctn
#typedef loc_t = loctn
(* ****** ****** *)
#typedef s2exp = $S2E.s2exp
#typedef s2typ = $S2E.s2typ
(* ****** ****** *)
#typedef d2con = $D2E.d2con
#typedef d2cst = $D2E.d2cst
#typedef d2var = $D2E.d2var
#typedef d2pat = $D2E.d2pat
#typedef d2exp = $D2E.d2exp
(* ****** ****** *)
#typedef d3pat = $D3E.d3pat
#typedef d3exp = $D3E.d3exp
#typedef d3ecl = $D3E.d3ecl
(* ****** ****** *)
#typedef d3patlst = $D3E.d3patlst
#typedef d3explst = $D3E.d3explst
#typedef d3eclist = $D3E.d3eclist
(* ****** ****** *)
(* ****** ****** *)
datatype
irlab(x0:type) =
|
IRLAB of (label, x0(*elt*))
(* ****** ****** *)
#abstbox irpat_tbox // p0tr
#typedef irpat = irpat_tbox
(* ****** ****** *)
#abstbox irexp_tbox // p0tr
#typedef irexp = irexp_tbox
(* ****** ****** *)
#abstbox irdcl_tbox // p0tr
#typedef irdcl = irdcl_tbox
(* ****** ****** *)
#typedef l0irp = irlab(irpat)
#typedef l0ire = irlab(irexp)
(* ****** ****** *)
#typedef irpatlst = list(irpat)
#typedef l0irplst = list(l0irp)
(* ****** ****** *)
#typedef irexplst = list(irexp)
#typedef l0irelst = list(l0ire)
(* ****** ****** *)
#typedef irdclist = list(irdcl)
(* ****** ****** *)

datatype
irpat_node =
//
| IRPnil of ()
| IRPany of ()
//
| IRPint of (int)
| IRPbtf of (bool)
| IRPchr of (char)
| IRPstr of string
//
| IRPvar of (d2var)
//
| IRPbang of (irpat)
| IRPflat of (irpat)
| IRPfree of (irpat)
//
| IRPcapp of (d2con, irpatlst)
//
| IRPtup0 of (irpatlst)
| IRPtup1 of (int(*knd*), irpatlst)
| IRPrcd2 of (int(*knd*), l0irplst)
//
| IRPnone0 of () | IRPnone1 of (d3pat)
//
(* ****** ****** *)
//
fun
irpat_fprint(FILR,irpat): void
//
(* ****** ****** *)
//
fun
irpat_get_lctn(irpat):( loc_t )
fun
irpat_get_node(irpat):irpat_node
//
(* ****** ****** *)
#symload lctn with irpat_get_lctn
#symload node with irpat_get_node
(* ****** ****** *)
fun
irpat_none0(loc0: loctn): irpat
fun
irpat_none1(d3p0: d3pat): irpat
(* ****** ****** *)
fun
irpat_make_node
(loc: loctn, nod: irpat_node):irpat
(* ****** ****** *)
#symload irpat with irpat_make_node
(* ****** ****** *)
//
datatype
irexp_node =
//
|IREint of token
|IREbtf of sym_t
|IREchr of token
|IREflt of token
|IREstr of token
//
|IREi00 of (sint) // sint
|IREb00 of (bool) // bool
|IREc00 of (char) // char
|IREf00 of (dflt) // float
|IREs00 of (strn) // string
//
|IREtop of (sym_t)
//
|IREvar of (d2var)
//
|IREcon of (d2con)
|IREcst of (d2cst)
//
|IREnone0 of ((*0*)) |IREnone1 of (d3exp)
//
// HX-2023-??-??: end-of-[datatype(irexp_node)]
//
(* ****** ****** *)
//
fun
irexp_fprint(FILR,irexp): void
//
(* ****** ****** *)
//
fun
irexp_get_lctn(irexp):( loc_t )
fun
irexp_get_node(irexp):irexp_node
//
(* ****** ****** *)
#symload lctn with irexp_get_lctn
#symload node with irexp_get_node
(* ****** ****** *)
fun
irexp_none0(loc0: loctn): irexp
fun
irexp_none1(d3e0: d3exp): irexp
(* ****** ****** *)
fun
irexp_make_node
(loc:loctn, nod:irexp_node):irexp
(* ****** ****** *)
#symload irexp with irexp_make_node
(* ****** ****** *)
//
datatype
irdcl_node =
//
|IRDlocal0 of
( irdclist(*local-head*)
, irdclist(*local-body*))
//
|IRDnone0 of ((*0*)) |IRDnone1 of (d3ecl)
//
(* ****** ****** *)
//
fun
irdcl_fprint(FILR,irdcl): void
//
(* ****** ****** *)
//
fun
irdcl_get_lctn(irdcl):( loc_t )
fun
irdcl_get_node(irdcl):irdcl_node
//
(* ****** ****** *)
fun
irdcl_make_node
(loc:loctn, nod:irdcl_node):irdcl
(* ****** ****** *)
#symload irdcl with irdcl_make_node
(* ****** ****** *)
(* ****** ****** *)
#absvtbx
trdienv_vtbx
#vwtpdef
trdienv = trdienv_vtbx
(* ****** ****** *)
(* ****** ****** *)
fun
trdienv_make_nil(): trdienv
fun
trdienv_free_top(trdienv): void
(* ****** ****** *)
fun
trxd3ir_d3pat
(env0: !trdienv, d3p0: d3pat): irpat
(* ****** ****** *)
fun
trxd3ir_d3exp
(env0: !trdienv, d3e0: d3exp): irexp
(* ****** ****** *)
fun
trxd3ir_d3ecl
(env0: !trdienv, d3cl: d3ecl): irdcl
(* ****** ****** *)
fun
trxd3ir_d3patlst
(env0: !trdienv, d3ps: d3patlst): irpatlst
fun
trxd3ir_d3explst
(env0: !trdienv, d3es: d3explst): irexplst
(* ****** ****** *)
fun
trxd3ir_d3eclist
(env0: !trdienv, dcls: d3eclist): irdclist
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_intrep0.sats] *)
