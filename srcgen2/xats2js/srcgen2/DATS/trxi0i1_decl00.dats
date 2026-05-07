(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

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

(* ****** ****** *)
(* ****** ****** *)
//
(*
Author: Hongwei Xi
//
Sun Apr 26 09:47:30 AM EDT 2026
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
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../../../SATS/xbasics.sats"
#staload
"./../../../SATS/lexing0.sats"
#staload
"./../../../SATS/dynexp2.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload ".\
/../../../xats2cc\
/srcgen1/SATS/intrep0.sats"//...
//
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/trxi0i1.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
_(*DATS*)="./../DATS/trxi0i1.dats"
//
(* ****** ****** *)
(* ****** ****** *)
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with d2var_get_lctn
(* ****** ****** *)
#symload lctn with i0dcl_lctn$get
#symload node with i0dcl_node$get
(* ****** ****** *)
(*
#symload ival with i1cmp_ival$get
#symload ilts with i1cmp_ilts$get
*)
(* ****** ****** *)
//
#implfun
i0dcl_trxi0i1
(dcl0, env0) =
(
case+
dcl0.node() of
//
(* ****** ****** *)
//
|I0Dd3ecl _ =>
let
val
loc0 = dcl0.lctn()
in//let
i1dcl_make_node
(loc0, I1Di0dcl(dcl0))
end//let//end(I0Dd3ecl)
//
(* ****** ****** *)
//
|I0Dextern _ =>
(
  f0_extern(dcl0, env0))
//
|I0Dstatic _ =>
(
  f0_static(dcl0, env0))
//
(* ****** ****** *)
//
|I0Ddclst0 _ =>
(
  f0_dclst0(dcl0, env0))
|I0Dlocal0 _ =>
(
  f0_local0(dcl0, env0))
//
(* ****** ****** *)
//
|I0Dtmpsub _ =>
(
  f0_tmpsub(dcl0, env0))
//
(* ****** ****** *)
//
|I0Dinclude _ =>
(
  f0_include(dcl0, env0))
//
(* ****** ****** *)
//
|I0Dvaldclst _ =>
(
  f0_valdclst(dcl0, env0))
|I0Dvardclst _ =>
(
  f0_vardclst(dcl0, env0))
//
(* ****** ****** *)
//
|I0Dfundclst _ =>
(
  f0_fundclst(dcl0, env0))
//
(* ****** ****** *)
//
|I0Dimplmnt0 _ =>
(
  f0_implmnt0(dcl0, env0))
//
(* ****** ****** *)
|_(* otherwise *) => i1dcl_none1(dcl0)
(* ****** ****** *)
//
) where
{
//
(* ****** ****** *)
//
fun
f0_extern
(
dcl0: i0dcl,
env0: !envi0i1): i1dcl =
let
//
val
loc0 = dcl0.lctn((*0*))
val-
I0Dextern
(tknd, dcl1) = dcl0.node()
//
val dcl1 =
(
  i0dcl_trxi0i1(dcl1, env0))
//
in//let
(
i1dcl(loc0, I1Dextern(tknd, dcl1)))
end(*let*)//end of [f0_extern(d3cl,env0)]
//
fun
f0_static
(
dcl0: i0dcl,
env0: !envi0i1): i1dcl =
let
//
val
loc0 = dcl0.lctn((*0*))
val-
I0Dstatic
(tknd, dcl1) = dcl0.node()
//
val dcl1 =
(
  i0dcl_trxi0i1(dcl1, env0))
//
in//let
(
i1dcl(loc0, I1Dstatic(tknd, dcl1)))
end(*let*)//end of [f0_static(d3cl,env0)]
//
(* ****** ****** *)
//
fun
f0_dclst0
(
dcl0: i0dcl,
env0: !envi0i1): i1dcl =
let
//
val
loc0 = dcl0.lctn((*0*))
val-
I0Ddclst0
(   dcls   ) = dcl0.node()
//
val dcls =
i0dclist_trxi0i1(dcls, env0)
//
in//let
(
  i1dcl(loc0, I1Ddclst0( dcls ) ) )
end(*let*)//end of [f0_dclst0(d3cl,env0)]
//
(* ****** ****** *)
//
fun
f0_local0
(
dcl0: i0dcl,
env0: !envi0i1): i1dcl =
let
//
val
loc0 = dcl0.lctn((*0*))
val-
I0Dlocal0
(head, body) = dcl0.node()
//
(*
HX-2024-09-16:
This way of handling
local-in-end is okay as
unam is used for comparison
*)
//
(*
val (  ) =
envi0i1_pshloc1(env0)
val (  ) =
envi0i1_pshloc2(env0)
*)
val head =
i0dclist_trxi0i1(head, env0)
val body =
i0dclist_trxi0i1(body, env0)
(*
val (  ) = envi0i1_locjoin(env0)
*)
//
in//let
(
  i1dcl(loc0, I1Dlocal0(head, body)))
end(*let*)//end of [f0_local0(d3cl,env0)]
//
(* ****** ****** *)
//
fun
f0_tmpsub
(
dcl0: i0dcl,
env0: !envi0i1): i1dcl =
let
//
val
loc0 = dcl0.lctn((*0*))
val-
I0Dtmpsub
(svts, dcl1) = dcl0.node()
val
dcl1 = i0dcl_trxi0i1(dcl1, env0)
//
in//let
(
  i1dcl(loc0, I1Dtmpsub(svts, dcl1)))
end(*let*)//end of [f0_tmpsub(d3cl,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_include
(
dcl0: i0dcl,
env0: !envi0i1): i1dcl =
let
//
val
loc0 = dcl0.lctn((*0*))
val-
I0Dinclude
(knd0
,tknd, gsrc
,fopt, dopt) = dcl0.node()
//
val dopt =
(
case+ dopt of
|
optn_nil() => optn_nil(*nil*)
|
optn_cons(dcls) =>
optn_cons
(i0dclist_trxi0i1(dcls, env0)))
//
in//let
(
  i1dcl_make_node
  ( loc0
  , I1Dinclude
    (knd0, tknd, gsrc, fopt, dopt)))
end(*let*)//end of [f0_include(d3cl,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_valdclst
(
dcl0: i0dcl,
env0: !envi0i1): i1dcl =
let
//
val
loc0 = dcl0.lctn((*0*))
val-
I0Dvaldclst
(tknd, i0vs) = dcl0.node()
//
val
i1vs =
i0valdclist_trxi0i1(i0vs, env0)
//
in//let
  i1dcl(loc0, I1Dvaldclst(tknd, i1vs))
end where
{
//
(*
val loc0 = dcl0.lctn()
val (  ) =
prerrsln("f0_valdclst(i0i1): d3cl = ", d3cl)
*)
//
}(*where*) // end of [f0_valdclst(d3cl,env0)]
//
(* ****** ****** *)
//
fun
f0_vardclst
(
dcl0: i0dcl,
env0: !envi0i1): i1dcl =
let
//
val
loc0 = dcl0.lctn((*0*))
val-
I0Dvardclst
(tknd, i0vs) = dcl0.node()
//
val
i0vs =
i0vardclist_trxi0i1(i0vs, env0)
//
in//let
  i1dcl(loc0, I1Dvardclst(tknd, i0vs))
end where
{
//
(*
val loc0 = dcl0.lctn()
val (  ) =
prerrsln("f0_vardclst(i0i1): dcl0 = ", dcl0)
*)
//
}(*where*) // end of [f0_vardclst(dcl0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_fundclst
(
dcl0: i0dcl,
env0: !envi0i1): i1dcl =
let
//
val
loc0 = dcl0.lctn((*void*))
//
val-
I0Dfundclst
(tknd
,lvl0, tqas
,d2cs, i0fs) = dcl0.node()
//
val recq =
(
case+
tknd.node() of
| T_FUN(fnk) =>
(
  funkind_recq(fnk) )
| _(*else*) => false): bool
//
val (  ) =
if // if
recq then mydvsins(env0, i0fs)
//
val
i1fs =
i0fundclist_trxi0i1(i0fs, env0)
//
val (  ) =
if // if
~(recq) then mydvsins(env0, i0fs)
//
in//let
//
i1dcl_make_node
(
loc0,
I1Dfundclst(
  tknd(*fnk*),lvl0,tqas,d2cs,i1fs))
//
end where
{
//
fun
mydvsins
( env0: !envi0i1
, i0fs: i0fundclist): void =
(
case+ i0fs of
|
list_nil() => ((*0*))
|
list_cons(i0f1, i0fs) =>
mydvsins(env0, i0fs) where
{
val d2v1 = i0fundcl_dpid$get(i0f1)
val (  ) = envi0i1_d2vins_self(env0, d2v1)
}
)
//
(*
//
val loc0 = dcl0.lctn((*void*))
//
val (  ) =
prerrsln("f0_fundclst(i0i1): dcl0 = ", dcl0)
*)
//
}(*where*) // end of [f0_fundclst(dcl0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_implmnt0
(
dcl0: i0dcl,
env0: !envi0i1): i1dcl =
let
//
val
loc0 = dcl0.lctn((*void*))
//
val-
I0Dimplmnt0
(tknd
,lvl0
,stmp
,dimp, fias
,iexp, i0vs) = dcl0.node()
//
val (  ) =
(
  envi0i1_pshlam0(env0))
//
val fjas =
fiarglst_trxi0i1(fias, env0)
//
val iret =
i0exp_trxi0i1(iexp, env0)
val ilts =
(
  envi0i1_poplam0(  env0  ))
val icmp = I1CMPcons(ilts, iret)
//
in//let
i1dcl_make_node
(
loc0,
I1Dimplmnt0(
  tknd, lvl0, stmp, dimp, fjas, icmp))
end where
{
//
(*
//
val loc0 = dcl0.lctn((*void*))
//
val (  ) =
prerrsln("f0_implmnt0(i0i1): dcl0 = ", dcl0)
*)
//
}(*where*) // end of [f0_implmnt0(dcl0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
val loc0 = dcl0.lctn((*0*))
//
(*
val (  ) =
(
  prerrsln("i0dcl_trxi0i1: loc0 = ", loc0) )
val (  ) =
(
  prerrsln("i0dcl_trxi0i1: dcl0 = ", dcl0) )
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
} (*where*) // end of [i0dcl_trxi0i1(idcl,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
teqi0exp_trxi0i1
  (tdxp, env0) =
(
case+ tdxp of
|
TEQI0EXPnone() =>
TEQI1CMPnone((*void*))
|
TEQI0EXPsome(teq1, i0e2) =>
TEQI1CMPsome(teq1, icmp) where
{
  val (  ) =
  (
    envi0i1_pshblk0(env0))
  val ival =
  (
    i0exp_trxi0i1(i0e2, env0) )
  val ilts = envi0i1_popblk0(env0)
  val icmp = I1CMPcons(ilts, ival) }
//
) (*case+*)//end-of(teqi0exp_trxi0i1(...))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0valdcl_trxi0i1
  (ival, env0) = let
//
val loc0 =
i0valdcl_lctn$get(ival)
val ipat =
i0valdcl_ipat$get(ival)
val tdxp =
i0valdcl_tdxp$get(ival)
//
val
tdxp =
teqi0exp_trxi0i1(tdxp, env0)
//
(*
HX-2024-07-14:
For non-recursive declaration!
*)
val
ibnd = i0pat_trxi0i1(ipat, env0)
//
in//let
(
  i1valdcl_make_args(loc0, ibnd, tdxp))
end//let
(*let*)//end-of-[i0valdcl_trxi0i1(ival,env0)]
//
(* ****** ****** *)
//
#implfun
i0vardcl_trxi0i1
  (ivar, env0) = let
//
val loc0 =
i0vardcl_lctn$get(ivar)
val dpid =
i0vardcl_dpid$get(ivar)
val tdxp =
i0vardcl_dini$get(ivar)
//
val tdxp =
teqi0exp_trxi0i1(tdxp, env0)
//
val dvar = dpid.dvar()
val itnm = i1tnm_new0()
val ival =
i1val(loc0, I1Vtnm(itnm))
val (  ) =
envi0i1_dvar$insert(env0,dvar,ival)
//
in//let
//
let
//
val ipat =
let
val loc1 = dvar.lctn()
val i0t1 = dpid.ityp()
in//let
i0pat(loc1, i0t1, I0Pvar(dvar))
end//let
//
val ibnd =
I1BNDcons
(itnm, ipat, list_sing@(dvar, ival))
//
in//let
  i1vardcl_make_args(loc0, ibnd, tdxp)
end//let
end//let
(*let*)//end-of-[i0vardcl_trxi0i1(ivar,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0fundcl_trxi0i1
  (ifun, env0) = let
//
val loc0 =
i0fundcl_lctn$get(ifun)
//
val dvar =
i0fundcl_dpid$get(ifun)
val fias =
i0fundcl_farg$get(ifun)
val tdxp =
i0fundcl_tdxp$get(ifun)
//
(*
val (  ) = prerrsln
("i0fundcl_trxi0i1: fias = ", fias)
val (  ) = prerrsln
("i0fundcl_trxi0i1: tdxp = ", tdxp)
*)
//
val (  ) =
envi0i1_pshlam0(env0)
//
(*
HX-2024-05-25:
stkmap_nilq()=false! *)
val (  ) =
envi0i1_exnm$insert
  (env0, i1f0) where
{
val i1f0 = i1val_var(dvar)
}(*where*)//end-of-[val()]
//
val fjas =
fiarglst_trxi0i1(fias, env0)
//
val tdxp =
(
case+ tdxp of
|
TEQI0EXPnone
( (*void*) ) =>
TEQI1CMPnone() where
{
val
ilts = envi0i1_poplam0(env0)}
|
TEQI0EXPsome
(teq1, iexp) =>
TEQI1CMPsome
( teq1
, I1CMPcons(ilts, ival)) where
{
val ival =
(
  i0exp_trxi0i1(iexp, env0) )
val ilts = envi0i1_poplam0(env0)}
) (*case+*) // end-of-( teqi0exp )
//
in//let
(
  i1fundcl(loc0, dvar, fjas, tdxp))
end//let
(*let*)//end-of-[i0fundcl_trxi0i1(ifun,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen2_DATS_trxi0i1_decl00.dats] *)
(***********************************************************************)
