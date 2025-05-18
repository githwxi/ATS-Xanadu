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
Fri Nov 29 04:22:27 PM EST 2024
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
(*
#include
"./../../..\
/HATS/xatsopt_dats.hats"
*)
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
#staload "./../SATS/py1emit.sats"
//
(* ****** ****** *)
//
#staload
_(*DATS*)="./../DATS/py1emit.dats"
//
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with d2con_get_lctn
#symload lctn with d2cst_get_lctn
(* ****** ****** *)
#symload lctn with i1val_get_lctn
(* ****** ****** *)
#symload lctn with i1cmp_get_lctn
#symload ival with i1cmp_get_ival
#symload ilts with i1cmp_get_ilts
(* ****** ****** *)
#symload node with i1cls_get_node
(* ****** ****** *)
#symload node with t1imp_get_node
(* ****** ****** *)
#symload lctn with i1dcl_get_lctn
#symload node with i1dcl_get_node
(* ****** ****** *)
(* ****** ****** *)
#symload filr with envx2js_get_filr
#symload nind with envx2js_get_nind
(* ****** ****** *)
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
d2conpy1
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
end(*let*)//end-of-[d2conpy1(...)]
//
(* ****** ****** *)
//
fun
d2ctgpy1
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
end(*let*)//end-of-[d2ctgpy1(...)]
//
(* ****** ****** *)
//
fun
i0ctgpy1
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
end(*let*)//end-of-[i0ctgpy1(filr,ipat)]
//
(* ****** ****** *)
//
fun
i0pcnpy1
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
end(*let*)//end-of-[i0pcnpy1(filr,ipat)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0pckpy1
( filr
, ival, ipat) =
let
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
conj
(b0: sint): void =
(
if
(b0 > 0)
then
print(" and ") else ())
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
(* ****** ****** *)
(* ****** ****** *)
//
|I0Pany _ => ((*void*))
|I0Pvar _ => ((*void*))
//
(* ****** ****** *)
//
|I0Pint _ =>
(
 f0_int0(b0, ival, ipat))
|I0Pbtf _ =>
(
 f0_btf0(b0, ival, ipat))
|I0Pchr _ =>
(
 f0_chr0(b0, ival, ipat))
|I0Pflt _ =>
(
 f0_flt0(b0, ival, ipat))
|I0Pstr _ =>
(
 f0_str0(b0, ival, ipat))
//
(* ****** ****** *)
//
|I0Pdap1 _ =>
(
  f0_dap1(b0, ival, ipat))
|I0Pdapp _ =>
(
  f0_dapp(b0, ival, ipat))
//
(* ****** ****** *)
//
|I0Prfpt _ =>
(
  f0_rfpt(b0, ival, ipat))
//
(* ****** ****** *)
//
|I0Ptup0 _ =>
(
  f0_tup0(b0, ival, ipat))
|I0Ptup1 _ =>
(
  f0_tup1(b0, ival, ipat))
(*
|I0Prcd2 _ =>
(
  f0_rcd2(b0, ival, ipat))
*)
//
(* ****** ****** *)
//
|I0Pbang _ =>
(
  f0_bang(b0, ival, ipat))
//
|I0Pflat _ =>
(
  f0_flat(b0, ival, ipat))
//
|I0Pfree _ =>
(
  f0_free(b0, ival, ipat))
//
(* ****** ****** *)
//
|
_(*otherwise*) =>
(
conj(b0); prints('"',ipat,'"'))
//
//end-of-[f0_ipat(b0,ival,ipat)]
//
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
<token>(x) = i0intpy1(filr, x)
#impltmp
g_print
<i1val>(x) = i1valpy1(filr, x)
//
in//let
(conj(b0)
;print("XATS000_inteq(")
;prints(ival, ", ", tint, ")"))
end(*let*)//end-of-[f0_int0(...)]
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
<sym_t>(x) = i0btfpy1(filr, x)
#impltmp
g_print
<i1val>(x) = i1valpy1(filr, x)
//
in//let
(conj(b0)
;print("XATS000_btfeq(")
;prints(ival, ", ", btf0, ")"))
end(*let*)//end-of-[f0_btf0(...)]
//
and
f0_chr0
( b0: sint
, ival: i1val
, ipat: i0pat): void =
let
//
val-
I0Pchr
(  tchr  ) = ipat.node()
//
#impltmp
g_print
<token>(x) = i0chrpy1(filr, x)
#impltmp
g_print
<i1val>(x) = i1valpy1(filr, x)
//
in//let
(conj(b0)
;print("XATS000_chreq(")
;prints(ival, ", ", tchr, ")"))
end(*let*)//end-of-[f0_chr0(...)]
//
and
f0_flt0
( b0: sint
, ival: i1val
, ipat: i0pat): void =
let
//
val-
I0Pflt
(  tflt  ) = ipat.node()
//
#impltmp
g_print
<token>(x) = i0fltpy1(filr, x)
#impltmp
g_print
<i1val>(x) = i1valpy1(filr, x)
//
in//let
(conj(b0)
;print("XATS000_flteq(")
;prints(ival, ", ", tflt, ")"))
end(*let*)//end-of-[f0_flt0(...)]
//
and
f0_str0
( b0: sint
, ival: i1val
, ipat: i0pat): void =
let
//
val-
I0Pstr
(  tstr  ) = ipat.node()
//
#impltmp
g_print
<token>(x) = i0strpy1(filr, x)
#impltmp
g_print
<i1val>(x) = i1valpy1(filr, x)
//
in//let
(conj(b0)
;print("XATS000_streq(")
;prints(ival, ", ", tstr, ")"))
end(*let*)//end-of-[f0_str0(...)]
//
(* ****** ****** *)
//
and
f0_dap1
( b0: sint
, ival: i1val
, ipat: i0pat): void =
let
//
val-
I0Pdap1
(  i0f0  ) = ipat.node()
//
#impltmp
g_print
<i0pat>(x) = i0ctgpy1(filr, x)
#impltmp
g_print
<i1val>(x) = i1valpy1(filr, x)
//
in//let
(conj(b0)
;print("XATS000_ctgeq(")
;prints(ival, ", ", i0f0, ")"))
end(*let*)//end-of-[f0_dap1(...)]
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
<i0pat>(x) = i0ctgpy1(filr, x)
#impltmp
g_print
<i1val>(x) = i1valpy1(filr, x)
//
in//let
(
conj(b0);
print("XATS000_ctgeq(");
prints(ival,", ",i0f0, ")");
f0_ipatlst(b0+1,0,ival,ipat,i0ps))
end(*let*)//end-of-[f0_dapp(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
and
f0_rfpt
( b0: sint
, ival: i1val
, ipat: i0pat): void =
let
//
val-
I0Prfpt
(i0p1, i0p2) = ipat.node()
//
val () = f0_ipat(b0,ival,i0p1)
val () = f0_ipat(b0,ival,i0p2)
//
end(*let*)//end-of-[f0_rfpt(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
and
f0_tup0
( b0: sint
, ival: i1val
, ipat: i0pat): void =
let
//
val-
I0Ptup0 i0ps = ipat.node()
//
in//let
(
f0_ipatlst(b0+0,0,ival,ipat,i0ps))
end(*let*)//end-of-[f0_tup0(...)]
//
(* ****** ****** *)
//
and
f0_tup1
( b0: sint
, ival: i1val
, ipat: i0pat): void =
let
//
val-
I0Ptup1
(tknd, i0ps) = ipat.node()
//
in//let
(
f0_ipatlst(b0+0,0,ival,ipat,i0ps))
end(*let*)//end-of-[f0_tup1(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
and
f0_bang
( b0: sint
, ival: i1val
, ipat: i0pat): void =
(
f0_ipat(b0, ival, i0p1)
) where
{
val-I0Pbang(i0p1) = ipat.node()
}(*where*)//end-of-[f0_bang(...)]
//
and
f0_flat
( b0: sint
, ival: i1val
, ipat: i0pat): void =
(
f0_ipat(b0, ival, i0p1)
) where
{
val-I0Pflat(i0p1) = ipat.node()
}(*where*)//end-of-[f0_flat(...)]
//
and
f0_free
( b0: sint
, ival: i1val
, ipat: i0pat): void =
(
f0_ipat(b0, ival, i0p1)
) where
{
val-I0Pfree(i0p1) = ipat.node()
}(*where*)//end-of-[f0_free(...)]
//
(* ****** ****** *)
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
(b0, i0+1, ival, ipat, i0ps)
else
let
val i1v1 =
proj(i0, ival, ipat)
in//let
f0_ipat(b0, i1v1, i0p1);
f0_ipatlst
(b0+1, i0+1, ival, ipat, i0ps)
end//let
)(*case+*)//end-of-[f0_ipatlst(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
in
( if
  i0pat_allq(ipat)
  then print("True")
  else f0_ipat(0(*conj*), ival, ipat) )
end(*let*)//end-(i0pckpy1(filr,ival,ipat))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
xtrcdpy1
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
prints("XATSTRCD(", knd0, ")"))
|T_TRCD20(knd0) =>
(
prints("XATSTRCD(", knd0, ")"))
//
|_(*otherwise*) =>
(
prints
("XATSTRCD(", "'", tknd, "'", ")"))
//
end(*let*)//end-of-[xtrcdpy1(filr,tknd)]
//
(* ****** ****** *)
//
fun
labelpy1
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
  prints("'", nam, "'") end//let
) where
{
//
  #impltmp g_print$out<>() = filr
//
}(*where*)//end-of-[labelpy1(filr,lab0)]
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
(dcst, dopt) =>
(
case+ dopt of
|
optn_nil() =>
prints("T1IMPall1(", dcst, ")")
|
optn_cons(idcl) =>
let
val loc0 = idcl.lctn((*0*))
val (  ) = prints("\
T1IMPall1(", dcst, ", ", loc0, ")")
end//let
)
//
|T1IMPallx
(dcst, dopt) =>
(
case+ dopt of
|
optn_nil() =>
prints("T1IMPallx(", dcst, ")")
|
optn_cons(idcl) =>
let
val loc0 = idcl.lctn((*0*))
val (  ) = prints("\
T1IMPallx(", dcst, ", ", loc0, ")")
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
(dcst, dopt) =>
(
case+ dopt of
|
optn_nil() =>
prints("T1IMPall1(", dcst, ")")
|
optn_cons(idcl) =>
let
val (  ) = prints("\
T1IMPall1(", dcst, ", ", idcl, ")")
end//let
)
//
|T1IMPallx
(dcst, dopt) =>
(
case+ dopt of
|
optn_nil() =>
prints("T1IMPallx(", dcst, ")")
|
optn_cons(idcl) =>
let
val (  ) = prints("\
T1IMPallx(", dcst, ", ", idcl, ")")
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
  praux(idcl)) where
{
//
fun
praux
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
praux(idcl); print(")"))//tmpsub
//
|
I1Dimplmnt0
(tknd, stmp
,dimp, fjas,icmp) =>
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
fjas1py1
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
; prints("arg", i0)
; loop3(i0+1, i1bs, fjas))
)
//
in
(print("(")
;loop1(1(*i0*),fjas);print(")"))
end(*let*)//end-of-[fjas1py1(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1valpy1(filr, ival) =
let
//
(*
val () =
prerrsln
("i1valpy1: ival = ", ival)
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
( tint ) => i0intpy1(filr,tint)
(* ****** ****** *)
|I1Vbtf
( btf0 ) => i0btfpy1(filr,btf0)
(* ****** ****** *)
|I1Vchr
( tchr ) => i0chrpy1(filr,tchr)
(* ****** ****** *)
|I1Vflt
( tflt ) => i0fltpy1(filr,tflt)
(* ****** ****** *)
|I1Vstr
( tstr ) => i0strpy1(filr,tstr)
(* ****** ****** *)
(* ****** ****** *)
//
|I1Vi00
( int0 ) => i0i00py1(filr,int0)
|I1Vb00
( btf0 ) => i0b00py1(filr,btf0)
|I1Vc00
( chr0 ) => i0c00py1(filr,chr0)
|I1Vf00
( flt0 ) => i0f00py1(filr,flt0)
|I1Vs00
( str0 ) => i0s00py1(filr,str0)
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1Vtop
( sym0 ) => print( "XATSTOP0" )
//
(* ****** ****** *)
|I1Vtnm
( itnm ) => i1tnmpy1(filr,itnm)
(* ****** ****** *)
|I1Vcon
( dcon ) => d2conpy1(filr,dcon)
(* ****** ****** *)
|I1Vcst
( dcst ) => d2cstpy1(filr,dcst)
(* ****** ****** *)
|I1Vvar
( dvar ) => d2varpy1(filr,dvar)
(* ****** ****** *)
(* ****** ****** *)
//
|I1Vaddr(i1v1) =>
(
  prints("XATSADDR(", i1v1, ")") )
|I1Vaexp(i0e1) =>
(
  prints("XATSAEXP(", i0e1, ")") )
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
  g_print<i0pat>(x) = i0pcnpy1(filr,x) }
//
|I1Vp1rj
( trcd
, itup, pind) =>
(
print("XATSP1RJ(");
prints
(trcd, ", ", itup, "[", pind, "]", ")")
) where
{ #impltmp
  g_print<token>(x) = xtrcdpy1(filr,x) }
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1Vlpcn
(plab, itup) =>
( prints
  ("XATSLPCN(", plab, ", ", itup, ")")
) where
{ #impltmp
  g_print<label>(x) = labelpy1(filr,x) }
//
|I1Vlpft
(plab, itup) =>
( prints
  ("XATSLPFT(", plab, ", ", itup, ")")
) where
{ #impltmp
  g_print<label>(x) = labelpy1(filr,x) }
//
|I1Vlpbx
(plab, itup) =>
( prints
  ("XATSLPBX(", plab, ", ", itup, ")")
) where
{ #impltmp
  g_print<label>(x) = labelpy1(filr,x) }
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
  g_print<i1val>(x) = i1valpy1(filr, x)
//
}(*where*)//end-of-[ i1valpy1(filr,ival) ]
//
(* ****** ****** *)
//
#implfun
l1i1vpy1
(filr, liv0) =
let
val+
I1LAB(lab1, i1v2) = liv0
in//let
(
prints(lab1, ": ", i1v2)) where
{
  #impltmp
  g_print<label>(x) = labelpy1(filr, x)
  #impltmp
  g_print<i1val>(x) = i1valpy1(filr, x)
}
end(*end*)//end-of-[ l1i1vpy1(filr,ival) ]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1valpy1_list
( filr: FILR
, i1vs: i1valist): void =
(
list_iforitm(i1vs)) where
{
#typedef x0 = i1val
#typedef xs = i1valist
#impltmp
iforitm$work<x0>(i0, x0) =
(
if
(i0 >= 1)
then
strnfpr(filr,", ");i1valpy1(filr, x0))
}(*where*)//end-of-[i1valpy1_list(...)]
//
(* ****** ****** *)
//
fun
l1i1vpy1_list
( filr: FILR
, livs: l1i1vlst): void =
(
list_iforitm(livs)) where
{
#typedef x0 = l1i1v
#typedef xs = l1i1vlst
#impltmp
iforitm$work<x0>(i0, x0) =
(
if
(i0 >= 1)
then
strnfpr(filr,", ");l1i1vpy1(filr, x0))
}(*where*)//end-of-[l1i1vpy1_list(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1inspy1
( filr: FILR
, iins: i1ins): void =
let
//
(*
val () =
prerrsln
("i1inspy1: iins = ", iins)
*)
//
#impltmp
g_print
<label>(x) = labelpy1(filr, x)
#impltmp
g_print
<i1val>(x) = i1valpy1(filr, x)
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
if
i1val_conq
(  i1f0  )
then//then
let
val-
I1Vcon(dcon) = i1f0.node()
in//let
(
//
strnfpr
(filr,"XATSCAPP(");
d2conpy1(filr,dcon);
strnfpr(filr,", [");d2ctgpy1(filr,dcon);
//
if // if
list_consq(i1vs) then strnfpr(filr,", ");
//
i1valpy1_list(filr,i1vs);strnfpr(filr,"])"))
end//let
else//else
(
if
i1val_cfnq
(  i1f0  )
then // then
(
strnfpr
(filr,"XATSCAST(");
strnfpr(filr,"\"");
i1valpy1(filr,i1f0);strnfpr(filr,"\"");
strnfpr(filr,", [");
i1valpy1_list(filr,i1vs);strnfpr(filr,"])"))
else // else
(
strnfpr
(filr,"XATSDAPP(");
i1valpy1(filr,i1f0);strnfpr(filr,"(");
i1valpy1_list(filr,i1vs);strnfpr(filr,"))"))
)
)
//
(* ****** ****** *)
//
|I1INSpcon
(lab0, i1v1) =>
(
prints("XATSPCON(", i1v1, ",", lab0, ")"))
//
|I1INSpflt
(lab0, i1v1) =>
(
prints("XATSPFLT(", i1v1, "[", lab0, "]", ")"))
|I1INSproj
(lab0, i1v1) =>
(
prints("XATSPROJ(", i1v1, "[", lab0, "]", ")"))
//
(* ****** ****** *)
//
|I1INStup0
(   i1vs   ) =>
(
strnfpr(filr,"XATSTUP0(");
strnfpr(filr,"[");i1valpy1_list(filr,i1vs);strnfpr(filr,"]");strnfpr(filr,")")
)
//
|I1INStup1
(tknd, i1vs) =>
(
strnfpr(filr,"XATSTUP1(");
xtrcdpy1(filr,tknd);strnfpr(filr,", ")
;strnfpr(filr,"[");i1valpy1_list(filr,i1vs);strnfpr(filr,"]");strnfpr(filr,")")
)
//
|I1INSrcd2
(tknd, livs) =>
(
strnfpr(filr,"XATSRCD2(");
xtrcdpy1(filr,tknd);strnfpr(filr,", ")
;strnfpr(filr,"{");l1i1vpy1_list(filr,livs);strnfpr(filr,"}");strnfpr(filr,")")
)
//
(* ****** ****** *)
//
|I1INSflat
(   i1v1   ) =>
(strnfpr(filr,"XATSFLAT(")
;i1valpy1(filr,i1v1);strnfpr(filr,")"))
//
(* ****** ****** *)
//
|I1INSdl0az
(   i1v1   ) =>
(strnfpr(filr,"XATS000_dl0az(")
;i1valpy1(filr,i1v1);strnfpr(filr,")"))
//
|I1INSdl1az
(   i1v1   ) =>
(strnfpr(filr,"XATS000_dl1az(")
;i1valpy1(filr,i1v1);strnfpr(filr,")"))
//
(* ****** ****** *)
//
|I1INSdp2tr
(   i1v1   ) =>
(strnfpr(filr,"XATS000_dp2tr(")
;i1valpy1(filr,i1v1);strnfpr(filr,")"))
//
(* ****** ****** *)
//
|I1INSraise
(tknd, i1v0) =>
(
strnfpr(filr, "XATS000_raise(");
i1valpy1(filr, i1v0);strnfpr(filr, ")"))
//
(* ****** ****** *)
(* ****** ****** *)
|
_(*otherwise*) => i1ins_fprint(iins,filr)
//
(* ****** ****** *)
(* ****** ****** *)
//
end(*let*) // end-of-[i1inspy1(env0,iins)]
//
(* ****** ****** *)
//
fun
i1cmppy1
( filr: FILR
, icmp: i1cmp): void =
let
//
(*
val () =
prerrsln
("i1cmppy1: icmp = ", icmp)
*)
//
in//let
case+ icmp of
(* ****** ****** *)
|
_(*otherwise*) => i1cmp_fprint(icmp,filr)
(* ****** ****** *)
end(*let*) // end-of-[i1cmppy1(env0,icmp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#implfun
py1emit_i1ins
( env0,iins ) =
xats2js_i1ins( env0,iins ) // implfun
*)
//
(* ****** ****** *)
//
#implfun
py1emit_i1cmp
( env0,icmp ) =
let
//
val filr =
envx2js_get_filr(env0)
val nind =
envx2js_get_nind(env0)
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
(filr,"## I1CMP:start\n");
//
(
nindfpr(filr, nind);
strnfpr
(filr,"## I1CMP:return:");
i1valpy1
(filr,ival);fprintln(filr)) where
{
val () =
(
  py1emit_i1letlst(env0, ilts)) }
//
)(* end-of-[I1CMPcons(ilts,ival)] *)
//
end(*let*)//end-of-[py1emit_i1cmp(env0,icmp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
py1emit_i1let
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
//
|optn_nil
((*void*)) =>
(
d2cst_fprint
(dcst, filr)) where
{
val () =
strnfpr(filr, "()")
val () =
strnfpr(filr, ": ## timp: ")
}
//
|optn_cons
(  idcl  ) =>
(
case+
idcl.node() of
I1Dimplmnt0
( tknd
, stmp, dimp
, fjas, icmp) =>
(
fjas1py1(filr, fjas);
strnfpr(filr, ": ## timp: ");
d2cst_fprint(dcst, filr);fprintln(filr);
(
envx2js_incnind(env0,2(*++*));
py1emit_fjarglst(env0, fjas);f0_i1cmpret(env0, icmp));
(
envx2js_decnind(env0,2(*--*));
nindstrnfpr(filr, nind, "## endtimp(");d2cst_fprint(dcst, filr);strnfpr(filr, ")")))
)
//
end//let//end-of-[f0_t1imp(...)]
//
(* ****** ****** *)
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
py1emit_i1cmp(env0, icmp)
//
in//let
//
nindstrnfpr
(filr, nind, "return ");
i1valpy1(filr, ival);fprintln(filr)
//
end//let
end//let//end-of-[f0_i1cmpret(...)]
//
(* ****** ****** *)
//
and
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
py1emit_i1letlst(env0, ilts)
//
val () =
let
nindfpr(filr, nind);i1tnmpy1(filr, itnm);
strnfpr(filr, " = ");i1valpy1(filr, ival);fprintln(filr)
end//let
//
end//let//end-of-[f0_i1tnmcmp(...)]
//
(* ****** ****** *)
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
//
|I1GPTpat
(   ibnd   ) =>
(
case+ ibnd of
I1BNDcons
(itnm,ipat,dvvs) =>
(
nindstrnfpr(filr, nind, "## ");
prints(igpt, "\n");
nindstrnfpr(filr, nind, "if (");
i0pckpy1
(filr, ival, ipat);strnfpr(filr, "): ## { // gpt\n");
nindfpr(filr,nind+2);i1tnmpy1(filr, itnm);
strnfpr(filr,(" = "));i1valpy1(filr, ival);fprintln(filr)
)(* end-of-[I1BNDcons(...)] *)
)
//
|I1GPTgua
(ibnd, i1gs) =>
(
case+ ibnd of
I1BNDcons
(itnm,ipat,dvvs) =>
(
nindstrnfpr
(filr, nind, "## "); prints(igpt, "\n");
nindstrnfpr
(filr, nind, "if (");
i0pckpy1
(filr, ival, ipat);strnfpr(filr, "): ## { // gpt\n");
nindfpr(filr,nind+2);i1tnmpy1(filr, itnm);
strnfpr(filr,(" = "));i1valpy1(filr, ival);fprintln(filr)
)(* end-of-[I1BNDcons(...)] *)
)
//
end(*let*)//end-of-[f0_i1valgpt(...)]
//
(* ****** ****** *)
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
(*
val () =
prerrsln
("f0_i1tnmvalcls: itnm = ", itnm)
val () =
prerrsln
("f0_i1tnmvalcls: ival = ", ival)
val () =
prerrsln
("f0_i1tnmvalcls: icl0 = ", icl0)
*)
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
strnfpr(filr, "## { // cls\n"))
//
val () =
(
  f1_i1clscls(env0, igpt, icmp))
//
val () =
nindstrnfpr(filr, nind, "## } // cls\n")
//
end//let//end(I1CLScls(igpt,icmp))
//
end where
{
//
val filr = envx2js_get_filr(env0)
val nind = envx2js_get_nind(env0)
//
fun
f1_i1clscls
( env0:
! envx2js
, igpt: i1gpt
, icmp: i1cmp): void =
(
case+
igpt.node() of
|I1GPTpat _ =>
f1_i1clscls_pat(env0, igpt, icmp)
|I1GPTgua _ =>
f1_i1clscls_gua(env0, igpt, icmp))
//
and
f1_i1clscls_pat
( env0:
! envx2js
, igpt: i1gpt
, icmp: i1cmp): void =
let
val () =
(
  f0_i1valgpt(env0, ival, igpt))
//
val () =
let
//
val () =
(
  envx2js_incnind(env0,2(*++*)))
val () =
(
  f0_i1tnmcmp(env0, itnm, icmp))
val () =
(
  envx2js_decnind(env0,2(*--*)))
//
in//let
(
  nindfpr(filr, nind+2);
  strnfpr(filr, "break ## cls\n"))
end//let
//
val () =
nindstrnfpr(filr, nind, "## } // gpt\n")
//
end//let//end(f1_i1clscls_pat(igpt,icmp))
//
(* ****** ****** *)
//
and
f1_i1clscls_gua
( env0:
! envx2js
, igpt: i1gpt
, icmp: i1cmp): void =
let
//
val tbrk =
i1tnm_new0( (*void*) )
//
fun
tbrkpy1
( filr: FILR
, tbrk: i1tnm): void =
(
  i1tnmpy1(filr, tbrk))
//
val () =
(
f0_i1valgpt(env0, ival, igpt))
//
val () =
(
envx2js_incnind(env0,2(*++*)))
//
val () =
(
nindfpr(filr, nind+2);
tbrkpy1(filr, (tbrk));
strnfpr(filr, " = False\n");
nindfpr(filr, nind+2);
strnfpr(filr, "while True: ## do { // gua\n")
)
//
val () =
(
envx2js_incnind(env0,2(*++*)))
//
val () =
(
f2_i1gualst(env0, i1gs)) where
{
//
fun
f2_i1gua
( env0:
! envx2js
, igua: i1gua): void =
(
case+
igua.node() of
|
I1GUAexp(icmp) =>
let
//
val ival =
i1cmp_get_ival(icmp)
val (  ) =
py1emit_i1cmp(env0, icmp)
//
in//let
(
nindfpr
(filr, nind+4);
strnfpr
(filr, "if not(");
i1valpy1(filr, ival);
strnfpr(filr, "): break\n"))
end where // end-of-[let]
{
val () =
(
nindfpr(filr, nind+4); prints
("## I1GUAexp: igua = ", igua, "\n"))
}
|
I1GUAmat(icmp, ibnd) =>
(
nindfpr(filr, nind+4); prints
("## I1GUAmat: igua = ", igua, "\n"))
)
//
and
f2_i1gualst
( env0:
! envx2js
, i1gs: i1gualst): void =
(
case+ i1gs of
|
list_nil() => ()
|
list_cons(i1g1, i1gs) =>
let
val () =
  f2_i1gua(env0, i1g1)
val () =
  f2_i1gualst(env0, i1gs) end
)(*case+*)//endof-(f2_i1gualst)
//
val-
I1GPTgua(_, i1gs) = igpt.node()
//
}
//
val () =
(
//
(*
HX-2025-01-13:
For dismissing the guard
*)
//
nindfpr
(filr, nind+4);
tbrkpy1(filr, tbrk);
strnfpr(filr, 
  " = (True) ## deguarded!\n"))
//
val () =
(
  f0_i1tnmcmp(env0, itnm, icmp))
val () =
(
  envx2js_decnind(env0,2(*--*)))
val () =
(
  envx2js_decnind(env0,2(*--*)))
//
val () =
nindstrnfpr(filr, nind+4, "break\n")
//
val () =
(
nindfpr(filr, nind+2);
strnfpr(filr,"## } while True // end-of(do-gua)\n"))
//
val () =
(
  f2_igptbrk(filr, nind+2)) where
{
fun
f2_igptbrk
( filr: FILR
, nind: sint): void =
(
nindfpr(filr, nind);strnfpr(filr, "if (");
tbrkpy1(filr, tbrk);strnfpr(filr, "): break ## cls\n"))
}
//
val () =
(
nindstrnfpr(filr, nind, "## } // gpt\n"))
//
end//let//end(f1_i1clscls_gua(igpt,icmp))
//
(* ****** ****** *)
//
}(*where*)//end-of-[f0_i1tnmvalcls(env0,...)]
//
(* ****** ****** *)
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
"XATS000_cfail()");fprintln(filr))
end//let
|
list_cons(icl1, icls) =>
( f0_i1tnmvalcls(env0,itnm,ival,icl1)
; f0_i1tnmvalclslst(env0,itnm,ival,icls) )
)(*case+*)//end-of-[f0_i1tnmvalclslst(env0,...)]
//
(* ****** ****** *)
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
(* ****** ****** *)
//
|I1INSfold
(  i1v0  ) =>
(
nindstrnfpr
(filr, nind, "XATS000_fold(");
i1valpy1(filr, i1v0);strnfpr(filr, ")\n"))
//
(* ****** ****** *)
//
|I1INSfree
(  i1v0  ) =>
(
nindstrnfpr
(filr, nind, "XATS000_free(");
i1valpy1(filr, i1v0);strnfpr(filr, ")\n"))
//
(* ****** ****** *)
//
|I1INSassgn
(i1vl, i1vr) =>
(
nindstrnfpr
(filr, nind, "XATS000_assgn(");
i1valpy1(filr, i1vl);strnfpr(filr, ", ");
i1valpy1(filr, i1vr);strnfpr(filr, ")\n"))
//
(* ****** ****** *)
//
|_(*otherwise*) =>
(
nindfpr(filr, nind);i1inspy1(filr, iins);fprintln(filr))
//
(* ****** ****** *)
//
)(*case+*)//end-of-[I1LETnew0(iins)]
//
(* ****** ****** *)
//
|I1LETnew1
(itnm, iins) =>
let
//
fun
f1_i1ins
(iins: i1ins): void =
(
nindfpr(filr, nind);
i1tnmpy1(filr, itnm);
strnfpr(filr, " = ");
i1inspy1(filr, iins);fprintln(filr))
//
in//let
//
case+ iins of
//
(* ****** ****** *)
(* ****** ****** *)
|I1INSdapp _ => f1_i1ins(iins)
(* ****** ****** *)
|I1INSpcon _ => f1_i1ins(iins)
|I1INSpflt _ => f1_i1ins(iins)
|I1INSproj _ => f1_i1ins(iins)
(* ****** ****** *)
|I1INStup0 _ => f1_i1ins(iins)
|I1INStup1 _ => f1_i1ins(iins)
|I1INSrcd2 _ => f1_i1ins(iins)
(* ****** ****** *)
|I1INSflat _ => f1_i1ins(iins)
(* ****** ****** *)
|I1INSdl0az _ => f1_i1ins(iins)
|I1INSdl1az _ => f1_i1ins(iins)
(* ****** ****** *)
|I1INSdp2tr _ => f1_i1ins(iins)
(* ****** ****** *)
|I1INSraise _ => f1_i1ins(iins)
(* ****** ****** *)
(* ****** ****** *)
//
|I1INStimp
(i0f1, timp) =>
let
//
val
loc1 = i0f1.lctn((*0*))
//
val
iopt = t1imp_i1cmpq(timp)
//
val () = (
nindstrnfpr
(filr, nind, "## ");
loctnfpr(filr, loc1);fprintln(filr))
val () = (
nindstrnfpr
(filr, nind, "## ");
i0expfpr(filr, i0f1);fprintln(filr))
//
in//let
//
case+ iopt of
|
optn_nil() =>
(
//
nindstrnfpr
(filr, nind, "## ");
t1imploc(filr, timp);fprintln(filr);
nindstrnfpr
(filr, nind, "## ");
t1impdcl(filr, timp);fprintln(filr);
//
nindstrnfpr
(filr, nind, "def ");
i1tnmpy1(filr, itnm);
f0_t1imp(env0, timp);fprintln(filr))
|
optn_cons(icmp) =>
(
f0_i1tnmcmp(env0, itnm, icmp)) where
{
val () =
(
//
nindstrnfpr
(filr, nind, "## ");
t1imploc(filr, timp);fprintln(filr);
nindstrnfpr
(filr, nind, "## ");
t1impdcl(filr, timp);fprintln(filr);
//
nindfpr(filr, nind);
i1tnmpy1(filr, itnm);strnfpr(filr, " = None\n"))}
//
end//let//end-of-[I1INStimp(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1INSlet0
(dcls, icmp) =>
let
//
val () = 
nindstrnfpr
(filr, nind, "## let\n")
//
val () =
(
nindfpr(filr, nind);
i1tnmpy1(filr, itnm);
strnfpr(filr, " = None\n"))
//
val () =
(
 py1emit_i1dclist(env0,dcls))
val () =
(
 f0_i1tnmcmp(env0,itnm,icmp))
//
val () = 
(
nindstrnfpr(filr, nind, "## end-of(let)\n"))
//
end//let//end-of-[I1INSlet0(...)]
//
(* ****** ****** *)
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
i1tnmpy1(filr, itnm);
strnfpr(filr, " = None\n"))
//
val () =
(
nindstrnfpr
(filr, nind, "if (");
i1valpy1(filr, itst);strnfpr(filr, "):\n"))
//
val () =
(
case+ ithn of
|optn_nil() => ()
|optn_cons(icmp) =>
(envx2js_incnind(env0,2(*++*))
;f0_i1tnmcmp( env0,itnm,icmp )
;envx2js_decnind(env0,2(*--*))))//then
//
val () =
(
case+ iels of
|optn_nil() =>
(
nindstrnfpr
(filr, nind,
"## else: None\n"))//no-else
|optn_cons(icmp) =>
(
nindstrnfpr
(filr, nind, "else:\n");
(envx2js_incnind(env0,2(*++*))
;f0_i1tnmcmp( env0,itnm,icmp )
;envx2js_decnind(env0,2(*--*)))))
//
val () =
(
nindstrnfpr(filr, nind, "## end-of(if)\n"))
//
end//let//end-of-[I1INSift0(...)]
//
(* ****** ****** *)
//
|I1INScas0
(cask
,i1v1, icls) =>
let
val () =
(
nindfpr(filr, nind);
i1tnmpy1(filr, itnm);strnfpr(filr, " = None\n"))
//
val () =
(
nindstrnfpr
(filr, nind,
"while True: ## do {\n"))
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
nindfpr(filr, nind);
strnfpr(filr,"## } while True // end-of(do-cls)\n"))
//
end//let//end-of-[I1INScas0(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1INSlam0
(tknd
,fjas, icmp) =>
(
nindstrnfpr
(filr, nind, "def ");
i1tnmpy1(filr, itnm);
fjas1py1(filr, fjas);
strnfpr(filr, ": ## { // lam0(");
tokenfpr(filr, tknd);strnfpr(filr, ")\n");
(
envx2js_incnind
( env0,2(*++*) );
py1emit_fjarglst(env0, fjas);f0_i1cmpret(env0, icmp));
(
envx2js_decnind
( env0,2(*--*) );nindstrnfpr(filr, nind, "## } // end(lam0)\n"))
)
//
(* ****** ****** *)
//
|I1INSfix0
(tknd
,dvar
,fjas, icmp) =>
(
//
nindfpr(filr, nind);
i1tnmpy1(filr, itnm);
strnfpr(filr," = None\n");
//
nindstrnfpr
(filr, nind, "def ");
d2varfpr(filr, dvar); //fvar
fjas1py1(filr, fjas); //farg
strnfpr(filr, ": ## { // fix0(");
tokenfpr(filr, tknd);strnfpr(filr, ")\n");
//
(
envx2js_incnind
( env0,2(*++*) );
py1emit_fjarglst
( env0,fjas(*args*) );f0_i1cmpret(env0, icmp));
//
(
envx2js_decnind
( env0,2(*--*) );
nindstrnfpr(filr, nind, "## } // end(fix0)\n"));
//
nindfpr(filr, nind);i1tnmpy1(filr, itnm);
strnfpr(filr," = ");d2varfpr(filr, dvar);fprintln(filr)
)
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1INStry0
(tknd
,icmp
,iexn, icls) =>
let
val () =
(
nindfpr(filr, nind);
i1tnmpy1(filr, itnm);strnfpr(filr, " = None\n"))
//
val () =
(
nindstrnfpr
(filr, nind, "try:\n");
//
envx2js_incnind(env0,2(*++*));
f0_i1tnmcmp(env0, itnm, icmp);
envx2js_decnind(env0,2(*--*));
//
nindstrnfpr
(filr, nind, "except X2PYExcptn as exn:\n");
nindfpr(filr, nind+2);
i1valpy1(filr, iexn);strnfpr(filr, " = exn.args[0]\n"))
//
val () =
(
nindstrnfpr
(filr, nind+2,
"while True: ## do {\n"))
//
val () = // enter
envx2js_incnind(env0,2+2(*++*))
//
val () =
f0_i1tnmvalclslst
( env0,itnm,iexn,icls(*list*) )
//
val () =
(
  envx2js_decnind(env0,2+2(*--*)))//leave
//
val () =
(
nindfpr(filr, nind+2);
strnfpr(filr,"## } while True // end-of(do-try)\n"))
//
val () =
(
nindstrnfpr(filr, nind, "## } // end(except) // end-of(try)\n"))
end//let//end-of-[I1INStry0(...)]
//
(* ****** ****** *)
//
|I1INSl0azy
(dknd, icmp) =>
(
nindstrnfpr
(filr, nind, "def ");
i1tnmpy1(filr, itnm);strnfpr(filr, "(): ## { // l0azy\n");
(
envx2js_incnind
( env0,2(*++*) );f0_i1cmpret(env0, icmp);
(
envx2js_decnind
( env0,2(*--*) );nindstrnfpr(filr, nind, "## } // end(l0azy)\n")))
)
//
|I1INSl1azy
(dknd
,icmp, cmps) =>
(
nindstrnfpr
(filr, nind, "def ");
i1tnmpy1(filr, itnm);strnfpr(filr, "(tlaz): ## { // l1azy\n");
(
envx2js_incnind
( env0,2(*++*) );f0_i1cmpret(env0, icmp);
(
envx2js_decnind
( env0,2(*--*) );nindstrnfpr(filr, nind, "## } // end(l1azy)\n")))
)
//
(* ****** ****** *)
(* ****** ****** *)
//
| _(* otherwise *) =>
(
nindfpr(filr, nind);
i1tnmpy1(filr, itnm);strnfpr(filr, " = ");i1inspy1(filr, iins);fprintln(filr))
//
(* ****** ****** *)
(* ****** ****** *)
//
end(*let*)//end-of-[I1LETnew1(itnm,iins)]
//
(* ****** ****** *)
(* ****** ****** *)
//
end(*let*)//end-of-[py1emit_i1let(env0,ilet)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
py1emit_i1letlst
  (env0, ilts) =
(
  list_py1emit_fnp(env0, ilts, py1emit_i1let))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
py1emit_fjarglst
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
<i1tnm>(itnm) = i1tnmpy1(filr, itnm)
//
val () =
case+ ibnd of
|
I1BNDcons(itnm, i0p1, dvvs) =>
(
nindfpr(filr,nind);prints(itnm, " = ", "arg", i0, "\n"))
}
)
//
}(*where*)//end-of-[py1emit_fjarglst(env0,fjas)]
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2py_srcgen1_DATS_py1emit_dynexp.dats] *)
(***********************************************************************)
