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
(* ****** ****** *)
//
#staload
"./../../../SATS/lexing0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#typedef stamp = stamp
#typedef sym_t = sym_t
#typedef label = label
#typedef loctn = loctn
#typedef loc_t = loctn
(* ****** ****** *)
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
#typedef s2exp = $S2E.s2exp
#typedef s2typ = $S2E.s2typ
(* ****** ****** *)
#typedef d2var = $D2E.d2var
#typedef d2con = $D2E.d2con
#typedef d2cst = $D2E.d2cst
(* ****** ****** *)
(* ****** ****** *)
#typedef d3pat = $D3E.d3pat
#typedef d3exp = $D3E.d3exp
#typedef d3ecl = $D3E.d3ecl
(* ****** ****** *)
(* ****** ****** *)
#abstbox i0pat_tbox // p0tr
#typedef i0pat = i0pat_tbox
(* ****** ****** *)
#abstbox i0exp_tbox // p0tr
#typedef i0exp = i0exp_tbox
(* ****** ****** *)
#abstbox i0dcl_tbox // p0tr
#typedef i0dcl = i0dcl_tbox
(* ****** ****** *)
#typedef l0i0p = i0lab(i0pat)
#typedef l0i0e = i0lab(i0exp)
(* ****** ****** *)
#typedef i0patlst = list(i0pat)
#typedef l0i0plst = list(l0i0p)
(* ****** ****** *)
#typedef i0expopt = optn(i0exp)
#typedef i0explst = list(i0exp)
#typedef l0i0elst = list(l0i0e)
(* ****** ****** *)
#typedef i0dclist = list(i0dcl)
(* ****** ****** *)

datatype
i0pat_node =
//
|I0Pnil of ()
|I0Pany of ()
//
|I0Pint of sint
|I0Pbtf of bool
|I0Pchr of char
//
|I0Pflt of token
|I0Pstr of token
//
|I0Pvar of d2var
//
|I0Pbang of (i0pat)
//
(*
|I0Pflat of (i0pat)
|I0Pfree of (i0pat)
*)
//
|I0Pcapp of
( d2con, i0patlst )
//
|I0Ptup0 of (i0patlst)
|I0Ptup1 of (token, i0patlst)
|I0Prcd2 of (token, l0i0plst)
//
|I0Pnone0 of ((*0*)) | I0Pnone1 of (d3pat)

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
//
|I0Etop of (sym_t)
//
//
(* ****** ****** *)
//
|I0Evar of (d2var)
//
(* ****** ****** *)
//
|I0Enone0 of ((*0*)) |I0Enone1 of (d3exp)
//
// HX-2023-??-??: end-of-[datatype(i0exp_node)]

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
(* ****** ****** *)
//
datatype
i0dcl_node =
//
|I0Dd3ecl of (d3ecl)
//
|I0Dlocal0 of
( i0dclist(*local-head*)
, i0dclist(*local-body*))
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
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_SATS_intrep0.sats] *)
(***********************************************************************)
