(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
Start Time: May 28th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
TMP = "./xstamp0.sats"
#typedef stamp = $TMP.stamp
//
(* ****** ****** *)
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox symbl_tbox // ptr
//
#typedef symbl = symbl_tbox
#typedef sym_t = symbl_tbox
//
(* ****** ****** *)
//
val
the_symbl_nil: symbl//symbl("")
//
(* ****** ****** *)
fun
symbl_nilq(sym: symbl): bool
#symload nilq with symbl_nilq
fun
symbl_neqz(sym: symbl): bool
#symload neqz with symbl_neqz
//
(* ****** ****** *)
//
(*
fun
symbl_eq(symbl, symbl): bool
*)
fun
symbl_cmp(symbl, symbl): sint
//
(* ****** ****** *)
//
fun//<>
symbl_fprint
(sym0: symbl, filr: FILR): void
//
(* ****** ****** *)
//
fun
symbl_get_name(symbl): strn
fun
symbl_get_stmp(symbl): stamp
//
#symload name with symbl_get_name
#symload stmp with symbl_get_stmp
//
(* ****** ****** *)
//
fun
symbl_make_name
  (name: strn): symbl//end(fun)
#symload symbl with symbl_make_name
//
(* ****** ****** *)
//
val AMP_symbl: symbl//symbl("&")
val BAR_symbl: symbl//symbl("|")
val CLN_symbl: symbl//symbl(":")
val DOT_symbl: symbl//symbl(".")
val EQ0_symbl: symbl//symbl("=")
//
val DLR_symbl: symbl//symbl("$")
val SRP_symbl: symbl//symbl("#")
//
val BANG_symbl: symbl//symbl("!")
//
val SMCLN_symbl: symbl//symbl(";")
val TILDA_symbl: symbl//symbl("~")
//
val WCARD_symbl: symbl//symbl("_")
//
(* ****** ****** *)
//
val ADD_symbl: symbl //=symbl("+")
val SUB_symbl: symbl //=symbl("-")
val MUL_symbl: symbl //=symbl("*")
val DIV_symbl: symbl //=symbl("/")
val MOD_symbl: symbl //=symbl("%")
//
(* ****** ****** *)
//
val CBV0_symbl: symbl // symbl("~")
val CBV1_symbl: symbl // symbl("!")
val CBRF_symbl: symbl // symbl("&")
//
val AXCG_symbl: symbl // symbl(">>")
//
(* ****** ****** *)
//
val EQLT_symbl: symbl // symbl("=<")
val EQGT_symbl: symbl // symbl("=>")
//
val MSLT_symbl: symbl // symbl("-<")
val MSGT_symbl: symbl // symbl("->")
//
(* ****** ****** *)
val PFLAT_symbl: symbl //=symbl("@")
val PFREE_symbl: symbl //=symbl("!")
(* ****** ****** *)
//
val DLRDT_symbl: symbl // symbl("$.")
//
(* ****** ****** *)
//
val ASSGN_symbl: symbl //=symbl(":=")
val BRCKT_symbl: symbl //=symbl("[]")
//
(* ****** ****** *)
//
val INT_symbl: symbl //=symbl("int")
val ADDR_symbl: symbl //=symbl("addr")
val BOOL_symbl: symbl //=symbl("bool")
val CHAR_symbl: symbl //=symbl("char")
val STRN_symbl: symbl //=symbl("strn")
//
(* ****** ****** *)
//
val PROP_symbl: symbl //=symbl("prop")
val VIEW_symbl: symbl //=symbl("view")
//
val TYPE_symbl: symbl //=symbl("type")
val TBOX_symbl: symbl //=symbl("tbox")
val TFLT_symbl: symbl //=symbl("tflt")
//
val VWTP_symbl: symbl //=symbl("vwtp")
val VTBX_symbl: symbl //=symbl("vtbx")
val VTFT_symbl: symbl //=symbl("vtft")
//
(* ****** ****** *)
val TRUE_symbl: symbl //=symbl("true")
val FALSE_symbl: symbl //=symbl("false")
(* ****** ****** *)
val DADDR_symbl: symbl //=symbl("$addr")
val DVIEW_symbl: symbl //=symbl("$view")
(* ****** ****** *)
val DEVAL_symbl: symbl //=symbl("$eval")
val DFOLD_symbl: symbl //=symbl("$fold")
val DFREE_symbl: symbl //=symbl("$free")
(* ****** ****** *)
val DLAZY_symbl: symbl //=symbl("$lazy")
val DLLAZY_symbl: symbl //=symbl("$llazy")
(* ****** ****** *)
val DRAISE_symbl: symbl //=symbl("$raise")
(* ****** ****** *)
//
fun
symbl_search$opt
(nam: strn): optn_vt(symbl)
fun
symbl_insert$any(sym: symbl): void
//
(* ****** ****** *)
//
val
DLR_EXTNAM_symbl: symbl //=symbl("$extnam")
val
DLR_EXTVAL_symbl: symbl //=symbl("$extval")
//
val
DLR_EXTBOX_symbl: symbl //=symbl("$extbox")
val
DLR_EXTYPE_symbl: symbl //=symbl("$extype")
//
(* ****** ****** *)
//
fun
symbl_wcard_kind
( sym: symbl ) : sint // HX: true/false: -1|0+
//
(* ****** ****** *)

val
P1TR_TBOX_symbl: symbl //=symbl("p1tr_tbox")
val
P2TR_TBOX_symbl: symbl //=symbl("p2tr_tbox")

(* ****** ****** *)

val
L0AZY_TBOX_symbl: symbl //=symbl("lazy_t0_tx")
val
L1AZY_VTBX_symbl: symbl //=symbl("lazy_vt_vx")

(* ****** ****** *)
//
val
(*
[V0] is not [VT]! *)
CBV0_V0_VT_symbl: symbl //=symbl("cbv0_v0_vt")
val
(*
[V0] is not [VT]! *)
CBV1_V0_VT_symbl: symbl //=symbl("cbv1_v0_vt")
//
val
CBRF_VT_VT_symbl: symbl //=symbl("cbrf_vt_vt")
//
val
TOP0_VT_T0_symbl: symbl //=symbl("top0_vt_t0")
val
TOP1_VT_T0_symbl: symbl //=symbl("top1_vt_t0")
//
(* ****** ****** *)
//
(*
HX-2024-07-19:
For external syntax
(usually of the target)
Fri 19 Jul 2024 05:07:03 PM EDT
*)
val DLR_SYNEXT_symbl: symbl // =symbl("$synext")
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-08:
Thu 08 Aug 2024 10:07:35 PM EDT
*)
//
fun
symbl_extend_stamp
(sym0: symbl, stmp: stamp): symbl
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-02-17:
These are moved from [xglobal.sats]
*)
fun
the_xsymbls_insert(sym: sym_t): void
fun
the_xsymbls_search(key:sint): optn_vt(sym_t)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****************************************** *)
(* ****************************************** *)

(* end of [ATS3/XATSOPT_srcgen2_SATS_xsymbol.sats] *)
