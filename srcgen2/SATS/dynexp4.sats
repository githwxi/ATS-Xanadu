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
#typedef tnode = $LEX.tnode
#typedef token = $LEX.token
(* ****** ****** *)
#typedef g1exp = $G1M.g1exp
(* ****** ****** *)
#typedef s2typ = $S2E.s2typ
(* ****** ****** *)
#typedef d2var = $D2E.d2var
#typedef d2con = $D2E.d2con
#typedef d2cst = $D2E.d2cst
(* ****** ****** *)
#typedef d3pat = $D3E.d3pat
#typedef d3exp = $D3E.d3exp
(* ****** ****** *)
#typedef d3ecl = $D3E.d3ecl
(* ****** ****** *)
(* ****** ****** *)
#abstbox d4pat_tbox // p0tr
#typedef d4pat = d4pat_tbox
(* ****** ****** *)
#abstbox d4exp_tbox // p0tr
#typedef d4exp = d4exp_tbox
(* ****** ****** *)
#abstbox d4ecl_tbox // p0tr
#typedef d4ecl = d4ecl_tbox
(* ****** ****** *)
//
#abstbox d4valdcl_tbox//p0tr
#abstbox d4vardcl_tbox//p0tr
#abstbox d4fundcl_tbox//p0tr
//
(* ****** ****** *)
//
#abstbox d4parsed_tbox//p0tr
//
(* ****** ****** *)
#typedef d4patlst = list(d4pat)
(* ****** ****** *)
#typedef d4explst = list(d4exp)
#typedef d4expopt = optn(d4exp)
(* ****** ****** *)
#typedef d4eclist = list(d4ecl)
(* ****** ****** *)
#typedef d4valdcl = d4valdcl_tbox
#typedef d4vardcl = d4vardcl_tbox
#typedef d4fundcl = d4fundcl_tbox
(* ****** ****** *)
#typedef d4parsed = d4parsed_tbox
(* ****** ****** *)
#typedef d4valdclist = list(d4valdcl)
#typedef d4vardclist = list(d4vardcl)
#typedef d4fundclist = list(d4fundcl)
(* ****** ****** *)
//
#typedef d4explstopt = optn(d4explst)
#typedef d4eclistopt = optn(d4eclist)
//
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
#typedef l4d4p = d4lab(d4pat)
#typedef l4d4e = d4lab(d4exp)
(* ****** ****** *)
#typedef l4d4plst = list(l4d4p)
#typedef l4d4elst = list(l4d4e)
(* ****** ****** *)
(* ****** ****** *)
//
datatype
d4pat_node =
//
|D4Pint of token
|D4Pbtf of sym_t
|D4Pchr of token
|D4Pflt of token
|D4Pstr of token
//
|D4Perrck of
( sint(*lvl*), d4pat(*err*) ) // tread34-error
//
(* ****** ****** *)
fun
d4pat_fprint
(
  out:FILR, d4p0:d4pat):(void)
(* ****** ****** *)
//
fun
d4pat_get_lctn(d4pat): ( loc_t )
//
fun
d4pat_get_styp(d4pat): ( s2typ )
//
fun
d4pat_get_node(d4pat): d4pat_node
//
(* ****** ****** *)
#symload lctn with d4pat_get_lctn
#symload styp with d4pat_get_styp
#symload node with d4pat_get_node
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
(* ****** ****** *)
//
|D4Edapp of
(d4exp,sint(*npf*),d4explst)
//
(* ****** ****** *)
//
|D4Elet0 of (d4eclist, d4exp)
//
(* ****** ****** *)
//
|D4Eift0 of
(d4exp(*cond*)
,d4expopt(*thn*), d4expopt(*els*) )
//
|D4Eseqn of
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
|D4Enone1 of (d3exp) | D4Enone2 of (d4exp)
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
d4exp_get_styp(d4exp): ( s2typ )
//
fun
d4exp_get_node(d4exp): d4exp_node
//
(* ****** ****** *)
#symload lctn with d4exp_get_lctn
#symload styp with d4exp_get_styp
#symload node with d4exp_get_node
(* ****** ****** *)
fun
d4exp_none0(loc0: loc_t): (d4exp)
fun
d4exp_none1(dexp: d3exp): (d4exp)
fun
d4exp_none2(dexp: d4exp): (d4exp)
(* ****** ****** *)
fun
d4exp_make_node
(loc:loc_t,nod:d4exp_node): d4exp
fun
d4exp_make_tpnd
(loc:loc_t
,typ:s2typ,nod:d4exp_node): d4exp
(* ****** ****** *)
#symload d4exp with d4exp_make_node
#symload d4exp with d4exp_make_tpnd
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
fun
d4ecl_none0(loc0: loc_t): (d4ecl)
fun
d4ecl_none1(d3cl: d3ecl): (d4ecl)
(* ****** ****** *)
fun
d4ecl_make_node
(loc:loc_t,nod:d4ecl_node): d4ecl
(* ****** ****** *)
#symload d4ecl with d4ecl_make_node
(* ****** ****** *)
(* ****** ****** *)
//
fun
d4parsed_fprint
(out:FILR, dpar:d4parsed): void
//
(* ****** ****** *)
#typedef d1topenv = $D1E.d1topenv
#typedef d2topenv = $D2E.d2topenv
#typedef d3topenv = $D3E.d3topenv
(* ****** ****** *)
//
fun
d4parsed_get_stadyn:(d4parsed)->sint
fun
d4parsed_get_nerror:(d4parsed)->sint
//
fun
d4parsed_get_source:(d4parsed)->lcsrc
//
#symload stadyn with d4parsed_get_stadyn
#symload nerror with d4parsed_get_nerror
#symload source with d4parsed_get_source
//
(* ****** ****** *)
//
fun
d4parsed_get_t1penv:(d4parsed)->d1topenv
fun
d4parsed_get_t2penv:(d4parsed)->d2topenv
//
fun
d4parsed_get_t3penv:(d4parsed)->d3topenv
//
fun
d4parsed_get_parsed
:(d4parsed(*dpar*))->d4eclistopt(*?err*)
//
#symload t1penv with d4parsed_get_t1penv
#symload t2penv with d4parsed_get_t2penv
#symload t3penv with d4parsed_get_t3penv
#symload parsed with d4parsed_get_parsed
//
(* ****** ****** *)
//
fun
d4parsed_make_args
( stadyn:sint
, nerror:sint
, source:lcsrc
, t1penv:d1topenv
, t2penv:d2topenv
, t3penv:d3topenv
, parsed:d4eclistopt): d4parsed//end-fun
//
#symload d4parsed with d4parsed_make_args
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_dynexp4.sats] *)
