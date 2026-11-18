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
Tue Nov 10 01:01:20 AM EST 2026
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
#staload "./../SATS/xats2cc.sats"
//
#staload "./../SATS/cc0emit.sats"
#staload "./../SATS/cc1emit.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with i1val_lctn$get
#symload dcst with t1imp_dcst$get
(* ****** ****** *)
(* ****** ****** *)
//
#symload
sint_fprint
with gint_fprint$sint
//
fun
sintfpr
(filr:FILR
,sint:sint):void =
(
sint_fprint(sint, filr))
//
fun
strnfpr
(filr:FILR
,strn:strn):void =
(
strn_fprint(strn, filr))
//
(* ****** ****** *)
//
fun
endlnfpr
(filr: FILR): void =
(
strn_fprint("\n", filr))//endfun
fun
smclnfpr
(filr: FILR): void =
(
strn_fprint(";\n", filr))//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
xsymcc1
( filr: FILR
, xsym: symbl): void =
symbl_fprint(xsym, filr)
*)
fun
xsymcc1
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
end(*let*)//endof[xsymcc1(filr,xsym)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xtrcdcc1
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
end(*let*)//end-of-[xtrcdcc1(filr,tknd)]
//
(* ****** ****** *)
//
#implfun
labelcc1
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
}(*where*)//end-of-[labelcc1(filr,lab0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d2concc1
(filr, dcon) =
let
//
val
name = dcon.name((*0*))
//
in//let
(
xsymcc1
(filr, name);
strnfpr(filr, "_");
fprint_loctn_as_stamp
(filr, dcon.lctn((*void*))))
end(*let*)//endof[d2concc1(filr,dcon)]
//
(* ****** ****** *)
//
#implfun
d2cstcc1
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
xsymcc1
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
_(* else *) => xsymcc1(filr, name))
end(*let*)//endof[f0_some(dcst,dexp)]
//
}(*where*)
end(*let*)//endof[d2cstcc1(filr,dcst)]
//
(* ****** ****** *)
//
#implfun
d2varcc1
(filr, dvar) =
let
//
val name = dvar.name((*0*))
//
in//let
(
xsymcc1
(filr, name);
strnfpr(filr, "_");
fprint_loctn_as_stamp
(filr, dvar.lctn((*void*))))
end(*let*)//endof[d2varcc1(filr,dvar)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1envcc1
(filr, ienv) =
(
prints
("env", enum+1)) where
{
//
#impltmp g_print$out<>() = filr
//
val enum = i1env_enum$get(ienv)
//
}(*where*)//endof[i1envcc1(filr,ienv)]
//
(* ****** ****** *)
//
#implfun
i1tnmcc1
(filr, itnm) =
(
prints
("ccx", "tnm", stmp)) where
{
//
#impltmp g_print$out<>() = filr
//
val stmp = i1tnm_stmp$get(itnm)
//
}(*where*)//endof[i1tnmcc1(filr,itnm)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0intcc1
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
}(*where*)//end-of-[i0intcc1(filr,tint)]
//
(* ****** ****** *)
//
#implfun
i0btfcc1
(filr, btf0) =
(
if
(btf0 = TRUE_symbl)
then print("XATSBOOL(true)")
else print("XATSBOOL(false)")
) where
{
#impltmp g_print$out<>() = filr
}(*where*)//end-of-[i0btfcc1(filr,btf0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1valcc1
(filr, ival) =
let
//
(*
val () =
prerrsln
("i1valcc1: ival = ", ival)
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
( tint ) => i0intcc1(filr,tint)
(* ****** ****** *)
|I1Vbtf
( btf0 ) => i0btfcc1(filr,btf0)
(* ****** ****** *)
|I1Vchr
( tchr ) => i0chrcc1(filr,tchr)
(* ****** ****** *)
|I1Vflt
( tflt ) => i0fltcc1(filr,tflt)
(* ****** ****** *)
|I1Vstr
( tstr ) => i0strcc1(filr,tstr)
(* ****** ****** *)
(* ****** ****** *)
//
|I1Vi00
( int0 ) => i0i00cc1(filr,int0)
|I1Vb00
( btf0 ) => i0b00cc1(filr,btf0)
|I1Vc00
( chr0 ) => i0c00cc1(filr,chr0)
|I1Vf00
( flt0 ) => i0f00cc1(filr,flt0)
|I1Vs00
( str0 ) => i0s00cc1(filr,str0)
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1Vtop
( sym0 ) => print( "XATSTOP0" )
//
|I1Venv
( ienv ) => i1envcc1(filr,ienv)
//
(* ****** ****** *)
(* ****** ****** *)
|I1Vtnm
( itnm ) => i1tnmcc1(filr,itnm)
(* ****** ****** *)
|I1Vcon
( dcon ) => d2concc1(filr,dcon)
(* ****** ****** *)
|I1Vcst
( dcst ) => d2cstcc1(filr,dcst)
(* ****** ****** *)
(*
|I1Vvar
( dvar ) => d2varcc1(filr,dvar)
*)
(* ****** ****** *)
(* ****** ****** *)
//
|I1Vtimp
(i0f0, timp) =>
let
//
val loc0 = ival.lctn()
val dcst = timp.dcst()
//
in//let
//
d2cstcc1
(filr, dcst);
strnfpr(filr, "_");
fprint_lctn1_as_stamp(filr,loc0)
//
end(*let*)//end-of-[I1Vtimp(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1Vaddr
(   i1v1   ) =>
(
  prints("XATSADDR(", i1v1, ")") )
//
|I1Vaexp
(   i0e1   ) =>
(
  prints("XATSAEXP(", i0e1, ")") )
//
(* ****** ****** *)
(* ****** ****** *)
//
|I1Vp0rj
(itup, pind) =>
(
prints
("XATSP0RJ(",itup,"[",pind,"]", ")"))
//
(* ****** ****** *)
//
|I1Vp1cn
(ipat
,icon, pind) =>
(
print("XATSP1CN(");
prints(
ipat, ", ", icon, "[",pind,"+1]", ")")
) where
{
#impltmp
g_print<i0pat>(x0) = i0pcncc1(filr, x0)
}
//
(* ****** ****** *)
//
|I1Vp1rj
(trcd
,itup, pind) =>
(
print("XATSP1RJ(");
prints(
trcd, ", ", itup, "[", pind, "]", ")")
) where
{
#impltmp
g_print<token>(x0) = xtrcdcc1(filr, x0)
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
g_print<label>(x0) = labelcc1(filr, x0)
}
//
|I1Vlpft
(plab, itup) =>
( prints
  ("XATSLPFT(", plab, ", ", itup, ")")
) where
{
#impltmp
g_print<label>(x0) = labelcc1(filr, x0)
}
//
|I1Vlpbx
(plab, itup) =>
( prints
  ("XATSLPBX(", plab, ", ", itup, ")")
) where
{
#impltmp
g_print<label>(x0) = labelcc1(filr, x0)
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
  g_print<i1val>(x0) = i1valcc1(filr, x0)
//
}(*where*)//end-of-[i1valcc1( filr,ival )]
//
(* ****** ****** *)
//
#implfun
l1i1vcc1
(filr, liv0) =
let
val+
I1LAB(lab1, i1v2) = liv0
in//let
(
prints(lab1, ": ", i1v2)) where
{
#impltmp
g_print<label>(x0) = labelcc1(filr, x0)
#impltmp
g_print<i1val>(x0) = i1valcc1(filr, x0)
}
//
end(*end*)//end-of-[l1i1vcc1( filr,ival )]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
fjas1cc1
(filr
,nind, fjas) =
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
list_nil
( (*void*) ) =>
(
  loop1(i0, fjas))
|
list_cons
(i1b1, i1bs) =>
( if
  (i0 >= 2)
  then print(",\n")
; f0_i0ibnd(i0, i1b1)
; loop3(i0+1, i1bs, fjas))
)
//
and
f0_i0ibnd
(i0: sint
,ibnd: i1bnd): void =
let
//
val ityp =
i1bnd_ityp$get(ibnd)
//
in//let
//
nindfpr(filr,nind);
i0typcc0(filr,ityp);endlnfpr(filr)
;nindfpr(filr,nind)
;strnfpr(filr,"arg");sintfpr(filr,i0)
//
end(*let*)//end-of-[f0_i1bnd(i0,ibnd)]
//
in//let
//
nindfpr(filr, nind);
print("(\n");loop1(1(*i0*),fjas);print(")")
//
end(*let*)//end-of-[fjas1cc1(filr,nind,fjas)]
//
(* ****** ****** *)
//
#implfun
fjas2cc1
(filr
,nind
,fjas, i0ws) =
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
|list_nil
((*void*)) =>
( if
  (i0 >= 2)
  then print(",\n")
; loop4(1(*i0*), i0ws))
|list_cons
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
list_nil
( (*void*) ) =>
(
  loop1(i0, fjas))
|
list_cons
(i1b1, i1bs) =>
( if
  (i0 >= 2)
  then print(",\n")
; f0_i0ibnd(i0, i1b1)
; loop3(i0+1, i1bs, fjas))
)
//
and
loop4
(
i0: sint,
i0ws: i0varlst): void =
(
case+ i0ws of
|list_nil
( (*void*) ) => ()
|list_cons
(i0w1, i0ws) =>
( if
  (i0 >= 2)
  then print(",\n")
; f0_i0ivar(i0, i0w1)
; loop4(i0+1, i0ws(*envs*)))
)
//
and
f0_i0ibnd
(i0: sint
,ibnd: i1bnd): void =
let
//
val ityp =
i1bnd_ityp$get(ibnd)
//
in//let
//
nindfpr(filr,nind);
i0typcc0(filr,ityp);endlnfpr(filr)
;nindfpr(filr,nind)
;strnfpr(filr,"arg");sintfpr(filr,i0)
//
end(*let*)//end-of-[f0_i1bnd(i0,ibnd)]
//
and
f0_i0ivar
(i0: sint
,ivar: i0var): void =
let
//
val ityp =
i0var_ityp$get(ivar)
//
in//let
//
nindfpr(filr,nind);
i0typcc0(filr,ityp);endlnfpr(filr)
;nindfpr(filr,nind)
;strnfpr(filr,"env");sintfpr(filr,i0)
//
end(*let*)//end-of-[f0_i0var(i0,ivar)]
//
in//
//
nindfpr(filr, nind);
print("(\n");loop1(1(*i0*),fjas);print(")")
//
end(*let*)//end-of-[fjas2cc1(filr,nind,fjas,i0ws)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3-XANADU/srcgen2/xats2cc/srcgen1/DATS/cc1emit_utils0.dats] *)
(***********************************************************************)
(***********************************************************************)
