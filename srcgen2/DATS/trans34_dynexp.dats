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
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
#staload "./../SATS/dynexp4.sats"
(* ****** ****** *)
#staload "./../SATS/trans34.sats"
(* ****** ****** *)
#symload boxq with sort2_boxq
(* ****** ****** *)
#symload linq with s2typ_linq
(* ****** ****** *)
#symload node with token_get_node
(* ****** ****** *)
#symload node with s2typ_get_node
(* ****** ****** *)
#symload styp with d2var_get_styp
#symload styp with d2var_set_styp
(* ****** ****** *)
#symload lctn with d3pat_get_lctn
#symload styp with d3pat_get_styp
#symload node with d3pat_get_node
(* ****** ****** *)
#symload lctn with d3exp_get_lctn
#symload styp with d3exp_get_styp
#symload node with d3exp_get_node
(* ****** ****** *)
#symload lctn with f3arg_get_lctn
#symload node with f3arg_get_node
(* ****** ****** *)
//
#symload lctn with d3gua_get_lctn
#symload node with d3gua_get_node
//
#symload lctn with d3gpt_get_lctn
#symload node with d3gpt_get_node
//
#symload lctn with d3cls_get_lctn
#symload node with d3cls_get_node
//
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with d4pat_get_lctn
#symload styp with d4pat_get_styp
#symload node with d4pat_get_node
(* ****** ****** *)
#symload lctn with d4exp_get_lctn
#symload styp with d4exp_get_styp
#symload node with d4exp_get_node
(* ****** ****** *)
#symload lctn with d4gua_get_lctn
#symload node with d4gua_get_node
(* ****** ****** *)
(* ****** ****** *)
//
fun
s2typ_delft
(t2p0: s2typ): s2typ =
(
case+
t2p0.node() of
|
T2Plft(t2p1) => t2p1
|
_(*non-T2Plft*) => t2p0)
//
(* ****** ****** *)
//
fun
s2typ_new0_x2tp
( loc0: loc_t ): s2typ =
(
s2typ_xtv
(x2t2p_make_lctn(loc0)))
//
(* ****** ****** *)
//
fun
s2typ_top1
(t2p0: s2typ): s2typ =
let
val s2t0 =
(
if
boxq(s2t0)
then the_sort2_tbox(*0*)
else the_sort2_type(*0*))
: sort2 // end-of-[val]
in//let
s2typ(s2t0, T2Ptop1(t2p0))
end where
{
  val s2t0 = t2p0.sort((*0*)) }
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d4exp_dvts
( d4e0: d4exp
, dvts: d2vts): d4exp =
let
//
val loc0 = d4e0.lctn()
val t2p0 = d4e0.styp()
//
in//let
(
d4exp_make_tpnd
(loc0,t2p0,D4Edvts(d4e0, dvts)))
end//let//end-of-[d4exp_dvts(...)]
//
(* ****** ****** *)
//
fun
d4exp_dvtck
( d4e0: d4exp
, tcks: dvtcklst): d4exp =
let
//
  val loc0 = d4e0.lctn()
  val t2p0 = d4e0.styp()
//
in//let
(
d4exp_make_tpnd
(loc0,t2p0,D4Edvtck(d4e0, tcks)))
end//let//end-of-[d4exp_dvtck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d4gpt_get_dpat
( dgpt: d4gpt): d4pat =
(
case+ dgpt.node() of
| D4GPTpat(dpat) => dpat
| D4GPTgua(dpat, d4gs) => dpat)
//
(* ****** ****** *)
//
fun
d4exp_get_dvts
( d4e0: d4exp): d2vts =
(
case+
d4e0.node() of
| D4Edvts(_, dvts) => dvts
| _(*non-D4Edvts*) => list_nil())
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d4exp_none0_void
  (loc0: loc_t): d4exp =
let
//
val t2p0 =
(
  the_s2typ_void((*void*)))
//
in//let
(
  d4exp(loc0, t2p0, D4Enone0()))
end(*let*)//end-of[d4exp_none0_void]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d4pat_t2pck
( d4p0: d4pat
, stp1: s2typ): d4pat =
let
//
val loc0 = d4p0.lctn()
val t2p0 = d4p0.styp()
//
in//let
(
d4pat_make_tpnd
(loc0,t2p0,D4Pt2pck(d4p0, stp1)))
end//let//end-of-[d4pat_t2pck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d4exp_t2pck
( d4e0: d4exp
, stp1: s2typ): d4exp =
let
//
val loc0 = d4e0.lctn()
val t2p0 = d4e0.styp()
//
in//let
(
d4exp_make_tpnd
(loc0,t2p0,D4Et2pck(d4e0, stp1)))
end//let//end-of-[d4exp_t2pck(...)]
//
(* ****** ****** *)
//
fun
d4exp_p2tck
( d4e0: d4exp
, stp1: s2typ): d4exp =
let
//
val loc0 = d4e0.lctn()
val t2p0 = d4e0.styp()
//
in//let
(
d4exp_make_tpnd
(loc0,t2p0,D4Ep2tck(d4e0, stp1)))
end//let//end-of-[d4exp_p2tck(...)]
//
(* ****** ****** *)
//
fun
d4exp_linex
( d4e0: d4exp
, stp1: s2typ): d4exp =
let
//
val loc0 = d4e0.lctn()
val t2p0 = d4e0.styp()
//
in//let
(
d4exp_make_tpnd
(loc0,t2p0,D4Elinex(d4e0, stp1)))
end//let//end-of-[d4exp_linex(...)]
//
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
|D3Pint(tok) =>
(
d4pat_make_tpnd
( loc0
, t2p0, D4Pint(tok)))
|D3Pbtf(sym) =>
(
d4pat_make_tpnd
( loc0
, t2p0, D4Pbtf(sym)))
|D3Pchr(tok) =>
(
d4pat_make_tpnd
( loc0
, t2p0, D4Pchr(tok)))
//
(* ****** ****** *)
//
|D3Pcon _ =>
(
  f0_con(env0, d3p0) )
//
(* ****** ****** *)
//
|D3Pdapp _ =>
(
  f0_dapp(env0, d3p0) )
//
(* ****** ****** *)
//
|D3Pannot _ =>
(
  f0_annot(env0, d3p0) )
//
(* ****** ****** *)
//
|
_(* otherwise *) =>
let
(*
  val loc0 = d3p0.lctn((*void*))
*)
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
}(*where*)//end-of-[f0_con(env0,d3p0)]
//
(* ****** ****** *)
//
fun
f0_dapp
( env0:
! tr34env
, d3p0: d3pat): d4pat =
let
//
val loc0 = d3p0.lctn()
//
val-
D3Pdapp
( d3f0
, npf1
, d3ps) = d3p0.node((*0*))
//
val
d4f0 =
(
 trans34_d3pat(env0, d3f0))
val d4ps =
trans34_d3patlst(env0, d3ps)
//
val tfun = d4f0.styp((*nil*))
//
val targ =
(
case+
tfun.node() of
|
T2Pfun1
( f2cl, npf1
, t2ps, tres) => t2ps
| _(*else*) => list_nil()): s2typlst
val tres =
(
case+
tfun.node() of
|
T2Pfun1
( f2cl
, npf1, t2ps, tres) => tres
| _(* non-T2Pfun1 *) => tfun): s2typ
//
(*
val () =
prerrln
("trans34_d3pat:f0_dapp:tfun = ",tfun)
val () =
prerrln
("trans34_d3pat:f0_dapp:targ = ",targ)
val () =
prerrln
("trans34_d3pat:f0_dapp:tres = ",tres)
*)
//
in//let
let
val d4ps =
trans34_d4patlst_tpcks
(env0, loc0, d4ps, targ)
in
  d4pat_make_tpnd
  (loc0, tres, D4Pdapp(d4f0,npf1,d4ps))
end (*let*)
end (*let*) // end of [f0_dapp(env0,d3p0)]
//
(* ****** ****** *)
//
fun
f0_annot
( env0:
! tr34env
, d3p0: d3pat): d4pat =
let
//
val loc0 = d3p0.lctn()
//
val-
D3Pannot
( d3p1
, s1e2, s2e2) = d3p0.node()
//
(*
val
t2p2 = s2exp_stpize(s2e2)
val
t2p2 = s2typ_hnfiz0(t2p2)
*)
val
t2p2 = d3p0.styp((*void*))
//
// (*
val () =
prerrln
("f0_annot(34): t2p2 = ", t2p2)
// *)
//
val d4p1 =
(
case+
d3p1.node() of
|
D3Pvar(d2v1) =>
(
(*
HX: No update!!!
*)
// d2v1.styp(t2p2);
d4pat
( loc1
, t2p2, D4Pvar(d2v1))) where
{
  val loc1 = d3p1.lctn((*0*)) }
|
_(*non-D3Pvar*) =>
trans34_d3pat_tpck(env0, d3p1, t2p2)
) : d4pat // end of [val(d4p1)]
//
in//let
d4pat_make_tpnd
(loc0, t2p2, D4Pannot(d4p1,s1e2,s2e2))
end (*let*) // end of [f0_annot(env0,...)]
//
(* ****** ****** *)
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
end(*let*)//end-of-[trans34_l3d3p(env0,ld3p)]
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
|D3Evar _ =>
(
  f0_var(env0, d3e0))
//
(* ****** ****** *)
//
|D3Eint(tok) =>
(
d4exp_make_tpnd
(loc0, t2p0, D4Eint(tok)))
|D3Ebtf(sym) =>
(
d4exp_make_tpnd
(loc0, t2p0, D4Ebtf(sym)))
|D3Echr(tok) =>
(
d4exp_make_tpnd
(loc0, t2p0, D4Echr(tok)))
//
(* ****** ****** *)
//
|D3Edapp _ => f0_dapp(env0, d3e0)
//
(* ****** ****** *)
//
|D3Elet0 _ => f0_let0(env0, d3e0)
//
(* ****** ****** *)
//
|D3Eift0 _ => f0_ift0(env0, d3e0)
|D3Ecas0 _ => f0_cas0(env0, d3e0)
//
(* ****** ****** *)
//
|D3Eseqn _ => f0_seqn(env0, d3e0)
//
(* ****** ****** *)
//
|D3Etup0 _ => f0_tup0(env0, d3e0)
|D3Etup1 _ => f0_tup1(env0, d3e0)
//
(* ****** ****** *)
//
|D3Eflat _ => f0_flat(env0, d3e0)
//
(* ****** ****** *)
//
|D3Eassgn _ => f0_assgn(env0, d3e0)
//
(* ****** ****** *)
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
fun
f0_var
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Evar(d2v1) = d3e0.node()
//
in//let
if
d2var_mutq(d2v1)
then
(
  f1_mutq(env0, d3e0))
else let
//
val
opt1 =
tr34env_stprch_dvar
  (env0, d2v1) //val(opt1)
//
val
t2p1 =
(
case+ opt1 of
| ~
optn_vt_nil
( (*nil*) ) => d2v1.styp()
| ~
optn_vt_cons(t2p1) => t2p1)
: s2typ // end-of-[val(t2p1)]
//
val () =
(
if
linq(t2p1)
then
let
val t2p1 =
s2typ_top1(t2p1)
in//let
tr34env_d2vins_dget
( env0
, d2v1, D4TYPstp(t2p1)) end )
//
in//let
  d4exp_make_tpnd
  (loc0, t2p1, D4Evar(d2v1)) end
end where // end-of-let//val()
{
//
fun
f1_mutq
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
//
val
loc0 = d3e0.lctn()
val-
D3Evar(d2v1) = d3e0.node()
//
val
opt1 =
tr34env_stprch_dvar
  (env0, d2v1) //val(opt1)
//
val
t2p1 =
(
case+ opt1 of
| ~
optn_vt_nil
 ((*nil*)) =>
(
s2typ_delft(d2v1.styp()))
| ~
optn_vt_cons(t2p1) => t2p1)
: s2typ // end-of-[val(t2p1)]
//
val test = linq(t2p1)
//
val t2p0 = s2typ_lft(t2p1)
//
val (  ) =
if test then
let
val t2p1 =
s2typ_top1(t2p1) in//let
tr34env_d2vins_dget
(env0,d2v1,D4TYPstp(t2p1)) end
//
in//let
d4exp(loc0, t2p0, D4Evar(d2v1))
end(*let*) // end of [f1_mutq(...)]
//
}(*where*) // end of [f0_var(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_dapp
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Edapp
( d3f0
, npf1, d3es) = d3e0.node()
//
val
d4f0 =
(
  trans34_d3exp(env0, d3f0))
//
val d4es =
trans34_d3explst(env0, d3es)
//
val tfun = d4f0.styp((*nil*))
//
val targ =
(
case+
tfun.node() of
| T2Pfun1
( f2cl, npf1
, t2ps, tres) => t2ps
|_ (*else*) => list_nil()): s2typlst
val tres =
(
case+
tfun.node() of
| T2Pfun1
( f2cl
, npf1, t2ps, tres) => tres
| _(* non-T2Pfun1 *) => tfun): s2typ
//
// (*
val () =
prerrln
("trans34_d3exp:f0_dapp:tfun = ",tfun)
val () =
prerrln
("trans34_d3exp:f0_dapp:targ = ",targ)
val () =
prerrln
("trans34_d3exp:f0_dapp:tres = ",tres)
// *)
//
in//let
//
let
//
val d4es =
trans34_d4explst_tpcks
  (env0, loc0, d4es, targ) //val(d4es)
//
val d4es =
trans34_d4explst_ptcks
  (env0, loc0, d4es, targ) //val(d4es)
//
in//let
  d4exp_make_tpnd
  (loc0, tres, D4Edapp(d4f0,npf1,d4es))
end (*let*)
//
end (*let*) // end of [f0_dapp(env0,d3e0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_let0
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Elet0
( dcls, d3e1) = d3e0.node()
//
val () =
tr34env_pshlet0(env0)//enter
//
val dcls =
(
  trans34_d3eclist(env0, dcls))
//
val
d4e1 = trans34_d3exp(env0, d3e1)
//
val d2vs = tr34env_letvars( env0 )
val dvts = tr34env_getlet0( env0 )
val (  ) = tr34env_poplet0( env0 )
//
in//let
//
(
d4exp_dvts(d4e0, dvts)) where
{
//
  val t2p1 =
  d4e1.styp( (*void*) )
  val d4e1 =
  d4exp_dvts(d4e1, dvts)
//
  val dvts =
  d2vts_drop_vars(dvts, d2vs)
//
  val d4e0 =
  d4exp_make_tpnd
  (loc0, t2p1, D4Elet0(dcls, d4e1)) }
//
end (*let*) // end of [f0_let0(env0,d3e0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
fun
f1_dopt_dvts
(dopt: d4expopt): d2vts =
(
case+ dopt of
|
optn_nil() =>
list_nil((*void*))
|
optn_cons(dexp) =>
d4exp_get_dvts(dexp))//f1_dopt_dvts
//
(* ****** ****** *)
//
fun
f1_dexp_vtck
( env0:
! tr34env
, dexp: d4exp
, dvts: d2vts): d4expopt =
(
let
//
val () =
tr34env_pshift0(env0)
//
val () =
tr34env_d2vins_dvts
(env0, d4exp_get_dvts(dexp))
//
val tcks =
tr34env_d2vtck_dvts(env0, dvts)
//
val (  ) = tr34env_popift0(env0)
//
in//let
//
case+ tcks of
//
|list_nil 
( (*0*) ) =>
(
optn_cons(dexp))
//
|list_cons(_, _) =>
(
  optn_cons
  (d4exp_dvtck(dexp,tcks))) endlet
//
) where // end-of-[let]
{
//
val () = prerrln
  ( "f1_dexp_vtck: dexp = ", dexp )
val () = prerrln
  ( "f1_dexp_vtck: dvts = ", dvts )
//
}(*where*)//end-of-[f1_dexp_vtck(...)]
// 
(* ****** ****** *)
//
fun
f1_dift_dvts
( dthn: d4expopt
, dels: d4expopt): d2vts =
(
  d2vts_z2merge(xts1, xts2)
) where
{ val xts1 = f1_dopt_dvts(dthn)
  val xts2 = f1_dopt_dvts(dels)
}(*where*)//end-of-[f1_dift_dvts(...)]
//
(* ****** ****** *)
//
fun
f1_dift_tres
( dthn: d4expopt
, dels: d4expopt): s2typ =
(
case+ dthn of
|
optn_nil() =>
the_s2typ_void((*void*))
|
optn_cons(d4e2) =>
(
case+ dels of
|
optn_nil() =>
the_s2typ_void((*void*))
|
optn_cons(d4e3) => d4e2.styp()))//fun
//
(* ****** ****** *)
//
in//local
//
(* ****** ****** *)
//
fun
f0_ift0
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Eift0
( d3e1
, dthn, dels) = d3e0.node()
//
val d4e1 =
trans34_d3exp_tpck
( env0, d3e1, t2p1 ) where
{
val t2p1 = the_s2typ_bool()
}
//
val dthn =
(
  trans34_d3thn(env0, dthn))
val dels =
(
  trans34_d3els(env0, dels))
//
val
dvts = f1_dift_dvts(dthn, dels)
val
tres = f1_dift_tres(dthn, dels)
//
val dthn =
(
case+ dvts of
|
list_nil
( (*0*) ) => dthn
|
list_cons _ =>
let
val dexp =
(
case+ dthn of
|
optn_nil() =>
d4exp_none0_void(loc0)
|
optn_cons(dexp) => dexp): d4exp
in//let
  f1_dexp_vtck(env0, dexp, dvts)
end//let
)
//
val dels =
(
case+ dvts of
|
list_nil
( (*0*) ) => dels
|
list_cons _ =>
let
val dexp =
(
case+ dels of
|
optn_nil() =>
d4exp_none0_void(loc0)
|
optn_cons(dexp) => dexp): d4exp
in//let
  f1_dexp_vtck(env0, dexp, dvts)
end//let
)
//
val d4e0 =
d4exp_make_tpnd
( loc0
, tres
, D4Eift0(d4e1, dthn, dels, dvts))
in//let
(
trans34_d4ift_dvts(env0, d4e0, dvts))
end (*let*) // end of [f0_ift0(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_cas0
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
//
val loc0 = d3e0.lctn()
val-
D3Ecas0
( tknd
, d3e1, dcls) = d3e0.node()
//
val d4e1 =
(
  trans34_d3exp(env0, d3e1))
//
in//let
//
let
//
val tres =
s2typ_new0_x2tp(loc0)
val dcls =
(
trans34_d3clslst_tpck1
(env0, dcls, d4e1, tres))//val
//
val dvts = list_nil(*FIXME!!!*)
//
val d4e0 =
d4exp_make_tpnd
(loc0,tres,D4Ecas0(tknd,d4e1,dcls))
//
in//let
(
trans34_d4cas_dvts(env0, d4e0, dvts))
end (*let*)
//
end (*let*) // end of [f0_cas0(env0,d3e0)]
//
(* ****** ****** *)
//
end (*local*) // end of [local(f0_if0/cas0(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_seqn
( env0:
! tr34env
, d3e0: d3exp): d4exp =
(
d4exp_make_tpnd
( loc0
, d4e1.styp()
, D4Eseqn(d4es, d4e1))) where
{
val loc0 = d3e0.lctn()
val-
D3Eseqn
(d3es, d3e1) = d3e0.node()
//
val d4es =
trans34_d3explst_tpck1
(env0, d3es, the_s2typ_void())
//
val d4e1 = trans34_d3exp(env0, d3e1)
//
} (*where*) // end of [f0_seqn(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_tup0
( env0:
! tr34env
, d3e0: d3exp): d4exp =
(
d4exp_make_tpnd
( loc0, t2p0
, D4Etup0(npf1, d4es))) where
{
val loc0 = d3e0.lctn()
val-
D3Etup0
(npf1, d3es) = d3e0.node()
val
d4es = trans34_d3explst(env0, d3es)
val
t2p0 =
(
case+ d4es of
|list_nil() =>
the_s2typ_void()
|list_cons _ =>
s2typ_tup0(npf1, s2typlst(d4es))): s2typ
} (*where*) // end of [f0_tup0(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_tup1
( env0:
! tr34env
, d3e0: d3exp): d4exp =
(
d4exp_make_tpnd
( loc0, t2p0
, D4Etup1
  (tknd, npf1, d4es))) where
{
val loc0 = d3e0.lctn()
val-
D3Etup1
( tknd
, npf1, d3es) = d3e0.node()
val
d4es =
(
  trans34_d3explst(env0, d3es))
val
trcd =
(
case-
tknd.node() of
| T_TRCD10(0) => TRCDflt0(*void*)
| T_TRCD10(_) => TRCDbox0(*void*))
val
t2p0 =
s2typ_tup1(trcd, npf1, s2typlst(d4es))
}(*where*) // end of [f0_tup1(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_flat
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Eflat(d3e1) = d3e0.node()
//
val
d4e1 =
(
  trans34_d3exp(env0, d3e1))
//
in//let
//
let
val t2p0 =
s2typ_delft(d4e1.styp()) in
d4exp(loc0, t2p0, D4Eflat(d4e1)) end
//
end(*let*) // end-of-[f0_flat(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_assgn
( env0:
! tr34env
, d3e0: d3exp): d4exp =
let
//
val loc0 = d3e0.lctn()
val-
D3Eassgn
( d3el, d3er) = d3e0.node()
//
(*
HX-2024-03-01:
Note the ordering here:
RHS first and LHS second
*)
val
d4er = // HX: RHS-first!
(
  trans34_d3exp(env0, d3er))
val
d4el = // HX: LHS-second!
(
  trans34_d3exp(env0, d3el))
//
val t2pr = d4er.styp((*nil*))
val t2pl = d4el.styp((*nil*))
//
in//let
let
//
val t2p0 =
the_s2typ_void((*0*))
val (  ) =
trans34_d4exp_dset(env0,d4el,t2pr)
//
val d4el =
(
if
linq(t2pl)
then
d4exp_linex(d4el, t2pl) else d4el
) : d4exp // end-of-[ val( d4el ) ]
//
in//let
  d4exp
  (loc0, t2p0, D4Eassgn(d4el, d4er))
end(*let*)
end(*let*) // end-of-[f0_assgn(env0,d3e0)]
//
(* ****** ****** *)
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
end(*let*)//end-of-[trans34_l3d3e(env0,ld3e)]
//
(* ****** ****** *)
//
#implfun
trans34_d3thn
( env0, dthn ) =
(
case+ dthn of
|
optn_nil() => optn_nil()
|
optn_cons(d3e2) =>
optn_cons(d4e2) where
{
val (  ) =
tr34env_pshift0(env0)
val d4e2 =
(
  trans34_d3exp(env0, d3e2))
//
val dvts = tr34env_getift0(env0)
val (  ) = tr34env_popift0(env0)
//
(*
val (  ) =
prerrln
("trans34_d3thn: dvts = ", dvts)
*)
//
val d4e2 = d4exp_dvts(d4e2, dvts)
//
} // where // end of [optn_cons(d4e2)]
) where
{
//
val () =
prerrln("trans34_d3thn: dthn = ", dthn)
//
}(*where*)//end-of-[trans34_d3thn(env0,dthn)]
//
(* ****** ****** *)
//
#implfun
trans34_d3els
( env0, dels ) =
(
case+ dels of
|
optn_nil() => optn_nil()
|
optn_cons(d3e3) =>
optn_cons(d4e3) where
{
val (  ) =
tr34env_pshift0(env0)
val d4e3 =
(
  trans34_d3exp(env0, d3e3))
//
val dvts = tr34env_getift0(env0)
val (  ) = tr34env_popift0(env0)
//
(*
val (  ) =
prerrln
("trans34_d3els: dvts = ", dvts)
*)
//
val d4e3 = d4exp_dvts(d4e3, dvts)
//
} // where // end of [optn_cons(d4e3)]
) where
{
//
val () =
prerrln("trans34_d3els: dels = ", dels)
//
}(*where*)//end-of-[trans34_d3els(env0,dels)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans34_f3arg
( env0, farg ) =
let
//
val loc0 = farg.lctn()
//
(*
val () =
prerrln
("trans34_f3arg: loc0 = ", loc0)
val () =
prerrln
("trans34_f3arg: farg = ", farg)
*)
//
in//let
//
case+
farg.node() of
//
|
F3ARGdapp(npf1, d3ps) =>
let
val loc0 = farg.lctn()
val d4ps =
trans34_d3patlst(env0, d3ps)
in//let
f4arg(loc0,F4ARGdapp(npf1,d4ps))
end (*let*) // end of [F3ARGdapp]
//
|
F3ARGsapp
(s2vs, s2ps) =>
(
  f4arg(loc0,F4ARGsapp(s2vs,s2ps)))
|
F3ARGmets
(   s2es   ) => f4arg(loc0,F4ARGmets(s2es))
//
end(*let*)//end-of-[trans34_f3arg(env0,farg)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans34_d4aft
( env0, d4p0 ) =
let
val loc0 = d4p0.lctn()
val t2p0 = d4p0.styp()
in//let
//
case+
t2p0.node() of
//
|T2Parg1
(knd0, tinv) =>
if
knd0 = 0
then
d4pat_none0(loc0)
else
(
case+
tinv.node() of
|
T2Patx2
(tbef, taft) =>
auxmain_tpck(env0, d4p0, taft)
|
_(*non-T2Patx2*) =>
auxmain_tpck(env0, d4p0, tinv))
//
|T2Patx2
(tbef, taft) =>
(
auxmain_tpck(env0, d4p0, taft))
//
|
_(* otherwise *) => d4pat_none0(loc0)
//
end where
{
//
fun
auxmain_tpck
( env0:
! tr34env
, d4p0: d4pat
, taft: s2typ): d4pat =
let
//
val
d4p0 =
trans34_d4pxp(env0, d4p0)
//
val t2p0 = d4p0.styp((*0*))
//
val ubtf =
unify34_s2typ(env0, t2p0, taft)
in//let
(
  if // if
  ubtf then
  d4p0 else d4pat_t2pck(d4p0, taft) )
end//let//end-of-[auxmain_tpck(env0,...)]
//
}(*where*)//end-of-[trans34_d4aft(env0,d4p0)]
//
(* ****** ****** *)
//
#implfun
trans34_f4aft
( env0, farg ) =
let
//
val loc0 = farg.lctn()
//
(*
val () =
prerrln
("trans34_f4aft: loc0 = ", loc0)
val () =
prerrln
("trans34_f4aft: farg = ", farg)
*)
//
in//let
//
case+
farg.node() of
//
|
F4ARGdapp(npf1, d4ps) =>
let
val loc0 = farg.lctn()
val d4ps =
trans34_d4aftlst(env0, d4ps)
in//let
f4arg(loc0,F4ARGdapp(npf1,d4ps))
end (*let*) // end of [F4ARGdapp]
//
|
F4ARGsapp
(s2vs, s2ps) =>
(
  f4arg(loc0,F4ARGsapp(s2vs,s2ps)))
|
F4ARGmets
(   s2es   ) => f4arg(loc0,F4ARGmets(s2es))
//
end(*let*)//end-of-[trans34_f4aft(env0,farg)]
//
(* ****** ****** *)
//
#implfun
trans34_d4pxp
( env0, d4p0 ) =
(
case+
d4p0.node() of
//
|D4Pvar _ =>
(
  f0_var(env0, d4p0) )
//
|D4Pdapp _ =>
(
  f0_dapp(env0, d4p0) )
//
|D4Pannot
(d4p1, _, _) =>
(
  trans34_d4pxp(env0, d4p1) )
//
|_(*otherwise*) =>
(
let
val loc0 = d4p0.lctn()
val t2p0 = d4p0.styp()
in//let
  d4pat_make_tpnd
  (loc0, t2p0, D4Pnone0()) end)
//
) where
{
//
(* ****** ****** *)
//
fun
f0_var
( env0:
! tr34env
, d4p0: d4pat): d4pat =
let
//
val loc0 = d4p0.lctn()
//
val-
D4Pvar(d2v1) = d4p0.node()
//
val opt1 =
tr34env_stprch_dvar
  (env0, d2v1) //val(opt1)
//
val t2p1 =
(
case+ opt1 of
| ~
optn_vt_nil
( (*nil*) ) => d2v1.styp()
| ~
optn_vt_cons(t2p1) => t2p1)
: s2typ // end-of-[val(t2p1)]
//
val () =
(
if
linq(t2p1)
then
let
val t2p1 =
s2typ_top1(t2p1)
in//let
tr34env_d2vins_dget
( env0
, d2v1, D4TYPstp(t2p1)) end )
//
in//let
(
  d4pat_make_tpnd
  (loc0, t2p1, D4Pvar(d2v1)) )
end//let//end-of-[f0_var(env0,d4p0)]
//
(* ****** ****** *)
//
fun
f0_dapp
( env0:
! tr34env
, d4p0: d4pat): d4pat =
let
//
val loc0 = d4p0.lctn()
//
val-
D4Pdapp
( d4f0
, npf1
, d4ps) = d4p0.node((*0*))
//
val
d4f0 =
(
 trans34_d4pxp(env0, d4f0))
val d4ps =
trans34_d4pxplst(env0, d4ps)
//
val tfun = d4f0.styp((*nil*))
//
val targ =
(
case+
tfun.node() of
|
T2Pfun1
( f2cl, npf1
, t2ps, tres) => t2ps
| _(*else*) => list_nil()): s2typlst
val tres =
(
case+
tfun.node() of
|
T2Pfun1
( f2cl
, npf1, t2ps, tres) => tres
| _(* non-T2Pfun1 *) => tfun): s2typ
//
(*
val () =
prerrln
("trans34_d4pxp:f0_dapp:tfun = ",tfun)
val () =
prerrln
("trans34_d4pxp:f0_dapp:targ = ",targ)
val () =
prerrln
("trans34_d4pxp:f0_dapp:tres = ",tres)
*)
//
in//let
let
val d4ps =
trans34_d4patlst_tpcks
(env0, loc0, d4ps, targ)
in
  d4pat_make_tpnd
  (loc0, tres, D4Pdapp(d4f0,npf1,d4ps))
end (*let*)
end (*let*) // end of [f0_dapp(env0,d4p0)]
//
(* ****** ****** *)
//
val () =
(
  prerrln("trans34_d4pxp: d4p0 = ", d4p0))
//
}(*where*)//end-of-[trans34_d4pxp(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans34_d3gua
( env0, dgua ) =
(
case+
dgua.node() of
//
|D3GUAexp(d3e1) =>
d4gua
(
loc0, D4GUAexp(d4e1)
) where
{
//
val
loc0 = dgua.lctn((*0*))
//
val
t2p1 = the_s2typ_bool()
val
d4e1 =
trans34_d3exp_tpck(env0, d3e1, t2p1) }
//
|D3GUAmat(d3e1, d3p2) =>
d4gua
(loc0
,D4GUAmat(d4e1, d4p2)
) where
{
//
val
loc0 = dgua.lctn((*0*))
//
val
d4e1 = 
trans34_d3exp(env0, d3e1)
val
t2p1 = d4e1.styp((*void*))
val
d4p2 =
trans34_d3pat_tpck(env0, d3p2, t2p1) }
//
)(*case+*)//end-of-[trans34_d3gua(env0,...)]
//
(* ****** ****** *)
//
#implfun
trans34_d3gpt_tpck
( env0
, dgpt, targ ) =
(
case+
dgpt.node() of
//
|D3GPTpat
(  d3p1  ) =>
let
val
loc0 = dgpt.lctn()
val
d4p1 =
trans34_d3pat_tpck
(env0 , d3p1 , targ) in
d4gpt(loc0, D4GPTpat(d4p1)) end
//
|D3GPTgua
(d3p1, d3gs) =>
let
val
loc0 = dgpt.lctn()
val
d4p1 =
trans34_d3pat_tpck
(env0 , d3p1 , targ)
val
d4gs =
trans34_d3gualst(env0, d3gs) in
d4gpt(loc0, D4GPTgua(d4p1, d4gs)) end
//
)(*case+*)//end-of-[trans34_d3gpt_tpck(...)]
//
(* ****** ****** *)
//
#implfun
trans34_d3cls_tpck
( env0, dcls
, darg, tres) =
(
case+
dcls.node() of
//
|D3CLSgpt
(  dgpt  ) =>
let
//
val
loc0 = dcls.lctn()
val
targ = darg.styp()
//
val dgpt =
trans34_d3gpt_tpck
(env0, dgpt, targ)
//
val darg =
if
not
(linq(targ))
then//if-then
d4exp_none0
(darg.lctn())
else//if-else
trans34_d4arg_dgpt
(env0, darg, dgpt) in//let
(
  d4cls(loc0, D4CLSgpt(dgpt))
)
end//let//end-of-[D3CLSgpt(dgpt)]
//
|D3CLScls
(dgpt, d3e1) =>
let
//
val
loc0 = dcls.lctn()
val
targ = darg.styp()
//
val (  ) =
tr34env_pshcas0
  (  env0  ) // HX: entering
//
val dgpt =
trans34_d3gpt_tpck
(env0, dgpt, targ)//val(dgpt)
//
val (  ) =
(
tr34env_insert_dgpt(env0,dgpt))
//
(*
HX-2024-02-26:
Note that [dgpt] needs
to be put back into [darg]!
*)
//
val darg =
if
not
(linq(targ))
then // if-then
d4exp_none0(darg.lctn())
else // if-else
trans34_d4arg_dgpt(env0,darg,dgpt)
//
val d4e1 =
trans34_d3exp_tpck(env0,d3e1,tres)
//
(*
HX-2024-02-26:
Note that $fold(darg) needs to be
performed if the re-computed type
of darg is a pattern!
*)
//
val darg =
(
  trans34_d4exp_fold(env0, darg))
//
val d2vs = tr34env_casvars( env0 )
val dvts = tr34env_getcas0( env0 )
val (  ) = tr34env_popcas0( env0 )
//
in//let
//
let
//
val d4e1 =
(
  d4exp_dvts(d4e1, dvts))
val dvts =
(
  d2vts_drop_vars(dvts, d2vs))
//
in//let
(
d4cls_make_args
( loc0
, darg
, d2vs, dvts, D4CLScls(dgpt, d4e1)))
end//let
//
end//let//end-of-[ D3CLScls(dgpt,d3e1) ]
//
)(*case+*)//end-of-[trans34_d3cls_tpck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans34_d3patlst
  (env0, d3ps) =
(
  list_trans34_fnp(env0, d3ps, trans34_d3pat))
//
(* ****** ****** *)
//
#implfun
trans34_l3d3plst
  (env0, ldps) =
(
  list_trans34_fnp(env0, ldps, trans34_l3d3p))
//
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
//
#implfun
trans34_f3arglst
  (env0, f3as) =
(
  list_trans34_fnp(env0, f3as, trans34_f3arg))
//
(* ****** ****** *)
//
#implfun
trans34_d4aftlst
  (env0, d4ps) =
(
  list_trans34_fnp(env0, d4ps, trans34_d4aft))
#implfun
trans34_f4aftlst
  (env0, f4as) =
(
  list_trans34_fnp(env0, f4as, trans34_f4aft))
//
(* ****** ****** *)
//
#implfun
trans34_d4pxplst
  (env0, d4ps) =
(
  list_trans34_fnp(env0, d4ps, trans34_d4pxp))
//
(* ****** ****** *)
(* ****** ****** *)

#implfun
trans34_d3pat_tpck
(env0, d3p0, t2p0) =
let
val
d4p0 = trans34_d3pat(env0, d3p0)
in
trans34_d4pat_tpck(env0,d4p0,t2p0)
end(*let*) // end-of-[trans34_d3pat_tpck(...)]

(* ****** ****** *)

#implfun
trans34_d3exp_tpck
(env0, d3e0, t2p0) =
let
val
d4e0 = trans34_d3exp(env0, d3e0)
in//let
(
  trans34_d4exp_tpck(env0,d4e0,t2p0) )
end(*let*) // end-of-[trans34_d3exp_tpck(...)]

(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans34_d4pat_tpck
(env0, d4p0, t2p0) =
let
//
val t2p1 = d4p0.styp()
//
val ubtf =
unify34_s2typ(env0, t2p1, t2p0)
//
in//let
if
ubtf then d4p0 else
let
val loc0 = d4p0.lctn() in//let
d4pat_make_tpnd
(loc0, t2p0, D4Pt2pck(d4p0,t2p0)) endlet
end where
{
//
(*
val () =
prerrln("trans34_d4pat_tpck: d4p0 = ", d4p0)
val () =
prerrln("trans34_d4pat_tpck: t2p0 = ", t2p0)
*)
//
} (*where*) // end of [trans34_d4pat_tpck(...)]
//
(* ****** ****** *)
//
#implfun
trans34_d4exp_tpck
(env0, d4e0, t2p0) =
let
//
val t2p0 =
(
  f0_dearg(t2p0) )
//
val t2p1 = d4e0.styp()
//
val ubtf =
unify34_s2typ(env0,t2p1,t2p0)
//
in//let
//
if
ubtf
then d4e0 else
let
val
loc0 = d4e0.lctn()
in//let
d4exp_make_tpnd
(loc0,t2p0,D4Et2pck(d4e0,t2p0))
end//let
//
end where
{
//
fun
f0_dearg
(t2p0: s2typ): s2typ =
(
case+
t2p0.node() of
|T2Parg1
(knd0, t2p1) => f0_dearg(t2p1)
|T2Patx2
(t2p1, t2p2) => f0_dearg(t2p1)
|_(* otherwise *) => (  t2p0  ))//fun
//
(*
//
val loc0 = d4e0.lctn((*void*))
//
val (  ) =
prerrln("trans34_d4exp_tpck: loc0 = ", loc0)
val (  ) =
prerrln("trans34_d4exp_tpck: d4e0 = ", d4e0)
val (  ) =
prerrln("trans34_d4exp_tpck: t2p0 = ", t2p0)
//
*)
//
}(*where*) // end-of-[trans34_d4exp_tpck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans34_d4exp_ptck
(env0, d4e0, stp1) =
(
case+
stp1.node() of
//
|
T2Parg1
(knd0, tinv) =>
if
knd0 = 0
then d4e0 else
(
case+
tinv.node() of
//
|T2Patx2
(tbef, taft) =>
auxmain(env0, d4e0, taft)
//
|_(*non-T2Patx2*) =>
auxmain(env0, d4e0, tinv))
//
|
T2Patx2
(tbef, taft) =>
(
auxmain(env0, d4e0, taft))
//
|
_(* otherwise *) => ( d4e0 )
) where
{
//
(* ****** ****** *)
//
fun
f0_var
( env0:
! tr34env
, d4e0: d4exp
, stp1: s2typ): d4exp =
let
//
val-
D4Evar(d2v1) = d4e0.node()
//
val
opt1 =
tr34env_stprch_dvar
  (env0, d2v1) //val(opt1)
//
val
t2p1 =
(
case+ opt1 of
| ~
optn_vt_nil
( (*nil*) ) => d2v1.styp()
| ~
optn_vt_cons(t2p1) => t2p1)
: s2typ // end-of-[val(t2p1)]
//
val () =
tr34env_d2vins_dget
(env0, d2v1, D4TYPstp(stp1))
//
in//let
if // if
linq(t2p1)
then // HX: linear excess: [t2p1] 
d4exp_linex(d4e0, t2p1) else d4e0
end(*let*)//end-of-[f0_var(env0,d4e0)]
//
(* ****** ****** *)
//
fun
auxmain
( env0:
! tr34env
, d4e0: d4exp
, taft: s2typ): d4exp =
(
case+
d4e0.node() of
//
| D4Evar _ =>
(
f0_var(env0, d4e0, taft))
//
| _(*otherwise*) =>
(
  d4exp_p2tck(d4e0, taft) )
)(*case+*)//end-of-[auxmain(d4e0,taft)]
//
(* ****** ****** *)
//
val loc0 = d4e0.lctn((*void*))
//
val (  ) =
prerrln("trans34_d4exp_ptck: loc0 = ", loc0)
val (  ) =
prerrln("trans34_d4exp_ptck: d4e0 = ", d4e0)
val (  ) =
prerrln("trans34_d4exp_ptck: stp1 = ", stp1)
//
}(*where*) // end-of-[trans34_d4exp_ptck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans34_d4ift_dvts
(env0, d4e0, dvts) =
(
//
(
  d4exp_dvts(d4e0, dvts)
) where
{
val (  ) =
tr34env_d2vins_dvts(env0, dvts) }
//
) where
{
val (  ) =
prerrln("trans34_d4ift_dvts: dvts = ", dvts)
}(*where*) // end-of-[trans34_d4ift_dvts(...)]
//
(* ****** ****** *)
//
#implfun
trans34_d4cas_dvts
(env0, d4e0, dvts) =
(
//
(
  d4exp_dvts(d4e0, dvts)
) where
{
val (  ) =
tr34env_d2vins_dvts(env0, dvts) }
//
) where
{
val (  ) =
prerrln("trans34_d4cas_dvts: dvts = ", dvts)
}(*where*) // end-of-[trans34_d4cas_dvts(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans34_d4arg_dpat
(env0, darg, dpat) =
(
if
d4pat_freeq(dpat)
then
(
d4exp_none0
(darg.lctn((*nil*))))
else
if
not(d4exp_foldq(darg))
then
(
d4exp_none0(darg.lctn()))
else
let
val dtyp = D4TYPpat(dpat)
in//let
trans34_d4arg_dtyp(env0,darg,dtyp)
end//let
) where
{
//
val (  ) =
prerrln
("trans34_d4arg_dpat: darg = ", darg)
val (  ) =
prerrln
("trans34_d4arg_dpat: dpat = ", dpat)
//
}(*where*) // end-of-[trans34_d4arg_dpat(...)]
//
(* ****** ****** *)
//
#implfun
trans34_d4arg_dgpt
(env0, darg, dgpt) =
(
case+
dgpt.node() of
|D4GPTpat(dpat) =>
trans34_d4arg_dpat(env0,darg,dpat)
|D4GPTgua(dpat,d4gs) =>
trans34_d4arg_dpat(env0,darg,dpat)
) where
{
//
val (  ) =
prerrln
("trans34_d4arg_dgpt: darg = ", darg)
val (  ) =
prerrln
("trans34_d4arg_dgpt: dgpt = ", dgpt)
//
}(*where*) // end-of-[trans34_d4arg_dgpt(...)]
//
(* ****** ****** *)

#implfun
trans34_d4arg_dtyp
(env0, darg, dtyp) =
(
case+
darg.node() of
|
D4Evar _ =>
(
  f0_var(env0, darg) )
|
_(* otherwise *) =>
(
  d4exp_none0(darg.lctn()))
) where
{
//
fun
f0_var
( env0:
! tr34env
, darg: d4exp): d4exp =
let
val-
D4Evar(d2v1) = darg.node()
in//let
tr34env_d2vins_dset
( env0, d2v1, dtyp ); darg
end//(*let*)//end-of-[f0_var(...)]
//
val (  ) = prerrln
  ("trans34_d4arg_dtyp: darg = ", darg)
val (  ) = prerrln
  ("trans34_d4arg_dtyp: dtyp = ", dtyp)
//
}(*where*) // end-of-[trans34_d4arg_dtyp(...)]

(* ****** ****** *)
(* ****** ****** *)

#implfun
trans34_d4exp_dset
(env0, d4e0, t2p0) =
(
case+
d4e0.node() of
//
|
D4Eflat(d4e1) =>
auxmain(env0, d4e1)
//
) where
{
//
fun
f0_var
( env0:
! tr34env
, d4e1: d4exp): void =
(
tr34env_d2vins_dset
(env0, d2v1, D4TYPstp(t2p0))
) where
{
val-D4Evar(d2v1) = d4e1.node()
}(*where*)//end-of-[f1_var(...)]
//
fun
auxmain
( env0:
! tr34env
, d4e1: d4exp): void =
(
case+
d4e1.node() of
//
|
D4Evar _ => f0_var(env0, d4e1)
//
|
_(*otherwise*) => (  (*void*)  )
//
) where
{
//
val () =
prerrln("auxmain: d4e1 = ", d4e1)
//
}(*where*)//end-of-[ f1_main(...) ]
//
val (  ) = prerrln
  ("trans34_d4exp_dset: d4e0 = ", d4e0)
val (  ) = prerrln
  ("trans34_d4exp_dset: t2p0 = ", t2p0)
//
}(*where*) // end-of-[trans34_d4exp_dset(...)]

(* ****** ****** *)
(* ****** ****** *)

#implfun
trans34_d4exp_fold
  (env0, d4e0) =
(
case+
d4e0.node() of
//
|
D4Evar _ => f0_var(env0, d4e0)
//
|
_(* otherwise *) => (   d4e0   )
//
) where
{
//
fun
f0_var
( env0:
! tr34env
, d4e0: d4exp): d4exp =
let
//
val-
D4Evar(d2v1) = d4e0.node()
//
val opt1 =
tr34env_dtprch_dvar
  (env0, d2v1) //val(opt1)
//
in//let
//
case+ opt1 of
| ~
optn_vt_nil
  ((*0*)) =>
(
d4exp_none0(d4e0.lctn()))
| ~
optn_vt_cons
  ( dtp1 ) =>
let
val t2p1 =
trans34_d4typ_fold
  (env0, dtp1) //val(t2p1)
val dtp2 = D4TYPstp( t2p1 )
in//let
tr34env_d2vins_dset
( env0, d2v1, dtp2 ); d4e0 end
//
end(*let*) // end of [f0_var( ... )]
//
val (  ) = prerrln
  ("trans34_d4exp_fold: d4e0 = ", d4e0)
//
}(*where*) // end-of-[trans34_d4exp_fold(...)]

(* ****** ****** *)
//
#implfun
trans34_d4typ_fold
  (env0, dtp0) =
(
case+ dtp0 of
//
|
D4TYPpat(d4p1) =>
(
  d4p2.styp((*void*))
) where
{
val d4p2 =
trans34_d4pxp(env0, d4p1)}
//
) where
{
//
val (  ) = prerrln
  ("trans34_d4typ_fold: dtp0 = ", dtp0)
//
}(*where*) // end-of-[trans34_d4typ_fold(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans34_d4patlst_tpcks
( env0
, loc0, d4ps , t2ps ) =
(
case+ d4ps of
|
list_nil() =>
list_nil((*void*))
|
list_cons _ =>
(
case+ t2ps of
|
list_nil() =>
(
  list_nil((*void*)))
|
list_cons _ =>
(
  list_cons(d4p1, d4ps)
) where
{
val-
list_cons(d4p1, d4ps) = d4ps
val-
list_cons(t2p1, t2ps) = t2ps
//
val d4p1 =
trans34_d4pat_tpck(env0, d4p1, t2p1)
val d4ps =
trans34_d4patlst_tpcks(env0,loc0,d4ps,t2ps)
//
} // end-of-[list_cons(d4p1, d4ps)]
) // end-of-[list_cons(t2p1, t2ps)]
//
)(*case+*) // end-of-[trans34_d4patlst_tpcks(...)]
//
(* ****** ****** *)
//
#implfun
trans34_d3explst_tpck1
( env0 , d3es , t2p0 ) =
(
case+ d3es of
|
list_nil() => list_nil()
|
list_cons(d3e1, d3es) =>
list_cons(d4e1, d4es) where
{
val d4e1 =
trans34_d3exp_tpck(env0, d3e1, t2p0)
val d4es =
trans34_d3explst_tpck1(env0, d3es, t2p0) }
)(*case+*) // end of [trans34_d2explst_tpck1(...)]
//
(* ****** ****** *)
//
#implfun
trans34_d4explst_tpcks
( env0
, loc0, d4es , t2ps ) =
(
case+ d4es of
|
list_nil() =>
list_nil((*void*))
|
list_cons _ =>
(
case+ t2ps of
//
|
list_nil() =>
(
  list_nil((*void*)))
//
|
list_cons _ =>
(
  list_cons(d4e1, d4es)
) where
{
val-
list_cons(d4e1, d4es) = d4es
val-
list_cons(t2p1, t2ps) = t2ps
//
val d4e1 =
trans34_d4exp_tpck(env0, d4e1, t2p1)
val d4es =
trans34_d4explst_tpcks(env0,loc0,d4es,t2ps)
//
} // end-of-[list_cons(d4e1, d4es)]
) // end-of-[list_cons(t2p1, t2ps)]
//
)(*case+*) // end-of-[trans34_d4explst_tpcks(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans34_d4explst_ptcks
( env0
, loc0, d4es , t2ps ) =
(
case+ d4es of
|
list_nil() =>
list_nil((*void*))
|
list_cons _ =>
(
case+ t2ps of
|
list_nil() =>
list_nil((*void*))
|
list_cons _ =>
list_cons(d4e1, d4es) where
{
val-
list_cons(d4e1, d4es) = d4es
val-
list_cons(t2p1, t2ps) = t2ps
//
val d4e1 =
trans34_d4exp_ptck(env0, d4e1, t2p1)
val d4es =
trans34_d4explst_ptcks(env0,loc0,d4es,t2ps)
//
} // end-of-[list_cons(d4e1, d4es)]
) // end-of-[list_cons(t2p1, t2ps)]
)(*case+*) // end-of-[trans34_d4explst_ptcks(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans34_d3clslst_tpck1
( env0
, dcls , darg , tres ) =
(
list_map_e1nv
<x0><y0><e1>(dcls, env0)) where
{
#typedef x0 = d3cls
#typedef y0 = d4cls
#vwtpdef e1 = tr34env
#impltmp
map$fopr_e1nv<x0><y0><e1>
(x0, e1) = trans34_d3cls_tpck(e1,x0,darg,tres)
} (*where*) // end of [list_trans34_fnp(e1,xs,fopr)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans34_d3explstopt
( env0, dopt ) =
(
  optn_trans34_fnp(env0, dopt, trans34_d3explst))
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans34_dynexp.dats] *)
