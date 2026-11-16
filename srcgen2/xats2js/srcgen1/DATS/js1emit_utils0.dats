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
Wed 11 Sep 2024 01:48:44 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
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
(* ****** ****** *)
//
#staload // D2E =
"./../../../SATS/dynexp2.sats"
//
(* ****** ****** *)
//
#staload // GLO =
"./../../../SATS/xglobal.sats"
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
(* ****** ****** *)
//
#staload
_(*DATS*)="./../DATS/js1emit.dats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload lctn with token_get_lctn
#symload node with token_get_node
//
(* ****** ****** *)
//
#symload lctn with d2con_get_lctn
#symload lctn with d2cst_get_lctn
#symload lctn with d2var_get_lctn
//
#symload name with d2con_get_name
#symload name with d2cst_get_name
#symload name with d2var_get_name
//
(* ****** ****** *)
//
#symload lctn with d2exp_get_lctn
#symload node with d2exp_get_node
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
xsymjs1
( filr: FILR
, xsym: symbl): void =
symbl_fprint(xsym, filr)
*)
fun
xsymjs1
( filr: FILR
, xsym: symbl): void =
let
(
  strn_foritm(name)
) where
{
//
val
name =
symbl_get_name(xsym)
//
#impltmp
foritm$work<char>(c0) =
let
val c0 =
(
case+ c0 of
|'\'' => '$'| _ => c0)
in//let
(
  char_fprint(c0, filr)) end
}(*where*)
end(*let*)//endof[xsymjs1(filr,xsym)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xtrcdjs1
(filr, tknd) =
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
end(*let*)//end-of-[xtrcdjs1(filr,tknd)]
//
(* ****** ****** *)
//
#implfun
labeljs1
(filr, lab0) =
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
#impltmp g_print$out<>((*0*)) = filr
//
}(*where*)//end-of-[labeljs1(filr,lab0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d2conjs1
(filr, dcon) =
(*
d2confpr(filr, dcon)
*)
let
//
val
name = dcon.name((*0*))
//
in//let
(
xsymjs1
(filr, name);
strnfpr(filr, "_");
fprint_loctn_as_stamp
(filr, dcon.lctn((*void*))))
end(*let*)//endof[d2conjs1(filr,dcon)]
//
(* ****** ****** *)
//
#implfun
d2cstjs1
(filr, dcst) =
let
//
val stmp =
d2cst_get_stmp(dcst)
val xopt =
the_d2cstmap_xnmfind(stmp)
//
in//let
(
case+
xopt of
| ~
optn_vt_nil
 ( (*0*) ) => f0_none(dcst)
| ~
optn_vt_cons
 (  xnam  ) =>
(
case+ xnam of
|X2NAMnone
 ( (*0*) ) => f0_none(dcst)
|X2NAMsome
 (  dexp  ) => f0_some(dcst, dexp)
)
) where
{
//
fun
f0_none
(dcst: d2cst): void =
let
val lctn = dcst.lctn((*0*))
val name = dcst.name((*0*))
//
in//let
(
xsymjs1
(filr, name);
strnfpr(filr, "_");
fprint_loctn_as_stamp(filr,lctn))
end(*let*)//end-of-[f0_none(dcst)]
//
fun
f0_some
(dcst: d2cst
,dexp: d2exp): void =
let
//
val name = dcst.name((*0*))
//
val-
D2Eextnam
(tknd, gnam) = dexp.node((*0*))
//
in//let
(
case+ gnam of
|
_(* else *) => xsymjs1(filr, name))
end(*let*)//endof[f0_some(dcst,dexp)]
//
}(*where*)
end(*let*)//endof[d2cstjs1(filr,dcst)]
//
(* ****** ****** *)
//
#implfun
d2varjs1
(filr, dvar) =
(*
d2varfpr(filr, dvar)
*)
let
//
val name = dvar.name((*0*))
//
in//let
(
xsymjs1
(filr, name);
strnfpr(filr, "_");
fprint_loctn_as_stamp
(filr, dvar.lctn((*void*))))
end(*let*)//endof[d2varjs1(filr,dvar)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1tnmjs1
( filr,itnm ) =
(
prints
("jsx", "tnm", stmp)) where
{
//
#impltmp g_print$out<>() = filr
//
val stmp = i1tnm_stmp$get(itnm)
//
}(*where*)//endof[i1tnmjs1(filr,itnm)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0i00js1
(filr, i00) =
(
prints
("XATSINT0(", i00, ")")
) where
{
#impltmp g_print$out<>() = filr
}(*where*)//end-of-[i0i00js1(filr,i00)]
//
#implfun
i0b00js1
(filr, b00) =
(
prints
("XATSBTF0(", b00, ")")
) where
{
#impltmp g_print$out<>() = filr
}(*where*)//end-of-[i0b00js1(filr,b00)]
//
(* ****** ****** *)
//
#implfun
i0c00js1
(filr, c00) =
(
print(
"XATSCHR0(\"");
f0_char( c00 );print("\")")
) where
{
#impltmp g_print$out<>() = filr
} where
{
fun
f0_char
(ch: char): void =
(
case+ ch of
//
| '\n' => strn_fprint("\\n", filr)
| '\t' => strn_fprint("\\t", filr)
| '\r' => strn_fprint("\\r", filr)
//
(*
| '\a' => strn_fprint("\\a", filr)
| '\g' => strn_fprint("\\g", filr)
*)
//
| '\b' => strn_fprint("\\b", filr)
| '\f' => strn_fprint("\\f", filr)
| '\v' => strn_fprint("\\v", filr)
//
| _(*else*) => char_fprint(ch, filr)
)
}(*where*)//end-of-[i0c00js1(filr,c00)]
//
(* ****** ****** *)
//
#implfun
i0f00js1
(filr, f00) =
(
prints
("XATSFLT0(", f00, ")")
) where
{
#impltmp g_print$out<>() = filr
}(*where*)//end-of-[i0f00js1(filr, f00)]
//
(* ****** ****** *)
//
#implfun
i0s00js1
(filr, s00) =
(
print(
"XATSSTR0(\"");
f0_strn( s00 ); print("\")")
) where
{
//
fun
f0_strn
(cs: strn): void =
let
val () =
  strn_fprint(cs, filr) end//let
//
#impltmp
g_print$out<(*nil*)>((*void*)) = filr
//
}(*where*)//end-of-[i0s00js1(filr,s00)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0intjs1
(filr, tint) =
(
case-
tint.node() of
|T_INT01
(  rep  ) => prints
("XATSINT1(", rep, ")")
|T_INT02
(bas,rep) => prints
("XATSINT2(",bas,",",rep,")")
|T_INT03
(bas
,rep,sfx) => prints
("XATSINT3("
,bas, ",", rep, ",", sfx, ")")
) where
{
#impltmp g_print$out<>() = filr
}(*where*)//end-of-[i0intjs1(filr,tint)]
//
(* ****** ****** *)
//
#implfun
i0btfjs1
(filr, btf0) =
(
if
(btf0 = TRUE_symbl)
then print("XATSBOOL(true)")
else print("XATSBOOL(false)")
) where
{
#impltmp g_print$out<>() = filr
}(*where*)//end-of-[i0btfjs1(filr,btf0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0chrjs1
(filr, tchr) =
(
  i0chrfpr(filr, tchr))
//HX:sharing(i0chrfpr=i1chrjs1=i1chrpy1)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
(*
HX-2026-01-16:
This is reimplemented below
for handling multiline strings
*)
#implfun
i0strjs1
(filr, tstr) =
(
  i0strfpr(filr, tstr))
//HX:sharing(i0strfpr=i1strjs1=i1strpy1)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0fltjs1
(filr, tflt) =
(
//
case-
tflt.node() of
|T_FLT01
(  rep  ) => prints
("XATSFLT1(", rep, ")")
|T_FLT02
(bas,rep) => prints
("XATSFLT2(",bas,",",rep,")")
|T_FLT03
(bas
,rep,sfx) => prints
("XATSFLT3("
,bas, ",", rep, ",", sfx, ")")
) where
{
#impltmp g_print$out<>() = filr
}(*where*)//end-of-[i0fltjs1(filr,tflt)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0strjs1
( filr, tstr) =
let
//
#impltmp
g_print$out
<(*nil*)>((*void*)) = filr
//
in//let
//
case-
tstr.node() of
//
|T_STRN1_clsd
( rep1,len2 ) =>
( print("XATSSTRN(\"");
  f0_strn(rep1, len2-1); print("\")"))
|T_STRN2_ncls
( rep1,len2 ) =>
( print("XATSSTRN(\"");
  f0_strn(rep1, len2-0); print("\")"))
//
end where
{
//
fun
f0_strn
( rep1: strn
, len2: sint): void =
let
//
val n0 = len2
(*
val n0 =
strn_length(rep1)
*)
//
fnx
loop1
(i0: nint): void =
if
(i0 >= n0)
then ((*0*)) else
let
//
  val c0 = rep1[i0]
//
in//let
//
if // if1
(c0 = '\\')
then//then1
(
loop2(i0+1)
) else//if1
(
if // if2
(c0 = '\n')
then//then2
(
strn_fprint
("\\n\\\n", filr); loop1(i0+1)
) else//if2
(
char_fprint(c0, filr); loop1(i0+1)))
end//let//end-of-[loop1(i0)]
//
and
loop2
(i1: nint): void =
if // if
(i1 >= n0)
then//then
(
char_fprint
('\0', filr)) else
let
  val c1 = rep1[i1]
in (*let*)
if // if
(c1 = '\n')
then//then
(
  loop1(i1+1)) else
(
char_fprint('\\', filr); char_fprint(c1, filr); loop1(i1+1))
end//let//end-of-[loop2(i1)]
//
in//let
//
let
(*
HX: skip the first char
*)
val i0 = 1 in loop1(i0) end//let
//
end(*let*)//end-of-(f0_strn(rep))
//
}(* where *)//end-of-[i0strjs1(filr,tstr)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0pcnjs1
(filr, ipat) =
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
end(*let*)//end-of-[i0pcnjs1(filr,ipat)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1valjs1
(filr, ival) =
let
//
(*
val () =
prerrsln
("i1valjs1: ival = ", ival)
*)
//
in//let
//
case+
ival.node() of
(* ****** ****** *)
(* ****** ****** *)
|I1V000
((*0*)) => prints("XATSVOID")
(* ****** ****** *)
(* ****** ****** *)
|I1Vint
( tint ) => i0intjs1(filr,tint)
(* ****** ****** *)
|I1Vbtf
( btf0 ) => i0btfjs1(filr,btf0)
(* ****** ****** *)
|I1Vchr
( tchr ) => i0chrjs1(filr,tchr)
(* ****** ****** *)
|I1Vflt
( tflt ) => i0fltjs1(filr,tflt)
(* ****** ****** *)
|I1Vstr
( tstr ) => i0strjs1(filr,tstr)
(* ****** ****** *)
(* ****** ****** *)
//
|I1Vi00
( int0 ) => i0i00js1(filr,int0)
|I1Vb00
( btf0 ) => i0b00js1(filr,btf0)
|I1Vc00
( chr0 ) => i0c00js1(filr,chr0)
|I1Vf00
( flt0 ) => i0f00js1(filr,flt0)
|I1Vs00
( str0 ) => i0s00js1(filr,str0)
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1Vtop
( sym0 ) => print( "XATSTOP0" )
//
(* ****** ****** *)
(* ****** ****** *)
|I1Vtnm
( itnm ) => i1tnmjs1(filr,itnm)
(* ****** ****** *)
|I1Vcon
( dcon ) => d2conjs1(filr,dcon)
(* ****** ****** *)
|I1Vcst
( dcst ) => d2cstjs1(filr,dcst)
(* ****** ****** *)
|I1Vvar
( dvar ) => d2varjs1(filr,dvar)
(* ****** ****** *)
(* ****** ****** *)
//
|I1Vaddr(i1v1) =>
(
  prints("XATSADDR(", i1v1, ")") )
//
|I1Vaexp(i0e1) =>
(
  prints("XATSAEXP(", i0e1, ")") )
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1Vp0rj
( itup,pind ) =>
(
prints
("XATSP0RJ(",itup,"[",pind,"]", ")"))
//
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
{
#impltmp
g_print<i0pat>(x0) = i0pcnjs1(filr, x0)
}
//
(* ****** ****** *)
//
|I1Vp1rj
( trcd
, itup, pind) =>
(
print("XATSP1RJ(");
prints
(trcd, ", ", itup, "[", pind, "]", ")")
) where
{
#impltmp
g_print<token>(x0) = xtrcdjs1(filr, x0)
}
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1Vlpcn
(plab, itup) =>
( prints
  ("XATSLPCN(", plab, ", ", itup, ")")
) where
{
#impltmp
g_print<label>(x0) = labeljs1(filr, x0)
}
//
|I1Vlpft
(plab, itup) =>
( prints
  ("XATSLPFT(", plab, ", ", itup, ")")
) where
{
#impltmp
g_print<label>(x0) = labeljs1(filr, x0)
}
//
|I1Vlpbx
(plab, itup) =>
( prints
  ("XATSLPBX(", plab, ", ", itup, ")")
) where
{
#impltmp
g_print<label>(x0) = labeljs1(filr, x0)
}
//
(* ****** ****** *)
(* ****** ****** *)
|
_(*otherwise*) => i1val_fprint(ival,filr)
(* ****** ****** *)
(* ****** ****** *)
//
end where
{
//
  #impltmp g_print$out<>() = filr
//
  #impltmp
  g_print<i1val>(x0) = i1valjs1(filr, x0)
//
}(*where*)//end-of-[i1valjs1( filr,ival )]
//
(* ****** ****** *)
//
#implfun
l1i1vjs1
(filr, liv0) =
let
//
val+
I1LAB(lab1, i1v2) = liv0
in//let
//
(
prints(lab1, ": ", i1v2)) where
{
#impltmp
g_print<label>(x0) = labeljs1(filr, x0)
#impltmp
g_print<i1val>(x0) = i1valjs1(filr, x0)
}
//
end(*end*)//end-of-[l1i1vjs1( filr,ival )]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
fjas1js1
(filr, fjas) =
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
) (* end-of-[loop1(i0,fjas)] *)
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
) (* end-of-[loop2(i0,fja1,fjas)] *)
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
) (* end-of-[loop3(i0,i1bs,fjas)] *)
//
in//let
//
print("(");loop1(1(*i0*),fjas);print(")")
//
end(*end*)//end-of-[fjas1js1( filr,ival )]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3-XANADU/srcgen2/xats2js/srcgen1/DATS/js1emit_utils0.dats] *)
(***********************************************************************)
