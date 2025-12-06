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
Sat May 17 10:53:55 PM EDT 2025
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
"./../SATS/dynexp3.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "\
./../../../SATS/xbasics.sats"
#staload "\
./../../../SATS/locinfo.sats"
#staload "\
./../../../SATS/staexp2.sats"
#staload "\
./../../../SATS/statyp2.sats"
#staload "\
./../../../SATS/dynexp2.sats"
#staload "\
./../../../SATS/dynexp3.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/mytmplib00.hats"
//
#staload
"./../DATS/dynexp3_tmplib.dats"
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
d3typ1_linq
  (dtyp) =
(
case+ 
dtyp.node() of
//
|T3P1none
((*void*)) => false
//
|T3P1styp
(  styp  ) =>
(
  s2typ1_linq(styp))
//
|T3P1dvar _ => false
|T3P1lvar _ => false
//
|T3P1dlft _ => f0_dlft(dtyp)
//
|T3P1tcon _ => f0_tcon(dtyp)
|T3P1trcd _ => f0_trcd(dtyp)
//
|_(*otherwise*) => (   false   )
//
) where
{
//
fun
f0_dlft
(dtyp: d3typ1): bool =
(
  d3typ1_linq(t3q1))
where{
val-
T3P1dlft
(   t3q1   ) = dtyp.node()}
//
fun
f0_tcon
(dtyp: d3typ1): bool =
let
val-
T3P1tcon
(dcon, t3qs) = dtyp.node()
in//let
if // if
d2con_linq(dcon)
then f0_t3qs(t3qs) else false
end//let//end-of-[f0_tcon(dtyp)]
//
and
f0_trcd
(dtyp: d3typ1): bool =
let
val-
T3P1trcd
(trcd
,npf1, ltqs) = dtyp.node()
//
val () =
prerrsln
("f0_trcd: trcd = ", trcd)
//
in//let
case+ trcd of
|TRCDbox0() => false
|TRCDbox1() => (true)
|TRCDflt0() => f0_ltqs(ltqs)
end//let//end-of-[f0_trcd(dtyp)]
//
and
f0_t3qs
(t3qs: d3typ1lst): bool =
(
case+ t3qs of
|
list_nil() => false
|
list_cons(t3q1, t3qs) =>
(
if
d3typ1_linq(t3q1)
then true else f0_t3qs(t3qs))
)(*case+*)//end-of-[f0_ltqs(ltqs)]
//
and
f0_ltqs
(ltqs: l3t3p1lst): bool =
(
case+ ltqs of
|
list_nil() => false
|
list_cons(ltq1, ltqs) =>
let
val+
D3LAB(_, t3q1) = ltq1
in//let
(
if // if
d3typ1_linq(t3q1)
then true else f0_ltqs(ltqs))
end//let
)(*case+*)//end-of-[f0_ltqs(ltqs)]
//
val (  ) =
(
  prerrsln
  ( "d3typ1_linq: dtyp = ", dtyp ))
//
}(*where*)//end-of-[d3typ1_linq(dtyp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3exp1_lftq
  (dexp) =
(
case+
dexp.node() of
//
|D3E1var _ => (   true   )
//
|D3E1flat
(  d3e1  ) => d3exp1_lftq(d3e1)
//
|D3E1pcon
(dcon
,lab1, d3e1) => d3exp1_lftq(d3e1)
|D3E1proj
(tknd
,lab1, d3e1) => d3exp1_lftq(d3e1)
//
|_(*otherwise*) => (     false     )
//
)(*case+*)//end-of-[d3exp1_lftq(dexp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
dvstp1lst_linq
  (dvts) =
(
case+ dvts of
|list_nil
( (*void*) ) => false
|list_cons
(vtp1, dvts) =>
if // if
s2typ1_linq(vtp1.1)
then true else dvstp1lst_linq(dvts)  
)(*case+*)//end-of-[dvstp1lst_linq(dvts)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-09-07:
Sun Sep  7 03:04:00 AM EDT 2025
*)
//
#implfun
d3pat1_d2vs$get
  (  d3p0  ) =
(
d3pat1_d2v$folditm<r0>(xs, r0)
) where
{
//
#typedef x0 = d2var
#typedef xs = d3pat1
#vwtpdef r0 = list_vt(x0)
//
val xs = d3p0 and r0 = list_vt_nil()
//
#impltmp
folditm$fopr<x0><r0>(r0, x0) = list_vt_cons(x0, r0)
}
//
(* ****** ****** *)
//
#implfun
d3gpt1_d2vs$get
  (  dgpt  ) =
(
case+
dgpt.node() of
|D3GPT1pat(d3p0) => d3p0.d2vs()
|D3GPT1gua(d3p0, _) => d3p0.d2vs()
)(*case+*)//end-of-[d3gpt1_d2vs$get(dcls)]
//
#implfun
d3cls1_d2vs$get
  (  dcls  ) =
(
case+
dcls.node() of
|D3CLS1gpt(dgpt) => dgpt.d2vs()
|D3CLS1cls(dgpt, _) => dgpt.d2vs()
)(*case+*)//end-of-[d3cls1_d2vs$get(dcls)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3typ1_t1pize
  ( t3q0 ) =
(
case+
t3q0.node() of
//
|
T3P1none() => (t3q0)
//
|
T3P1styp(t2q1) =>
let
val
t2q0 = t3q0.styp()
val
t2q1 =
s2typ1_t1pize(t2q1)
in//let
//
d3typ1(t2q0, T3P1styp(t2q1))
//
end//let//end-of-(T3P1styp())
//
|_(*otherwise*) =>
let
val
t2q0 = t3q0.styp()
val
t2q1 = s2typ1_t0pize(t2q0)
in//let
//
d3typ1(t2q0, T3P1styp(t2q1))
//
end//let//end-of-(otherwise(...))
//
) where
{
//
val () =
prerrsln
("d3typ1_t1pize: t3q0 = ", t3q0)
//
#symload
d3typ1 with d3typ1_make_styp$node
//
}(*where*)//end-of-[d3typ1_t1pize(t3q0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3typ1_trcdize
  (  dtyp  ) =
(
case+
dtyp.node() of
|T3P1styp(styp) =>
(
case+
styp.node() of
|T2P1trcd
(trcd
,npf1, ltqs) =>
let
val t2rt =
d3typ1_styp$get(dtyp)
val ltqs = f0_ltqs(ltqs)
in//let
d3typ1_make_styp$node
(t2rt, T3P1trcd(trcd, npf1, ltqs))
end//let
|_(*otherwise*) => (     dtyp     )
)
|_(*otherwise*) => (     dtyp     )
) where
{
//
fun
f0_ltqs
( ltqs
: l2t2p1lst): l3t3p1lst =
(
case+ ltqs of
|list_nil
( (*void*) ) => list_nil()
|list_cons
(ltq1, ltqs) =>
let
val+
S2LAB
(lab1, t2q1) = ltq1
val t3q1 =
d3typ1_styp$make(t2q1)
val ltq1 = D3LAB(lab1, t3q1)
in
(
  list_cons( ltq1, f0_ltqs(ltqs) ) )
end//let//end-of-[list_cons(ltq1,ltqs)]
)
//
val () =
prerrsln("d3typ1_trcdize: dtyp = ", dtyp)
//
}(*where*)//end-of(d3typ1_trcdize( dtyp ))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3typ1_out$flat
  (  dtyp  ) =
(
case+
dtyp.node() of
//
|T3P1styp
(   styp   ) =>
(
case+
styp.node() of
|T2P1lft(t2q1) =>
(
  d3typ1_styp$make(t2q1))
|_(*otherwise*) => d3typ1_none0())
//
|T3P1dlft(t3q1) => (      t3q1      )
//
|_(*otherwise*) => d3typ1_none0((*0*))
//
)(*case+*)//end-of-[d3typ1_out$flat(dtyp)]
//
(* ****** ****** *)
//
#implfun
d3typ1_lab$proj
  (dtyp, lab0) =
(
case+
dtyp.node() of
//
|T3P1styp
(   styp   ) =>
(
case+
styp.node() of
|T2P1trcd
(trcd
,npf1, ltqs) =>
d3typ1_styp$make(
  l2t2p1lst_lab$proj(ltqs, lab0))
|_(*otherwise*) => d3typ1_none0((*0*))
)
//
|T3P1trcd
(trcd
,npf1, ltqs) =>
(
  l3t3p1lst_lab$proj(ltqs, lab0))
//
|_(*otherwise*) => d3typ1_none0((*0*))
//
) where
{
//
// (*
val (  ) =
prerrsln("d3typ1_lab$proj: dtyp = ", dtyp)
val (  ) =
prerrsln("d3typ1_lab$proj: lab0 = ", lab0)
// *)
//
}(*where*)//end-of-[d3typ1_lab$proj(dtyp,...)]
//
(* ****** ****** *)
//
#implfun
l3t3p1lst_lab$proj
  (ltqs, lab0) =
(
case+ ltqs of
//
|list_nil
( (*void*) ) =>
(
d3typ1_none0((*void*)))
//
|list_cons
(ltq1, ltqs) =>
let
val+
D3LAB
(lab1, t3q1) = ltq1
in//let
if // if
(lab0 = lab1) then t3q1
else l3t3p1lst_lab$proj(ltqs, lab0)
end//let//end-of-[list_cons(ltq1,ltqs)]
//
)(*case+*)//end-of-[l3t3p1lst_lab$proj(ltqs,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3typ1_lab$fset
(dtyp, lab0, t3q0) =
(
case+
dtyp.node() of
//
|T3P1trcd
(trcd
,npf1, ltqs) =>
let
val ltqs =
(
l3t3p1lst_lab$fset
(ltqs, lab0, t3q0))
val t2rt =
(
d3typ1_styp$get(dtyp))
in//let
(
d3typ1(t2rt,
  T3P1trcd(trcd, npf1, ltqs)))
end//let//end-of-[T3P1trcd(...)]
//
|_(*non-T3P1tuple*) => (    dtyp    )
//
) where
{
//
val dtyp = d3typ1_trcdize(dtyp)
//
// (*
val (  ) =
prerrsln("d3typ1_lab$fset: dtyp = ", dtyp)
val (  ) =
prerrsln("d3typ1_lab$fset: lab0 = ", lab0)
val (  ) =
prerrsln("d3typ1_lab$fset: t3q0 = ", t3q0)
// *)
//
}(*where*)//end-of-[d3typ1_lab$fset(dtyp,lab0,t3q0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
l3t3p1lst_lab$fset
(ltqs, lab0, t3q0) =
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
D3LAB(lab1, t3q1) = ltq1
in//let
//
if // if
(lab0=lab1)
then
let
val ltq1 =
D3LAB(lab0, t3q0)
in//let
list_cons(ltq1, ltqs) end
else
list_cons(ltq1,
l3t3p1lst_lab$fset(ltqs, lab0, t3q0))
end//let//end-of-[list_cons(ltq1,ltqs)]
//
)(*case+*)//end-of-[l3t3p1lst_lab$fset(ltqs,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_dynexp3_utils0.dats] *)
(***********************************************************************)
