(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)
//
(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
Author: Hongwei Xi
//
Mon May 18 09:17:12 PM EDT 2026
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
(* ****** ****** *)
#staload
"./../../../SATS/xstamp0.sats"
#staload
"./../../../SATS/xsymbol.sats"
(* ****** ****** *)
#staload
"./../../../SATS/dynexp2.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload ".\
/../../../xats2cc\
/srcgen1/SATS/intrep0.sats"//...
#staload "./../SATS/intrep1.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1val_conq
  (ival) =
(
case+
ival.node()
of // case+
| I1Vcon _ => true
| _(*non-I1Vcon*) => false)
//
#implfun
i1val_cstq
  (ival) =
(
case+
ival.node()
of // case+
| I1Vcst _ => true
| _(*non-I1Vcst*) => false)
//
(* ****** ****** *)
//
#implfun
i1val_cfnq
  (ival) =
(
case+
ival.node()
of // case+
| I1Vcst(d2c) =>
(
  d2cst_castq(d2c) )
| _(*non-I1Vcst*) => false)
//
(* ****** ****** *)
//
#implfun
i1val_fidq
  (ival) =
(
case+
ival.node()
of // case+
| I1Vfid _ => true
| _(*non-I1Vvar*) => false)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1cmp_retq
 (icmp) =
(
auxlp1(
icmp.ilts()))
where
{
//
(* ****** ****** *)
//
fun
auxlp1
(ilts
:i1letlst): bool =
(
case+ ilts of
|list_nil
( (*0*) ) => false
|list_cons
(ilt1, ilts) => auxlp2(ilts, ilt1)
)
//
and
auxlp2
(ilts
:i1letlst
,ilt1: i1let): bool =
(
case+ ilts of
|list_nil
( (*0*) ) =>
(
case+ ilt1 of
|I1LETnew0
(   iins   ) =>
(
case+ iins of
//
|I1INSift0 _ =>
(
f0_iins$ift0(iins))
//
|I1INScas0 _ =>
(
f0_iins$cas0(iins))
//
|I1INSrturn _ => (true)
//
|
_(*otherwise*) => false)
|I1LETnew1(_, _) => false)
|list_cons
(ilt2, ilts) => auxlp2(ilts, ilt2)
)
//
(* ****** ****** *)
//
and
f0_iins$ift0
(iins: i1ins): bool =
let
//
val-
I1INSift0
(test
,opt1, opt2) = iins
//
in//let
//
(
case+ opt1 of
|optn_nil() =>
(
case+ opt2 of
|optn_nil
( (*0*) ) => false
|optn_cons
(  icmp  ) => i1cmp_retq(icmp)
)
|optn_cons
(  icmp  ) => i1cmp_retq(icmp))
//
end(*let*)//end-of-[f0_iins$ift0(.)]
//
and
f0_iins$cas0
(iins: i1ins): bool =
let
//
val-
I1INScas0
(cask
,ival, icls) = iins
//
in//let
//
(
list_exists(icls))
where{
//
#typedef x0 = i1cls
//
#impltmp
exists$test<x0>(x0) =
(
case+
x0.node() of
|I1CLSgpt
(   igpt   ) => false
|I1CLScls
(igpt, icmp) => i1cmp_retq(icmp))
//
}(*where*)//end-of-[list_exists(.)]
//
end(*let*)//end-of-[f0_iins$cas0(.)]
//
(* ****** ****** *)
//
}(*where*)//end-of-[i1cmp_retq(icmp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
t1imp_i1cmpq
(   timp   ) =
(
case+
timp.node() of
|T1IMPall1
(dcst
,t2js, dopt) => f0_dopt(dopt)
|T1IMPallx
(dcst
,t2js, dopt) => f0_dopt(dopt)
) where
{
//
fun
f0_dopt
( dopt
: i1dclopt): i1cmpopt =
(
case+ dopt of
|
optn_nil() => optn_nil((*0*))
|
optn_cons(idcl) => f1_idcl(idcl))
//
and
f1_idcl
(idcl: i1dcl): i1cmpopt =
(
case+
idcl.node() of
//
|I1Ddclenv
(dcl1, envs) => f1_idcl(dcl1)
|I1Dtmpsub
(svts, dcl1) => f1_idcl(dcl1)
//
|
I1Dfundclst
(tknd
,lvl0, tqas
,d2cs, i1fs) => optn_nil((*0*))
//
|
I1Dimplmnt0
(tknd, lvl0
,stmp, dimp
,fjas, icmp) => optn_nil((*0*))
(*
case+ fjas of
|list_nil() => optn_cons(icmp)
|list_cons(_, _) => optn_nil((*0*))
*)
//
| _(*otherwise*) => optn_nil((*0*))
//
)(*case+*)//end-of-[ f1_dopt(dopt) ]
//
(*
val () =
prerrsln("t1imp_i1cmpq: timp = ", timp)
*)
//
}(*where*)//end-of-[t1imp_i1cmpq( timp )]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
t1imp_i1dclq
(   timp   ) =
(
case+
timp.node() of
|T1IMPall1
(dcst
,t2js, dopt) => f0_dopt(dopt)
|T1IMPallx
(dcst
,t2js, dopt) => f0_dopt(dopt)
) where
{
//
fun
f0_dopt
( dopt
: i1dclopt): i1dclopt =
(
case+ dopt of
|
optn_nil() => optn_nil((*0*))
|
optn_cons(idcl) => f1_idcl(idcl))
//
and
f1_idcl
(idcl: i1dcl): i1dclopt =
(
case+
idcl.node() of
//
|I1Ddclenv
(dcl1,envs) => f1_idcl(dcl1)
|I1Dtmpsub
(svts,dcl1) => f1_idcl(dcl1)
//
|I1Dfundclst _ => optn_cons(idcl)
|I1Dimplmnt0 _ => optn_cons(idcl)
//
| _(*otherwise*) => optn_nil((*0*))
//
)(*case+*)//end-of-[ f1_dopt(dopt) ]
//
(*
val () =
prerrsln("t1imp_i1dclq: timp = ", timp)
*)
//
}(*where*)//end-of-[t1imp_i1dclq( timp )]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d2var_tailq
(d2v0, ical) =
(
case+ ical of
|I0CALfix
(   dfix   ) => (d2v0 = dfix)
|I0CALfun
(dfix, d2vs) => (d2v0 = dfix) 
|_(*otherwise*) => (   false   )
)(*case+*)//end-of-[d2var_tailq(...)]
//
(* ****** ****** *)
//
#implfun
i1val_tailq
(ival, ical) =
(
case+
ival.node() of
|I1Vfid
(   dfix   ) =>
(
  d2var_tailq(dfix, ical))
|I1Vfenv
(dfix, envs) =>
(
  d2var_tailq(dfix, ical))
|_(*otherwise*) => (    false   )
)(*case+*)//end-of-[i1val_tailq(...)]
//
(* ****** ****** *)
//
#implfun
i1cmp_tailq
(icmp, ical) =
(
auxlp1(icmp.ilts())
) where
{
//
fun
auxtst
(tnm0: i1tnm): bool =
let
//
val ival = icmp.ival()
//
#symload
stmp with i1tnm_stmp$get
//
in//let
//
case+
ival.node() of
|I1Vtnm(tnm1) =>
(
tnm0.stmp() = tnm1.stmp())
|
_(*otherwise*) => ( false )
//
end(*let*)//end-of-[auxtst(...)]
//
fun
auxlp1
( ilts
: i1letlst): bool =
(
case+ ilts of
|list_nil() => false
|list_cons
(ilt1, ilts) => auxlp2(ilts, ilt1)
)
//
and
auxlp2
( ilts
: i1letlst
, ilt1: i1let): bool =
(
case+ ilts of
|list_nil
( (*0*) ) =>
(
case+ ilt1 of
|I1LETnew0
(   iins   ) => false
|I1LETnew1
(tnm1, iins) =>
(
if // if
not(
auxtst(tnm1))
then false else
case+ iins of
|I1INSdapp
(i1f0, i1vs) =>
(
  i1val_tailq(i1f0, ical))
|_(*non-I1INSdapp*) => (false))
)
|list_cons
(ilt2, ilts) => auxlp2(ilts, ilt2)
)
}(*where*)//end-of-[i1cmp_tailq(icmp,ical)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen2_DATS_intrep1_utils0.dats] *)
(***********************************************************************)
