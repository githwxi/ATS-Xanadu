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
(* ****** ****** *)
(* ****** ****** *)
datatype
irlab(x0:type) =
|
IRLAB of
(label, x0(*elt*))
(* ****** ****** *)
#abstbox irpat_tbox // ptr
#typedef irpat = irpat_tbox
(* ****** ****** *)
#abstbox irexp_tbox // ptr
#typedef irexp = irexp_tbox
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
//
datatype
d3exp_node =
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
|IREtimp of (irexp, timpl)
//
|IREsapp of (irexp, s2explst)
|IREsapq of (irexp, s2typlst)
//
|IREtapp of (irexp, s2explst)
|IREtapq of (irexp, t2jaglst)
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

(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_intrep0.sats] *)
