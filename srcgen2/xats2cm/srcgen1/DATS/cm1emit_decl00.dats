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
(*
Thu Jul  2 11:24:48 PM EDT 2026
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
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
//
#include
"./../HATS/libxatsopt.hats"
#include
"./../HATS/libxats2js.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/xats2cm.sats"
#staload "./../SATS/cm1emit.sats"
//
(* ****** ****** *)
//
#staload
_(*DATS*)="./../DATS/cm1emit.dats"
//
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload node with dimpl_get_node
(* ****** ****** *)
(*
#symload ival with i1cmp_get_ival
#symload ilts with i1cmp_get_ilts
*)
(* ****** ****** *)
#symload lctn with i1dcl_lctn$get
#symload node with i1dcl_node$get
(* ****** ****** *)
#symload filr with envx2js_filr$get
#symload nind with envx2js_nind$get
(* ****** ****** *)
(* ****** ****** *)
//
fun
fprintln
(filr: FILR): void =
(
 strn_fprint("\n", filr))//endfun
//
(* ****** ****** *)
//
fun
lctnfpr
(filr: FILR
,loc0: loc_t): void =
(
 loctn_fprint(loc0, filr))//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
dicstcm1
(filr: FILR
,dimp: dimpl): void =
(
case+
dimp.node() of
|DIMPLone1
(  dcst  ) =>
(
  d2cstcm1(filr, dcst))
|DIMPLone2
(dcst, svts) =>
(
  d2cstcm1(filr, dcst))
|DIMPLnon1
(  dqid  ) =>
(
  d1qid_fprint(dqid, filr))
)(*case+*)//end-of-(dicstcm1)
//
(* ****** ****** *)
//
fun
dimplfpr
(filr: FILR
,dimp: dimpl): void =
(
 dimpl_fprint(dimp, filr))//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1dcl_cm1emit
(
  dcl0, env0) =
let
(*
//
val () =
prerrsln
("i1dcl_cm1emit: dcl0 = ", dcl0))
//
*)
in//let
//
case+
dcl0.node() of
//
(* ****** ****** *)
//
|I1Dextern _ =>
(
  f0_extern(dcl0, env0))
|I1Dstatic _ =>
(
  f0_static(dcl0, env0))
//
(* ****** ****** *)
//
|I1Ddclst0 _ =>
(
  f0_dclst0(dcl0, env0))
|I1Dlocal0 _ =>
(
  f0_local0(dcl0, env0))
//
(* ****** ****** *)
//
|I1Dinclude _ =>
(
  f0_include(dcl0, env0))
//
(* ****** ****** *)
//
|I1Dvaldclst _ =>
(
  f0_valdclst(dcl0, env0))
//
|I1Dvardclst _ =>
(
  f0_vardclst(dcl0, env0))
//
(* ****** ****** *)
//
|I1Dfundclst _ =>
(
  f0_fundclst(dcl0, env0))
//
(* ****** ****** *)
//
(*
|I1Dimplmnt0 _ =>
(
  f0_implmnt0(dcl0, env0))
*)
//
(* ****** ****** *)
(* ****** ****** *)
|_(*otherwise*) => f0_otherwise(dcl0, env0)
(* ****** ****** *)
(* ****** ****** *)
//
end where
{
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_extern
(
dcl0: i1dcl,
env0: envx2js): void =
let
//
val filr = env0.filr()
val nind = env0.nind()
//
val loc0 = dcl0.lctn()
//
val-
I1Dextern
(tknd, dcl1) = dcl0.node()
//
val
(  ) =
let
//
#impltmp
g_print$out<>() = filr
//
in//let
//
nindfpr(filr, nind);
prints
(";; I1Dextern(",loc0,")\n")
end//let
//
val (  ) =
(
nindstrnfpr(filr, nind, ";; ");
i1dcl_fprint(dcl1, filr); fprintln(filr))
//
end(*let*)//end-of-[f0_extern(dcl0,env0)]
//
(* ****** ****** *)
//
fun
f0_static
(
dcl0: i1dcl,
env0: envx2js): void =
let
//
val filr = env0.filr()
val nind = env0.nind()
//
val loc0 = dcl0.lctn()
//
val-
I1Dstatic
(tknd, dcl1) = dcl0.node()
//
val
(  ) =
let
//
#impltmp
g_print$out<>() = filr
//
in//let
nindfpr(filr, nind);
prints
(";; I1Dstatic(",loc0,")\n")
end//let
//
val (  ) =
(
  xats2cm_i1dcl( env0, dcl1 ))
//
end(*let*)//end-of-[f0_static(dcl0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_dclst0
(
dcl0: i1dcl,
env0: envx2js): void =
let
//
val-
I1Ddclst0
(   dcls   ) = dcl0.node()
//
val () =
(
  i1dclist_cm1emit(dcls, env0))
//
end(*let*)//end-of-[f0_dclst0(dcl0,env0)]
//
(* ****** ****** *)
//
fun
f0_local0
(
dcl0: i1dcl,
env0: envx2js): void =
let
//
val filr = env0.filr()
val nind = env0.nind()
//
val loc0 = dcl0.lctn()
//
val-
I1Dlocal0
(head, body) = dcl0.node()
//
val
(  ) =
let
//
#impltmp
g_print$out<>() = filr
//
in//let
(
nindfpr(filr, nind);
prints
(";; I1Dlocal0(",loc0,")\n"))
end//let
//
val () =
(
  i1dclist_cm1emit(head, env0))
val () =
(
  i1dclist_cm1emit(body, env0))
//
end(*let*)//end-of-[f0_local0(dcl0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_include
(
dcl0: i1dcl,
env0: envx2js): void =
let
//
val filr = env0.filr()
val nind = env0.nind()
//
val loc0 = dcl0.lctn()
//
val-
I1Dinclude
( knd0
, tknd, gsrc
, fopt, dopt) = dcl0.node()
//
val (  ) =
let
//
#impltmp
g_print$out<>() = filr
//
in//let
(
nindfpr(filr, nind);
prints
(";; I1Dinclude(",loc0,")\n"))
end//let
//
in//let
(
case+ dopt of
|optn_nil() => ( (*void*) )
|optn_cons(dcls) =>
(
  i1dclist_cm1emit(dcls, env0)))
end(*let*)//end-of-[f0_include(dcl0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_valdclst
(
dcl0: i1dcl,
env0: envx2js): void =
let
//
val filr =
  env0.filr((*void*))
val nind =
  env0.nind((*void*))
val loc0 =
  dcl0.lctn((*void*))
//
val-
I1Dvaldclst
(tknd, i1vs) = dcl0.node()
//
val
prvq =
(
  valtok_prvq( tknd ))
//
val (  ) =
let
//
#impltmp
g_print$out<>() = filr
//
in//let
//
(
  nindfpr(filr, nind));
//
if
prvq
then prints
(";; I1Dprvdclist(",loc0,")\n")
else prints
(";; I1Dvaldclist(",loc0,")\n")
//
end//let
//
val (  ) =
if
prvq
then
(
 xats2cm_i1valdclist(env0, i1vs))
else
(
 i1valdclist_cm1emit(i1vs, env0))
//
end(*let*)//end-of-[f0_valdclst(dcl0,env0)]
//
(* ****** ****** *)
//
fun
f0_vardclst
(
dcl0: i1dcl,
env0: envx2js): void =
let
//
val filr = env0.filr()
val nind = env0.nind()
//
val loc0 = dcl0.lctn()
//
val-
I1Dvardclst
(tknd, i1vs) = dcl0.node()
//
val (  ) =
let
//
#impltmp
g_print$out<>() = filr
//
in//let
nindfpr(filr, nind);
prints
(";; I1Dvardclist(",loc0,")\n")
end//let
//
val (  ) =
(
 i1vardclist_cm1emit(i1vs, env0))
//
end(*let*)//end of [f0_vardclst(dcl0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_fundclst
(
dcl0: i1dcl,
env0: envx2js): void =
let
//
val filr =
  env0.filr((*void*))
val nind =
  env0.nind((*void*))
val loc0 =
  dcl0.lctn((*void*))
//
val-
I1Dfundclst
(tknd, tqas
,d2cs, i1fs) = dcl0.node()
//
val prfq =
(
  funtok_prfq( tknd ))
//
val (  ) =
let
//
#impltmp
g_print$out<>() = filr
//
in//let
//
(
  nindfpr(filr, nind));
//
if
prfq
then prints
(";; I1Dprfdclist(",loc0,")\n")
else prints
(";; I1Dfundclist(",loc0,")\n")
//
end//let
//
val (  ) =
if
prfq
then
(
 xats2cm_i1fundclist(env0, i1fs))
else
(
 i1fundclist_cm1emit(i1fs, env0))
//
end(*let*)//end-of-[f0_fundclst(dcl0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_otherwise
(
dcl0: i1dcl,
env0: envx2js): void =
let
//
val loc0 =
(
  dcl0.lctn((*void*)))
//
val filr =
(
  envx2js_filr$get(env0))
val nind =
(
  envx2js_nind$get(env0))
//
in//let
//
(
nindstrnfpr
(filr, nind, ";; ");loctn_fprint(loc0, filr);fprintln(filr);
nindstrnfpr
(filr, nind, ";; ");i1dcl_fprint(dcl0, filr);fprintln(filr))
//
end(*let*)//end-of-[f0_otherwise(dcl0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[i1dcl_cm1emit(dcl0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1valdcl_cm1emit
  (idcl, env0) = let
//
(* ****** ****** *)
//
val dpat =
i1valdcl_dpat$get(idcl)
val tdxp =
i1valdcl_tdxp$get(idcl)
//
(* ****** ****** *)
//
val ipat =
(
case+ dpat of
|I1BNDcons(_,ipat,_) => ipat)
val itnm =
(
case+ dpat of
|I1BNDcons(itnm,_,_) => itnm)
//
(* ****** ****** *)
//
val (  ) =
(
case+ tdxp of
//
|
TEQI1CMPnone
( (*void*) ) => ( (*void*) )
|
TEQI1CMPsome
(teq1, icmp) =>
let
//
val ival =
(
  i1cmp_ival$get(icmp))
val filr =
(
  envx2js_filr$get(env0))
val nind =
(
  envx2js_nind$get(env0))
//
val (  ) =
(
nindfpr(filr, nind);
//
(
if (nind > 0)
then strnfpr(filr, "(")
else strnfpr(filr, "(define "));
//
i1tnmcm1(filr, itnm);strnfpr(filr, "\n"))
//
val (  ) =
(
i1cmp_ind$cm1emit(icmp, 1, env0))
val (  ) =
(
if // if
(nind > 0)
then//then
(
strnfpr(filr, ")");fprintln(filr))
else//else
(
nindstrnfpr(filr, nind, "\n) ;; val(...)");fprintln(filr)))
//
val (  ) =
(
nindfpr(filr, nind);strnfpr(filr, "(XATS000_patck");
i0pckcm1(filr, ival, ipat);strnfpr(filr, ")");fprintln(filr))
//
endlet(*TEQI1CMPsome*))(*case+of(tdxp)*)
//
(* ****** ****** *)
//
end where//end-of-let(i1valdcl_cm1emit(ival,...)]
{
//
(* ****** ****** *)
//
val (  ) =
let
val filr =
(
envx2js_filr$get(env0))
val nind =
(
envx2js_nind$get(env0))
in//let
(
 nindstrnfpr(filr, nind, ";; I1VALDCL\n"))
end//let//end-of-[val()]
//
(* ****** ****** *)
//
}(*where*)//end-of-[i1valdcl_cm1emit(dcl0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1vardcl_cm1emit
  (idcl, env0) = let
//
(* ****** ****** *)
//
val dpid =
i1vardcl_dpid$get(idcl)
val tdxp =
i1vardcl_dini$get(idcl)
//
(* ****** ****** *)
//
val itnm =
(
case+ dpid of
|I1BNDcons(itnm,_,_) => itnm)
//
(* ****** ****** *)
//
val (  ) =
(
case+ tdxp of
//
|
TEQI1CMPnone
( (*void*) ) =>
let
//
val filr = env0.filr()
val nind = env0.nind()
//
in//let
//
(*
HX-2026-07-08:
w/o initialization
*)
nindfpr(filr, nind);
(
if (nind > 0)
then strnfpr(filr, "(")
else strnfpr(filr, "(define "));
//
i1tnmcm1(filr, itnm);strnfpr(filr, " (XATSVAR0))");fprintln(filr)
//
end//let//end-of-[TEQI1CMPnone]
//
|
TEQI1CMPsome
(teq1, icmp) =>
let
//
val filr = env0.filr()
val nind = env0.nind()
//
in//let
//
(*
HX-2026-07-08:
with initialization
*)
(
nindfpr(filr, nind);
if (nind > 0)
then strnfpr(filr, "(")
else strnfpr(filr, "(define "));
i1tnmcm1(filr, itnm);strnfpr(filr, "\n");
nindstrnfpr(filr, nind+1, "(XATSVAR1\n");
i1cmp_ind$cm1emit(icmp, 2, env0);strnfpr(filr, ")");
//
if // if
(nind > 0)
then//then
(
strnfpr(filr, ")");fprintln(filr))
else//else
(
nindstrnfpr(filr, nind, "\n) ;; var(...)");fprintln(filr))
//
end//let//end-of-[TEQI1CMPsome]
//
) (*case+*) // end-of-( teqi1exp )
//
(* ****** ****** *)
//
end where
{
//
val (  ) =
let
val filr =
(
envx2js_filr$get(env0))
val nind =
(
envx2js_nind$get(env0))
in//let
(
 nindstrnfpr(filr, nind, ";; I1VARDCL\n"))
end//let//end-of-[val()]
//
}(*where*)//end-of-[i1vardcl_cm1emit(dcl0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1fundcl_cm1emit
  (ifun, env0) = let
//
(* ****** ****** *)
//
val dvar =
i1fundcl_dpid$get(ifun)
val fjas =
i1fundcl_farg$get(ifun)
val tdxp =
i1fundcl_tdxp$get(ifun)
//
(* ****** ****** *)
//
val (  ) =
let
in//let
(
nindfpr(filr, nind);
(
if (nind > 0)
then strnfpr(filr, "(")
else strnfpr(filr, "(define "));
d2varcm1(filr, dvar);strnfpr(filr, " ;; fun(...)\n");
nindstrnfpr(filr, nind+1, "(lambda (");fjas1cm1(filr, fjas);strnfpr(filr, ")\n"))
end//let
//
(* ****** ****** *)
//
val (  ) = // enter
(
  envx2js_pshlam0(env0) )
//
val (  ) =
(
case+ tdxp of
|
TEQI1CMPnone
( (*void*) ) => ((*void*))
|
TEQI1CMPsome
(teq1, icmp) =>
let
//
val (  ) =
let
val nind = nind+2
in//let
nindstrnfpr
(filr, nind, "(let\n");
nindstrnfpr(filr, nind, "(\n");
fjletlst_ind$cm1emit(fjas, 0, env0);
nindstrnfpr(filr, nind, ")\n")
end//let
//
val (  ) =
(
i1cmp_cm1emit(icmp, env0); strnfpr(filr, "))"))
//
(* ****** ****** *)
end//let//end[TEQI1DEXPsome(...)]
(* ****** ****** *)
)(*case+*)//end-of-(case+of(tdxp))
//
val (  ) = envx2js_poplam0(env0)//leave
//
val (  ) =
(
if // if
(nind > 0)
then//then
(
strnfpr(
filr, ") ;; ");d2varcm1(filr, dvar);fprintln(filr))
else//else
(
nindstrnfpr(
filr, nind, "\n) ;; ");d2varcm1(filr, dvar);fprintln(filr)))
//
(* ****** ****** *)
//
end where
{
//
val filr =
(
  envx2js_filr$get(env0))
val nind =
(
  envx2js_nind$get(env0))
//
val (  ) =
(
  nindstrnfpr(filr, nind, ";; I1FUNDCL\n"))
//
}(*where*)//end-of-[i1fundcl_cm1emit(ifun,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cm_srcgen1_DATS_cm1emit_decl00.dats] *)
(***********************************************************************)
