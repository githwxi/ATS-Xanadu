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
Sun 26 May 2024 09:29:27 AM EDT
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
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#include
"./../HATS/xats2js_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload // LAB =
"./../../../SATS/xlabel0.sats"
#staload // SYM =
"./../../../SATS/xsymbol.sats"
//
#staload // LOC =
"./../../../SATS/locinfo.sats"
//
#staload // LEX =
"./../../../SATS/lexing0.sats"
//
#staload // D2E =
"./../../../SATS/dynexp2.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
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
#symload lctn with i1cmp_get_lctn
#symload ival with i1cmp_get_ival
#symload ilts with i1cmp_get_ilts
(* ****** ****** *)
#symload node with i1cls_get_node
(* ****** ****** *)
#symload node with t1imp_get_node
(* ****** ****** *)
#symload filr with envx2js_get_filr
#symload nind with envx2js_get_nind
(* ****** ****** *)
(* ****** ****** *)
//
fun
fprintln
(filr: FILR): void =
(
 strn_fprint(filr,"\n"))//endfun
//
(* ****** ****** *)
//
fun
i1cmpfpr
(filr: FILR
,icmp: i1cmp): void =
(
 i1cmp_fprint(filr,icmp))//endfun
//
(* ****** ****** *)
//
fun
i0ctgjs1
(filr: FILR
,ipat: i0pat): void =
let
#impltmp
g_print$out<>() = filr
in//let
case+
ipat.node() of
//
|I0Pcon(d2c0) =>
(
print
("XATSCTAG("
,'"', name, '"', ", ", ctag, ")")
) where
{
  val ctag = d2con_get_ctag(d2c0)
  val name = d2con_get_name(d2c0) }
//
|
_(*non-I0Pcon*) => print('"',ipat,'"')
//
end(*let*)//end-of-[i0ctgjs1(filr,ipat)]
//
(* ****** ****** *)
//
fun
i0pcnjs1
(filr: FILR
,ipat: i0pat): void =
let
#impltmp
g_print$out<>() = filr
in//let
case+
ipat.node() of
//
|I0Pcon(d2c0) =>
(
  print('"', name, '"')) where
{
  val name = d2con_get_name(d2c0)
}
|
_(*non-I0Pcon*) => print('"',ipat,'"')
//
end(*let*)//end-of-[i0pcnjs1(filr,ipat)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
i0pckjs1
(filr: FILR
,ival: i1val
,ipat: i0pat): void =
*)
#implfun
i0pckjs1
( filr
, ival, ipat) =
let
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print$out<>() = filr
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
conj
(b0: sint): void =
if
(b0 > 0)
then print(" && ") else ()
//
(* ****** ****** *)
//
fun
proj
(i0: sint
,ival: i1val
,ipat: i0pat): i1val =
(
case-
ipat.node() of
//
|I0Ptup0 _ =>
i1val
(loc0,I1Vp0rj(ival, i0))
//
|I0Pdapp(i0f0, _) =>
i1val(loc0,
  I1Vp1cn(i0f0, ival, i0))
//
|I0Ptup1(tknd, _) =>
i1val(loc0,
  I1Vp1rj(tknd, ival, i0))
//
) where
{
  val loc0 = ival.lctn((*0*))
}(*where*)//end-of-[proj(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_ipat
( b0: sint
, ival: i1val
, ipat: i0pat): void =
case+
ipat.node() of
//
|I0Pany _ => ((*void*))
|I0Pvar _ => ((*void*))
//
|I0Pdapp _ =>
(
  f0_dapp(b0, ival, ipat))
//
|
_(*non-I0Pcon*) =>
(
conj(b0); print('"',ipat,'"'))
//end-of-[f0_ipat(b0,ival,ipat)]
//
(* ****** ****** *)
//
and
f0_dapp
( b0: sint
, ival: i1val
, ipat: i0pat): void =
let
//
val-
I0Pdapp
(i0f0, i0ps) = ipat.node()
//
#impltmp
g_print
<i0pat>(x) = i0ctgjs1(filr, x)
#impltmp
g_print
<i1val>(x) = i1valjs1(filr, x)
//
in//let
(conj(b0)
;print("XATS000_ctgeq(")
;print(ival,", ",i0f0, ")")
;f0_ipatlst(b0+1,0,ival,ipat,i0ps))
end(*let*)//end-of-[f0_dapp(...)]
//
(* ****** ****** *)
//
and
f0_ipatlst
( b0: sint
, i0: sint
, ival: i1val
, ipat: i0pat
, i0ps: i0patlst): void =
(
case+ i0ps of
|
list_nil
( (*void*) ) => ()
|
list_cons
(i0p1, i0ps) =>
if
i0pat_allq(i0p1)
then
f0_ipatlst
(b0,i0+1,ival,ipat,i0ps) else
let
val i1v1 =
proj(i0, ival, ipat)
in//let
f0_ipat(b0+1,i1v1,i0p1);
f0_ipatlst(b0+1,i0+1,ival,ipat,i0ps)
end//let
)(*case+*)//end-of-[f0_ipatlst(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
in
( if
  i0pat_allq(ipat)
  then print("true")
  else f0_ipat(0(*conj*), ival, ipat) )
end(*let*)//end-(i0pckjs1(filr,ival,ipat))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
xtrcdjs1
(filr: FILR
,tknd: token): void =
let
#impltmp
g_print$out<>() = filr
in//let
case+
tknd.node() of
//
|T_TRCD10(knd0) =>
(
print("XATSTRCD(", knd0, ")"))
|T_TRCD20(knd0) =>
(
print("XATSTRCD(", knd0, ")"))
//
|_(*otherwise*) =>
(
print
("XATSTRCD(", "'", tknd, "'", ")"))
//
end(*let*)//end-of-[xtrcdjs1(filr,tknd)]
//
(* ****** ****** *)
//
fun
labeljs1
(filr: FILR
,lab0: label): void =
(
case+ lab0 of
|
LABint(int) => print(int)
|
LABsym(sym) =>
let
val nam =
symbl_get_name(sym) in//let
  print("'", nam, "'") end//let
) where
{
//
  #impltmp g_print$out<>() = filr
//
}(*where*)//end-of-[labeljs1(filr,lab0)]
//
(* ****** ****** *)
//
fun
t1imploc
(filr: FILR
,timp: t1imp): void =
let
//
#impltmp
g_print$out<>() = filr
//
in//let
//
case+
timp.node() of
|T1IMPall1
(dcst, dopt) =>
(
case+ dopt of
|optn_nil() =>
print("T1IMPall1(", ")")
|optn_cons(idcl) =>
let
val loc0 = idcl.lctn() in
print("T1IMPall1(", loc0, ")") end
)
|T1IMPallx
(dcst, dopt) =>
(
case+ dopt of
|optn_nil() =>
print("T1IMPallx(", ")")
|optn_cons(idcl) =>
let
val loc0 = idcl.lctn() in
print("T1IMPallx(", loc0, ")") end
)
//
end//let//end-of-[t1imploc(filr,timp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1intjs1
( filr: FILR
, tint: token): void =
(
case-
tint.node() of
|T_INT01
(  rep  ) => print
("XATSINT1(", rep, ")")
|T_INT02
(bas,rep) => print
("XATSINT2(",bas,",",rep,")")
|T_INT03
(bas
,rep,sfx) => print
("XATSINT3("
,bas, ",", rep, ",", sfx, ")")
) where
{
#impltmp g_print$out<>() = filr
}(*where*)//end-of-[i1intjs1(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
fjas1js1
(filr,fjas) =
let
//
#impltmp
g_print$out<>() = filr
//
fnx
loop1
(i0: sint
,fjas: fjarglst): void =
(
case+ fjas of
|
list_nil
((*void*)) => ((*0*))
|
list_cons
(fja1, fjas) =>
(
  loop2(i0, fja1, fjas))
)
//
and
loop2
(i0: sint
,fja1: fjarg
,fjas: fjarglst): void =
(
case+
fja1.node() of
|FJARGdarg(i1bs) =>
(
  loop3(i0, i1bs, fjas))
)
//
and
loop3
(i0: sint
,i1bs: i1bndlst
,fjas: fjarglst): void =
(
case+ i1bs of
|
list_nil() =>
(
  loop1(i0, fjas))
|
list_cons(_, i1bs) =>
( if
  (i0 > 1)
  then
  print(", ")
; print("arg", i0)
; loop3(i0+1, i1bs, fjas))
)
//
in
(print("(")
;loop1(1(*i0*),fjas);print(")"))
end(*let*)//end-of-[fjas1js1(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1valjs1(filr, ival) =
let
//
(*
val () =
prerrln
("i1valjs1: ival = ", ival)
*)
//
in//let
case+
ival.node() of
(* ****** ****** *)
(* ****** ****** *)
|I1Vnil
((*0*)) => print("[", "]")
(* ****** ****** *)
(* ****** ****** *)
|I1Vint
( tint ) => i1intjs1(filr,tint)
(* ****** ****** *)
(* ****** ****** *)
|I1Vtnm
( itnm ) => i1tnmfpr(filr,itnm)
(* ****** ****** *)
|I1Vcst
( dcst ) => d2cstfpr(filr,dcst)
(* ****** ****** *)
|I1Vvar
( dvar ) => d2varfpr(filr,dvar)
(* ****** ****** *)
(* ****** ****** *)
//
|I1Vaddr(i1v1) =>
(
  print("XATSADDR(", i1v1, ")") )
|I1Vaexp(i0e1) =>
(
  print("XATSAEXP(", i0e1, ")") )
//
(* ****** ****** *)
|I1Vp0rj
( itup,pind ) =>
(
print
("XATSP0RJ(",itup,"[",pind,"]", ")"))
(* ****** ****** *)
|I1Vp1cn
( ipat
, icon, pind) =>
(
print("XATSP1CN(");
print
(ipat, ", ", icon, "[",pind,"+1]", ")")
) where
{ #impltmp
  g_print<i0pat>(x) = i0pcnjs1(filr,x) }
(* ****** ****** *)
|I1Vp1rj
( trcd
, itup, pind) =>
(
print("XATSP1RJ(");
print
(trcd, ", ", itup, "[", pind, "]", ")")
) where
{ #impltmp
  g_print<token>(x) = xtrcdjs1(filr,x) }
(* ****** ****** *)
//
|I1Vlpft
(plab, itup) =>
( print
  ("XATSLPFT(", plab, ", ", itup, ")")
) where
{ #impltmp
  g_print<label>(x) = labeljs1(filr,x) }
//
|I1Vlpbx
(plab, itup) =>
( print
  ("XATSLPBX(", plab, ", ", itup, ")")
) where
{ #impltmp
  g_print<label>(x) = labeljs1(filr,x) }
//
(* ****** ****** *)
(* ****** ****** *)
|
_(*otherwise*) => i1val_fprint(filr,ival)
(* ****** ****** *)
(* ****** ****** *)
end where
{
//
  #impltmp g_print$out<>() = filr
//
  #impltmp
  g_print<i1val>(x) = i1valjs1(filr, x)
//
}(*where*)//end-of-[ i1valjs1(filr,ival) ]
//
(* ****** ****** *)
//
#implfun
l1i1vjs1(filr, liv0) =
let
val+
I1LAB(lab1, i1v2) = liv0
in//let
(
print(lab1, ": ", i1v2)) where
{
  #impltmp
  g_print<label>(x) = labeljs1(filr, x)
  #impltmp
  g_print<i1val>(x) = i1valjs1(filr, x)
}
end(*end*)//end-of-[ l1i1vjs1(filr,ival) ]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1valjs1_list
( filr: FILR
, i1vs: i1valist): void =
(
list_iforeach(i1vs)) where
{
#typedef x0 = i1val
#typedef xs = i1valist
#impltmp
iforeach$work<x0>(i0, x0) =
(
if
(i0 >= 1)
then
strnfpr(filr,", ");i1valjs1(filr, x0))
}(*where*)//end-of-[i1valjs1_list(...)]
//
(* ****** ****** *)
//
fun
l1i1vjs1_list
( filr: FILR
, livs: l1i1vlst): void =
(
list_iforeach(livs)) where
{
#typedef x0 = l1i1v
#typedef xs = l1i1vlst
#impltmp
iforeach$work<x0>(i0, x0) =
(
if
(i0 >= 1)
then
strnfpr(filr,", ");l1i1vjs1(filr, x0))
}(*where*)//end-of-[i1valjs1_list(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1insjs1
( filr: FILR
, iins: i1ins): void =
let
//
(*
val () =
prerrln
("i1insjs1: iins = ", iins)
*)
//
#impltmp
g_print
<label>(x) = labeljs1(filr, x)
#impltmp
g_print
<i1val>(x) = i1valjs1(filr, x)
//
in//let
//
case+ iins of
//
(* ****** ****** *)
//
|I1INSdapp
(i1f0, i1vs) =>
(
(*
strnfpr(filr,"XATSDAPP(");
*)
i1valjs1(filr,i1f0);strnfpr(filr,"(");
i1valjs1_list(filr,i1vs);strnfpr(filr,")")//;strnfpr(filr,")")
)
//
(* ****** ****** *)
//
|I1INSpflt
(lab0, i1v1) =>
(
print("XATSPFLT(", i1v1, "[", lab0, "]", ")"))
//
|I1INSproj
(lab0, i1v1) =>
(
print("XATSPROJ(", i1v1, "[", lab0, "]", ")"))
//
(* ****** ****** *)
//
|I1INStup0
(   i1vs   ) =>
(
strnfpr(filr,"XATSTUP0(");
strnfpr(filr,"[");i1valjs1_list(filr,i1vs);strnfpr(filr,"]");strnfpr(filr,")")
)
//
|I1INStup1
(tknd, i1vs) =>
(
strnfpr(filr,"XATSTUP1(");
xtrcdjs1(filr,tknd);strnfpr(filr,", ")
;strnfpr(filr,"[");i1valjs1_list(filr,i1vs);strnfpr(filr,"]");strnfpr(filr,")")
)
//
|I1INSrcd2
(tknd, livs) =>
(
strnfpr(filr,"XATSRCD2(");
xtrcdjs1(filr,tknd);strnfpr(filr,", ")
;strnfpr(filr,"{");l1i1vjs1_list(filr,livs);strnfpr(filr,"}");strnfpr(filr,")")
)
//
(* ****** ****** *)
//
|I1INSflat
(   i1v1   ) =>
(strnfpr(filr,"XATSFLAT(")
;i1valjs1(filr,i1v1);strnfpr(filr,")"))
//
(* ****** ****** *)
//
|
_(*otherwise*) => i1ins_fprint(filr,iins)
(* ****** ****** *)
end(*let*) // end-of-[i1insjs1(env0,iins)]
//
(* ****** ****** *)
//
fun
i1cmpjs1
( filr: FILR
, icmp: i1cmp): void =
let
//
(*
val () =
prerrln
("i1cmpjs1: icmp = ", icmp)
*)
//
in//let
case+ icmp of
(* ****** ****** *)
|
_(*otherwise*) => i1cmp_fprint(filr,icmp)
(* ****** ****** *)
end(*let*) // end-of-[i1cmpjs1(env0,icmp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#implfun
js1emit_i1ins
  (env0, iins) = xats2js_i1ins(env0, iins)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
js1emit_i1cmp
( env0,icmp ) =
let
//
val filr = env0.filr()
val nind = env0.nind()
//
in//let
//
case+ icmp of
|
I1CMPcons
(ilts, ival) =>
(
nindfpr(filr, nind);
strnfpr
(filr,"// I1CMP:start\n");
//
(
nindfpr(filr, nind);
strnfpr
(filr,"// I1CMP:return:");
i1valjs1
(filr,ival);fprintln(filr)) where
{
val () =
(
  js1emit_i1letlst(env0, ilts)) }
//
)(* end-of-[I1CMPcons(ilts,ival)] *)
//
end(*let*)//end-of-[js1emit_i1cmp(env0,icmp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
js1emit_i1let
( env0,ilet ) =
let
//
(* ****** ****** *)
(* ****** ****** *)
val filr = env0.filr()
val nind = env0.nind()
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_t1imp
( env0:
! envx2js
, timp: t1imp): void =
let
//
val filr =
envx2js_get_filr(env0)
val nind =
envx2js_get_nind(env0)
//
val
dcst =
(
  t1imp_get_dcst(timp))
val
dopt = t1imp_i1dclq(timp)
//
in//let
//
case+ dopt of
|
optn_nil
((*void*)) =>
(
d2cst_fprint
(filr, dcst)) where
{ val () =
  strnfpr(filr, "undefined // timp: ")}
|
optn_cons
(  idcl  ) =>
(
case+
idcl.node() of
I1Dimplmnt0
( tknd
, stmp, dimp
, fjas, icmp) =>
(
strnfpr
(filr,"function ");fjas1js1(filr, fjas);
(
strnfpr(filr," { // timp: ");
d2cst_fprint(filr, dcst);fprintln(filr));
(
envx2js_incnind(env0,2(*++*));
js1emit_fjarglst(env0,fjas);f0_i1cmpret(env0, icmp));
(envx2js_decnind(env0,2(*--*));nindstrnfpr(filr, nind, "} // endfun(timp)")))
)
//
end//let//end-of-[f0_t1imp(...)]
//
(* ****** ****** *)
//
and
f0_i1cmpret
( env0:
! envx2js
, icmp: i1cmp): void =
let
//
val filr =
envx2js_get_filr(env0)
val nind =
envx2js_get_nind(env0)
//
in//let
let
//
val ival = icmp.ival()
val (  ) =
js1emit_i1cmp(env0, icmp)
//
in//let
//
nindstrnfpr
(filr, nind, "return ");
i1valjs1(filr, ival);fprintln(filr)
//
end//let
end//let//end-of-[f0_i1cmpret(...)]
//
(* ****** ****** *)
//
(*
HX-2024-06-22:
Note that the temporary [itnm]
is assumed to have been introduced
*)
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
val ival = icmp.ival()
val ilts = icmp.ilts()
//
val () =
js1emit_i1letlst(env0, ilts)
//
val () =
let
nindfpr(filr, nind);i1tnmfpr(filr, itnm);
strnfpr(filr, " = ");i1valjs1(filr, ival);fprintln(filr)
end//let
//
end//let//end-of-[f0_i1tnmcmp(...)]
//
(* ****** ****** *)
//
fun
f0_i1valgpt
( env0:
! envx2js
, ival: i1val
, igpt: i1gpt): void =
let
//
val filr =
envx2js_get_filr(env0)
val nind =
envx2js_get_nind(env0)
//
in//let
//
case+
igpt.node() of
|
I1GPTpat
(  ibnd  ) =>
(
case+ ibnd of
I1BNDcons
(itnm,ipat,dvvs) =>
(
nindstrnfpr
(filr, nind, "if (");
i0pckjs1(filr, ival, ipat);strnfpr(filr, ") { // gpt\n");
nindstrnfpr
(filr, nind+2, "let "); // HX: [itnm] is new for each clause!
i1tnmfpr(filr, itnm);strnfpr(filr, " = ");i1valjs1(filr, ival);fprintln(filr)
)(* end-of-[I1BNDcons(...)] *)
)
//
end(*let*)//end-of-[f0_i1valgpt(...)]
//
(* ****** ****** *)
//
fun
f0_i1tnmvalcls
( env0:
! envx2js
, itnm: i1tnm
, ival: i1val
, icl0: i1cls): void =
let
//
val filr =
envx2js_get_filr(env0)
val nind =
envx2js_get_nind(env0)
//
in//let
//
case+
icl0.node() of
|
I1CLScls(igpt, icmp) =>
let
val () =
(
nindfpr(filr, nind);
strnfpr(filr, "// { // cls\n"))
//
val () =
(
  f0_i1valgpt(env0, ival, igpt))
//
val () =
let
val () =
(
  envx2js_incnind(env0,2(*++*)))
//
val () =
(
  f0_i1tnmcmp(env0, itnm, icmp))
//
val () =
(
nindfpr(filr, nind+2);
strnfpr(filr, "break // cls\n"))
//
val () =
(
  envx2js_decnind(env0,2(*--*))) end
//
val () =
nindstrnfpr(filr, nind, "} // gpt\n")
//
val () =
nindstrnfpr(filr, nind, "// } // cls\n")
//
end//let//end(I1CLScls(igpt,icmp))
//
end where
{
//
(*
val () =
( prerrln
  ("f0_i1tnmvalcls: itnm = ", itnm))
val () =
( prerrln
  ("f0_i1tnmvalcls: ival = ", ival))
val () =
( prerrln
  ("f0_i1tnmvalcls: icl0 = ", icl0))
*)
//
}(*where*)//end-of-[f0_i1tnmvalcls(...)]
//
fun
f0_i1tnmvalclslst
( env0:
! envx2js
, itnm: i1tnm
, ival: i1val
, icls: i1clslst): void =
(
case+ icls of
|
list_nil() =>
let
val filr =
envx2js_get_filr(env0)
val nind =
envx2js_get_nind(env0)
in//let
(
nindstrnfpr
(filr,nind,
"XATS000_casef()");fprintln(filr))
end//let
|
list_cons(icl1, icls) =>
( f0_i1tnmvalcls(env0,itnm,ival,icl1)
; f0_i1tnmvalclslst(env0,itnm,ival,icls) )
)(*case+*)//end-of-[f0_i1tnmvalclslst(...)]
//
(* ****** ****** *)
//
in//let
//
case+ ilet of
//
|I1LETnew0
(   iins   ) =>
(
case+ iins of
//
|I1INSassgn
(i1vl, i1vr) =>
(
nindstrnfpr
(filr, nind, "XATS000_assgn(");
i1valjs1(filr, i1vl);strnfpr(filr, ", ");
i1valjs1(filr, i1vr);strnfpr(filr, ")\n"))
//
(* ****** ****** *)
//
|_(*otherwise*) =>
(
nindfpr(filr, nind);i1insjs1(filr, iins);fprintln(filr))
//
)(*end-of-[I1LETnew0(iins)]*)
//
(* ****** ****** *)
//
|I1LETnew1
(itnm, iins) =>
(
//
case+ iins of
//
(* ****** ****** *)
//
|I1INStimp
(i0e1, timp) =>
let
//
val
iopt = t1imp_i1cmpq(timp)
//
in//let
//
case+ iopt of
|
optn_nil() =>
(
nindstrnfpr
(filr, nind, "// ");
t1imploc(filr, timp);fprintln(filr);
nindstrnfpr
(filr, nind, "let ");
i1tnmfpr(filr, itnm);strnfpr(filr, " = ");f0_t1imp(env0, timp);fprintln(filr))
|
optn_cons(icmp) =>
(
f0_i1tnmcmp(env0, itnm, icmp)) where
{
val () =
(
nindstrnfpr
(filr, nind, "// ");
t1imploc(filr, timp);fprintln(filr);
nindstrnfpr
(filr, nind, "let ");i1tnmfpr(filr, itnm);fprintln(filr))}
//
end//let//end-of-[I1INStimp(...)]
//
(* ****** ****** *)
//
|I1INSlet0
(dcls, icmp) =>
let
//
val () =
(
nindstrnfpr
(filr, nind, "let ");
i1tnmfpr(filr, itnm);strnfpr(filr, " // let");fprintln(filr))
//
val () =
(
nindstrnfpr
(filr, nind, "{ // let\n"))
//
val () =
envx2js_incnind(env0,2(*++*))
val () =
(
 js1emit_i1dclist(env0,dcls))
val () =
(
 f0_i1tnmcmp(env0,itnm,icmp))
val () =
(
 envx2js_decnind(env0,2(*--*)))
//
val () = 
(
nindstrnfpr(filr, nind, "} // endlet\n"))
//
end//let//end-of-[I1INSlet0(...)]
//
(* ****** ****** *)
//
|I1INSift0
(itst
,ithn, iels) =>
let
//
val () =
(
nindstrnfpr
(filr, nind, "let ");
i1tnmfpr(filr, itnm);strnfpr(filr, " // ift\n"))
//
val () =
(
nindstrnfpr
(filr, nind, "if (");
i1valjs1(filr, itst);strnfpr(filr, ") // ift\n"))
//
val () =
(
nindstrnfpr
(filr, nind, "{\n");
case+ ithn of
|optn_nil() => ()
|optn_cons(icmp) =>
(envx2js_incnind(env0,2(*++*))
;f0_i1tnmcmp( env0,itnm,icmp )
;envx2js_decnind(env0,2(*--*))))//then
//
val () =
(
nindstrnfpr
(filr, nind, "} else {\n");
case+ iels of
|optn_nil() => ()
|optn_cons(icmp) =>
(envx2js_incnind(env0,2(*++*))
;f0_i1tnmcmp( env0,itnm,icmp )
;envx2js_decnind(env0,2(*--*))))//else
//
val () =
(
nindstrnfpr(filr, nind, "} // end(if)\n"))
//
end//let//end-of-[I1INSift0(...)]
//
(* ****** ****** *)
//
|I1INScas0
(cknd
,i1v1, icls) =>
let
val () =
(
nindstrnfpr
(filr, nind, "let ");
i1tnmfpr(filr, itnm);strnfpr(filr, " // cas\n"))
//
val () =
(
nindstrnfpr
(filr, nind, "do {\n"))
//
val () = // enter
envx2js_incnind(env0,2(*++*))
//
val () =
f0_i1tnmvalclslst
( env0,itnm,i1v1,icls(*list*) )
//
val () =
(
  envx2js_decnind(env0,2(*--*)))//leave
//
val () =
(
nindstrnfpr(filr, nind, "} while (false) // end(do)\n"))
end//let//end-of-[I1INScas0(...)]
//
(* ****** ****** *)
//
|
_(*otherwise*) =>
(
nindstrnfpr
(filr, nind, "let ");
i1tnmfpr(filr, itnm);strnfpr(filr, " = ");i1insjs1(filr, iins);fprintln(filr))
//
(* ****** ****** *)
//
)(*end-of-[I1LETnew1(itnm,iins)]*)
//
end(*let*)//end-of-[js1emit_i1let(env0,ilet)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
js1emit_i1letlst
  (env0, ilts) =
(
  list_js1emit_fnp(env0, ilts, js1emit_i1let))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
js1emit_fjarglst
  (env0, fjas) =
(
  loop1(1(*i0*), fjas)) where
{
//
val filr =
(
  envx2js_get_filr(env0))
val nind =
(
  envx2js_get_nind(env0))
//
fnx
loop1
( i0: sint
, fjas: fjarglst): void =
(
case+ fjas of
|
list_nil
( (*void*) ) => ( (*void*) )
|
list_cons
(fja1, fjas) => loop2(i0, fja1, fjas)
)
//
and
loop2
( i0: sint
, fja1: fjarg
, fjas: fjarglst): void =
(
case+
fja1.node() of
|
FJARGdarg(i1bs) => loop3(i0, i1bs, fjas)
)
//
and
loop3
( i0: sint
, i1bs: i1bndlst
, fjas: fjarglst): void =
(
case+ i1bs of
|
list_nil() =>
loop1(i0, fjas)
|
list_cons(ibnd, i1bs) =>
(
  loop3(i0+1, i1bs, fjas)) where
{
//
#impltmp
g_print$out<>() = filr
//
#impltmp g_print
<i1tnm>(itnm) = i1tnmfpr(filr, itnm)
//
val () =
case+ ibnd of
|
I1BNDcons(itnm, i0p1, dvvs) =>
(
nindfpr(filr,nind);
(
  print("let ", itnm, " = ", "arg", i0, "\n")))
}
)
//
}(*where*)//end-of-[js1emit_fjarglst(env0,fjas)]
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_js1emit_dynexp.dats] *)
(***********************************************************************)
