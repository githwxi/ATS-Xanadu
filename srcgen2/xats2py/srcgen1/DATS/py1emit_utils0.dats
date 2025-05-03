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
Fri Nov 29 04:20:01 PM EST 2024
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
xsympy1
( filr: FILR
, xsym: symbl): void =
let
(
  strn_foritm(name)
) where
{
//
val name =
symbl_get_name(xsym)
//
#impltmp
foritm$work<char>(c0) =
let
val c0 =
(
case+ c0 of
| '$' => '_' | _ => c0)
in
  char_fprint(c0, filr) end
}
end // end of [xsympy1(filr,xsym)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d2conpy1
(filr, dcon) =
(*
d2confpr(filr, dcon)
*)
let
//
val name = dcon.name((*0*))
//
in//let
(
xsympy1
(filr, name);
strnfpr(filr, "_");
fprint_loctn_as_stamp
(filr, dcon.lctn((*void*))))
end(*let*)//end-of-[d2conpy1(env0,dcon)]
//
(* ****** ****** *)
//
#implfun
d2cstpy1
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
xsympy1
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
_(* else *) => xsympy1(filr, name)
end(*let*)//end-of-[f0_some(dcst,dexp)]
//
}(*where*)
end(*let*)//end-of-[d2cstpy1(env0,dcst)]
//
(* ****** ****** *)
//
#implfun
d2varpy1
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
xsympy1
(filr, name);
strnfpr(filr, "_");
fprint_loctn_as_stamp
(filr, dvar.lctn((*void*))))
end(*let*)//end-of-[d2varpy1(env0,dvar)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0i00py1
(filr, i00) =
(
prints
("XATSINT0(", i00, ")")
) where
{
#impltmp g_print$out<>() = filr
}(*where*)//end-of-[i0i00py1(...)]
//
#implfun
i0b00py1
(filr, b00) =
(
prints
("XATSBTF0(", b00, ")")
) where
{
#impltmp g_print$out<>() = filr
}(*where*)//end-of-[i0b00py1(...)]
//
(* ****** ****** *)
//
#implfun
i0c00py1
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
| '\0' => strn_fprint("\\x00", filr)
//
| _(*else*) => char_fprint(ch, filr)
)
}(*where*)//end-of-[i0c00py1(filr,c00)]
//
(* ****** ****** *)
//
#implfun
i0f00py1
(filr, f00) =
(
prints
("XATSFLT0(", f00, ")")
) where
{
#impltmp g_print$out<>() = filr
}(*where*)//end-of-[i0f00py1(filr,f00)]
//
(* ****** ****** *)
//
#implfun
i0s00py1
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
}(*where*)//end-of-[i0s00py1(filr,s00)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0intpy1
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
}(*where*)//end-of-[i0intpy1(...)]
//
(* ****** ****** *)
//
#implfun
i0btfpy1
(filr, btf0) =
(
if
(btf0 = TRUE_symbl)
then print("XATSBOOL(True)")
else print("XATSBOOL(False)")
) where
{
#impltmp g_print$out<>() = filr
}(*where*)//end-of-[i0btfpy1(...)]
//
(* ****** ****** *)
//
#implfun
i0chrpy1
(filr, tchr) =
(
//
case-
tchr.node() of
|T_CHAR1_nil0 _ =>
prints("XATSCNUL(", ")")
|T_CHAR2_char(rep) =>
prints("XATSCHR2(", rep, ")")
|T_CHAR3_blsh(rep) =>
prints("XATSCHR3(", rep, ")")
//
) where
{
#impltmp g_print$out<>() = filr
}(*where*)//end-of-[i0chrpy1(...)]
//
(* ****** ****** *)
//
#implfun
i0fltpy1
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
}(*where*)//end-of-[i0fltpy1(...)]
//
(* ****** ****** *)
//
#implfun
i0strpy1
( filr, tstr) =
let
//
#impltmp
g_print$out<>() = filr
//
in//let
//
case-
tstr.node() of
|T_STRN1_clsd
( rep1,len2 ) =>
(
print
("XATSSTRN(");
f0_strn(rep1, len2); print(")"))
|T_STRN2_ncls
( rep1,len2 ) =>
(
print
("XATSSTRN(\"");
f0_strn(rep1, len2); print("\")"))
//
end where // end-of-[let]
{
//
fun
f0_strn
(rep1: strn
,len2: sint): void =
(
strn_iforitm(rep1)) where
{
#impltmp
iforitm$work
<cgtz>(i0, ch) =
(
case+ ch of
| '"' =>
strn_fprint("\"", filr)
(*
if
(0 = i0)
then
strn_fprint("\"", filr)
else
if
(i0+1 = len2)
then
strn_fprint("\"", filr)
else
strn_fprint("\\\"", filr)
*)
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
}
//
}(*where*)//end-of-[i0strpy1(filr,tstr)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1tnmpy1
( filr,itnm ) =
(
prints
("pyx", "tnm", stmp)) where
{
//
#impltmp g_print$out<>() = filr
//
val stmp = i1tnm_get_stmp(itnm)
//
}(*where*)//end-of-[i1tnmpy1(filr,itnm)]
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2py_srcgen1_DATS_py1emit_utils0.dats] *)
(***********************************************************************)
