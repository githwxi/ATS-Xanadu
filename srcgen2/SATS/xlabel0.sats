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
SYM = "./xsymbol.sats"

(* ****** ****** *)
datatype label =
| LABint of sint
| LABsym of $SYM.sym_t
(* ****** ****** *)
#typedef lab_t = label
(* ****** ****** *)
(*
#abstbox label_tbox
#typedef label = label_tbox
*)
(* ****** ****** *)
fun label_none(): label
(* ****** ****** *)
//
(*
fun
label_eq(label, label): bool
*)
fun
label_cmp(label, label): sint
//
(* ****** ****** *)
//
fun
label_fprint(FILR, label): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****************************************** *)
(* ****************************************** *)

(* end of [ATS3/XATSOPT_srcgen2_SATS_xlabel0.sats] *)
