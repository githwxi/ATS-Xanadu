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
(*
HX-2023-12-26:
For linearity checking!!!
*)
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Tue Dec 26 22:03:40 EST 2023
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
//
#staload
FP0 = "./filpath.sats"
#staload
LOC = "./locinfo.sats"
//
#staload
SYM = "./xsymbol.sats"
#staload
MAP = "./xsymmap.sats"
//
(* ****** ****** *)
//
#staload
LEX = "./lexing0.sats"
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
T2P = "./statyp2.sats"
#staload
D2E = "./dynexp2.sats"
(* ****** ****** *)
#staload
D3E = "./dynexp3.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#typedef lab_t = $LAB.lab_t
#typedef label = $LAB.label
//
(* ****** ****** *)
#typedef stamp = $TMP.stamp
(* ****** ****** *)
#typedef sym_t = $SYM.sym_t
#typedef symbl = $SYM.symbl
(* ****** ****** *)
//
#typedef loc_t = $LOC.loc_t
#typedef loctn = $LOC.loctn
//
(* ****** ****** *)
#typedef lcsrc = $LOC.lcsrc
(* ****** ****** *)
//
#typedef
 fpath = ($FP0.fpath)
#typedef
 fpathopt = ($FP0.fpathopt)
//
(* ****** ****** *)
//
#typedef tnode = $LEX.tnode
#typedef token = $LEX.token
//
(* ****** ****** *)
#typedef d2var = $D2E.d2var
#typedef d2con = $D2E.d2con
#typedef d2cst = $D2E.d2cst
(* ****** ****** *)
#typedef d3pat = $D3E.d2pat
#typedef d3exp = $D3E.d2exp
(* ****** ****** *)
#typedef d3ecl = $D3E.d2ecl
(* ****** ****** *)
(* ****** ****** *)
#abstbox d4exp_tbox // p0tr
#typedef d4exp = d4exp_tbox
(* ****** ****** *)
#abstbox d4ecl_tbox // p0tr
#typedef d4ecl = d4ecl_tbox
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox d4parsed_tbox//p0tr
//
(* ****** ****** *)
(* ****** ****** *)
#typedef d4explst = list(d4exp)
#typedef d4expopt = optn(d4exp)
(* ****** ****** *)
#typedef d4eclist = list(d4ecl)
(* ****** ****** *)
(* ****** ****** *)
//
datatype
d4lab(itm:type) =
|D4LAB of
(label, itm(*elt*))
//
fun
<x0:t0>
d4lab_get_itm
(dlab: d4lab(x0)): x0
#symload
itm with d4lab_get_itm
//
(* ****** ****** *)
//
#typedef
d3lab(x0:t0)=$D3E.d3lab(x0)
//
(* ****** ****** *)
//
fun
<x0:type>
d4lab_fprint
( out
: FILR, lab: d4lab(x0)): void
//
(* ****** ****** *)
(* ****** ****** *)
#typedef l4d4e = d4lab(d4exp)
(* ****** ****** *)
#typedef l4d4elst = list(l4d4e)
(* ****** ****** *)
(* ****** ****** *)
//
datatype
d4exp_node =
//
|D4Eint of token
|D4Ebtf of sym_t
|D4Echr of token
|D4Eflt of token
|D4Estr of token
//
|D4Eift0 of
(d4exp(*cond*)
,d4expopt(*thn*), d4expopt(*els*) )
//
|D3Eseqn of
( d4explst(*init*), d4exp(*last*) )
//
|D4Etup0 of (sint(*npf*), d4explst)
|D4Etup1 of
(
token(*knd*), sint(*npf*), d4explst)
|D4Ercd2 of
(
token(*knd*), sint(*npf*), l4d4elst)
//
|D4Enone0 of ((*0*))
|D4Enone1 of (d3exp) | D4Enone2 of (d3exp)
//
|D4Eerrck of
( sint(*lvl*), d4exp(*err*) ) // tread34-error
//
(* ****** ****** *)
fun
d4exp_fprint
(
  out:FILR, d4e0:d4exp):(void)
(* ****** ****** *)
//
fun
d4exp_get_lctn(d4exp): ( loc_t )
//
fun
d4exp_get_node(d4exp): d4exp_node
//
(* ****** ****** *)
#symload lctn with d4exp_get_lctn
#symload node with d4exp_get_node
(* ****** ****** *)
(* ****** ****** *)
//
datatype
d4ecl_node =
//
|D4Cd3ecl of (d3ecl)
//
|D4Cinclude of
( sint(*s/d*)
, token
, g1exp // src
, fpathopt
, d4eclistopt) // inclusion
//
|
D4Cnone0 of ((*nil*))
|
D4Cnone1 of ( d3ecl ) | D4Cnone2 of ( d4ecl )
//
|
D4Cerrck of
( sint(*lvl*), d4ecl(*err*) ) // tread34-error
//
(* ****** ****** *)
fun
d4ecl_fprint
(
  out:FILR, d4cl:d4ecl):(void)
(* ****** ****** *)
//
fun
d4ecl_get_lctn(d4ecl): ( loc_t )
//
fun
d4ecl_get_node(d4ecl): d4ecl_node
//
(* ****** ****** *)
#symload lctn with d4ecl_get_lctn
#symload node with d4ecl_get_node
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_dynexp4.sats] *)
