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
#symload !=
with sint_neq$sint of 1099
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
"prelude/SATS/gsyn000.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../../../SATS/xbasics.sats"
#staload
"./../../../SATS/xlabel0.sats"
//
#staload
"./../../../SATS/staexp2.sats"
#staload
"./../../../SATS/statyp2.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
label_neq
(lab1: label
,lab2: label): bool =
(label_cmp(lab1, lab2) != 0)
#symload != with label_neq
//
(* ****** ****** *)
//
fun
trcdknd_noteq
(knd1: trcdknd
,knd2: trcdknd): bool =
not(trcdknd_equal(knd1, knd2))
//
#symload = with trcdknd_equal
#symload != with trcdknd_noteq
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
s2typ1_t0pize
(s2t0, t2q0) =
(
case+
t2q0.node() of
|T2P1top0(t2q1) =>
s2typ1(s2t0, T2P1top0(t2q1))
|T2P1top1(t2q1) =>
s2typ1(s2t0, T2P1top0(t2q1))
|_(*otherwise*) =>
s2typ1(s2t0, T2P1top0(t2q0)))
//
#implfun
s2typ1_t1pize
(s2t0, t2q0) =
(
case+
t2q0.node() of
|T2P1top0(t2q1) =>
s2typ1(s2t0, T2P1top0(t2q1))
|T2P1top1(t2q1) =>
s2typ1(s2t0, T2P1top1(t2q1))
|_(*otherwise*) =>
s2typ1(s2t0, T2P1top1(t2q0)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
s2typ1_lteq
(t2q1, t2q2) =
(
case+
t2q2.node() of
//
|T2P1top0 _ =>
(
if
linq(t2q1)
then false else
let
val s2t1 = t2q1.sort()
val t2q1 =
s2typ1_t0pize(s2t1, t2q1)
in//let
  f0_main(t2q1, t2q2) end//let
)
//
|T2P1top1 _ =>
(
if
linq(t2q1)
then false else
let
val s2t1 = t2q1.sort()
val t2q1 =
s2typ1_t1pize(s2t1, t2q1)
in//let
  f0_main(t2q1, t2q2) end//let
)
//
|_(*rest*) => f0_main(t2q1, t2q2)
//
) where
{
//
(* ****** ****** *)
//
#symload
linq with s2typ1_linq
//
(* ****** ****** *)
//
fun
f0_main
(t2q1: s2typ1
,t2q2: s2typ1): bool =
(
case+
t2q1.node() of
//
(* ****** ****** *)
//
|T2P1cst
(  s2c1  ) =>
(
case+
t2q2.node() of
|T2P1cst(s2c2) =>
( s2c1 = s2c2 )
|_(*non-T2P1cst*) => ( false )
)
//
|T2P1var
(  s2v1  ) =>
(
case+
t2q2.node() of
|T2P1var(s2v2) =>
( s2v1 = s2v2 )
|_(*non-T2P1var*) => ( false )
)
//
(* ****** ****** *)
//
|T2P1top0
(  t2q1  ) =>
(
case+
t2q2.node() of
|T2P1top0(t2q2) =>
(
  s2typ1_lteq(t2q1, t2q2))
|T2P1top1(t2q2) =>
(
  s2typ1_lteq(t2q1, t2q2))
|_(*non-T2P1top?*) => ( false )
)
//
|T2P1top1
(  t2q1  ) =>
(
case+
t2q2.node() of
|T2P1top1(t2q2) =>
(
  s2typ1_lteq(t2q1, t2q2))
|_(*non-T2P1top1*) => ( false )
)
//
(* ****** ****** *)
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
|_(*non-T2P1apps*) => ( false )
)
//
(* ****** ****** *)
//
|T2P1trcd
(knd1, npfa, lts1) =>
(
case+
t2q2.node() of
|T2P1trcd
(knd2, npfb, lts2) =>
(
if
knd1 != knd2
then false else
if
npfa != npfb
then false else
l2t2p1lst_lteq(lts1, lts2))
|_(*non-T2P1apps*) => ( false )
)
//
(* ****** ****** *)
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
|_(*non-T2P1text*) => ( false )
)
//
(* ****** ****** *)
//
|T2P1none0() =>
(
case+
t2q2.node() of
|T2P1none0() => true | _ => false)
//
|_(* otherwise *) => (     false     )
//
(* ****** ****** *)
//
) where
{
//
val () =
(
  prerrsln("f0_main: t2q1 = ", t2q1))
val () =
(
  prerrsln("f0_main: t2q2 = ", t2q2))
//
}(*where*)//end-of-[f0_main(t2q1,t2q2)]
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
l2t2p1_lteq
(ltq1, ltq2) =
let
//
val+
S2LAB(lab1, t2q1) = ltq1
val+
S2LAB(lab2, t2q2) = ltq2
//
in//let
if // if
lab1 != lab2
then (false)
else s2typ1_lteq(t2q1, t2q2)
end(*let*)//end-of-[l2t2p1_lteq(ltq1,ltq2)]
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
//
#implfun
l2t2p1lst_lteq
(lts1, lts2) =
(
case+ lts1 of
|list_nil() =>
(
case+ lts2 of
|list_nil() => true
|list_cons _ => false)
|list_cons
(ltq1, lts1) =>
(
case+ lts2 of
|list_nil() => false
|list_cons(ltq2, lts2) =>
(
if
l2t2p1_lteq(ltq1, ltq2)
then
l2t2p1lst_lteq(lts1, lts2) else false))
)(*case+*)//end-of-[l2t2p1lst_lteq(lts1,lts2)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
l2t2p1lst_lab$proj
  (ltqs, lab0) =
(
case+ ltqs of
|
list_nil
( (*void*) ) =>
s2typ1_none0((*void*))
|
list_cons
(ltq1, ltqs) =>
let
val+
S2LAB
(lab1, t2q1) = ltq1
in//let
if // if
(lab0 = lab1) then t2q1
else l2t2p1lst_lab$proj(ltqs, lab0) end
)(*case+*)//end-of-[l2t2p1lst_lab$proj(ltqs,lab0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_statyp2_utils0.dats] *)
(***********************************************************************)
