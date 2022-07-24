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
(*
Sun Jul 24 17:58:32 EDT 2022
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
LOC = "./locinfo.sats"
//
#typedef lab_t = $LAB.lab_t
#typedef label = $LAB.label
#typedef loc_t = $LOC.loc_t
#typedef loctn = $LOC.loctn
//
(* ****** ****** *)
//
#staload
SYM = "./xsymbol.sats"
#staload
LEX = "./lexing0.sats"
//
#typedef sym_t = $SYM.sym_t
#typedef token = $LEX.token
//
(* ****** ****** *)
#staload S0E = "./staexp0.sats"
(* ****** ****** *)
//
datatype g1nam =
//
| G1Nnil of ()
//
| G1Nid0 of sym_t
//
| G1Nint of (int)
| G1Nflt of double
| G1Nstr of string
//
| G1Nlist of (g1namlst)
//
| G1Nnone0 of () // HX: EMPTY
| G1Nnone1 of (g0nam) // ERROR!
//
where
{
#typedef g0nam = $S0E.g0nam
#typedef g1namlst = list(g1nam)
#typedef g1namopt = optn(g1nam)
} (*where*) // end-of(datatype(g1nam))
//
(* ****** ****** *)
#abstbox g1exp_tbox // ptr
#abstype g1mac_tbox // ptr
(* ****** ****** *)
#abstbox g1mag_tbox // ptr
(* ****** ****** *)
//
#typedef g0exp = $S0E.g0exp
//
#typedef g1exp = g1exp_tbox
#typedef g1mac = g1mac_tbox
#typedef g1arg = token(*sym*)
#typedef g1mag = g1mag_tbox
//
#typedef g1explst = list(g1exp)
#typedef g1expopt = optn(g1exp)
//
#typedef g1arglst = list(g1arg)
#typedef g1maglst = list(g1mag)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_staexp1.sats] *)
