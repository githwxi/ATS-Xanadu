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
#abstype i1val_tbox // p0tr
(* ****** ****** *)
#abstype fjarg_tbox // p0tr
(* ****** ****** *)
#abstbox i1gua_tbox // p0tr
#abstbox i1gpt_tbox // p0tr
#abstbox i1cls_tbox // p0tr
(* ****** ****** *)
#abstype i1dcl_tbox // p0tr
(* ****** ****** *)
#abstbox t1imp_tbox // p0tr
(* ****** ****** *)
//
#typedef i1val = i1val_tbox
#typedef fjarg = fjarg_tbox
//
#typedef i1cls = i1cls_tbox
#typedef i1gua = i1gua_tbox
#typedef i1gpt = i1gpt_tbox
//
#typedef i1dcl = i1dcl_tbox
//
#typedef t1imp = t1imp_tbox
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
#typedef l1i1v = i1lab(i1val)
(* ****** ****** *)
#typedef d2sub = (d2var,i1val)
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
#typedef i1valdcl = i1valdcl_tbox
#typedef i1vardcl = i1vardcl_tbox
#typedef i1fundcl = i1fundcl_tbox
(* ****** ****** *)
#typedef i1valdclist = list(i1valdcl)
#typedef i1vardclist = list(i1vardcl)
#typedef i1fundclist = list(i1fundcl)
(* ****** ****** *)
#typedef i1dclistopt = optn(i1dclist)
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1tnm_stmp$get(i1tnm): stamp
//
(* ****** ****** *)
//
fun
i1opr_fprint
(
iopr: i1opr, out0: FILR): void
fun
i1tnm_fprint
(
itnm: i1tnm, out0: FILR): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1dcl_fprint
(
idcl: i1dcl, out0: FILR): void
//
(* ****** ****** *)
//
fun
i1dcl_lctn$get(i1dcl): ( loc_t )
fun
i1dcl_node$get(i1dcl): i1dcl_node
//
(* ****** ****** *)
#symload lctn with i1dcl_lctn$get
#symload node with i1dcl_node$get
(* ****** ****** *)
fun
i1dcl_none0(loc_t): i1dcl
fun
i1dcl_none1(idcl: i0dcl): i1dcl
(* ****** ****** *)
fun
i1dcl_make_node
(loc0:loc_t,node:i1dcl_node):i1dcl
(* ****** ****** *)
#symload i1dcl with i1dcl_make_node
(* ****** ****** *)
(* ****** ****** *)
fun
i1valdcl_fprint
(ival:i1valdcl, out0:FILR): void
fun
i1vardcl_fprint
(ivar:i1vardcl, out0:FILR): void
(* ****** ****** *)
fun
i1fundcl_fprint
(ifun:i1fundcl, out0:FILR): void
(* ****** ****** *)
(* ****** ****** *)
fun
i1valdcl_lctn$get:(i1valdcl)->loc_t
fun
i1vardcl_lctn$get:(i1vardcl)->loc_t
fun
i1fundcl_lctn$get:(i1fundcl)->loc_t
(* ****** ****** *)
(* ****** ****** *)
fun
i1valdcl_dpat$get:(i1valdcl)->i1bnd
fun
i1valdcl_tdxp$get:(i1valdcl)->teqi1cmp
(* ****** ****** *)
#symload dpat with i1valdcl_dpat$get
#symload tdxp with i1valdcl_tdxp$get(*opt*)
(* ****** ****** *)
fun
i1vardcl_dpid$get:(i1vardcl)->i1bnd
fun
i1vardcl_dini$get:(i1vardcl)->teqi1cmp
(* ****** ****** *)
#symload dpid with i1vardcl_dpid$get
#symload dini with i1vardcl_dini$get(*opt*)
(* ****** ****** *)
(* ****** ****** *)
fun
i1fundcl_dpid$get:(i1fundcl)->d2var
fun
i1fundcl_farg$get:(i1fundcl)->fjarglst
fun
i1fundcl_tdxp$get:(i1fundcl)->teqi1cmp
(* ****** ****** *)
#symload dpid with i1fundcl_dpid$get
#symload farg with i1fundcl_farg$get(*lst*)
#symload tdxp with i1fundcl_tdxp$get(*opt*)
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1valdcl_make_args
( lctn:loc_t
, dpat:i1bnd, tdxp:teqi1cmp):i1valdcl
fun
i1vardcl_make_args
( lctn:loc_t
, dpid:i1bnd, dini:teqi1cmp):i1vardcl
//
(* ****** ****** *)
//
fun
i1fundcl_make_args
( lctn:loc_t
, dpid:d2var
, farg:fjarglst, tdxp:teqi1cmp):i1fundcl
//
(* ****** ****** *)
//
#symload i1valdcl with i1valdcl_make_args
#symload i1vardcl with i1vardcl_make_args
#symload i1fundcl with i1fundcl_make_args
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1parsed_fprint
(ipar:i1parsed, out0:FILR): void
//
(* ****** ****** *)
//
fun
i1parsed_stadyn$get:(i1parsed)->sint
fun
i1parsed_nerror$get:(i1parsed)->sint
//
fun
i1parsed_source$get:(i1parsed)->lcsrc
//
fun
i1parsed_parsed$get:(i1parsed)->i1dclistopt
//
(* ****** ****** *)
//
#symload stadyn with i1parsed_stadyn$get
#symload nerror with i1parsed_nerror$get
#symload source with i1parsed_source$get
#symload parsed with i1parsed_parsed$get
//
(* ****** ****** *)
//
fun
i1parsed_make_args
( stadyn:sint
, nerror:sint
, source:lcsrc
, parsed:i1dclistopt): i1parsed//end-fun
//
#symload i1parsed with i1parsed_make_args
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_SATS_intrep1.sats] *)
(***********************************************************************)
(***********************************************************************)
