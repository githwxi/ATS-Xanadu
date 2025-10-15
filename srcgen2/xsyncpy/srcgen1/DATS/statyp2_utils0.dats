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
Sat Aug  9 04:53:06 PM EDT 2025
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload
"./../SATS/statyp2.sats"
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"prelude/SATS/gsyn000.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../../../SATS/staexp2.sats"
#staload
"./../../../SATS/statyp2.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../../../DATS/xatsopt_tmplib.dats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
s2typ1_linq(t2q0) =
(
  sort2_linq(t2q0.sort()))
#implfun
s2typ1_prfq(t2q0) =
(
  sort2_prfq(t2q0.sort()))
//
(* ****** ****** *)
//
#implfun
l2t2p1_linq(ltq0) =
(
s2typ1_linq(t2q1)) where
{
val+S2LAB(lab0, t2q1) = ltq0}
//
#implfun
l2t2p1_prfq(ltq0) =
(
s2typ1_prfq(t2q1)) where
{
val+S2LAB(lab0, t2q1) = ltq0}
//
(* ****** ****** *)
//
#implfun
s2typ1lst_linq(t2qs) =
(
  list_exists(t2qs)) where
{
#impltmp
exists$test<s2typ1> = s2typ1_linq
}
#implfun
s2typ1lst_prfq(t2qs) =
(
  list_forall(t2qs)) where
{
#impltmp
forall$test<s2typ1> = s2typ1_prfq
}
//
(* ****** ****** *)
//
#implfun
l2t2p1lst_linq(ltqs) =
(
  list_exists(ltqs)) where
{
#impltmp
exists$test<l2t2p1> = l2t2p1_linq
}
#implfun
l2t2p1lst_prfq(ltqs) =
(
  list_forall(ltqs)) where
{
#impltmp
forall$test<l2t2p1> = l2t2p1_prfq
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
s2typ1_lteq
(t2q1, t2q2) =
(
case+
t2q1.node() of
//
|T2P1cst
(  s2c1  ) =>
(
case+
t2q2.node() of
|T2P1cst(s2c2) => (s2c1 = s2c2)
|_(*non-T2P1cst*) => (  false  )
)
//
|T2P1var
(  s2v1  ) =>
(
case+
t2q2.node() of
|T2P1var(s2v2) => (s2v1 = s2v2)
|_(*non-T2P1var*) => (  false  )
)
//
|T2P1apps
(t2f1, tqs1) =>
(
case+
t2q2.node() of
|T2P1apps(t2f2, tqs2) =>
(
if
s2typ1_lteq
(t2f1, t2f2)
then
s2typ1lst_lteq
( tqs1, tqs2 ) else false)
|_(*non-T2P1apps*) => (  false  )
)
//
|T2P1text
(tnm1, tqs1) =>
(
case+
t2q2.node() of
|T2P1text(tnm2, tqs2) =>
(
if
(tnm1 = tnm2)
then
s2typ1lst_lteq
( tqs1, tqs2 ) else false)
|_(*non-T2P1text*) => (  false  )
)
//
|T2P1none0() =>
(
case+
t2q2.node() of
|T2P1none0() => true | _ => false)
//
|_(* otherwise *) => (     false     )
) where
{
//
val () =
(
  prerrsln("s2typ1_lteq: t2q1 = ", t2q1))
val () =
(
  prerrsln("s2typ1_lteq: t2q2 = ", t2q2))
//
}(*where*)//end-of-[s2typ1_lteq(t2q1,t2q2)]
//
(* ****** ****** *)
//
#implfun
s2typ1lst_lteq
(tqs1, tqs2) =
(
case+ tqs1 of
|list_nil() =>
(
case+ tqs2 of
|list_nil() => true
|list_cons _ => false)
|list_cons
(t2q1, tqs1) =>
(
case+ tqs2 of
|list_nil() => false
|list_cons(t2q2, tqs2) =>
(
if
s2typ1_lteq(t2q1, t2q2)
then
s2typ1lst_lteq(tqs1, tqs2) else false))
)(*case+*)//end-of-[s2typ1lst_lteq(tqs1,tqs2)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_statyp2_utils0.dats] *)
(***********************************************************************)
