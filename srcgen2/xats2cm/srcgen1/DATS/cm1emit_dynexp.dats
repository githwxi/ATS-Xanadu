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
#symload lctn with d2con_get_lctn
#symload lctn with d2cst_get_lctn
(* ****** ****** *)
#symload lctn with i1val_lctn$get
(* ****** ****** *)
#symload lctn with i1cmp_lctn$get
#symload ival with i1cmp_ival$get
#symload ilts with i1cmp_ilts$get
(* ****** ****** *)
#symload node with i1gua_node$get
#symload node with i1gpt_node$get
#symload node with i1cls_node$get
(* ****** ****** *)
#symload node with t1imp_node$get
(* ****** ****** *)
#symload lctn with i1dcl_lctn$get
#symload node with i1dcl_node$get
(* ****** ****** *)
(* ****** ****** *)
#symload filr with envx2js_filr$get
#symload nind with envx2js_nind$get
(* ****** ****** *)
//
#symload
fjags_cm1emit with fjarglst_cm1emit
//
(* ****** ****** *)
//
val
EXCPTCON_BASE = 10000
//
(* ****** ****** *)
//
fun
d2con_ctag$get
(dcon: d2con): sint =
let
//
val
ctag =
d2con_get_ctag(dcon)
//
in//let
//
if ctag >= 0
then ctag else
let
val loc0 = dcon.lctn()
in//let
EXCPTCON_BASE + 
postn_get_ntot(loc0.pbeg())
end//let
//
end//end-of-[d2con_ctag$get]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fprintln
(filr: FILR): void =
(
strn_fprint("\n",filr))//endfun
//
(* ****** ****** *)
//
fun
loctnfpr
(filr: FILR
,loc0: loctn): void =
(
loctn_fprint(loc0,filr))//endfun
//
(* ****** ****** *)
//
fun
i0expfpr
(filr: FILR
,iexp: i0exp): void =
(
i0exp_fprint(iexp,filr))//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d2concm1
(filr: FILR
,dcon: d2con): void =
let
#impltmp
g_print$out<>() = filr
//
val name =
(
  d2con_get_name(dcon))
//
in//let
(
  prints('"', name, '"') )
end(*let*)//end-of-[d2concm1(...)]
//
(* ****** ****** *)
//
fun
d2ctgcm1
(filr: FILR
,dcon: d2con): void =
let
//
val ctag =
d2con_ctag$get(dcon)
//
in//let
(
  print(ctag) ) where
{
#impltmp g_print$out<>() = filr
}
end(*let*)//end-of-[d2ctgcm1(...)]
//
(* ****** ****** *)
//
fun
i0ctgcm1
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
prints
("XATSCTAG("
,'"', name, '"', ",", ctag, ")")
) where
{
  val ctag = d2con_ctag$get(d2c0)
  val name = d2con_get_name(d2c0) }
//
|
_(*non-I0Pcon*) => prints('"',ipat,'"')
//
end(*let*)//end-of-[i0ctgcm1(filr,ipat)]
//
(* ****** ****** *)
//
fun
i0pcncm1
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
  prints('"', name, '"')) where
{
  val name = d2con_get_name(d2c0)
}
//
|
_(*non-I0Pcon*) => prints('"',ipat,'"')
//
end(*let*)//end-of-[i0pcncm1(filr,ipat)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
i0pckcm1
(filr: FILR
,ival: i1val
,ipat: i0pat): void =
let
#impltmp
g_print$out<>() = filr
in//let
(
prints("i0pckcm1(",ival,",",ipat, ")"))
end//let//endof(i0pckcm1(filr,ival,ipat))
*)
//
#implfun
i0pckcm1
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
print(" ")//endfun
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
|I0Pdapp(i0f0, _) =>
i1val(loc0,
  I1Vp1cn(i0f0, ival, i0))
//
|I0Ptup0 _ =>
(
i1val
(loc0, I1Vp0rj(ival, i0)))
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
//
fun
f0_ipat
(
b0: sint,
ival: i1val,
ipat: i0pat): void =
case+
ipat.node() of
//
(* ****** ****** *)
|I0Pany _ => ((*void*))
|I0Pvar _ => ((*void*))
(* ****** ****** *)
//
|I0Pint _ =>
(
 f0_int0(b0, ival, ipat))
|I0Pbtf _ =>
(
 f0_btf0(b0, ival, ipat))
//
(* ****** ****** *)
//
|
_(*otherwise*) =>
(
conj(b0); prints('"',ipat,'"'))
//
(* ****** ****** *)
//end-of-[f0_ipat(b0,ival,ipat)]
(* ****** ****** *)
//
and
f0_int0
( b0: sint
, ival: i1val
, ipat: i0pat): void =
let
//
val-
I0Pint
(  tint  ) = ipat.node()
//
#impltmp
g_print
<token>(x) = i0intcm1(filr, x)
#impltmp
g_print
<i1val>(x) = i1valcm1(filr, x)
//
in//let
(
conj(b0);
prints("(XATS000_inteq ", ival, " ", tint, ")"))
end(*let*)//end-of-[f0_int0(...)]
//
(* ****** ****** *)
//
and
f0_btf0
( b0: sint
, ival: i1val
, ipat: i0pat): void =
let
//
val-
I0Pbtf
(  btf0  ) = ipat.node()
//
#impltmp
g_print
<sym_t>(x) = i0btfcm1(filr, x)
#impltmp
g_print
<i1val>(x) = i1valcm1(filr, x)
//
in//let
(
conj(b0);prints("(XATS000_btfeq ", ival, " ", btf0, ")"))
end(*let*)//end-of-[f0_btf0(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
in//let
//
(
if // if
(
i0pat_allq(ipat))
  then print("#t")
  else f0_ipat(0(*conj*), ival, ipat))
//
end(*let*)//end-(i0pckcm1(filr,ival,ipat))
//
(* ****** ****** *)
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
//
|T1IMPall1
(dcst
,tjas, dopt) =>
(
case+ dopt of
|
optn_nil() =>
let
val (  ) =
prints("T1IMPall1(",dcst,")")
end//let
|
optn_cons(idcl) =>
let
val loc0 = idcl.lctn((*0*))
val (  ) =
prints("T1IMPall1(",dcst,";",loc0,")")
end//let
)
//
|T1IMPallx
(dcst
,tjas, dopt) =>
(
case+ dopt of
|
optn_nil() =>
let
val (  ) =
prints("T1IMPallx(",dcst,")")
end//let
|
optn_cons(idcl) =>
let
val loc0 = idcl.lctn((*0*))
val (  ) =
prints("T1IMPallx(",dcst,";",loc0,")")
end//let
)
//
end(*let*)//end-of(t1imploc(filr,timp))
//
(* ****** ****** *)
//
fun
t1impdcl
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
//
|T1IMPall1
(dcst
,tjas, dopt) =>
(
case+ dopt of
|
optn_nil() =>
let
val (  ) = prints
("T1IMPall1(",dcst,"<",tjas,">",")")
end//let
|
optn_cons(idcl) =>
let
val (  ) = prints
("T1IMPall1(",dcst,"<",tjas,">",";",idcl,")")
end//let
)
//
|T1IMPallx
(dcst
,tjas, dopt) =>
(
case+ dopt of
|
optn_nil() =>
let
val (  ) = prints
("T1IMPallx(",dcst,"<",tjas,">",")")
end//let
|
optn_cons(idcl) =>
let
val (  ) = prints
("T1IMPallx(",dcst,"<",tjas,">",";",idcl,")")
end//let
)
//
end where
{
//
#impltmp
g_print
<i1dcl>(idcl) =
(
  auxpr(idcl)) where
{
//
fun
auxpr
(idcl: i1dcl): void =
(
case+
idcl.node() of
//
|
I1Dtmpsub
(svts, idcl) =>
(
print(
"I1Dtmpsub(");
prints(svts, ";");
auxpr(idcl); print(")"))//tmpsub
//
|
I1Dfundclst
(tknd, tqas
,d2cs, i1fs) =>
(
prints(
"I1Dfundclst(", d2cs, ")"))//funs
//
|
I1Dimplmnt0
(tknd, stmp
,dimp, fjas, icmp) =>
(
prints(
"I1Dimplmnt0(", dimp, ")"))//impl
//
|
_(* else *) => print("...I1DCL...")
)
//
}(*where*)//end-of-[g_print<i1dcl>]
//
}(*where*)//end-of(t1impdcl(filr,timp))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
fjas1cm1
(filr, fjas) =
(
loop1(1(*i0*), fjas)
) where
{
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
)(*case+*)//end-of-[loop1(...)]
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
)(*case+*)//end-of-[loop2(...)]
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
(
(
  if//if
  (i0 > 1)
  then print(" "));
  prints("arg", i0);
  loop3(i0+1, i1bs, fjas)
)
//
)(*case+*)//end-of-[loop3(...)]
//
}(*where*)//end-of-[fjas1cm1(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1valcm1
(filr, ival) =
let
//
(*
val () =
prerrsln
("i1valcm1: ival = ", ival)
*)
//
in//let
//
case+
ival.node() of
//
(* ****** ****** *)
(* ****** ****** *)
|I1Vnil
((*0*)) => prints("[", "]")
(* ****** ****** *)
(* ****** ****** *)
|I1Vint
( tint ) => i0intcm1(filr,tint)
(* ****** ****** *)
|I1Vbtf
( btf0 ) => i0btfcm1(filr,btf0)
(* ****** ****** *)
|I1Vchr
( tchr ) => i0chrcm1(filr,tchr)
(* ****** ****** *)
|I1Vflt
( tflt ) => i0fltcm1(filr,tflt)
(* ****** ****** *)
|I1Vstr
( tstr ) => i0strcm1(filr,tstr)
(* ****** ****** *)
(* ****** ****** *)
//
|I1Vi00
( int0 ) => i0i00cm1(filr,int0)
|I1Vb00
( btf0 ) => i0b00cm1(filr,btf0)
|I1Vc00
( chr0 ) => i0c00cm1(filr,chr0)
|I1Vf00
( flt0 ) => i0f00cm1(filr,flt0)
|I1Vs00
( str0 ) => i0s00cm1(filr,str0)
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1Vtop
( sym0 ) => print( "XATSTOP0" )
//
(* ****** ****** *)
|I1Vtnm
( itnm ) => i1tnmcm1(filr,itnm)
(* ****** ****** *)
|I1Vcon
( dcon ) => d2concm1(filr,dcon)
(* ****** ****** *)
|I1Vcst
( dcst ) => d2cstcm1(filr,dcst)
(* ****** ****** *)
|I1Vvar
( dvar ) => d2varcm1(filr,dvar)
(* ****** ****** *)
(* ****** ****** *)
//
|I1Vaddr(i1v1) =>
(
  prints("(XATSADDR ", i1v1, ")"))
|I1Vaexp(i0e1) =>
(
  prints("(XATSAEXP ", i0e1, ")"))
//
(* ****** ****** *)
(* ****** ****** *)
|I1Vp0rj
( itup,pind ) =>
(
prints
("XATSP0RJ(",itup,"[",pind,"]", ")"))
(* ****** ****** *)
//
|I1Vp1cn
( ipat
, icon, pind) =>
(
print("XATSP1CN(");
prints
(ipat, ", ", icon, "[",pind,"+1]", ")")
) where
{ #impltmp
  g_print<i0pat>(x) = i0pcncm1(filr,x) }
//
(*
|I1Vp1rj
( trcd
, itup, pind) =>
(
print("XATSP1RJ(");
prints
(trcd, ", ", itup, "[", pind, "]", ")")
) where
{ #impltmp
  g_print<token>(x) = xtrcdcm1(filr,x) }
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
|I1Vlpcn
(plab, itup) =>
( prints
  ("XATSLPCN(", plab, ", ", itup, ")")
) where
{ #impltmp
  g_print<label>(x) = labelcm1(filr,x) }
*)
//
(*
|I1Vlpft
(plab, itup) =>
( prints
  ("XATSLPFT(", plab, ", ", itup, ")")
) where
{ #impltmp
  g_print<label>(x) = labelcm1(filr,x) }
*)
//
(*
|I1Vlpbx
(plab, itup) =>
( prints
  ("XATSLPBX(", plab, ", ", itup, ")")
) where
{ #impltmp
  g_print<label>(x) = labelcm1(filr,x) }
*)
//
(* ****** ****** *)
(* ****** ****** *)
|
_(*otherwise*) => i1val_fprint(ival,filr)
//
end where
{
//
  #impltmp g_print$out<>() = ( filr )
//
  #impltmp
  g_print<i1val>(x) = i1valcm1(filr, x)
//
}(*where*)//end-of-[ i1valcm1(filr,ival) ]
//
(* ****** ****** *)
//
#implfun
i1vlsif1
(filr, i1vs) =
(
case+ i1vs of
|list_nil() => ()
|list_cons _ => strnfpr(filr, " ")
)(*where*)//end-of-[i1vlsif1(filr,i1vs)]
//
#implfun
i1vlscm1
(filr, i1vs) =
(
loop(i1vs, 0(*i0*))
) where
{
fun loop
( i1vs
: i1valist, i0: sint): void =
(
case+ i1vs of
|list_nil
( (*void*) ) => ( (*void*) )
|list_cons
(i1v1, i1vs) =>
(
(
if
(i0 >= 1) then
strnfpr(filr, " "));
i1valcm1(filr, i1v1);loop(i1vs, i0+1)))
}(*where*)//end-of-[i1vlscm1(filr,i1vs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1let_cm1emit
(ilet, env0) =
(
case+ ilet of
//
|I1LETnew0
(   iins   ) =>
(
fprintln(filr))
where{
val () =
f0_i1anyins(env0, iins)}
//
|I1LETnew1
(itnm, iins) =>
(
fprintln(filr))
where{
val () =
f0_i1tnmins(env0, itnm, iins)}
//
) where
{
//
val filr =
envx2js_filr$get(env0)
val nind =
envx2js_nind$get(env0)
//
(*
#impltmp
g_print$out<(*0*)>((*0*)) = (filr)
#impltmp
g_print<i1tnm>(itnm) = i1tnmcm1(filr, itnm)
*)
//
fun
f0_i1ins
( env0:
! envx2cm
, iins: i1ins): void =
let
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
case+ iins of
//
|I1INSdapp
(i1f0, i1vs) =>
(
if
i1val_conq
(  i1f0  )
then//then
let
val-
I1Vcon(dcon) = i1f0.node()
in//(*let*)
(
strnfpr(
filr,"(XATSCAPP ");
d2concm1(filr, dcon);strnfpr(filr," ");
d2ctgcm1(filr, dcon);
i1vlsif1(filr, i1vs);
i1vlscm1(filr, i1vs);strnfpr(filr, ")"))
end else//else
(
if
i1val_cfnq
(  i1f0  )
then//then
let
in//(*let*)
(
strnfpr(
filr, "(XATSCAST ");
strnfpr(filr, "\"");
i1valcm1(filr, i1f0);strnfpr(filr,"\"");
i1vlsif1(filr, i1vs);
i1vlscm1(filr, i1vs);strnfpr(filr, ")"))
end else//else
(
strnfpr(
filr, "(XATSDAPP ");
i1valcm1(filr, i1f0);
i1vlsif1(filr, i1vs);
i1vlscm1(filr, i1vs);strnfpr(filr, ")"))
)
)
(* ****** ****** *)
//
|I1INStimp
(i0f1, timp) =>
(
t1imp_cm1emit(timp, env0))
where
{
//
val loc1 = i0f1.lctn((*0*))
//
val (  ) =
(
fprintln(filr);
nindstrnfpr(filr, nind, ";; ");
loctnfpr(filr, loc1);fprintln(filr))
val (  ) =
(
nindstrnfpr(filr, nind, ";; ");
i0expfpr(filr, i0f1);fprintln(filr))
}
//
(* ****** ****** *)
//
|I1INSlet0
(dcls, icmp) =>
let
//
val (  ) =
(
fprintln(filr))
//
val (  ) =
(
nindstrnfpr
(filr
,nind, "(letrec\n");
nindstrnfpr
(filr, nind, "(\n"))
//
val (  ) =
i1dclist_cm1emit(dcls, env0)
//
val (  ) =
nindstrnfpr(filr, nind, ")\n")
//
val (  ) =
(
i1cmp_cm1emit(icmp, env0);strnfpr(filr, ")");fprintln(filr))
//
end(*let*)//end-of-[I1INSlet0(dcls,icmp)]
//
(* ****** ****** *)
//
|I1INSift0
(ival
,ithn, iels) =>
let
//
val (  ) =
(
fprintln(filr))
val (  ) =
(
nindstrnfpr
(filr, nind, "(if ");
i1valcm1
(filr, ival);strnfpr(filr, "\n"))
//
val (  ) =
(
case ithn of
|optn_nil() =>
(
nindstrnfpr
(filr, nind, "XATSVOID");fprintln(filr))
|optn_cons(icmp) =>
(
i1cmp_cm1emit(icmp, env0);fprintln(filr))
)
//
val (  ) =
(
case iels of
|optn_nil() =>
(
nindstrnfpr
(filr, nind, "XATSVOID");fprintln(filr))
|optn_cons(icmp) =>
(
i1cmp_cm1emit(icmp, env0);fprintln(filr))
)
//
val (  ) =
(
nindstrnfpr(filr, nind, ") ;; if(...)");fprintln(filr))
//
end(*let*)//end-of-[I1INSift0(ival, ...)]
//
(* ****** ****** *)
//
|I1INScas0
(cknd
,ival, iclz) =>
let
//
val (  ) =
(
fprintln(filr))
val (  ) =
(
nindstrnfpr
(filr, nind, "(cond\n"))
//
val (  ) =
i1valclslst_cm1emit(ival, iclz, env0)
//
val (  ) =
(
nindstrnfpr(filr, nind, ") ;; case(...)");fprintln(filr))
//
end(*let*)//end-of-[I1INScas0(cknd, ...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1INStup0
(   i1vs   ) =>
let
//
fun
i1vlsfpr
( filr: FILR
, i1vs: i1valist): void =
(
case+ i1vs of
|list_nil() => ()
|list_cons(i1v1, i1vs) =>
(
strnfpr(filr, " ");
i1valcm1(filr, i1v1); i1vlscm1(filr, i1vs)))
//
in//let
//
case+ i1vs of
|list_nil() =>
(
strnfpr(filr, "XATSVOID"))
|list_cons _ =>
(
strnfpr(
filr, "(XATSTUP0");i1vlsfpr(filr, i1vs);strnfpr(filr, ")"))
//
end(*let*)//end-of-[I1INStup0(ival, ...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1INSflat
(   i1v1   ) =>
(
strnfpr(filr, "(XATSFLAT");
strnfpr(filr, " ");i1valcm1(filr, i1v1);strnfpr(filr, ")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1INSassgn
(i1vl, i1vr) =>
(
strnfpr(filr, "(XATS000_assgn");
strnfpr(filr, " ");i1valcm1(filr, i1vl);
strnfpr(filr, " ");i1valcm1(filr, i1vr);strnfpr(filr, ")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
|
_(*otherwise*) =>
(
let
val ((*0*)) = i1ins_fprint(iins, filr) in (*otherwise*) end)
//
(* ****** ****** *)
(* ****** ****** *)
//
end(*let*)//end-of-[f0_i1ins(env0,iins)]
//
(* ****** ****** *)
//
fun
f0_close
( env0:
! envx2cm
, iins: i1ins): void =
let
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
case+ iins of
//
|I1INStimp _ =>
(
  nindstrnfpr(filr, nind, ")"))
//
|I1INSlet0 _ =>
(
  nindstrnfpr(filr, nind, ")"))
//
|I1INSift0 _ =>
(
  nindstrnfpr(filr, nind, ")"))
|I1INScas0 _ =>
(
  nindstrnfpr(filr, nind, ")"))
//
| _(*otherwise*) => strnfpr(filr, ")")
//
end(*let*)//end-of-[f0_close(env0,iins)]
//
(* ****** ****** *)
//
fun
f0_i1anyins
( env0:
! envx2cm
, iins: i1ins): void =
let
//
val filr =
(
  envx2js_filr$get(env0))
val nind =
(
  envx2js_nind$get(env0))
//
in//let
(
nindfpr
(filr, nind);strnfpr(filr, "(");
i1anycm1(filr);strnfpr(filr, " ");
f0_i1ins(env0, iins);f0_close(env0, iins))
end(*let*)//end[f0_i1anyins(env0,iins)]
//
fun
f0_i1tnmins
( env0:
! envx2cm
, itnm: i1tnm
, iins: i1ins): void =
let
//
val filr =
(
  envx2js_filr$get(env0))
val nind =
(
  envx2js_nind$get(env0))
//
in//let
(
nindfpr
(filr, nind);strnfpr(filr, "(");
i1tnmcm1(filr, itnm);strnfpr(filr, " ");
f0_i1ins(env0, iins);f0_close(env0, iins))
end(*let*)//end[f0_i1tnmins(env0,itnm,iins)]
//
(* ****** ****** *)
//
}(*where*)//end-of-[i1let_cm1emit(ilet,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1cmp_cm1emit
(icmp, env0) =
let
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
case+ icmp of
|
I1CMPcons
(ilts, ival) =>
(
case+ ilts of
|list_nil() =>
(
nindfpr
(filr, nind);i1valcm1(filr, ival))
|list_cons _ =>
(
nindfpr(filr, nind);
strnfpr(filr, "(let*\n");
nindfpr(filr, nind);strnfpr(filr, "(\n");
//
i1letlst_ind$cm1emit(ilts, 1(*d*), env0);
//
nindstrnfpr(filr, nind, ") ");i1valcm1(filr, ival);strnfpr(filr, ")"))
)
end(*let*)//end-of-[i1cmp_cm1emit(icmp,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
t1imp_cm1emit
(timp, env0) =
let
//
val
iopt = t1imp_i1cmpq(timp)
//
in//let
//
(
case+ iopt of
//
|optn_nil() =>
(
f0_t1imp(env0, timp))
//
|optn_cons(icmp) =>
(
i1cmp_cm1emit(icmp, env0)))
where
{
val () =
(
nindstrnfpr
(filr, nind, ";; ");
t1imploc(filr, timp);fprintln(filr);
nindstrnfpr
(filr, nind, ";; ");
t1impdcl(filr, timp);fprintln(filr))}
//
end where
{
//
val filr =
envx2js_filr$get(env0)
val nind =
envx2js_nind$get(env0)
//
fun
f0_t1imp
( env0:
! envx2cm
, timp: t1imp): void =
let
//
val dcst = timp.dcst((*0*))
val dopt = t1imp_i1dclq(timp)
//
in//let
//
case+ dopt of
//
|optn_nil
((*void*)) =>
(
d2cst_fprint
(dcst, filr)) where
{
val () =
strnfpr(filr,
"(XATS000_undef) ;; timp: ")}
//
|optn_cons
(  idcl  ) =>
(
case+
idcl.node() of
//
|I1Dfundclst
( tknd, tqas
, d2cs, i1fs) =>
let
//
fun
dcst2varfpr
(filr: FILR
,dcst: d2cst
,d2cs: d2cstlst
,i1fs: i1fundclist): void =
(
case+ d2cs of
|
list_nil() => ((*0*))
|
list_cons(d2c1, d2cs) =>
let
//
val-
list_cons(i1f1, i1fs) = i1fs 
//
in//let
//
if
(dcst = d2c1)
then
d2varcm1(filr, d2v1) where
{
val
d2v1 = i1fundcl_dpid$get(i1f1) }
else
dcst2varfpr(filr, dcst, d2cs, i1fs)
//
end//let
)
//
in//let
//
strnfpr
(filr,"function () {\n");
//
(
envx2js_incnind(env0,2(*++*));
(
envx2js_decnind(env0,2(*--*)))
where
{
val () =
i1fundclist_cm1emit(i1fs, env0)});
//
nindstrnfpr
(filr, nind+2, "return ");
dcst2varfpr(filr, dcst, d2cs, i1fs);fprintln(filr);
nindstrnfpr
(filr, nind+0, "} () // endtimp(");d2cst_fprint(dcst, filr);strnfpr(filr, ")")
//
end//let
//
|I1Dimplmnt0
( tknd
, stmp, dimp
, fjas, icmp) =>
(
nindfpr
(filr, nind);
strnfpr
(filr, "(lambda (");
fjas1cm1(filr, fjas);strnfpr(filr, ")");
(
strnfpr(filr," ;; timp: ");
d2cst_fprint(dcst, filr);fprintln(filr));
//
(
envx2js_incnind(env0,2(*++*));
(
envx2js_decnind(env0,2(*--*)))
where{
//
val
nind = (nind+2)
//
val () =
(
nindstrnfpr
(filr
,nind, "(let\n");
nindstrnfpr
(filr, nind, "(\n");
fjags_cm1emit(fjas, env0);
nindstrnfpr(filr, nind, ")\n"))
//
val () = i1cmp_cm1emit(icmp, env0)}//where
);
//
strnfpr(filr, ")) ;; endtimp(");
d2cst_fprint(dcst, filr);strnfpr(filr, ")");fprintln(filr))
)
//
end//let//end-of-[f0_t1imp(...)]
//
}(*where*)//end-of-[t1imp_cm1emit(timp,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1letlst_cm1emit
  (ilts, env0) =
(
  list_cm1emit_fnp(ilts, env0, i1let_cm1emit))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
fjarglst_cm1emit
  (fjas, env0) =
(
  loop1(1(*i0*), fjas)
) where
{
//
val filr =
(
envx2js_filr$get(env0))
val nind =
(
envx2js_nind$get(env0))
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
g_print$out
<(*0*)>(    ) = filr
//
#impltmp
g_print
<i1tnm>(itnm) = i1tnmcm1(filr, itnm)
//
val () =
case+ ibnd of
|
I1BNDcons(itnm, i0p1, dvvs) =>
(
nindfpr(filr,nind);
(
prints(" (", itnm, " ", "arg", i0, ")\n")))
}
)
//
}(*where*)//end-of-[fjarglst_cm1emit(fjas,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1cmp_ind$cm1emit
(icmp, dlta, env0) =
let
//
val () =
(
  envx2js_incnind(env0, dlta))
//
val () = i1cmp_cm1emit(icmp, env0)
val () = envx2js_decnind(env0, dlta)
//
end(*let*)//end-of-(i1cmp_ind$cm1emit(icmp,...)]
//
(* ****** ****** *)
//
#implfun
i1letlst_ind$cm1emit
(ilts, dlta, env0) =
let
//
val () =
(
  envx2js_incnind(env0, dlta))
//
val () =
(
  i1letlst_cm1emit(ilts, env0))
//
val () = envx2js_decnind(env0, dlta)
//
end(*let*)//endof(i1letlst_ind$cm1emit(ilts,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1valcls_cm1emit
(ival, icls, env0) =
let
//
val
nind =
envx2js_nind$get(env0)
val
filr =
envx2js_filr$get(env0)
//
#impltmp
g_print$out<>() = (filr)
//
in//let
//
case+
icls.node() of
//
|I1CLSgpt
(   igpt   ) =>
let
val () =
(
nindstrnfpr(filr,
nind, ";; I1CLSgpt(...)\n"))
end//let//end(I1CLSigpt(igpt))
//
(*
|I1CLScls
(igpt, icmp) =>
(
nindfpr(filr, nind);
prints("\
i1valcls_cm1emit(", ival, ";", icls, ")\n"))
*)
|I1CLScls
(igpt, icmp) =>
let
//
val (  ) =
(
nindstrnfpr(filr, nind, "(\n"))
//
val (  ) =
(
nindstrnfpr
(filr, nind+1, ";; ");
prints(ival, " AS ", igpt);fprintln(filr))
//
val (  ) =
nindstrnfpr
(filr, nind+1, "(and")
//
val ibnd =
(
case+
igpt.node() of
|I1GPTpat(ibnd) => ibnd
|I1GPTgua(ibnd, i1gs) => ibnd)
val ipat =
(
case+ ibnd of
|I1BNDcons(_, ipat, _) => ipat)
//
val (  ) =
(
i0pckcm1(filr, ival, ipat);
  strnfpr(filr, ")");fprintln(filr))
//
val (  ) =
(
i1cmp_ind$cm1emit
(icmp, 1(*d*), env0); strnfpr(filr, ")");fprintln(filr))
//
end(*let*)//end-of-[I1CLScls(igpt, icmp)]
//
end(*let*)//end(i1valcls_cm1emit(ival,icls,env0))
//
(* ****** ****** *)
//
#implfun
i1valclslst_cm1emit
(ival, iclz, env0) =
(
case+ iclz of
|
list_nil() => ((*0*))
|
list_cons(icls, iclz) =>
let
val () = i1valcls_cm1emit(ival, icls, env0)
val () = i1valclslst_cm1emit(ival, iclz, env0)
end//let//end-of-[list_cons]
)(*case+*)//end(i1valclslst_cm1emit(ival,iclz,env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cm_srcgen1_DATS_cm1emit_dynexp.dats] *)
(***********************************************************************)
