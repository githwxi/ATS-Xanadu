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
Sat Apr  4 08:20:20 PM EDT 2026
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
(* ****** ****** *)
(* ****** ****** *)
#staload "./intrep0.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./\
../../../SATS/xbasics.sats"
#staload "./\
../../../SATS/xstamp0.sats"
#staload "./\
../../../SATS/xsymbol.sats"
#staload "./\
../../../SATS/xlabel0.sats"
//
(* ****** ****** *)
//
#typedef stamp = stamp
#typedef sym_t = sym_t
#typedef label = label
#typedef loc_t = loc_t
#typedef loctn = loctn
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload S2E = "./\
../../../SATS/staexp2.sats"
#staload T2P = "./\
../../../SATS/statyp2.sats"
#staload D2E = "./\
../../../SATS/dynexp2.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef sort2 = $S2E.sort2
#typedef s2cst = $S2E.s2cst
#typedef s2var = $S2E.s2var
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
i1lab(x0:type) =
|
I1LAB of (label,x0(*elt*))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#abstype i1arg_tbox // p0tr
*)
#abstype i1opr_tbox // p0tr
#abstype i1tnm_tbox // p0tr
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox i1dcl_tbox // p0tr
#typedef i1dcl = i1dcl_tbox
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox i1valdcl_tbox//p0tr
#abstbox i1vardcl_tbox//p0tr
#abstbox i1fundcl_tbox//p0tr
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox i1parsed_tbox//p0tr
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef i1tnmlst = list(i1tnm)
//
(* ****** ****** *)
//
#typedef i1valist = list(i1val)
#typedef i1valopt = optn(i1val)
//
(* ****** ****** *)
(* ****** ****** *)
#typedef i1dclopt = optn(i1dcl)
#typedef i1dclist = list(i1dcl)
(* ****** ****** *)
(* ****** ****** *)
#typedef i1parsed = i1parsed_tbox
(* ****** ****** *)
(* ****** ****** *)
#typedef i1dclistopt = optn(i1dclist)
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_SATS_intrep1.sats] *)
(***********************************************************************)
(***********************************************************************)

