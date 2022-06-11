(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
//
(*
Author: Hongwei Xi
Start Time: June 07th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
//
#implfun
//<>(*tmp*)
tnode_fprint
  (out, tnd) =
(
case+ tnd of
//
|
T_EOF() => print("T_EOF")
|
T_ERR() => print("T_ERR")
//
|
T_EOL() => print("T_EOL")
//
|
T_BLANK(rep) =>
print("T_BLANK(", rep, ")")
|
T_CLNLT(rep) =>
print("T_CLNLT(", rep, ")")
|
T_DOTLT(rep) =>
print("T_DOTLT(", rep, ")")
//
|
T_SPCHR(rep) =>
print("T_SPCHR(", rep, ")")
//
|
T_IDENT(rep) =>
print("T_IDENT(", rep, ")")
|
T_IDALN(rep) =>
print("T_IDALN(", rep, ")")
|
T_IDSYM(rep) =>
print("T_IDSYM(", rep, ")")
//
|
T_IDDLR(rep) =>
print("T_IDDLR(", rep, ")")
|
T_IDSRP(rep) =>
print("T_IDSRP(", rep, ")")
//
|
T_IDQUA(rep) =>
print("T_IDQUA(", rep, ")")
//
|
T_INT01(rep) =>
print("T_INT01(", rep, ")")
|
T_INT02(bas, rep) =>
print("T_INT02(", bas, ";", rep, ")")
|
T_INT03(bas, rep, sfx) =>
print("T_INT03(", bas, ";", rep, ";", sfx, ")")
//
|
T_FLT01(rep) =>
print("T_FLT01(", rep, ")")
|
T_FLT02(bas, rep) =>
print("T_FLT02(", bas, ";", rep, ")")
|
T_FLT03(bas, rep, sfx) =>
print("T_FLT03(", bas, ";", rep, ";", sfx, ")")
//
//
|
T_CHAR1_nil0(rep) =>
print("T_CHAR1_nil0(", rep, ")")
|
T_CHAR2_char(rep) =>
print("T_CHAR2_char(", rep, ")")
|
T_CHAR3_blsh(rep) =>
print("T_CHAR3_blsh(", rep, ")")
//
|
T_STRN1_clsd(rep) =>
print("T_STRN1_clsd(", rep, ")")
|
T_STRN2_ncls(rep) =>
print("T_STRN2_ncls(", rep, ")")
//
|
T_VAL(vlk) =>
print("T_VAL(", vlk, ")")
|
T_VAR(vlk) =>
print("T_VAR(", vlk, ")")
|
T_FUN(fnk) =>
print("T_FUN(", fnk, ")")
|
T_CASE(csk) =>
print("T_CASE(", csk, ")")
//
|
T_CMNT1_line(ag1, ag2) =>
print("T_CMNT1_line(", ag1, ";", ag2, ")")
|
T_CMNT2_rest(ag1, ag2) =>
print("T_CMNT2_rest(", ag1, ";", ag2, ")")
|
T_CMNT3_ccbl(lvl, rep) =>
print("T_CMNT3_ccbl(", lvl, ";", rep, ")")
|
T_CMNT4_mlbl(lvl, rep) =>
print("T_CMNT4_mlbl(", lvl, ";", rep, ")")
//
) where
{
  #impltmp g_print$out<>() = out
}(*where*)//end-of(tnode_fprint)
//
(* ****** ****** *)
//
#implfun
//<>(*tmp*)
token_fprint
  (out, tok) =
(
  tnode_fprint(out, tok.node())
)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_lexing0_print0.dats] *)
