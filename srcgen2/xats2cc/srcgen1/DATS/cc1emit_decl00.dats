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
Sun Aug 16 10:36:26 AM EDT 2026
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
//
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload // BAS =
"./../../../SATS/xbasics.sats"
//
#staload // STM =
"./../../../SATS/xstamp0.sats"
#staload // SYM =
"./../../../SATS/xsymbol.sats"
#staload // LOC =
"./../../../SATS/locinfo.sats"
#staload // LEX =
"./../../../SATS/lexing0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/xats2cc.sats"
//
#staload "./../SATS/cc1emit.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
endlfpr
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
loctn_fprint(loc0,filr))//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
#static0
fun
valtok_prvq(token): bool
#static0
fun
funtok_prfq(token): bool
//
#implfun
valtok_prvq
(   tok   ) =
(
case-
tok.node() of
|T_VAL
( vlk ) => valkind_prvq(vlk))
(* end-of-[valtok_prvq(tok)] *)
//
#implfun
funtok_prfq
(   tok   ) =
(
case-
tok.node() of
|T_FUN
( fnk ) => funkind_prfq(fnk))
(* end-of-[funtok_prfq(tok)] *)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1dcl_cc1emit
(dcl0, env0) =
let
// (*
//
val () =
prerrsln
("i1dcl_cc1emit: dcl0 = ", dcl0)
//
// *)
in//let
//
case+
dcl0.node() of
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1Dinclude _ =>
(
  f0_include(dcl0, env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1Dvaldclst _ =>
(
  f0_valdclst(dcl0, env0))
(*
|I1Dvardclst _ =>
(
  f0_vardclst(dcl0, env0))
*)
//
(* ****** ****** *)
//
(*
|I1Dfundclst _ =>
(
  f0_fundclst(dcl0, env0))
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
f0_include
( 
dcl0: i1dcl,
env0: !envxcc1): void =
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
("// I1Dinclude(",loc0,")\n"))
end//let
//
in//let
(
case+ dopt of
|optn_nil() => ( (*void*) )
|optn_cons(dcls) =>
(
  i1dclist_cc1emit(dcls, env0)))
end(*let*)//end-of-[f0_include(dcl0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_valdclst
(
dcl0: i1dcl,
env0: !envxcc1): void =
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
("// I1Dprvdclist(",loc0,")\n")
else prints
("// I1Dvaldclist(",loc0,")\n")
//
end//let
//
val (  ) =
if
prvq
then
(
(*
(
  i1valdclist_ccaemit(i1vs, env0))
*)
)
else
(
  i1valdclist_cc1emit(i1vs, env0))
//
end(*let*)//end-of-[f0_valdclst(dcl0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_otherwise
(
dcl0: i1dcl,
env0: !envxcc1): void =
let
//
val loc0 =
dcl0.lctn((*void*))
//
val filr =
envxcc1_filr$get(env0)
val nind =
envxcc1_nind$get(env0)
//
in//let
//
nindfpr(filr, nind);
strnfpr(filr, "// ");lctnfpr(filr, loc0);endlfpr(filr);
nindfpr(filr, nind);
strnfpr(filr, "// ");i1dcl_fprint(dcl0, filr);endlfpr(filr)
//
end(*let*)//end-of-[f0_otherwise(dcl0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[i1dcl_cc1emit(dcl0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
//
#implfun
i1valdcl_cc1emit
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
i1cmp_ival$get(icmp)
val filr =
envxcc1_filr$get(env0)
val nind =
envxcc1_nind$get(env0)
//
val () =
(
nindfpr
(filr, nind);
i1tnmcc1
(filr, itnm);endlfpr(filr))
//
// HX: for computing ival
val () =
f0_i1tnmcmp(itnm, icmp, env0)
//
(*
val () =
(
nindstrnfpr
(filr
,nind, "XATS000_patck(");
i0pckcc1(filr, ival, ipat);
strnfpr(filr, ")");endlfpr(filr))
*)
//
endlet(*TEQI1CMPsome*))(*case+(tdxp)*)
//
(* ****** ****** *)
//
end where//end-of-(i1valdcl_cc1emit(...)]
{
//
val (  ) =
let
val filr =
(
envxcc1_filr$get(env0))
val nind =
(
envxcc1_nind$get(env0))
in//let
(
  nindstrnfpr(filr, nind, "// I1VALDCL\n"))
end//let//end-of-[val()]
//
fun
f0_i1tnmcmp
(
itnm: i1tnm,
icmp: i1cmp,
env0: !envxcc1): void =
let
//
val filr =
envxcc1_filr$get(env0)
val nind =
envxcc1_nind$get(env0)
//
val
ival =
(
  i1cmp_ival$get(icmp))
val
ilts =
(
  i1cmp_ilts$get(icmp))
//
val () =
i1letlst_cc1emit(ilts, env0)
//
val () =
let
(*
nindfpr(filr, nind);
i1tnmcc1(filr, itnm);strnfpr(filr, " = ");i1valcc1(filr, ival);endlfpr(filr)
*)
end//let
//
end//let//end-of-[f0_i1tnmcmp(...)]
//
}(*where*)//end-of-[i1valdcl_cc1emit(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3-XANADU/srcgen2/xats2cc/srcgen1/DATS/cc1emit_decl00.dats] *)
(***********************************************************************)
(***********************************************************************)
