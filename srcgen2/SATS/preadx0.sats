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
Start Time: June 17th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME // namespace
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload
LEX = "./lexing0.sats"
#staload
S0E = "./staexp0.sats"
(* ****** ****** *)
#typedef token = $LEX.token
(* ****** ****** *)
#typedef sort0 = $S0E.sort0
#typedef s0exp = $S0E.s0exp
(* ****** ****** *)
#typedef sort0lst = $S0E.sort0lst
#typedef sort0opt = $S0E.sort0opt
#typedef s0explst = $S0E.s0explst
#typedef s0expopt = $S0E.s0expopt
(* ****** ****** *)
//
#typedef
fpreadx0
(syn: tx) =
(syn , &sint >> _) -> syn
//
(* ****** ****** *)
fun preadx0_sort0: fpreadx0(sort0)
fun preadx0_s0exp: fpreadx0(s0exp)
(* ****** ****** *)
#symload preadx0 with preadx0_sort0
#symload preadx0 with preadx0_s0exp
(* ****** ****** *)
fun
preadx0_sort0opt: fpreadx0(sort0opt)
fun
preadx0_s0expopt: fpreadx0(s0expopt)
(* ****** ****** *)
fun
preadx0_sort0lst: fpreadx0(sort0lst)
fun
preadx0_s0explst: fpreadx0(s0explst)
(* ****** ****** *)
#symload preadx0 with preadx0_sort0opt
#symload preadx0 with preadx0_s0expopt
#symload preadx0 with preadx0_sort0lst
#symload preadx0 with preadx0_s0explst
(* ****** ****** *)
//
//HX-2022-06-18: printing errmsgs
//
(* ****** ****** *)
fun sort0_fpemsg(FILR, sort0): void
fun s0exp_fpemsg(FILR, s0exp): void
fun sort0opt_fpemsg(FILR, sort0opt): void
fun s0expopt_fpemsg(FILR, s0expopt): void
fun sort0lst_fpemsg(FILR, sort0lst): void
fun s0explst_fpemsg(FILR, s0explst): void
(* ****** ****** *)

(* end of [ATS3/XATSOPT_preadx0.sats] *)
