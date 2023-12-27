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

(* end of [ATS3/XATSOPT_srcgen2_dynexp4.sats] *)
