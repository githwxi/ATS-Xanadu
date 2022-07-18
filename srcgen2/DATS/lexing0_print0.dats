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
T_IDALP(rep) =>
print("T_IDALP(", rep, ")")
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
T_STRN1_clsd(rep, len) =>
print("T_STRN1_clsd(", rep, ";", len, ")")
|
T_STRN2_ncls(rep, len) =>
print("T_STRN2_ncls(", rep, ";", len, ")")
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
(*
HX-2022-06-15:
The rest of for secondary tokens that are
generated from the primary ones (that are
obtained directly from lexing some source)
*)
//
|
T_AT0() =>
print("T_AT0()")
|
T_BAR() =>
print("T_BAR()")
|
T_CLN() =>
print("T_CLN()")
|
T_DOT() =>
print("T_DOT()")
//
|
T_EQ0() =>
print("T_EQ0()")
|
T_LT0() =>
print("T_LT0()")
|
T_GT0() =>
print("T_GT0()")
//
|
T_DLR() =>
print("T_DLR()")
|
T_SRP() =>
print("T_SRP()")
//
|
T_EQLT() =>
print("T_EQLT()")
|
T_EQGT() =>
print("T_EQGT()")
//
|
T_LTGT() =>
print("T_LTGT()")
|
T_GTLT() =>
print("T_GTLT()")
|
T_MSLT() =>
print("T_MSLT()")
|
T_MSLT() =>
print("T_MSGT()")
//
|
T_GTDOT() =>
print("T_GTDOT()")
//
|
T_COMMA() =>
print("T_COMMA()")
|
T_SMCLN() =>
print("T_SMCLN()")
//
|
T_BSLSH() =>
print("T_BSLSH()")
//
|
T_LPAREN() =>
print("T_LPAREN()")
|
T_RPAREN() =>
print("T_RPAREN()")
//
|
T_LBRCKT() =>
print("T_LBRCKT()")
|
T_RBRCKT() =>
print("T_RBRCKT()")
//
|
T_LBRACE() =>
print("T_LBRACE()")
|
T_RBRACE() =>
print("T_RBRACE()")
//
|
T_EXISTS(knd) =>
print("T_EXISTS(", knd, ")")
//
|
T_TRCD10(knd) =>
print("T_TRCD10(", knd, ")")
|
T_TRCD20(knd) =>
print("T_TRCD20(", knd, ")")
//
|
T_AS0() =>
print("T_AS0(", ")")
|
T_OF0() =>
print("T_OF0(", ")")
//
|
T_OP1() =>
print("T_OP1(", ")")
|
T_OP2(tok) =>
print("T_OP2(", tok, ")")
|
T_OP3(tok) =>
print("T_OP3(", tok, ")")
//
|
T_IN0() =>
print("T_IN0(", ")")
//
|
T_AND() =>
print("T_AND(", ")")
|
T_END() =>
print("T_END(", ")")
//
|
T_IF0() =>
print("T_IF0(", ")")
|
T_SIF() =>
print("T_SIF(", ")")
//
|
T_THEN() =>
print("T_THEN(", ")")
|
T_ELSE() =>
print("T_ELSE(", ")")
//
|
T_WHEN() =>
print("T_WHEN(", ")")
|
T_WITH() =>
print("T_WITH(", ")")
//
|
T_SCAS() =>
print("T_SCAS(", ")")
|
T_CASE(csk) =>
print("T_CASE(", csk, ")")
//
|
T_ENDST() =>
print("T_ENDST(", ")")
//
|
T_LAM(knd) =>
print("T_LAM(", knd, ")")
|
T_FIX(knd) =>
print("T_FIX(", knd, ")")
//
|
T_LET() =>
print("T_LET(", ")")
|
T_TRY() =>
print("T_TRY(", ")")
|
T_WHERE() =>
print("T_WHERE(", ")")
//
|
T_LOCAL() =>
print("T_LOCAL(", ")")
//
|
T_ENDIF0() =>
print("T_ENDIF0(", ")")
|
T_ENDCAS() =>
print("T_ENDCAS(", ")")
|
T_ENDLAM() =>
print("T_ENDLAM(", ")")
|
T_ENDFIX() =>
print("T_ENDFIX(", ")")
|
T_ENDLET() =>
print("T_ENDLET(", ")")
|
T_ENDWHR() =>
print("T_ENDWHR(", ")")
|
T_ENDLOC() =>
print("T_ENDLOC(", ")")
|
T_ENDTRY() =>
print("T_ENDTRY(", ")")
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
//
|
T_IMPLMNT(knd) =>
print("T_IMPLMNT(", knd, ")")
//
|
T_STACST0() =>
print("T_STACST0(", ")")
//
|
T_ABSSORT() =>
print("T_ABSSORT(", ")")
|
T_SORTDEF() =>
print("T_SORTDEF(", ")")
|
T_SEXPDEF(knd) =>
print("T_SEXPDEF(", knd, ")")
//
|
T_ABSIMPL() =>
print("T_ABSIMPL(", ")")
|
T_ABSOPEN() =>
print("T_ABSOPEN(", ")")
|
T_ABSTYPE(knd) =>
print("T_ABSTYPE(", knd, ")")
//
|
T_DATASORT() =>
print("T_DATASORT(", ")")
//
|
T_EXCPTCON() =>
print("T_EXCPTCON(", ")")
//
|
T_DATATYPE(knd) =>
print("T_DATATYPE(", knd, ")")
|
T_WITHTYPE(knd) =>
print("T_WITHTYPE(", knd, ")")
//
|
T_SRP_THEN() =>
print("T_SRP_THEN(", ")")
|
T_SRP_ELSE() =>
print("T_SRP_ELSE(", ")")
|
T_SRP_ENDIF() =>
print("T_SRP_ENDIF(", ")")
|
T_SRP_IFDEC(knd) =>
print("T_SRP_IFDEC(", knd, ")")
|
T_SRP_ELSIF(knd) =>
print("T_SRP_ELSIF(", knd, ")")
//
|
T_SRP_NONFIX() =>
print("T_SRP_NONFIX(", ")")
|
T_SRP_FIXITY(knd) =>
print("T_SRP_FIXITY(", knd, ")")
//
|
T_SRP_STATIC() =>
print("T_SRP_STATIC(", ")")
|
T_SRP_EXTERN() =>
print("T_SRP_EXTERN(", ")")
//
|
T_SRP_DEFINE() =>
print("T_SRP_DEFINE(", ")")
|
T_SRP_MACDEF() =>
print("T_SRP_MACDEF(", ")")
//
|
T_SRP_SYMLOAD() =>
print("T_SRP_SYMLOAD(", ")")
//
|
T_SRP_STALOAD() =>
print("T_SRP_STALOAD(", ")")
|
T_SRP_DYNINIT() =>
print("T_SRP_DYNINIT(", ")")
|
T_SRP_INCLUDE() =>
print("T_SRP_INCLUDE(", ")")
(*
|
T_SRP_INPASTE() =>
print("T_SRP_INPASTE(", ")")
*)
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
