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
Sun 20 Nov 2022 11:00:59 AM EST
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
_(*TRANS2a*) = "./trans2a.dats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans2a.sats"
(* ****** ****** *)
//
fun
s2typlst_of_d2explst
( d2es
: d2explst ): s2typlst =
(
list_map<x0><y0>(d2es)) where
{
#typedef x0 = d2exp
#typedef y0 = s2typ
#impltmp
map$fopr<x0><y0>(d2e) = d2e.styp()
}
// end of [ s2typlst_of_d2explst ]
//
#symload
s2typlst with s2typlst_of_d2explst
//
(* ****** ****** *)
//
fun
d2exp_make_styp_node
( loc0: loc_t
, t2p0: s2typ
, node: d2exp_node): d2exp =
let
val
d2e0 = d2exp(loc0, node)
in
  (d2e0.styp(t2p0); d2e0) end
//
#symload
d2exp with d2exp_make_styp_node
//
(* ****** ****** *)
//
#implfun
trans2a_d2pat
( env0, d2p0 ) =
let
//
val () =
prerrln
("trans2a_d2pat: d2p0 = ", d2p0)
//
in//let
//
case+
d2p0.node() of
| _(*otherwise*) => d2pat_none2(d2p0)
//
endlet where
{
} (*where*) // end of [trans2a_d2pat(...)]
//
(* ****** ****** *)
//
#implfun
trans2a_d2exp
( env0, d2e0 ) =
let
//
val () =
prerrln
("trans2a_d2exp: d2e0 = ", d2e0)
//
in//let
//
case+
d2e0.node() of
//
|D2Eint _ => f0_int(env0, d2e0)
|D2Ei00 _ => f0_i00(env0, d2e0)
//
|D2Etup0 _ => f0_tup0(env0, d2e0)
//
| _(*otherwise*) => d2exp_none2(d2e0)
//
endlet where
{
//
(* ****** ****** *)
//
fun
f0_int
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
(
d2exp_make_styp_node
( loc0
, t2p0, D2Eint(tok))) where
{
val loc0 = d2e0.lctn()
val-
D2Eint(tok) = d2e0.node()
val t2p0 = the_s2typ_sint() }
//
(* ****** ****** *)
//
fun
f0_i00
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
(
d2exp_make_styp_node
( loc0
, t2p0, D2Ei00(int))) where
{
val loc0 = d2e0.lctn()
val-
D2Ei00(int) = d2e0.node()
val t2p0 = the_s2typ_sint() }
//
(* ****** ****** *)
//
fun
f0_tup0
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
(
d2exp_make_styp_node
( loc0, t2p0
, D2Etup0(npf1, d2es))) where
{
val loc0 = d2e0.lctn()
val-
D2Etup0
(npf1, d2es) = d2e0.node()
val
d2es = trans2a_d2explst(env0, d2es)
val
t2p0 = s2typ_tup0(npf1, s2typlst(d2es))
} (*where*) // end of [f0_tup0(env0,d2e0)]
//
} (*where*) // end of [trans2a_d2exp(...)]
//
(* ****** ****** *)
//
#implfun
trans2a_d2patlst
( env0, d2ps ) =
list_trans2a_fnp(env0, d2ps, trans2a_d2pat)
//
(* ****** ****** *)
//
#implfun
trans2a_d2expopt
( env0, dopt ) =
optn_trans2a_fnp(env0, dopt, trans2a_d2exp)
//
#implfun
trans2a_d2explst
( env0, d2es ) =
list_trans2a_fnp(env0, d2es, trans2a_d2exp)
//
(* ****** ****** *)
//
#implfun
trans2a_d2gualst
( env0, d2gs ) =
list_trans2a_fnp(env0, d2gs, trans2a_d2gua)
//
#implfun
trans2a_d2clslst
( env0, dcls ) =
list_trans2a_fnp(env0, dcls, trans2a_d2cls)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans2a_dynexp.dats] *)
