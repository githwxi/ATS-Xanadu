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
#staload // S2E =
"./../../../SATS/staexp2.sats"
#staload // T2P =
"./../../../SATS/statyp2.sats"
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
#symload lctn with d2con_get_lctn
#symload lctn with d2cst_get_lctn
#symload lctn with d2var_get_lctn
//
#symload name with d2con_get_name
#symload name with d2cst_get_name
#symload name with d2var_get_name
//
(* ****** ****** *)
#symload lctn with d2exp_get_lctn
#symload node with d2exp_get_node
(* ****** ****** *)
(* ****** ****** *)
//
fun
xsymjs1
( filr: FILR
, xsym: symbl): void =
symbl_fprint(xsym, filr)
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
end(*let*)//end-of-[d2conjs1(env0,dcon)]
//
(* ****** ****** *)
//
#implfun
d2cstjs1
(filr, dcst) =
(*
d2cstfpr(filr, dcst)
*)
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
xsymjs1
(filr, name);
strnfpr(filr, "_");
fprint_loctn_as_stamp(filr, lctn)
end//let//end-of-[f0_none]
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
case+ gnam of
|
_(* else *) => xsymjs1(filr, name)
end(*let*)//end-of-[f0_some(dcst,dexp)]
//
}(*where*)
end(*let*)//end-of-[d2cstjs1(env0,dcst)]
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
end(*let*)//end-of-[d2varjs1(env0,dvar)]
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
}(*where*)//end-of-[i0i00js1(...)]
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
}(*where*)//end-of-[i0b00js1(...)]
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
}(*where*)//end-of-[i0f00js1(filr,f00)]
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
i1tnmjs1
( filr,itnm ) =
(
prints
("jsx", "tnm", stmp)) where
{
//
#impltmp g_print$out<>() = filr
//
val stmp = i1tnm_get_stmp(itnm)
//
}(*where*)//end-of-[i1tnmjs1(filr,itnm)]
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
if // if
(c0 = '\\')
then//then
(
loop2(i0+1)
) else
if // if
(c0 = '\n')
then//then
(
strn_fprint
("\\n\\\n", filr); loop1(i0+1)
) else
(
char_fprint(c0, filr); loop1(i0+1))
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
('\\', filr)) else
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
end//let//end-of-[loop1(i1)]
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
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_js1emit_utils0.dats] *)
(***********************************************************************)
