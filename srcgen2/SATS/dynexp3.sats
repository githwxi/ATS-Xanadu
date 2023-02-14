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
//
datatype
d3pat_node =
//
|
D3Perrck of (sint(*lvl*), d3pat)//HX:tread23-error
//
// end of [d1exp_node] // end of [ datatype(...) ]
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
|
D3Eerrck of (sint(*lvl*), d3exp)//HX:tread23-error
//
// end of [d1exp_node] // end of [ datatype(...) ]
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

(* end of [ATS3/XATSOPT_srcgen2_dynexp3.sats] *)
