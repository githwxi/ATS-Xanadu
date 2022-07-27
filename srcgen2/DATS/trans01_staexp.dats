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
Tue Jul 26 11:26:29 EDT 2022
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload
_(*XFIXITY*) = "./xfixity.dats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/xfixity.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
(* ****** ****** *)
#staload "./../SATS/trans01.sats"
(* ****** ****** *)

#sexpdef fxitm = fxitm

(* ****** ****** *)
#typedef g1efx = fxitm(g1exp)
#typedef g1efxlst = list(g1efx)
(* ****** ****** *)
#typedef s1tfx = fxitm(sort1)
#typedef s1efx = fxitm(s1exp)
#typedef s1tfxlst = list(s1tfx)
#typedef s1efxlst = list(s1efx)
(* ****** ****** *)

fun
fxitmlst_resolve_g1exp
( loc0: loc_t
, itms: g1efxlst): g1exp =
let
//
#impltmp
fxitm_infix0<g1exp>
  (x0, f1, x2) =
let
val loc0 =
x0.lctn() + x2.lctn()
val g1en =
(
  case+
  f1.node() of
  | G1Ea0pp() =>
    G1Ea1pp(x0, x2)
  | _(*non-G1Eapp*) =>
    G1Ea2pp(f1, x0, x2)
) : g1exp_node // end of [val]
in
  FXITMatm(g1exp(loc0, g1en))
end // end of [$FIX.fxitm_infix0]
//
#impltmp
fxitm_prefix<g1exp>
  (f0, x1) = let
  val loc0 =
  f0.lctn() + x1.lctn()
in
  FXITMatm
  (g1exp(loc0, G1Ea1pp(f0, x1)))
end // end of [$FIX.fxitm_prefix]
//
#impltmp
fxitm_pstfix<g1exp>
  (x0, f1) = let
  val loc0 =
  x0.lctn() + f1.lctn()
in
  FXITMatm
  (g1exp(loc0, G1Ea1pp(f1, x0)))
end // end of [$FIX.fxitm_pstfix]
//
#impltmp
fxatm_none<g1exp>
  (loc) =
  g1exp_none0(loc)
#impltmp
fxopr_get_lctn<g1exp>
  (opr) = opr.lctn()
//
#impltmp
fxitm_get_lctn<g1exp>
  (itm) =
(
case+ itm of
| FXITMatm(x0) => x0.lctn()
| FXITMopr(x0, _) => x0.lctn()
) (* end of [$FIX.fxitm_get_lctn] *)
//
#impltmp
fxitmlst_resolve$appopr<g1exp>
  (itm) = let
//
val g1e1 =
g1exp
(loc0, G1Ea0pp(*void*)) where
{
val loc0 =
$FIX.fxitm_get_lctn<g1exp>(itm)
}
//
in//let
  $FIX.FXITMopr(g1e1, app_fixty)
end // end of [$FIX.fxitmlst_resolve$appopr]
//
in//let
  fxitmlst_resolve<g1exp>(loc0, itms)
end (*let*) // end of [fxitmlst_resolve_g1exp]

(* ****** ****** *)

fun
fxitmlst_resolve_sort1
( loc0: loc_t
, itms: s1tfxlst): sort1 =
let
//
#impltmp
fxitm_infix0<sort1>
  (x0, f1, x2) =
let
val loc0 =
x0.lctn() + x2.lctn()
val s1tn =
(
  case+
  f1.node() of
  | S1Ta0pp() =>
    S1Ta1pp(x0, x2)
  | _(*non-S1Tapp*) =>
    S1Ta2pp(f1, x0, x2)
) : sort1_node // end of [val]
in
  FXITMatm(sort1(loc0, s1tn))
end // end of [$FIX.fxitm_infix0]
//
#impltmp
fxitm_prefix<sort1>
  (f0, x1) = let
  val loc0 =
  f0.lctn() + x1.lctn()
in
  FXITMatm
  (sort1(loc0, S1Ta1pp(f0, x1)))
end // end of [$FIX.fxitm_prefix]
//
#impltmp
fxitm_pstfix<sort1>
  (x0, f1) = let
  val loc0 =
  x0.lctn() + f1.lctn()
in
  FXITMatm
  (sort1(loc0, S1Ta1pp(f1, x0)))
end // end of [$FIX.fxitm_pstfix]
//
#impltmp
fxatm_none<sort1>
  (loc) =
  sort1_none0(loc)
#impltmp
fxopr_get_lctn<sort1>
  (opr) = opr.lctn()
//
#impltmp
fxitm_get_lctn<sort1>
  (itm) =
(
case+ itm of
| FXITMatm(x0) => x0.lctn()
| FXITMopr(x0, _) => x0.lctn()
) (* end of [$FIX.fxitm_get_lctn] *)
//
#impltmp
fxitmlst_resolve$appopr<sort1>
  (itm) = let
//
val s1t1 =
sort1
(loc0, S1Ta0pp(*void*)) where
{
val loc0 =
$FIX.fxitm_get_lctn<sort1>(itm)
}
//
in//let
  $FIX.FXITMopr(s1t1, app_fixty)
end // end of [$FIX.fxitmlst_resolve$appopr]
//
in//let
  fxitmlst_resolve<sort1>(loc0, itms)
end (*let*) // end of [fxitmlst_resolve_sort1]

(* ****** ****** *)

fun
fxitmlst_resolve_s1exp
( loc0: loc_t
, itms: s1efxlst): s1exp =
let
//
#impltmp
fxitm_infix0<s1exp>
  (x0, f1, x2) =
let
val loc0 =
x0.lctn() + x2.lctn()
val s1en =
(
  case+
  f1.node() of
  | S1Ea0pp() =>
    S1Ea1pp(x0, x2)
  | _(*non-S1Eapp*) =>
    S1Ea2pp(f1, x0, x2)
) : s1exp_node // end of [val]
in
  FXITMatm(s1exp(loc0, s1en))
end // end of [$FIX.fxitm_infix0]
//
#impltmp
fxitm_prefix<s1exp>
  (f0, x1) = let
  val loc0 =
  f0.lctn() + x1.lctn()
in
  FXITMatm
  (s1exp(loc0, S1Ea1pp(f0, x1)))
end // end of [$FIX.fxitm_prefix]
//
#impltmp
fxitm_pstfix<s1exp>
  (x0, f1) = let
  val loc0 =
  x0.lctn() + f1.lctn()
in
  FXITMatm
  (s1exp(loc0, S1Ea1pp(f1, x0)))
end // end of [$FIX.fxitm_pstfix]
//
#impltmp
fxatm_none<s1exp>
  (loc) =
  s1exp_none0(loc)
#impltmp
fxopr_get_lctn<s1exp>
  (opr) = opr.lctn()
//
#impltmp
fxitm_get_lctn<s1exp>
  (itm) =
(
case+ itm of
| FXITMatm(x0) => x0.lctn()
| FXITMopr(x0, _) => x0.lctn()
) (* end of [$FIX.fxitm_get_lctn] *)
//
#impltmp
fxitmlst_resolve$appopr<s1exp>
  (itm) = let
//
val s1e1 =
s1exp
(loc0, S1Ea0pp(*void*)) where
{
val loc0 =
$FIX.fxitm_get_lctn<s1exp>(itm)
}
//
in//let
  $FIX.FXITMopr(s1e1, app_fixty)
end // end of [$FIX.fxitmlst_resolve$appopr]
//
in//let
  fxitmlst_resolve<s1exp>(loc0, itms)
end (*let*) // end of [fxitmlst_resolve_s1exp]

(* ****** ****** *)

#implfun
trans01_g0namlst
  (g0ns) =
list_vt2t
(
list_map_vt
<g0nam><g1nam>(g0ns)) where
{
#impltmp
map$fopr<g0nam><g1nam> = trans01_g0nam
} (*where*) // end of [trans01_gnamlst(g0ns)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_trans01_staexp.dats] *)
