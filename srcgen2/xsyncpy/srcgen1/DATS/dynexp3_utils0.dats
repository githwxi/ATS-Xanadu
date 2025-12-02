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
d3exp1_lftq
  (dexp) =
(
case+
dexp.node() of
//
|D3E1var _ => (   true   )
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
l3t3p1lst_lab$proj
  (ltqs, lab0) =
(
case+ ltqs of
|
list_nil
( (*void*) ) =>
d3typ1_none0((*void*))
|
list_cons
(ltq1, ltqs) =>
let
val+
D3LAB
(lab1, t3q1) = ltq1
in//let
if // if
(lab0 = lab1) then t3q1
else l3t3p1lst_lab$proj(ltqs, lab0) end
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
|
T3P1styp(styp) =>
(
d3typ1(
t2rt, T3P1styp(styp)))
where
{
//
val t2rt =
(
  d3typ1_styp$get(dtyp))
//
val t2q0 =
(
case-
t3q0.node() of
|T3P1styp(t2q0) => t2q0)
//
val styp =
s2typ1_lab$fset(styp, lab0, t2q0)
//
}(*where*)//end-of-[T3P1styp(styp)]
//
|_(*non-T3P1tuple*) => (    dtyp    )
//
) where
{
//
(*
val () =
prerrsln("d3typ1_lab$fset: dtyp = ", dtyp)
val () =
prerrsln("d3typ1_lab$fset: lab0 = ", lab0)
val () =
prerrsln("d3typ1_lab$fset: t3q0 = ", t3q0)
*)
//
}(*where*)//end-of-[d3typ1_lab$fset(dtyp,lab0,t3q0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_dynexp3_utils0.dats] *)
(***********************************************************************)
