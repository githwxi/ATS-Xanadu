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
//
(*
Author: Hongwei Xi
Start Time: May 28th, 2022
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
#staload
TMP = "./../SATS/xstamp0.sats"
(* ****** ****** *)
//
#abstbox symbl_tbox // ptr
//
#typedef symbl = symbl_tbox
#typedef sym_t = symbl_tbox
//
(* ****** ****** *)
#typedef stamp = $TMP.stamp
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
symbl_fprint(FILR, symbl): void
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
symbl_make_name(nam: strn): symbl
#symload symbl with symbl_make_name
//
(* ****** ****** *)
//
val AMP_symbl: symbl//symbl("&")
val BAR_symbl: symbl//symbl("|")
val CLN_symbl: symbl//symbl(":")
val DOT_symbl: symbl//symbl(".")
//
val DLR_symbl: symbl//symbl("$")
val SRP_symbl: symbl//symbl("#")
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
val CBV0_symbl : symbl // symbl("~")
val CBV1_symbl : symbl // symbl("!")
val CBRF_symbl : symbl // symbl("&")
//
val AXCG_symbl : symbl // symbl(">>")
//
(* ****** ****** *)
//
val EQLT_symbl : symbl // symbl("=<")
val EQGT_symbl : symbl // symbl("=>")
//
val MSLT_symbl : symbl // symbl("-<")
val MSGT_symbl : symbl // symbl("->")
//
(* ****** ****** *)
//
val INT_symbl: symbl //=symbl("int")
val ADDR_symbl: symbl //=symbl("addr")
val BOOL_symbl: symbl //=symbl("bool")
val CHAR_symbl: symbl //=symbl("char")
//
(* ****** ****** *)
//
val PROP_symbl: symbl //=symbl("prop")
val TYPE_symbl: symbl //=symbl("type")
val TBOX_symbl: symbl //=symbl("tbox")
val VIEW_symbl: symbl //=symbl("view")
val VWTP_symbl: symbl //=symbl("vwtp")
val VTBX_symbl: symbl //=symbl("vtbx")
//
(* ****** ****** *)
//
fun
symbl_search_opt
(nam: strn): optn_vt(symbl)
fun
symbl_insert_any(sym: symbl): void
//
(* ****** ****** *)
//
val
DLR_EXTBOX_symbl: symbl //=symbl("$extbox")
val
DLR_EXTYPE_symbl: symbl //=symbl("$extype")
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_xsymbol.sats] *)
