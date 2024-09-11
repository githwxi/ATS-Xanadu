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
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dats.hats"
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
}(*where*)//end-of-[i0intjs1(...)]
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
}(*where*)//end-of-[i0btfjs1(...)]
//
(* ****** ****** *)
//
#implfun
i0chrjs1
(filr, tchr) =
(
//
case-
tchr.node() of
|
T_CHAR1_nil0 _ =>
prints("XATSCNUL(", ")")
|
T_CHAR2_char(rep) =>
prints("XATSCHAR(", rep, ")")
|
T_CHAR3_blsh(rep) =>
prints("XATSCHAR(", rep, ")")
//
) where
{
#impltmp g_print$out<>() = filr
}(*where*)//end-of-[i0chrjs1(...)]
//
(* ****** ****** *)
//
#implfun
i0strjs1
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
|
T_STRN1_clsd
( rep1,len2 ) =>
(
print
("XATSSTRN(");
f0_strn(rep1, len2); print(")"))
|
T_STRN2_ncls
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
//
| '\b' => strn_fprint(filr, "\\b")
| '\f' => strn_fprint(filr, "\\f")
//
| '\g' => strn_fprint(filr, "\\g")
//
| '\v' => strn_fprint(filr, "\\v")
//
| _(*else*) => char_fprint(filr, ch)
)
}
//
}(*where*)//end-of-[i0strjs1(filr,tstr)]
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_js1emit_utils0.dats] *)
(***********************************************************************)
