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
Sun May 17 11:50:46 AM EDT 2026
*)
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
#staload // BAS =
"./../../../SATS/xbasics.sats"
//
#staload // SYM =
"./../../../SATS/xsymbol.sats"
#staload // LOC =
"./../../../SATS/locinfo.sats"
#staload // LEX =
"./../../../SATS/lexing0.sats"
//
#staload // S1E =
"./../../../SATS/staexp1.sats"
#staload // D2E =
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
#staload "./../SATS/xats2js.sats"
#staload "./../SATS/js1emit.sats"
//
(* ****** ****** *)
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
loctn_fprint(loc0,filr))//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
valtok_prvq
(tok: token): bool =
(
case-
tok.node() of
|T_VAL
( vlk ) => valkind_prvq(vlk))
(*case-*)//end(valtok_prvq(tok))
//
fun
funtok_prfq
(tok: token): bool =
(
case-
tok.node() of
|T_FUN
( fnk ) => funkind_prfq(fnk))
(*case-*)//end(funtok_prfq(tok))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1dcl_js1emit
(dcl0, env0) =
let
(*
//
val () =
prerrsln
("i1dcl_js1emit: dcl0 = ", dcl0))
//
*)
in//let
//
case+
dcl0.node() of
//
(* ****** ****** *)
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
(* ****** ****** *)
//
|I1Dvaldclst _ =>
(
  f0_valdclst(dcl0, env0))
|I1Dvardclst _ =>
(
  f0_vardclst(dcl0, env0))
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
|
_(*otherwise*) => f0_otherwise(dcl0, env0)
(* ****** ****** *)
(* ****** ****** *)
//
end where//end-of-[i1dcl_js1emit(dcl0,env0)]
{
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_extern
(
dcl0: i1dcl,
env0: !envx2js): void =
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
("// I1Dextern(",loc0,")\n")
end//let
//
val (  ) =
(
  i1dcl_xats2js( dcl1, env0 ))
//
end(*let*)//end-of-[f0_extern(dcl0,env0)]
//
(* ****** ****** *)
//
fun
f0_static
(
dcl0: i1dcl,
env0: !envx2js): void =
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
val (  ) =
let
//
#impltmp
g_print$out<>() = filr
//
in//let
nindfpr(filr, nind);
prints
("// I1Dstatic(",loc0,")\n")
end//let
//
val (  ) =
(
  i1dcl_xats2js( dcl1, env0 ))
//
end(*let*)//end-of-[f0_static(dcl0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_valdclst
(
dcl0: i1dcl,
env0: !envx2js): void =
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
then//then
prints
("// I1Dprvdclist(",loc0,")\n")
else//else
prints
("// I1Dvaldclist(",loc0,")\n")
//
end//let
//
val (  ) =
if
prvq
then//then
(
  i1valdclist_xats2js(i1vs, env0))
else//else
(
  i1valdclist_js1emit(i1vs, env0))
//
end(*let*)//end-of-[f0_valdclst(dcl0,env0)]
//
(* ****** ****** *)
//
fun
f0_vardclst
(
dcl0: i1dcl,
env0: !envx2js): void =
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
("// I1Dvardclist(",loc0,")\n")
end//let
//
val (  ) =
(
  i1vardclist_js1emit(i1vs, env0))
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
env0: !envx2js): void =
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
(tknd
,lvl0, tqas
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
then//then
prints
("// I1Dprfdclist(",loc0,")\n")
else//else
(
case+ tqas of
|
list_nil() =>
prints
("// I1Dfundclist(",loc0,")\n")
|
list_cons _ =>
prints
("// I1Dtfndclist(",loc0,")\n"))
//
end//let
//
val (  ) =
if
prfq
then//then
(
  i1fundclist_xats2js(i1fs, env0))
else//else
(
case+ tqas of
|
list_nil() => // HX: functions
(
  i1fundclist_js1emit(i1fs, env0))
|
list_cons _ => // HX: templates
(
  i1tfndclist_xats2js(i1fs, env0)))
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
env0: !envx2js): void =
let
//
val loc0 =
dcl0.lctn((*void*))
//
val filr =
envx2js_filr$get(env0)
val nind =
envx2js_nind$get(env0)
//
in//let
//
nindfpr(filr, nind);
strnfpr(filr, "// ");
loctn_fprint
(loc0, filr); fprintln(filr);
nindfpr(filr, nind);
strnfpr(filr, "// ");
i1dcl_fprint(dcl0, filr); fprintln(filr)
//
end(*let*)//end-of-[f0_otherwise(dcl0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[js1emit_i1dcl(dcl0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen2_DATS_js1emit_decl00.dats] *)
(***********************************************************************)
