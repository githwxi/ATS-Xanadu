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
Wed Dec 27 18:02:19 EST 2023
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
_(*TRANS34*) = "./trans34.dats"
(* ****** ****** *)
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp4.sats"
(* ****** ****** *)
#staload "./../SATS/trans34.sats"
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with d3pat_get_lctn
#symload styp with d3pat_get_styp
#symload node with d3pat_get_node
(* ****** ****** *)
#symload lctn with d3exp_get_lctn
#symload styp with d3exp_get_styp
#symload node with d3exp_get_node
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans34_d3pat
  (env0, d3p0) =
let
//
val loc0 = d3p0.lctn()
val t2p0 = d3p0.styp()
//
(*
val (  ) = prerrln
("trans34_d3pat: loc0 = ", loc0)
val (  ) = prerrln
("trans34_d3pat: d3p0 = ", d3p0)
val (  ) = prerrln
("trans34_d3pat: t2p0 = ", t2p0)
*)
//
in//let
//
case+
d3p0.node() of
//
|D3Pany _ =>
(
  f0_any(env0, d3p0))
|D3Pvar _ =>
(
  f0_var(env0, d3p0))
//
|
D3Pint(tok) =>
(
d4pat_make_tpnd
(loc0, t2p0, D4Pint(tok)))
|
D3Pbtf(sym) =>
(
d4pat_make_tpnd
(loc0, t2p0, D4Pbtf(sym)))
|
D3Pchr(tok) =>
(
d4pat_make_tpnd
(loc0, t2p0, D4Pchr(tok)))
//
|
D3Pcon _ => f0_con(env0, d3p0)
//
| _(*otherwise*) =>
let
  val loc0 = d3p0.lctn((*void*))
in//let
(
  d4pat(loc0, t2p0, D4Pnone1(d3p0)) )
end(*let*)//end of [_(*otherwise*)] // temp
//
end where // end-of-[trans34_d3pat( ... )]
{
//
(* ****** ****** *)
//
fun
f0_any
( env0:
! tr34env
, d3p0: d3pat): d4pat =
(
d4pat_make_tpnd
( loc0
, t2p0, D4Pany())) where
{
//
val loc0 = d3p0.lctn()
val t2p0 = d3p0.styp()
val-
D3Pany((*0*)) = d3p0.node()
//
}(*where*)//end-of-[f0_any(env0,d3p0)]
//
(* ****** ****** *)
//
fun
f0_var
( env0:
! tr34env
, d3p0: d3pat): d4pat =
(
d4pat_make_tpnd
( loc0
, t2p0, D4Pvar(d2v1))) where
{
//
val loc0 = d3p0.lctn()
val t2p0 = d3p0.styp()
val-D3Pvar(d2v1) = d3p0.node()
//
}(*where*)//end-of-[f0_var(env0,d3p0)]
//
(* ****** ****** *)
//
fun
f0_con
( env0:
! tr34env
, d3p0: d3pat): d4pat =
(
d4pat_make_tpnd
( loc0
, t2p0, D4Pcon(d2c1))) where
{
//
val loc0 = d3p0.lctn()
val t2p0 = d3p0.styp()
val-D3Pcon(d2c1) = d3p0.node()
//
}(*where*)//end-of-[f0_var(env0,d3p0)]
//
(* ****** ****** *)
//
}(*where*)//end of [trans34_d3pat(env0,d3p0)]
//
(* ****** ****** *)
//
#implfun
trans34_l3d3p
( env0,ld3p ) =
let
//
val+
D3LAB(lab0, d3p1) = ld3p
//
in//let
(
  D4LAB(lab0, trans34_d3pat(env0, d3p1)) )
end(*let*)//end-of-[trans33_l3d3p(env0,ld3p)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans34_d3exp
  (env0, d3e0) =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
(*
val (  ) = prerrln
("trans34_d3exp: loc0 = ", loc0)
val (  ) = prerrln
("trans34_d3exp: d3e0 = ", d3e0)
val (  ) = prerrln
("trans34_d3exp: t2p0 = ", t2p0)
*)
//
in//let
//
case+
d3e0.node() of
//
|
D3Eint(tok) =>
(
d4exp_make_tpnd
(loc0, t2p0, D4Eint(tok)))
|
D3Ebtf(sym) =>
(
d4exp_make_tpnd
(loc0, t2p0, D4Ebtf(sym)))
|
D3Echr(tok) =>
(
d4exp_make_tpnd
(loc0, t2p0, D4Echr(tok)))
//
| _(*otherwise*) =>
let
  val loc0 = d3e0.lctn((*0*))
in//let
(
  d4exp(loc0, t2p0, D4Enone1(d3e0)) )
end(*let*)//end of [_(*otherwise*)] // temp
//
end where // end-of-[trans34_d3exp( ... )]
{
//
(* ****** ****** *)
//
}(*where*)//end of [trans34_d3exp(env0,d3e0)]
//
(* ****** ****** *)
//
#implfun
trans34_l3d3e
( env0,ld3e ) =
let
//
val+
D3LAB(lab0, d3e1) = ld3e
//
in//let
(
  D4LAB(lab0, trans34_d3exp(env0, d3e1)) )
end(*let*)//end-of-[trans33_l3d3e(env0,ld3e)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans34_d3explst
  (env0, d3es) =
(
  list_trans34_fnp(env0, d3es, trans34_d3exp))
//
#implfun
trans34_d3expopt
  (env0, dopt) =
(
  optn_trans34_fnp(env0, dopt, trans34_d3exp))
//
(* ****** ****** *)
//
#implfun
trans34_l3d3elst
  (env0, ldes) =
(
  list_trans34_fnp(env0, ldes, trans34_l3d3e))
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans34_dynexp.dats] *)
