(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Mon Jun 30 02:37:02 AM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/statyp2.sats"
#staload
"./../SATS/trx3cpy.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/mytmplib00.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../../../SATS/staexp2.sats"
#staload
"./../../../SATS/statyp2.sats"
//
#symload sort with s2typ_get_sort
#symload node with s2typ_get_node
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
s2typ_trx3cpy
(t2p0, env0) =
let
//
val s2t0 = t2p0.sort()
//
in//let
//
case+
t2p0.node() of
//
|T2Pcst
(   s2c1   ) =>
s2typ1(s2t0, T2P1cst(s2c1))
|T2Pvar
(   s2v1   ) =>
s2typ1(s2t0, T2P1var(s2v1))
//
|T2Plft
(   t2p1   ) =>
let
val t2q1 =
s2typ_trx3cpy(t2p1, env0)
in//let
s2typ1(s2t0, T2P1lft(t2q1))
end//let
//
|T2Parg1
(knd0, t2p1) =>
let
val t2q1 =
s2typ_trx3cpy(t2p1, env0)
in//let
s2typ1
(s2t0, T2P1arg1(knd0, t2q1))
end//let
|T2Patx2
(t2p1, t2p2) =>
let
val t2q1 =
s2typ_trx3cpy(t2p1, env0)
val t2q2 =
s2typ_trx3cpy(t2p2, env0)
in//let
s2typ1
(s2t0, T2P1atx2(t2q1, t2q2))
end//let
//
|T2Papps
(t2f0, t2ps) =>
let
val t2f0 =
s2typ_trx3cpy(t2f0, env0)
val t2qs =
s2typlst_trx3cpy(t2ps, env0)
in//let
(
s2typ1
(s2t0, T2P1apps(t2f0, t2qs)))
end//let
//
|T2Plam1
(s2vs, t2p1) =>
let
val t2q1 =
(
  s2typ_trx3cpy(t2p1, env0))
in//let
(
s2typ1
(s2t0, T2P1lam1(s2vs, t2q1)))
end//let
//
|T2Pf2cl
(   f2cl   ) =>
(
s2typ1(s2t0, T2P1f2cl(f2cl)))
|T2Pfun1
(f2cl, npf1
,t2ps, tres) =>
let
//
val f2cl =
s2typ_trx3cpy(f2cl, env0)
val t2qs =
s2typlst_trx3cpy(t2ps, env0)
val tres =
(
  s2typ_trx3cpy(tres, env0))
//
in//let
s2typ1
(s2t0
,T2P1fun1(f2cl,npf1,t2qs,tres))
end//let
//
|T2Ptrcd
(trcd
,npf1, ltps) =>
let
val ltqs =
l2t2plst_trx3cpy(ltps, env0)
in//let
s2typ1
(s2t0,T2P1trcd(trcd,npf1,ltqs))
end//let
//
|T2Ptext
(name, t2ps) =>
let
val t2qs =
s2typlst_trx3cpy(t2ps, env0)
in//let
s2typ1(s2t0,T2P1text(name,t2qs))
end//let
//
|T2Pnone0() =>
(
  s2typ1(s2t0, T2P1none0((*0*))))
//
|T2Perrck
(lvl0, t2p1) =>
let
val t2q1 =
(
  s2typ_trx3cpy(t2p1, env0))
in//let
s2typ1(s2t0,T2P1errck(lvl0, t2q1))
end//let
//
|
_(*otherwise*) =>
(
  s2typ1(s2t0, T2P1s2typ( t2p0 )))
//
end(*let*)//end-of-[s2typ_trx3cpy(t2p0,env0)]
//
(* ****** ****** *)
//
#implfun
l2t2p_trx3cpy
(lt2p, env0) =
(
S2LAB(l0, t2q0)) where
{
val+S2LAB(l0, t2p0) = lt2p
val t2q0 = s2typ_trx3cpy(t2p0, env0)
}(*where*)//end-of[l2t2p_trx3cpy(lt2p,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_trx3cpy_staexp.dats] *)
(***********************************************************************)
