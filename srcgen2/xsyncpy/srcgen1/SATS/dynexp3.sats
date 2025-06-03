(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
Sun May 11 09:05:29 AM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"xatslib\
/libcats\
/HATS/libcats_dats.hats"
//
(* ****** ****** *)
#staload
"./../SATS/statyp2.sats"
(* ****** ****** *)
#staload
LOC = "./\
../../../SATS/locinfo.sats"
#staload
D3E = "./\
../../../SATS/dynexp3.sats"
(* ****** ****** *)
#typedef lcsrc = $LOC.lcsrc
#typedef loctn = $LOC.loctn
(* ****** ****** *)
#typedef d3pat = $D3E.d3pat
#typedef d3exp = $D3E.d3exp
#typedef d3ecl = $D3E.d3ecl
(* ****** ****** *)
(* ****** ****** *)
#abstbox d3pat1_tbox // p0tr
#typedef d3pat1 = d3pat1_tbox
(* ****** ****** *)
#abstbox d3exp1_tbox // p0tr
#typedef d3exp1 = d3exp1_tbox
(* ****** ****** *)
#abstbox d3ecl1_tbox // p0tr
#typedef d3ecl1 = d3ecl1_tbox
(* ****** ****** *)
//
#abstbox d3valdcl1_tbox//p0tr
#abstbox d3vardcl1_tbox//p0tr
#abstbox d3fundcl1_tbox//p0tr
//
(* ****** ****** *)
//
#abstbox d3parsed1_tbox//p0tr
//
(* ****** ****** *)
#typedef d3pat1lst = list(d3pat1)
#typedef d3exp1lst = list(d3exp1)
#typedef d3ecl1lst = list(d3ecl1)
(* ****** ****** *)
#typedef d3pat1opt = optn(d3pat1)
#typedef d3exp1opt = optn(d3exp1)
#typedef d3ecl1opt = optn(d3ecl1)
(* ****** ****** *)
#typedef d3valdcl1 = d3valdcl1_tbox
#typedef d3vardcl1 = d3vardcl1_tbox
#typedef d3fundcl1 = d3fundcl1_tbox
(* ****** ****** *)
#typedef d3parsed1 = d3parsed1_tbox
(* ****** ****** *)
#typedef d3valdcl1lst = list(d3valdcl1)
#typedef d3vardcl1lst = list(d3vardcl1)
#typedef d3fundcl1lst = list(d3fundcl1)
(* ****** ****** *)
#typedef d3ecl1lstopt = optn(d3ecl1lst)
(* ****** ****** *)
(* ****** ****** *)
//
datatype
d3pat1_node =
//
|D3P1any of ()
|D3P1var of d2var
//
|D3P1dapp of
(d3pat
,sint(*npf*), d3pat1lst(*darg*)
) (* D3P1dapp *)
//
|D3P1rfpt of
(d3pat1,token(*AS*),d3pat1(*aspt*))
//
|D3P1tup0 of (sint(*npf*), d3pat1lst)
//
|D3P1tup1 of
(
token(*knd*), sint(*npf*), d3pat1lst)
//
|D3P1d3pat of (d3pat)//yet-to-be-copied
//
|D3P1errck of (sint(*lvl*), d3pat1(*err*))
//
(* ****** ****** *)
//
fun
d3pat1_lctn$get
(dpat: d3pat1): loctn
#symload lctn with d3pat1_lctn$get
fun
d3pat1_node$get
(dpat: d3pat1): d3pat1_node
#symload node with d3pat1_node$get
//
fun
d3pat1_fprint
(dpat: d3pat1, out0: FILR): void
#symload fprint with d3pat1_fprint of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
d3exp1_node =
//
(* ****** ****** *)
//
|D3E1int of token
|D3E1btf of sym_t
|D3E1chr of token
|D3E1flt of token
|D3E1str of token
//
(* ****** ****** *)
//
|D3E1d3exp of (d3exp)//yet-to-be-copied
//
|D3E1errck of (sint(*lvl*), d3exp1(*err*))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp1_lctn$get
(dexp: d3exp1): loctn
#symload lctn with d3exp1_lctn$get
fun
d3exp1_styp$get
(dexp: d3exp1): s2typ1
#symload styp with d3exp1_styp$get
fun
d3exp1_node$get
(dexp: d3exp1): d3exp1_node
#symload node with d3exp1_node$get
//
(* ****** ****** *)
//
fun
d3exp1_fprint
(dexp: d3exp1, out0: FILR): void
#symload fprint with d3exp1_fprint of 1000
//
(* ****** ****** *)
//
fun
d3exp1_make_lctn$node
(loc0: loctn, node: d3exp1_node): d3exp1
fun
d3exp1_make_lctn$styp$node
(loc0: loctn
,t2p0: s2typ1, node: d3exp1_node): d3exp1
#symload d3exp1 with d3exp1_make_lctn$node
#symload d3exp1 with d3exp1_make_lctn$styp$node
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3ecl1_lctn$get
(decl: d3ecl1): loctn
#symload lctn with d3ecl1_lctn$get
fun
d3ecl1_node$get
(decl: d3ecl1): d3ecl1_node
#symload node with d3ecl1_node$get
//
fun
d3ecl1_fprint
(decl: d3ecl1, out0: FILR): void
#symload fprint with d3ecl1_fprint of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3parsed1_make_args
(stadyn: sint
,nerror: sint
,source: lcsrc
,parsed: d3ecl1lstopt): d3parsed1//end-fun
//
#symload d3parsed1 with d3parsed1_make_args
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_SATS_dynexp3.sats] *)
(***********************************************************************)
