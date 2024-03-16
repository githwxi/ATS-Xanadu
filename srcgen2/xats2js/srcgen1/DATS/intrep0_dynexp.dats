(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
//
Thu 14 Mar 2024 08:10:28 PM EDT
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
//
#include
"./../HATS/libxats2js.hats"
//
(* ****** ****** *)
//
#staload
"./../../../SATS/staexp2.sats"
#staload
"./../../../SATS/statyp2.sats"
//
(* ****** ****** *)
//
#staload
"./../../../SATS/dynexp3.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
//
(* ****** ****** *)
//
#staload
_(*DATS*)="./../DATS/intrep0.dats"
//
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with d3pat_get_lctn
#symload node with d3pat_get_node
(* ****** ****** *)
#symload lctn with d3exp_get_lctn
#symload node with d3exp_get_node
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxd3i0_d3pat
(env0 , d3p0) =
(
case+
d3p0.node() of
//
|D3Pany
((*0*)) =>
i0pat(loc0, I0Pany(   ))
|D3Pvar
( d2v ) =>
i0pat(loc0, I0Pvar(d2v))
//
|D3Pint
( tok ) =>
i0pat(loc0, I0Pint(tok))
|D3Pbtf
( sym ) =>
i0pat(loc0, I0Pbtf(sym))
|D3Pchr
( tok ) =>
i0pat(loc0, I0Pchr(tok))
|D3Pflt
( tok ) =>
i0pat(loc0, I0Pflt(tok))
|D3Pstr
( tok ) =>
i0pat(loc0, I0Pstr(tok))
//
) where
{
//
(* ****** ****** *)
//
val loc0 = d3p0.lctn((*0*))
//
(* ****** ****** *)
val (  ) =
prerrln("trxd3i0_d3pat: d3p0 = ", d3p0)
(* ****** ****** *)
//
}(*where*) // end of [trxd3i0_d3pat(...)]
//
(* ****** ****** *)
//
#implfun
trxd3i0_l3d3p
( env0,ld3p ) =
let
//
val+
D3LAB
(lab0, d3p1) = ld3p
//
in//let
I0LAB(lab0, trxd3i0_d3pat(env0, d3p1))
end (*let*)//end-of-[trxd3i0_l3d3p(env0,ld3p)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxd3i0_d3exp
(env0 , d3e0) =
(
case+
d3e0.node() of
//
|D3Eint
( tok ) =>
i0exp(loc0, I0Eint(tok))
|D3Ebtf
( sym ) =>
i0exp(loc0, I0Ebtf(sym))
|D3Echr
( tok ) =>
i0exp(loc0, I0Echr(tok))
|D3Eflt
( tok ) =>
i0exp(loc0, I0Eflt(tok))
|D3Estr
( tok ) =>
i0exp(loc0, I0Estr(tok))
//
|D3Evar
( d2v ) =>
i0exp(loc0, I0Evar(d2v))
//
|D3Elet0 _ => f0_let0(env0, d3e0)
//
|_(* otherwise *) => i0exp_none1(d3e0)
//
) where
{
//
(* ****** ****** *)
//
val loc0 = d3e0.lctn((*0*))
//
(* ****** ****** *)
//
fun
f0_let0
( env0:
! trdienv
, d3e0: d3exp): i0exp =
let
//
val-
D3Elet0
( dcls, d3e1) = d3e0.node()
//
val dcls =
trxd3i0_d3eclist(env0, dcls)
val i0e1 =
(
  trxd3i0_d3exp(env0, d3e1))
//
in//let
(
  i0exp_make_node
  (loc0, I0Elet0( dcls, i0e1 )))
end(*let*)//end-of-[f0_let0(env0,d3e0)]
//
(* ****** ****** *)
//
val (  ) =
prerrln("trxd3i0_d3exp: d3e0 = ", d3e0)
//
(* ****** ****** *)
//
}(*where*) // end of [trxd3i0_d3exp(...)]
//
(* ****** ****** *)
//
#implfun
trxd3i0_l3d3e
( env0,ld3e ) =
let
//
val+
D3LAB
(lab0, d3e1) = ld3e
//
in//let
I0LAB(lab0, trxd3i0_d3exp(env0, d3e1))
end (*let*)//end-of-[trxd3i0_l3d3e(env0,ld3e)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxd3i0_d3patlst
( env0, d3ps ) =
(
  list_trxd3i0_fnp(env0, d3ps, trxd3i0_d3pat))
//
(* ****** ****** *)
//
#implfun
trxd3i0_d3explst
( env0, d3es ) =
(
  list_trxd3i0_fnp(env0, d3es, trxd3i0_d3exp))
//
#implfun
trxd3i0_d3expopt
( env0, dopt ) =
(
  optn_trxd3i0_fnp(env0, dopt, trxd3i0_d3exp))
//
(* ****** ****** *)
//
#implfun
trxd3i0_l3d3plst
( env0, ldps ) =
(
  list_trxd3i0_fnp(env0, ldps, trxd3i0_l3d3p))
//
#implfun
trxd3i0_l3d3elst
( env0, ldes ) =
(
  list_trxd3i0_fnp(env0, ldes, trxd3i0_l3d3e))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxd3i0_d3gualst
( env0, d3gs) =
(
  list_trxd3i0_fnp(env0, d3gs, trxd3i0_d3gua))
//
#implfun
trxd3i0_d3clslst
( env0, dcls) =
(
  list_trxd3i0_fnp(env0, dcls, trxd3i0_d3cls))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_DATS_intrep0_dynexp.dats] *)
(***********************************************************************)
