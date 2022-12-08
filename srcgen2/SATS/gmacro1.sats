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
Sat 03 Dec 2022 11:12:20 AM EST
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
#typedef symbl = $SYM.symbl
#typedef token = $LEX.token
//
(* ****** ****** *)
//
#staload
S1E = "./staexp1.sats"
#staload
D1E = "./dynexp1.sats"
//
#typedef g1exp = $S1E.g1exp
#typedef g1arg = $S1E.g1arg
#typedef g1mag = $S1E.g1mag
#typedef s1exp = $S1E.s1exp
#typedef d1pat = $D1E.d1pat
#typedef d1exp = $D1E.d1exp
//
(* ****** ****** *)
(*
#abstype g1id0_tbox // ptr
*)
(* ****** ****** *)
#abstbox g1env_tbox // ptr
(* ****** ****** *)
//
#typedef g1id0 = (sym_t)
//
(* ****** ****** *)
(*
#typedef g1id0 = g1id0_tbox
*)
(* ****** ****** *)
#typedef g1ids = list(g1id0)
#typedef g1env = (g1env_tbox)
(* ****** ****** *)
#typedef g1expopt = optn(g1exp)
#typedef g1maglst = list(g1mag)
(* ****** ****** *)
//
datatype g1mac =
//
| G1Mint of sint
| G1Mbtf of bool
| G1Mchr of char
| G1Mflt of dflt
| G1Mstr of strn
//
| G1Mid0 of g1id0
//
(* ****** ****** *)
//
| G1Msexp of s1exp
| G1Mdpat of d1pat
| G1Mdexp of d1exp
//
(* ****** ****** *)
//
| G1Mif0 of
  ( g1mac(*cond*)
  , g1mac(*then*)
  , g1mac(*else*) )
//
(* ****** ****** *)
|
G1Mlam0 of
( g1ids(*marg*)
, g1mac(*body*) )
|
G1Mapps of
( g1mac(*fun*)
, g1maclst(*args*))
(* ****** ****** *)
//
| G1Msubs of
  ( g1mac
  , g1env(*subs*) )
//
(* ****** ****** *)
//
| G1Mnone0 of () // HX: EMPTY
| G1Mnone1 of (g1exp) // HX: ERROR!
//
where
{
#typedef g1maclst = list(g1mac) // lists
}
//
(* ****** ****** *)
fun
g1mac_fprint:(FILR,g1mac)->void
(* ****** ****** *)
fun
g1env_fprint:(FILR,g1env)->void
(* ****** ****** *)
#absvtbx tr11env_vtbx
#vwtpdef tr11env = tr11env_vtbx
(* ****** ****** *)
//
fun
tr11env_make_nil(): tr11env
//
(* ****** ****** *)
//
#vwtpdef
g1macopt_vt = optn_vt(g1mac)
//
fun
tr11env_search_opt
( env0:
! tr11env, key: sym_t): g1macopt_vt
//
(* ****** ****** *)
//
fun
tr11env_insert_any
( env0:
! tr11env, key: sym_t, itm: g1mac): void
//
(* ****** ****** *)
//
fun
trans11_gmdef
( gmas
: g1maglst, def1: g1expopt): g1mac
//
(* ****** ****** *)
//
fun
trans11_g1mac
(env0: !tr11env, g1m0: g1mac): g1mac
//
fun
trans11_g1mac_apps
( env0: !tr11env
, g1f0: g1mac, g1ms: g1maclst): g1mac
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_gmacro1.sats] *)
