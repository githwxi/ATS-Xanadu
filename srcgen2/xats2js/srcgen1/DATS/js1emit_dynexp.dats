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
print("XATSTRCD10(", knd0, ")"))
|T_TRCD20(knd0) =>
(
print("XATSTRCD20(", knd0, ")"))
//
|_(*otherwise*) =>
(
print("XATSTRCD??(", tknd, ")"))
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
t1impjs1
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
end//let//end-of-[t1impjs1(filr,timp)]
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
|I1Vtnm(itnm) => i1tnmfpr(filr,itnm)
(* ****** ****** *)
|I1Vcst(dcst) => d2cstfpr(filr,dcst)
(* ****** ****** *)
|I1Vvar(dvar) => d2varfpr(filr,dvar)
(* ****** ****** *)
|I1Vint(tint) => i1intjs1(filr,tint)
(* ****** ****** *)
|I1Vp0rj
( itup,pind ) =>
(
print
("XATSP0RJ(",itup,"[",pind,"]", ")"))
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
|
_(*otherwise*) => i1val_fprint(filr,ival)
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
( tknd
, lab0, i1v1) =>
(
case+
tknd.node() of
|
T_DOT((*0*)) =>
(
 print("XATSPFLT(", i1v1, "[", lab0, "]", ")"))
)
//
|I1INSproj
( tknd
, lab0, i1v1) =>
(
case+
tknd.node() of
|
T_DOT((*0*)) =>
(
 print("XATSPROJ(", i1v1, "[", lab0, "]", ")"))
)
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
xtrcdjs1(filr, tknd);strnfpr(filr,", ")
;strnfpr(filr,"[");i1valjs1_list(filr,i1vs);strnfpr(filr,"]");strnfpr(filr,")")
)
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
val filr = env0.filr()
val nind = env0.nind()
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
val ival = icmp.ival()
val ilts = icmp.ilts()
//
val () =
js1emit_i1letlst(env0, ilts)
//
val () =
let
nindfpr(filr, nind);
i1tnmfpr(filr, itnm);strnfpr(filr, " = ");i1valjs1(filr, ival);fprintln(filr)
end//let
//
end//let//end-of-[f0_i1tnmcmp(...)]
//
in//let
//
case+ ilet of
|I1LETnew0
(   iins   ) =>
(
nindfpr(filr, nind);
i1insjs1(filr, iins);fprintln(filr))
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
xats2js_i1let(env0, ilet))
|
optn_cons(icmp) =>
let
val
ival = icmp.ival()
val
iloc = ival.lctn()
in//let
nindfpr(filr, nind);
strnfpr(filr, "// ");t1impjs1(filr, timp);fprintln(filr);
nindfpr(filr, nind);
strnfpr(filr, "let ");i1tnmfpr(filr, itnm)
;strnfpr(filr, " = ");i1valjs1(filr, ival);fprintln(filr)
end//let
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
nindfpr(filr, nind);
strnfpr(filr, "let ");i1tnmfpr(filr, itnm);strnfpr(filr, " // let\n"))
//
val () =
(
nindfpr(filr, nind);
strnfpr(filr, "{ // let\n"))
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
nindfpr(filr, nind);
strnfpr(filr, "} // endlet\n"))
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
nindfpr(filr, nind);
strnfpr(filr, "let ");i1tnmfpr(filr, itnm);strnfpr(filr, " // ift\n"))
//
val () =
(
nindfpr(filr, nind);
strnfpr(filr, "if (");i1valjs1(filr, itst);strnfpr(filr, ") // ift\n"))
//
val () =
(
nindfpr(filr, nind);
strnfpr(filr, "{\n");
case+ ithn of
|optn_nil() => ()
|optn_cons(icmp) =>
(envx2js_incnind(env0,2(*++*))
;f0_i1tnmcmp( env0,itnm,icmp )
;envx2js_decnind(env0,2(*--*))))//then
//
val () =
(
nindfpr(filr, nind);
strnfpr(filr, "} else {\n");
case+ iels of
|optn_nil() => ()
|optn_cons(icmp) =>
(envx2js_incnind(env0,2(*++*))
;f0_i1tnmcmp( env0,itnm,icmp )
;envx2js_decnind(env0,2(*--*))))//else
//
val () =
( nindfpr(filr, nind);
  strnfpr(filr, "} // endif\n"))//endif
//
end//let//end-of-[I1INSift0(...)]
//
(* ****** ****** *)
//
|
_(*otherwise*) =>
(
nindfpr(filr, nind);
strnfpr(filr, "let ");i1tnmfpr(filr, itnm);strnfpr(filr, " = ");i1insjs1(filr, iins);fprintln(filr))
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
  print("let ",itnm," = ","arg",i0,"\n")))
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
