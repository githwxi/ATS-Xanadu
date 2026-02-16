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
(*
HX-2025-09-25:
This is needed for
prelude over srcgen1/prelude
*)
#symload not
with bool_neg of 1099
//
#symload lnot
with uint_lnot of 1099
#symload ladd
with uint_ladd of 1099
#symload lmul
with uint_lmul of 1099
//
#symload is2u
with sint_to$uint of 1099
#symload iu2s
with uint_to$sint of 1099
//
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
#staload
"./../../../SATS/dynexp2.sats"
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
where
{
(*
val () =
prerrsln("\
s2typ1_linq: t2q0 = ", t2q0)
*)
}(*where*)//end(s2typ1_linq)
//
#implfun
s2typ1_prfq(t2q0) =
(
sort2_prfq(t2q0.sort()))
where
{
(*
val () =
prerrsln("\
s2typ1_prfq: t2q0 = ", t2q0)
*)
}(*where*)//end(s2typ1_prfq)
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
sort2_enlin
(   s2t0   ) =
(
case+ s2t0 of
|
S2Tbas(s2tb) =>
(
case+ s2tb of
|
T2Bimpr(knd, sym) =>
let
  val msk = is2u( 2 )
  val knd = is2u(knd)
  val knd =
    iu2s(knd\ladd(msk))
in
  S2Tbas(T2Bimpr(knd, sym))
end
|_(*non-T2Bimpr*) => (s2t0)
)
|_(* non-S2Tbas *) => (s2t0)
)(*case+*)//end-of-[sort2_enlin(...)]
//
(* ****** ****** *)
//
#implfun
sort2_delin
(   s2t0   ) =
(
case+ s2t0 of
|
S2Tbas(s2tb) =>
(
case+ s2tb of
|
T2Bimpr(knd, sym) =>
let
  val msk =
  (
     lnot(is2u(2))  )
  val knd = is2u(knd)
  val knd =
    iu2s(knd\lmul(msk))
in
  S2Tbas(T2Bimpr(knd, sym))
end
|_(*non-T2Bimpr*) => (s2t0)
)
|_(* non-S2Tbas *) => (s2t0)
)(*case+*)//end-of-[sort2_delin(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
s2typ1_delin
(   t2q0   ) =
let
//
val s2t0 = t2q0.sort()
//
in//let
//
if
not(sort2_linq(s2t0))
then (t2q0) else s2typ1_t1pize(t2q0)
//
end(*let*)//end-of-[s2typ1_delin(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
s2typ1_t0pize
(   t2q0   ) =
(
f0_main(s2t0, t2q0))
where
{
//
fun
f0_main
(s2t0: sort2
,t2q0: s2typ1): s2typ1 =
(
case+
t2q0.node() of
|
T2P1lft(t2q1) =>
s2typ1_lft
(f0_main(s2t0, t2q1))
//
|
T2P1top0(t2q1) =>
s2typ1(s2t0, T2P1top0(t2q1))
|
T2P1top1(t2q1) =>
s2typ1(s2t0, T2P1top0(t2q1))
//
|_(*otherwise*) =>
(
s2typ1(s2t0, T2P1top0(t2q0))))
//
val s2t0 =
sort2_delin(s2typ1_sort$get(t2q0))
//
}(*where*)//end-of-[s2typ1_t0pize(t2q0)]
//
(* ****** ****** *)
//
#implfun
s2typ1_t1pize
(   t2q0   ) =
(
f0_main(s2t0, t2q0))
where
{
//
fun
f0_main
(s2t0: sort2
,t2q0: s2typ1): s2typ1 =
(
case+
t2q0.node() of
//
|
T2P1lft(t2q1) =>
s2typ1_lft
(f0_main(s2t0, t2q1))
//
|
T2P1top0(t2q1) =>
s2typ1(s2t0, T2P1top0(t2q1))
|
T2P1top1(t2q1) =>
s2typ1(s2t0, T2P1top1(t2q1))
//
|
_(*otherwise*) =>
(
s2typ1(s2t0, T2P1top1(t2q0))))
//
val s2t0 =
sort2_delin(s2typ1_sort$get(t2q0))
//
}(*where*)//end-of-[s2typ1_t1pize(t2q0)]
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
val t2q1 =
s2typ1_t0pize(t2q1)
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
val t2q1 =
s2typ1_t1pize(t2q1)
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
|T2P1cst
(   s2c2   ) => (s2c1=s2c2)
|_(*non-T2P1cst*) => ( false ))
//
|T2P1var
(  s2v1  ) =>
(
case+
t2q2.node() of
|T2P1var
(   s2v2   ) => (s2v1=s2v2)
|_(*non-T2P1var*) => ( false ))
//
(* ****** ****** *)
//
|T2P1top0
(  t2q1  ) =>
(
case+
t2q2.node() of
|T2P1top0
(   t2q2   ) =>
(
  s2typ1_lteq( t2q1, t2q2 ))
|T2P1top1
(   t2q2   ) =>
(
  s2typ1_lteq( t2q1, t2q2 ))
|_(*non-T2P1top?*) => ( false ))
//
|T2P1top1
(  t2q1  ) =>
(
case+
t2q2.node() of
|T2P1top1
(   t2q2   ) =>
(
  s2typ1_lteq( t2q1, t2q2 ))
|_(*non-T2P1top1*) => ( false ))
//
(* ****** ****** *)
//
|T2P1apps
(t2f1, tqs1) =>
(
case+
t2q2.node() of
|T2P1apps
(t2f2, tqs2) =>
(
if // if
s2typ1_lteq
(t2f1, t2f2)
then // then
s2typ1lst_lteq
( tqs1, tqs2 ) else (false))
|_(*non-T2P1apps*) => ( false ))
//
(* ****** ****** *)
//
|T2P1fun1
(fcl1, npf1
,tqs1, t2q1) =>
(
case+
t2q2.node() of
|T2P1fun1
(fcl2, npf2
,tqs2, t2q2) =>
(
if // if
targ
then//then
s2typ1_lteq
(t2q1, t2q2) else ( false ))
where
{
val targ =
(
  s2arg1lst_lteq(tqs2, tqs1))
}
|_(*non-T2P1fun1*) => ( false ))
//
(* ****** ****** *)
//
|T2P1tcon
(d2c1, tqs1) =>
let
//
val t2q2 =
s2typ1_unfold(t2q2, d2c1)
//
val (  ) =
prerrsln("f0_main:\
T2P1tcon: t2q2(un) = ", t2q2)
//
in//let
//
case+
t2q2.node() of
|T2P1tcon
(d2c2, tqs2) =>
(
if( // if
d2c1=d2c2)
then//then
s2typ1lst_lteq
( tqs1, tqs2 ) else (false))
|_(*non-T2P1tcon*) => ( false )
//
end(*let*)//endof[T2P1tcon(...)]
//
(* ****** ****** *)
//
|T2P1trcd
(knd1
,npfa, lts1) =>
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
|_(*non-T2P1apps*) => ( false ))
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
( tqs1, tqs2 ) else (false))
|_(*non-T2P1text*) => ( false ))
//
(* ****** ****** *)
//
|T2P1none0() =>
(
case+
t2q2.node() of
|T2P1none0() => true | _ => false)
//
(* ****** ****** *)
//
|_(* otherwise *) => (    false    )
//
(* ****** ****** *)
//
) where
{
//
// (*
val (  ) =
(
  prerrsln("f0_main: t2q1 = ", t2q1))
val (  ) =
(
  prerrsln("f0_main: t2q2 = ", t2q2))
// *)
//
}(*where*)//end-of-[f0_main(t2q1,t2q2)]
//
(*
val (  ) =
(
  prerrsln("s2typ1_lteq: t2q1 = ", t2q1))
val (  ) =
(
  prerrsln("s2typ1_lteq: t2q2 = ", t2q2))
*)
//
}(*where*)//end-of-[s2typ1_lteq(t2q1,t2q2)]
//
(* ****** ****** *)
//
#implfun
s2arg1_lteq
(t2q1, t2q2) =
(
case+
t2q1.node() of
//
|T2P1arg1
(knd1, t2q1) =>
(
case+
t2q2.node() of
|T2P1arg1
(knd2, t2q2) =>
(
if // if
s2typ1_lteq
(t2q1, t2q2)
then
s2typ1_lteq
(t2q2, t2q1) else (false))
|_(*otherwise*) =>
if
linq(t2q1)
then (false) else
(
  s2typ1_lteq( t2q1, t2q2 ))
)(*case+*)//end(T2P1arg1(...))
//
|_(*otherwise*) =>
(
  s2typ1_lteq(  t2q1 , t2q2  ))
//
) where
{
(*
val (  ) =
(
  prerrsln("s2arg1_lteq: t2q1 = ", t2q1))
val (  ) =
(
  prerrsln("s2arg1_lteq: t2q2 = ", t2q2))
*)
}(*where*)//end-of-[s2arg1_lteq(t2q1,t2q2)]
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
s2arg1lst_lteq
(tqs1, tqs2) =
(
case+ tqs1 of
//
|list_nil() =>
(
case+ tqs2 of
|list_nil() => true
|list_cons _ => false)
//
|list_cons
(t2q1, tqs1) =>
(
case+ tqs2 of
|list_nil() => false
|list_cons(t2q2, tqs2) =>
(
if
s2arg1_lteq(t2q1, t2q2)
then
s2arg1lst_lteq(tqs1, tqs2) else false))
//
)(*case+*)//end-of-[s2arg1lst_lteq(tqs1,tqs2)]
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
)(*case+*)//end-of-[l2t2p1lst_lab$proj(ltqs,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
s2typ1_lab$fset
(styp, lab0, t2q0) =
(
case+
styp.node() of
|T2P1trcd
(trcd
,npf1, ltqs) =>
let
//
val ltqs =
l2t2p1lst_lab$fset
(ltqs, lab0, t2q0)
//
val s2rt = styp.sort()
val s2rt =
(
if // if
s2typ1_linq(t2q0)
then
sort2_enlin(s2rt) else s2rt)
//
in//let
//
s2typ1_make_sort$node
(s2rt, T2P1trcd(trcd, npf1, ltqs))
//
end(*let*)//end-of-[T2P1trcd(...)]
//
|_(*non-T2P1trcd*) => (    styp    )
)(*case+*)//end-of-[s2typ1_lab$fset(...)]
//
(* ****** ****** *)
//
#implfun
l2t2p1lst_lab$fset
(ltqs, lab0, t2q0) =
(
case+ ltqs of
//
|list_nil
( (*void*) ) => 
(
  list_nil((*void*)))
//
|list_cons
(ltq1, ltqs) =>
let
val+
S2LAB(lab1, t2q1) = ltq1
in//let
//
if // if
(lab0=lab1)
then
let
val ltq1 =
S2LAB(lab0, t2q0)
in//let
list_cons(ltq1, ltqs) end
else
list_cons(ltq1,
l2t2p1lst_lab$fset(ltqs, lab0, t2q0))
end//let//end-of-[list_cons(ltq1,ltqs)]
//
)(*case+*)//end-of-[l2t2p1lst_lab$fset(ltqs,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
s2typ1_unfold
( styp, dcon ) =
(
case+
styp.node() of
//
|T2P1cst
(   s2c1   ) =>
(
s2typ1_tcon(dcon,
s2typlst_subst1(targ, svts)))
//
|T2P1apps
(t2q1, t2qs) =>
(
s2typ1_tcon(dcon,
s2typlst_subst1(targ, svts)))
//
|_(* otherwise *) => (     styp     )
) where
{
//
val tfun =
f0_elim(
d2con_get_styp(dcon))
where
{
fun
f0_elim
(t2p0: s2typ): s2typ =
(
case+
t2p0.node() of
|T2Puni0
(s2vs, t2p1) => f0_elim(t2p1)
| _(*non-T2Puni0*) => ( t2p0 ))
}
//
val targ =
(
case+
tfun.node() of
|T2Pfun1
(f2cl, npf1
,targ, tres) => targ | _ => list_nil())
//
val svts =
(
case+
tfun.node() of
|T2Pfun1
(f2cl, npf1
,targ, tres) =>
(
f0_tres(tres, styp)) | _ => list_nil())
where
{
//
fun
f0_t2p1
(
t2p1: s2typ,
t2q1: s2typ1,
svts: s2vtp1lst): s2vtp1lst =
(
case+
t2p1.node() of
|
T2Pvar(s2v1) =>
(
list_cons
((s2v1, t2q1), svts))
|_(*non-T2Pvar*) => ( svts ))
//
and
f0_t2ps
(
t2ps: s2typlst,
t2qs: s2typ1lst,
svts: s2vtp1lst): s2vtp1lst =
(
case+ t2ps of
|list_nil
((*void*)) => ( svts )
|list_cons
(t2p1, t2ps) =>
(
case+ t2qs of
|list_nil
((*void*)) => ( svts )
|list_cons
(t2q1, t2qs) =>
let
val
svts =
f0_t2p1(t2p1, t2q1, svts)
in//let
  f0_t2ps(t2ps, t2qs, svts) end))
//
fun
f0_tres
(t2p0: s2typ
,t2q0: s2typ1): s2vt1s =
(
case+
t2p0.node() of
|T2Pcst _ =>
(
list_nil((*void*)))
|T2Papps(s2c1, t2ps) =>
(
case+
t2q0.node() of
|T2P1apps
(s2c2, t2qs) =>
let
val svts = list_nil() in
  f0_t2ps(t2ps, t2qs, svts) end//let
|_(*otherwise*) => list_nil( (*void*) )))
//
}
//
}(*where*)//end-of-[s2typ1_unfold(styp,dcon)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
s2typ_subst1
 (t2p0, svts) =
(
case+
t2p0.node() of
//
|
T2Pvar
(   s2v1   ) =>
(
  f0_var(s2v1, svts))
//
|
T2Pcst
(   s2c1   ) =>
s2typ1(s2t0, T2P1cst(s2c1))
//
(* ****** ****** *)
//
|
T2Papps
(t2f0, t2ps) =>
let
val t2g0 =
s2typ_subst1(t2f0, svts)
val t2qs =
s2typlst_subst1(t2ps, svts)
in//let
s2typ1(
s2t0, T2P1apps(t2g0, t2qs))
end//let
//
|T2Plam1
(s2vs, t2p1) =>
let
val t2q1 =
s2typ_subst1(t2p1, svts)
in//let
s2typ1(
s2t0, T2P1lam1(s2vs, t2q1))
end//let
//
(* ****** ****** *)
//
|T2Pf2cl
(   f2cl   ) =>
s2typ1(
  s2t0, T2P1f2cl(f2cl))
//
|T2Pfun1
(f2cl
,npf1
,t2ps, tres) =>
let
val f2cl =
s2typ_subst1(f2cl, svts)
val t2qs =
s2typlst_subst1(t2ps, svts)
val tres =
(
  s2typ_subst1(tres, svts))
in//let
s2typ1(
s2t0,
T2P1fun1(
 f2cl , npf1 , t2qs , tres))
end//let
//
(* ****** ****** *)
//
|T2Ptext
(name, t2ps) =>
let
val t2qs =
s2typlst_subst1(t2ps, svts)
in//let
s2typ1(
  s2t0, T2P1text(name, t2qs))
end//let
//
(* ****** ****** *)
//
|T2Pnone0() =>
(
s2typ1(s2t0, T2P1none0(*0*)))
//
(* ****** ****** *)
//
|
_(*otherwise*) =>
(
 s2typ1_make_s2typ(  t2p0  ))
) where//end-of-(s2typ_subst1)
{
//
val
s2t0 =
s2typ_get_sort(t2p0)
//
fun
f0_var
( s2v1: s2var
, svts: s2vt1s): s2typ1 =
(
case+ svts of
//
|
list_nil((*void*)) =>
s2typ1(s2t0, T2P1var(s2v1))
//
|
list_cons(svt1, svts) =>
(
if // if
(s2v1 = svt1.0)
then svt1.1 else f0_var(s2v1, svts)))
}(*where*)//end-of-[s2typ_subst1(t2p0,svts)]
//
(* ****** ****** *)
//
#implfun
s2typlst_subst1
 (t2ps, svts) =
(
list_map$e1nv
<x0><y0><e1>(t2ps, svts)
) where
{
#typedef x0 = s2typ
#typedef y0 = s2typ1
#vwtpdef e1 = s2vt1s
#impltmp
map$e1nv$fopr
<x0><y0><e1>(x0, e1) = s2typ_subst1(x0, e1)
} (*where*)//end of [s2typlst_subst1(t2ps,svts)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_statyp2_utils0.dats] *)
(***********************************************************************)
