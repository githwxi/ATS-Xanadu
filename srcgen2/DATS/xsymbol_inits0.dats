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
Start Time: June 07th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
(*
HX-2022-10-01: Various symbols
*)
(* ****** ****** *)
//
#implval AMP_symbl = symbl("&")
#implval BAR_symbl = symbl("|")
#implval CLN_symbl = symbl(":")
#implval DOT_symbl = symbl(".")
#implval EQ0_symbl = symbl("=")
//
#implval DLR_symbl = symbl("$")
#implval SRP_symbl = symbl("#")
//
#implval BANG_symbl = symbl("!")
//
#implval SMCLN_symbl = symbl(";")
#implval TILDA_symbl = symbl("~")
//
#implval WCARD_symbl = symbl("_")
//
(* ****** ****** *)
//
#implval ADD_symbl = symbl("+")
#implval SUB_symbl = symbl("-")
#implval MUL_symbl = symbl("*")
#implval DIV_symbl = symbl("/")
#implval MOD_symbl = symbl("%")
//
(* ****** ****** *)
//
#implval CBV0_symbl = symbl("~")
#implval CBV1_symbl = symbl("!")
#implval CBRF_symbl = symbl("&")
//
#implval AXCG_symbl = symbl(">>")
//
(* ****** ****** *)
//
#implval EQLT_symbl = symbl("=<")
#implval EQGT_symbl = symbl("=>")
//
#implval MSLT_symbl = symbl("-<")
#implval MSGT_symbl = symbl("->")
//
(* ****** ****** *)
#implval DLRDT_symbl = symbl("$.")
(* ****** ****** *)
#implval ASSGN_symbl = symbl(":=")
#implval BRCKT_symbl = symbl("[]")
(* ****** ****** *)
#implval PFLAT_symbl = symbl("@")
#implval PFREE_symbl = symbl("~")
(* ****** ****** *)
//
#implval INT_symbl = symbl("int")
#implval ADDR_symbl = symbl("addr")
#implval BOOL_symbl = symbl("bool")
#implval CHAR_symbl = symbl("char")
#implval STRN_symbl = symbl("strn")
//
(* ****** ****** *)
//
#implval PROP_symbl = symbl("prop")
#implval VIEW_symbl = symbl("view")
//
#implval TYPE_symbl = symbl("type")
#implval TBOX_symbl = symbl("tbox")
#implval TFLT_symbl = symbl("tflt")
//
#implval VWTP_symbl = symbl("vwtp")
#implval VTBX_symbl = symbl("vtbx")
#implval VTFT_symbl = symbl("vtft")
//
(* ****** ****** *)
#implval TRUE_symbl = symbl("true")
#implval FALSE_symbl = symbl("false")
(* ****** ****** *)
#implval DADDR_symbl = symbl("$addr")
#implval DEVAL_symbl = symbl("$eval")
#implval DFOLD_symbl = symbl("$fold")
#implval DFREE_symbl = symbl("$free")
#implval DLAZY_symbl = symbl("$lazy")
#implval DLLAZY_symbl = symbl("$llazy")
#implval DRAISE_symbl = symbl("$raise")
(* ****** ****** *)
//
#implval DLR_EXTBOX_symbl = symbl("$extbox")
#implval DLR_EXTYPE_symbl = symbl("$extype")
//
(* ****** ****** *)
//
#implval P1TR_TBOX_symbl = symbl("p1tr_tbox")
#implval P2TR_TBOX_symbl = symbl("p2tr_tbox")
//
(* ****** ****** *)
//
#implval L0AZY_TBOX_symbl = symbl("lazy_t0_x0")
#implval L1AZY_VTBX_symbl = symbl("lazy_vt_vx")
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_xsymbol_inits0.dats] *)
