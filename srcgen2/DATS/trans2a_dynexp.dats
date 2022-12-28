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
#symload node with s2typ_get_node
(* ****** ****** *)
#symload styp with d2var_get_styp
#symload styp with d2var_set_styp
(* ****** ****** *)
#symload styp with d2pat_get_styp
#symload styp with d2pat_set_styp
(* ****** ****** *)
#symload styp with d2exp_get_styp
#symload styp with d2exp_set_styp
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
d2pat_make_styp_node
( loc0: loc_t
, t2p0: s2typ
, node: d2pat_node): d2pat =
let
val
d2p0 = d2pat(loc0, node)
in
  (d2p0.styp(t2p0); d2p0) end
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
d2pat with d2pat_make_styp_node
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
//
|D2Pvar _ => f0_var(env0, d2p0)
//
|D2Pint _ => f0_int(env0, d2p0)
|D2Pi00 _ => f0_i00(env0, d2p0)
//
| _(*otherwise*) => d2pat_none2(d2p0)
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
, d2p0: d2pat): d2pat =
(
d2pat_make_styp_node
( loc0
, t2p0, D2Pint(tok))) where
{
val loc0 = d2p0.lctn()
val-
D2Pint(tok) = d2p0.node()
val t2p0 = the_s2typ_sint() }
//
(* ****** ****** *)
//
fun
f0_i00
( env0:
! tr2aenv
, d2p0: d2pat): d2pat =
(
d2pat_make_styp_node
( loc0
, t2p0, D2Pi00(int))) where
{
val loc0 = d2p0.lctn()
val-
D2Pi00(int) = d2p0.node()
val t2p0 = the_s2typ_sint() }
//
(* ****** ****** *)
//
fun
f0_var
( env0:
! tr2aenv
, d2p0: d2pat): d2pat =
(
d2pat_make_styp_node
( loc0
, t2p0, D2Pvar(d2v1))) where
{
//
val loc0 = d2p0.lctn()
val-
D2Pvar(d2v1) = d2p0.node()
//
val t2p0 =
let
val t2p0 = d2v1.styp((*nil*))
in//let
(
case+
t2p0.node() of
|T2Pnone0() =>
let
val
xtp1 = x2t2p(d2v1)
val
t2p0 = s2typ_xtv(xtp1)
in//let
  (d2v1.styp(t2p0); t2p0) end
//(*let*) // end-of-[T2Pnone0]
| _(* non-T2Pnone0 *) => t2p0) end }
//
(* ****** ****** *)
//
} (*where*) // end of [trans2a_d2pat(env0,d2p0)]
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
|D2Evar _ => f0_var(env0, d2e0)
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
f0_var
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
(
d2exp_make_styp_node
( loc0
, t2p0, D2Evar(d2v1))) where
{
val loc0 = d2e0.lctn()
val-
D2Evar(d2v1) = d2e0.node()
val t2p0 = d2v1.styp((*nil*)) }
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
} (*where*) // end of [trans2a_d2exp(env0,d2e0)]
//
(* ****** ****** *)
//
(*
#implfun
trans2a_teqd2exp
  (env0, tdxp) =
(
case+ tdxp of
|
TEQD2EXPnone() =>
TEQD2EXPnone((*void*))
|
TEQD2EXPsome(teq1, d2e2) =>
TEQD2EXPsome(teq1, d2e2) where
{ val
  d2e2 = trans2a_d2exp(env0, d2e2) }
) (*case+*)//end-of(trans2a_teqd0exp(...))
*)
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
//
#implfun
trans2a_d2pat_tpck
(env0, d2p0, t2p0) =
let
val d2p0 =
trans2a_d2pat(env0, d2p0)
val ubtf =
unify2a(env0, d2p0.styp(), t2p0)
in//let
if
ubtf then d2p0 else
let
val loc0 = d2p0.lctn() in
d2pat(loc0, t2p0, D2Pt2pck(d2p0,t2p0)) end
end (*let*) // end of [trans2a_d2pat_tpck(...)]
//
(* ****** ****** *)
//
#implfun
trans2a_d2exp_tpck
(env0, d2e0, t2p0) =
let
val d2e0 =
trans2a_d2exp(env0, d2e0)
val ubtf =
unify2a(env0, d2e0.styp(), t2p0)
in//let
if
ubtf then d2e0 else
let
val loc0 = d2e0.lctn() in
d2exp(loc0, t2p0, D2Et2pck(d2e0,t2p0)) end
end (*let*) // end of [trans2a_d2exp_tpck(...)]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans2a_dynexp.dats] *)
