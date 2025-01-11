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
#include
"./../../..\
/HATS/xatsopt_dats.hats"
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
#implfun
i1tnmpy1
( filr,itnm ) =
(
prints("pytnm", stmp)) where
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
prints("XATSCHAR(", rep, ")")
|T_CHAR3_blsh(rep) =>
prints("XATSCHAR(", rep, ")")
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
strn_fprint(filr, "\"")
(*
if
(0 = i0)
then
strn_fprint(filr, "\"")
else
if
(i0+1 = len2)
then
strn_fprint(filr, "\"")
else
strn_fprint(filr, "\\\"")
*)
//
| '\n' => strn_fprint(filr, "\\n")
| '\t' => strn_fprint(filr, "\\t")
| '\r' => strn_fprint(filr, "\\r")
//
(*
| '\a' => strn_fprint(filr, "\\a")
| '\g' => strn_fprint(filr, "\\g")
*)
//
| '\b' => strn_fprint(filr, "\\b")
| '\f' => strn_fprint(filr, "\\f")
| '\v' => strn_fprint(filr, "\\v")
//
| _(*else*) => char_fprint(filr, ch)
)
}
//
}(*where*)//end-of-[i0strpy1(filr,tstr)]
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2py_srcgen1_DATS_py1emit_utils0.dats] *)
(***********************************************************************)
