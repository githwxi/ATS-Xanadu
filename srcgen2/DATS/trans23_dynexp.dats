(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
Sun 19 Feb 2023 09:42:43 AM EST
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
_(*TRANS23*) = "./trans23.dats"
(* ****** ****** *)
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/trans23.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with d2pat_get_lctn
#symload node with d2pat_get_node
#symload styp with d2pat_get_styp
(* ****** ****** *)
#symload lctn with d2exp_get_lctn
#symload node with d2exp_get_node
#symload styp with d2exp_get_styp
(* ****** ****** *)
#symload styp with d3pat_set_styp
#symload styp with d3exp_set_styp
(* ****** ****** *)
//
fun
d3pat_make_styp_node
( loc0: loc_t
, t2p0: s2typ
, node: d3pat_node): d3pat =
let
val
d3p0 = d3pat(loc0, node)
in
  (d3p0.styp(t2p0); d3p0) end
//
fun
d3exp_make_styp_node
( loc0: loc_t
, t2p0: s2typ
, node: d3exp_node): d3exp =
let
val
d3e0 = d3exp(loc0, node)
in
  (d3e0.styp(t2p0); d3e0) end
//
#symload
d3pat with d3pat_make_styp_node
#symload
d3exp with d3exp_make_styp_node
//
(* ****** ****** *)
//
#implfun
trans23_d2pat
( env0, d2p0 ) =
let
//
val loc0 = d2p0.lctn()
val t2p0 = d2p0.styp()
//
val (  ) = prerrln
("trans23_d2pat: d2p0 = ", d2p0)
//
in//let
//
case+
d2p0.node() of
//
|
D2Pvar(d2v) =>
d3pat_make_styp_node
(loc0, t2p0, D3Pvar(d2v))
//
|
D2Pint(tok) =>
d3pat_make_styp_node
(loc0, t2p0, D3Pint(tok))
|
D2Pbtf(sym) =>
d3pat_make_styp_node
(loc0, t2p0, D3Pbtf(sym))
|
D2Pchr(tok) =>
d3pat_make_styp_node
(loc0, t2p0, D3Pchr(tok))
|
D2Pflt(tok) =>
d3pat_make_styp_node
(loc0, t2p0, D3Pflt(tok))
|
D2Pstr(tok) =>
d3pat_make_styp_node
(loc0, t2p0, D3Pstr(tok))
//
| _(*otherwise*) => d3pat_none1(d2p0)
//
endlet where
{
//
(* ****** ****** *)
//
} (*where*)//end-of-[trans23_d2pat(env0,d2p0)]

(* ****** ****** *)

#implfun
trans23_d2patlst
  (env0, d2ps) =
(
list_trans23_fnp(env0, d2ps, trans23_d2pat))

(* ****** ****** *)
//
#implfun
trans23_d2exp
( env0, d2e0 ) =
let
//
val loc0 = d2e0.lctn()
val t2p0 = d2e0.styp()
//
val (  ) = prerrln
("trans23_d2exp: d2e0 = ", d2e0)
//
in//let
//
case+
d2e0.node() of
//
|
D2Eint(tok) =>
d3exp_make_styp_node
(loc0, t2p0, D3Eint(tok))
|
D2Ebtf(sym) =>
d3exp_make_styp_node
(loc0, t2p0, D3Ebtf(sym))
|
D2Echr(tok) =>
d3exp_make_styp_node
(loc0, t2p0, D3Echr(tok))
|
D2Eflt(tok) =>
d3exp_make_styp_node
(loc0, t2p0, D3Eflt(tok))
|
D2Estr(tok) =>
d3exp_make_styp_node
(loc0, t2p0, D3Estr(tok))
//
|D2Esym0 _ => f0_sym0(env0, d2e0)
//
|D2Edapp _ => f0_dapp(env0, d2e0)
//
| _(*otherwise*) => d3exp_none1(d2e0)
//
endlet where
{
//
(* ****** ****** *)
//
fun
f0_sym0
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
val loc0 = d2e0.lctn()
//
val-
D2Esym0
( drxp
, d1e1, dpis) = d2e0.node()
//
in//let
  trans23_d2exp(env0, drxp.dexp())
end (*let*)//end-of-[f0_sym0(env0,d2e0)]
//
(* ****** ****** *)
//
fun
f0_dapp
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
//
val loc0 = d2e0.lctn()
//
val-
D2Edapp
( d2f0
, npf1, d2es) = d2e0.node()
//
val d3f0 =
  trans23_d2exp(env0, d2f0)
val d3es =
  trans23_d2explst(env0, d2es)
//
val t2p0 = s2typ_none0((*void*))
//
in
d3exp_make_styp_node
(loc0, t2p0, D3Edapp(d3f0, npf1, d3es))
end (*let*)//end of [f0_dapp(env0,d2e0)]
//
(* ****** ****** *)
//
} (*where*)//end-of-[trans23_d2exp(env0,d2e0)]

(* ****** ****** *)

#implfun
trans23_d2explst
  (env0, d2es) =
(
list_trans23_fnp(env0, d2es, trans23_d2exp))

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans23_dynexp.dats] *)
