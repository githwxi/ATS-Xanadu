(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
Sun 26 May 2024 09:32:10 AM EDT
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
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/xats2js.sats"
#staload "./../SATS/js1emit.sats"
//
(* ****** ****** *)
//
#staload
_(*DATS*)="./../DATS/js1emit.dats"
//
(* ****** ****** *)
(* ****** ****** *)
#symload node with dimpl_get_node
(* ****** ****** *)
(*
#symload ival with i1cmp_get_ival
#symload ilts with i1cmp_get_ilts
*)
(* ****** ****** *)
#symload lctn with i1dcl_get_lctn
#symload node with i1dcl_get_node
(* ****** ****** *)
#symload filr with envx2js_get_filr
#symload nind with envx2js_get_nind
(* ****** ****** *)
#symload
js1emit_fjas1 with js1emit_fjarglst
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
dicstjs1
(filr: FILR
,dimp: dimpl): void =
(
case+
dimp.node() of
|DIMPLone1
(  dcst  ) =>
(
  d2cstjs1(filr, dcst))
|DIMPLone2
(dcst, svts) =>
(
  d2cstjs1(filr, dcst))
//
|DIMPLnon1
(  dqid  ) =>
(
  d1qid_fprint(dqid, filr))
)(*case+*)//end-of-(dicstjs1)
//
(* ****** ****** *)
//
fun
dimplfpr
(filr: FILR
,dimp: dimpl): void =
(
  dimpl_fprint(dimp, filr))//fun
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
js1emit_i1dcl
( env0,dcl0 ) =
let
(*
//
val () =
prerrsln
("js1emit_i1dcl: dcl0 = ", dcl0))
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
  f0_extern(env0, dcl0))
|I1Dstatic _ =>
(
  f0_static(env0, dcl0))
//
(* ****** ****** *)
//
|I1Ddclst0 _ =>
(
  f0_dclst0(env0, dcl0))
|I1Dlocal0 _ =>
(
  f0_local0(env0, dcl0))
//
(* ****** ****** *)
//
|I1Dinclude _ =>
(
  f0_include(env0, dcl0))
//
(* ****** ****** *)
//
|I1Dvaldclst _ =>
(
  f0_valdclst(env0, dcl0))
|I1Dvardclst _ =>
(
  f0_vardclst(env0, dcl0))
//
(* ****** ****** *)
//
|I1Dfundclst _ =>
(
  f0_fundclst(env0, dcl0))
//
(* ****** ****** *)
//
|I1Dimplmnt0 _ =>
(
  f0_implmnt0(env0, dcl0))
//
(* ****** ****** *)
(* ****** ****** *)
|_(*otherwise*) => f0_otherwise(env0, dcl0)
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
( env0:
! envx2js
, dcl0: i1dcl): void =
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
  xats2js_i1dcl( env0, dcl1 ))
//
end(*let*)//end-of-[f0_extern(env0,dcl0)]
//
(* ****** ****** *)
//
fun
f0_static
( env0:
! envx2js
, dcl0: i1dcl): void =
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
("// I1Dstatic(",loc0,")\n")
end//let
//
val (  ) =
(
  xats2js_i1dcl( env0, dcl1 ))
//
end(*let*)//end-of-[f0_static(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_dclst0
( env0:
! envx2js
, dcl0: i1dcl): void =
let
//
val-
I1Ddclst0
(   dcls   ) = dcl0.node()
//
val () =
(
  js1emit_i1dclist(env0, dcls))
//
end(*let*)//end-of-[f0_dclst0(env0,dcl0)]
//
(* ****** ****** *)
//
fun
f0_local0
( env0:
! envx2js
, dcl0: i1dcl): void =
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
("// I1Dlocal0(",loc0,")\n"))
end//let
//
val () =
(
  js1emit_i1dclist(env0, head))
val () =
(
  js1emit_i1dclist(env0, body))
//
end(*let*)//end-of-[f0_local0(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_include
( env0:
! envx2js
, dcl0: i1dcl): void =
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
  js1emit_i1dclist(env0, dcls)))
end(*let*)//end-of-[f0_include(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_valdclst
( env0:
! envx2js
, dcl0: i1dcl): void =
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
 xats2js_i1valdclist(env0, i1vs))
else
(
 js1emit_i1valdclist(env0, i1vs))
//
end(*let*)//end-of-[f0_valdclst(env0,dcl0)]
//
(* ****** ****** *)
//
fun
f0_vardclst
( env0:
! envx2js
, dcl0: i1dcl): void =
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
 js1emit_i1vardclist(env0, i1vs))
//
end(*let*)//end of [f0_vardclst(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_fundclst
( env0:
! envx2js
, dcl0: i1dcl): void =
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
then
prints
("// I1Dprfdclist(",loc0,")\n")
else
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
then // HX: proofs
(
 xats2js_i1fundclist(env0, i1fs))
else
(
case+ tqas of
|
list_nil() => // HX: functions
(
 js1emit_i1fundclist(env0, i1fs))
|
list_cons _ => // HX: templates
(
 xats2js_i1tfndclist(env0, i1fs)))
//
end(*let*)//end-of-[f0_fundclst(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_implmnt0
( env0:
! envx2js
, dcl0: i1dcl): void =
let
//
val filr = env0.filr()
val nind = env0.nind()
//
val loc0 = dcl0.lctn()
//
val-
I1Dimplmnt0
( tknd
, stmp, dimp
, fjas, icmp) = dcl0.node()
//
fun
implfunq
( tknd: token): bool =
(
case+ iknd of
|
IMPLfun() => true | _ => false
) where
{ val-
  T_IMPLMNT(iknd) = tknd.node() }
//
in//let
//
let
//
fun
f1_i1cmpret
( env0:
! envx2js
, icmp: i1cmp): void =
let
val filr = envx2js_get_filr(env0)
val nind = envx2js_get_nind(env0)
in//let
let
val ival = icmp.ival()
val (  ) = js1emit_i1cmp(env0, icmp)
in//let
nindstrnfpr
(filr, nind, "return ");i1valjs1(filr, ival);fprintln(filr)
end//let
end//let//end-of-[f1_i1cmpret(...)]
//
in//let
//
nindstrnfpr
(filr,nind,"// I1Dimplmnt0(");
lctnfpr(filr,loc0);strnfpr(filr,")\n");
//
if
dimpl_tempq(dimp)
then // template
(
nindstrnfpr
(filr,nind,"// I1Dimplmnt0(");
dimplfpr(filr,dimp);strnfpr(filr,"):timp\n"))
else // non-template
(
//
(
nindstrnfpr
(filr, nind, "let ");dicstjs1(filr, dimp);
strnfpr(filr," = function ");fjas1js1(filr, fjas));
(
strnfpr(filr," { // impl\n");
(envx2js_incnind(env0,2(*++*))
;js1emit_fjarglst(env0, fjas);f1_i1cmpret(env0, icmp));
//
if
implfunq(tknd)
then // then
(envx2js_decnind(env0,2(*--*))
;nindstrnfpr(filr, nind, "} // endfun(impl)");fprintln(filr))
else // else
(envx2js_decnind(env0,2(*--*))
;nindstrnfpr(filr, nind, "} () // endgen(impl)");fprintln(filr))
//
)
//
)//endif
//
end(*let*)
//
end(*let*)//end-of-[f0_implmnt0(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_otherwise
( env0:
! envx2js
, dcl0: i1dcl): void =
let
//
val loc0 = dcl0.lctn((*void*))
//
val filr = envx2js_get_filr(env0)
val nind = envx2js_get_nind(env0)
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
end(*let*)//end-of-[f0_otherwise(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[js1emit_i1dcl(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
js1emit_i1valdcl
  (env0, idcl) = let
//
(* ****** ****** *)
//
val dpat =
i1valdcl_get_dpat(idcl)
val tdxp =
i1valdcl_get_tdxp(idcl)
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
i1cmp_get_ival(icmp)
val filr =
envx2js_get_filr(env0)
val nind =
envx2js_get_nind(env0)
//
val () =
(
nindstrnfpr
(filr, nind, "let ");
i1tnmjs1
(filr, itnm);fprintln(filr))
//
// HX: for computing ival
val () =
f0_i1tnmcmp(env0, itnm, icmp)
//
val () =
(
nindstrnfpr
(filr, nind, "XATS000_patck(");
i0pckjs1(filr, ival, ipat);
strnfpr(filr, ")");fprintln(filr))
//
endlet(*TEQI1CMPsome*))(*case+(tdxp)*)
//
(* ****** ****** *)
//
end where//end-of-let(js1emit_i1valdcl(...)]
{
//
val (  ) =
let
val filr =
(
envx2js_get_filr(env0))
val nind =
(
envx2js_get_nind(env0))
in//let
(
 nindstrnfpr(filr, nind, "// I1VALDCL\n"))
end//let//end-of-[val()]
//
fun
f0_i1tnmcmp
( env0:
! envx2js
, itnm: i1tnm
, icmp: i1cmp): void =
let
//
val filr =
envx2js_get_filr(env0)
val nind =
envx2js_get_nind(env0)
//
val
ival = i1cmp_get_ival(icmp)
val
ilts = i1cmp_get_ilts(icmp)
//
val () =
js1emit_i1letlst(env0, ilts)
//
val () =
let
nindfpr(filr, nind);
i1tnmjs1(filr, itnm);strnfpr(filr, " = ");i1valjs1(filr, ival);fprintln(filr)
end//let
//
end//let//end-of-[f0_i1tnmcmp(...)]
//
}(*where*)//end-of-[js1emit_i1valdcl(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
js1emit_i1vardcl
  (env0, idcl) = let
//
(* ****** ****** *)
//
val dpid =
i1vardcl_get_dpid(idcl)
val tdxp =
i1vardcl_get_dini(idcl)
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
HX-2024-06-07:
w/o initialization
*)
nindfpr(filr, nind);
strnfpr(filr, "let ");i1tnmjs1(filr, itnm);
strnfpr(filr, " = XATSVAR0(");strnfpr(filr, ")\n")
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
val ival = i1cmp_get_ival(icmp)
val (  ) = js1emit_i1cmp(env0, icmp)
//
in//let
//
(*
HX-2024-06-07:
with initialization
*)
nindfpr(filr, nind);
strnfpr(filr, "let ");i1tnmjs1(filr, itnm);
strnfpr(filr, " = XATSVAR1(");i1valjs1(filr, ival);strnfpr(filr, ")\n")
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
envx2js_get_filr(env0))
val nind =
(
envx2js_get_nind(env0))
in//let
(
 nindstrnfpr(filr, nind, "// I1VARDCL\n"))
end//let//end-of-[val()]
//
}(*where*)//end-of-[js1emit_i1vardcl(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
js1emit_i1fundcl
  (env0, ifun) = let
//
(* ****** ****** *)
//
val dvar =
i1fundcl_get_dpid(ifun)
val fjas =
i1fundcl_get_farg(ifun)
val tdxp =
i1fundcl_get_tdxp(ifun)
//
(* ****** ****** *)
//
val (  ) =
let
val filr = env0.filr()
val nind = env0.nind()
in//let
(
nindfpr(filr, nind);
strnfpr(filr, "function ");
d2varfpr(filr, dvar);
fjas1js1(filr, fjas);fprintln(filr))
end//let
//
(* ****** ****** *)
//
val ( ) =
let
val filr = env0.filr()
val nind = env0.nind()
val (  ) =
(
nindfpr(filr, nind);strnfpr(filr, "{ // fun\n"))
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
val ival = icmp.ival()
//
val (  ) =
(
  js1emit_fjas1(env0, fjas))
val (  ) =
(
  js1emit_i1cmp(env0, icmp))
//
(* ****** ****** *)
//
val (  ) =
let
val filr = env0.filr()
val nind = env0.nind()
in//let
(
nindfpr(filr, nind);
strnfpr(filr, "return ");i1valjs1(filr, ival);fprintln(filr))
end//let
//
(* ****** ****** *)
end//let
(* ****** ****** *)
) (*case+*) // end-of-(teqi1exp)
//
val (  ) = envx2js_poplam0(env0)//leave
//
(* ****** ****** *)
//
val (  ) =
let
val filr = env0.filr()
val nind = env0.nind()
in//let
//
nindstrnfpr
(filr, nind, "} // endfun(");
d2varfpr(filr, dvar);strnfpr(filr, ")\n")
//
end//let
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
envx2js_get_filr(env0))
val nind =
(
envx2js_get_nind(env0))
in//let
(
 nindstrnfpr(filr, nind, "// I1FUNDCL\n"))
end//let//end-of-[val()]
//
}(*where*)//end-of-[js1emit_i1fundcl(env0,ifun)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
js1emit_i1dclist
  (env0, dcls) =
(
  list_js1emit_fnp(env0, dcls, js1emit_i1dcl))
(*where*)//end-of-[js1emit_i1dclist(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
js1emit_i1valdclist
  (env0, i1vs) =
(
  list_js1emit_fnp(env0, i1vs, js1emit_i1valdcl))
//
(* ****** ****** *)
//
#implfun
js1emit_i1vardclist
  (env0, i1vs) =
(
  list_js1emit_fnp(env0, i1vs, js1emit_i1vardcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
js1emit_i1fundclist
  (env0, i1fs) =
(
  list_js1emit_fnp(env0, i1fs, js1emit_i1fundcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
js1emit_i1dclistopt
  (env0, dopt) =
(
  optn_js1emit_fnp(env0, dopt, js1emit_i1dclist))
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_js1emit_decl00.dats] *)
(***********************************************************************)
