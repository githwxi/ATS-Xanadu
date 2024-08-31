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
prints("T_BLANK(", rep, ")")
|
T_CLNLT(rep) =>
prints("T_CLNLT(", rep, ")")
|
T_DOTLT(rep) =>
prints("T_DOTLT(", rep, ")")
//
|
T_SPCHR(rep) =>
prints("T_SPCHR(", rep, ")")
//
|
T_IDENT(rep) =>
prints("T_IDENT(", rep, ")")
|
T_IDALP(rep) =>
prints("T_IDALP(", rep, ")")
|
T_IDSYM(rep) =>
prints("T_IDSYM(", rep, ")")
//
|
T_IDDLR(rep) =>
prints("T_IDDLR(", rep, ")")
|
T_IDSRP(rep) =>
prints("T_IDSRP(", rep, ")")
//
|
T_IDQUA(rep) =>
prints("T_IDQUA(", rep, ")")
//
|
T_INT01(rep) =>
prints("T_INT01(", rep, ")")
|
T_INT02(bas, rep) =>
prints("T_INT02(", bas, ";", rep, ")")
|
T_INT03(bas, rep, sfx) =>
prints("T_INT03(", bas, ";", rep, ";", sfx, ")")
//
|
T_FLT01(rep) =>
prints("T_FLT01(", rep, ")")
|
T_FLT02(bas, rep) =>
prints("T_FLT02(", bas, ";", rep, ")")
|
T_FLT03(bas, rep, sfx) =>
prints("T_FLT03(", bas, ";", rep, ";", sfx, ")")
//
|
T_CHAR1_nil0(rep) =>
prints("T_CHAR1_nil0(", rep, ")")
|
T_CHAR2_char(rep) =>
prints("T_CHAR2_char(", rep, ")")
|
T_CHAR3_blsh(rep) =>
prints("T_CHAR3_blsh(", rep, ")")
//
|
T_STRN1_clsd(rep, len) =>
prints("T_STRN1_clsd(", rep, ";", len, ")")
|
T_STRN2_ncls(rep, len) =>
prints("T_STRN2_ncls(", rep, ";", len, ")")
//
|
T_CMNT1_line(ag1, ag2) =>
prints("T_CMNT1_line(", ag1, ";", ag2, ")")
|
T_CMNT2_rest(ag1, ag2) =>
prints("T_CMNT2_rest(", ag1, ";", ag2, ")")
|
T_CMNT3_ccbl(lvl, rep) =>
prints("T_CMNT3_ccbl(", lvl, ";", rep, ")")
|
T_CMNT4_mlbl(lvl, rep) =>
prints("T_CMNT4_mlbl(", lvl, ";", rep, ")")
//
(*
HX-2022-06-15:
The rest of for secondary tokens that are
generated from the primary ones (that are
obtained directly from lexing some source)
*)
//
|T_AT0() =>
prints("T_AT0(", ")")
|T_BAR() =>
prints("T_BAR(", ")")
|T_CLN() =>
prints("T_CLN(", ")")
|T_DOT() =>
prints("T_DOT(", ")")
//
|T_EQ0() =>
prints("T_EQ0(", ")")
|T_LT0() =>
prints("T_LT0(", ")")
|T_GT0() =>
prints("T_GT0(", ")")
//
|T_DLR() =>
prints("T_DLR(", ")")
|T_SRP() =>
prints("T_SRP(", ")")
//
|T_EQLT() =>
prints("T_EQLT(", ")")
|T_EQGT() =>
prints("T_EQGT(", ")")
//
|T_LTGT() =>
prints("T_LTGT(", ")")
|T_GTLT() =>
prints("T_GTLT(", ")")
|T_MSLT() =>
prints("T_MSLT(", ")")
|T_MSGT() =>
prints("T_MSGT(", ")")
//
|T_GTDOT() =>
prints("T_GTDOT(", ")")
//
|T_COMMA() =>
prints("T_COMMA(", ")")
|T_SMCLN() =>
prints("T_SMCLN(", ")")
//
|T_BSLSH() =>
prints("T_BSLSH(", ")")
//
|T_LPAREN() =>
(
 prints("T_LPAREN(", ")"))
|T_RPAREN() =>
(
 prints("T_RPAREN(", ")"))
//
|T_LBRCKT() =>
(
 prints("T_LBRCKT(", ")"))
|T_RBRCKT() =>
(
 prints("T_RBRCKT(", ")"))
//
|T_LBRACE() =>
(
 prints("T_LBRACE(", ")"))
|T_RBRACE() =>
(
 prints("T_RBRACE(", ")"))
//
|
T_EXISTS(knd) =>
prints("T_EXISTS(", knd, ")")
//
|
T_TRCD10(knd) =>
prints("T_TRCD10(", knd, ")")
|
T_TRCD20(knd) =>
prints("T_TRCD20(", knd, ")")
//
|
T_AS0() =>
prints("T_AS0(", ")")
|
T_OF0() =>
prints("T_OF0(", ")")
//
|
T_OP1() =>
prints("T_OP1(", ")")
|
T_OP2(tok) =>
prints("T_OP2(", tok, ")")
|
T_OP3(tok) =>
prints("T_OP3(", tok, ")")
//
|
T_IN0() =>
prints("T_IN0(", ")")
//
|
T_AND() =>
prints("T_AND(", ")")
|
T_END() =>
prints("T_END(", ")")
//
|
T_IF0() =>
prints("T_IF0(", ")")
|
T_SIF() =>
prints("T_SIF(", ")")
//
|
T_THEN() =>
prints("T_THEN(", ")")
|
T_ELSE() =>
prints("T_ELSE(", ")")
//
|
T_WHEN() =>
prints("T_WHEN(", ")")
|
T_WITH() =>
prints("T_WITH(", ")")
//
|
T_SCAS() =>
prints("T_SCAS(", ")")
|
T_CASE(csk) =>
prints("T_CASE(", csk, ")")
//
|
T_ENDST() =>
prints("T_ENDST(", ")")
//
|
T_LAM(knd) =>
prints("T_LAM(", knd, ")")
|
T_FIX(knd) =>
prints("T_FIX(", knd, ")")
//
|
T_LET() =>
prints("T_LET(", ")")
|
T_TRY() =>
prints("T_TRY(", ")")
|
T_WHERE() =>
prints("T_WHERE(", ")")
//
|
T_LOCAL() =>
prints("T_LOCAL(", ")")
//
|
T_ENDIF0() =>
prints("T_ENDIF0(", ")")
|
T_ENDCAS() =>
prints("T_ENDCAS(", ")")
|
T_ENDLAM() =>
prints("T_ENDLAM(", ")")
|
T_ENDFIX() =>
prints("T_ENDFIX(", ")")
|
T_ENDLET() =>
prints("T_ENDLET(", ")")
|
T_ENDWHR() =>
prints("T_ENDWHR(", ")")
|
T_ENDLOC() =>
prints("T_ENDLOC(", ")")
|
T_ENDTRY() =>
prints("T_ENDTRY(", ")")
//
|
T_VAL(vlk) =>
prints("T_VAL(", vlk, ")")
|
T_VAR(vlk) =>
prints("T_VAR(", vlk, ")")
|
T_FUN(fnk) =>
prints("T_FUN(", fnk, ")")
//
|
T_IMPLMNT(knd) =>
prints("T_IMPLMNT(", knd, ")")
//
|
T_STACST0() =>
prints("T_STACST0(", ")")
//
|
T_ABSSORT() =>
prints("T_ABSSORT(", ")")
|
T_SORTDEF() =>
prints("T_SORTDEF(", ")")
|
T_SEXPDEF(knd) =>
prints("T_SEXPDEF(", knd, ")")
//
|
T_ABSIMPL() =>
prints("T_ABSIMPL(", ")")
|
T_ABSOPEN() =>
prints("T_ABSOPEN(", ")")
|
T_ABSTYPE(knd) =>
prints("T_ABSTYPE(", knd, ")")
//
|
T_DATASORT() =>
prints("T_DATASORT(", ")")
//
|
T_EXCPTCON() =>
prints("T_EXCPTCON(", ")")
//
|
T_DATATYPE(knd) =>
prints("T_DATATYPE(", knd, ")")
|
T_WITHTYPE(knd) =>
prints("T_WITHTYPE(", knd, ")")
//
|
T_DLR_RAISE() =>
prints("T_DLR_RAISE(", ")")
//
|
T_DLR_EXTNAM() =>
prints("T_DLR_EXTNAM(", ")")
|
T_DLR_EXISTS() =>
prints("T_DLR_EXISTS(", ")")
//
(* ****** ****** *)
|
T_DLR_SYNEXT() =>
prints("T_DLR_SYNEXT(", ")")
//
(* ****** ****** *)
|
T_SRP_THEN() =>
prints("T_SRP_THEN(", ")")
|
T_SRP_ELSE() =>
prints("T_SRP_ELSE(", ")")
|
T_SRP_ENDIF() =>
prints("T_SRP_ENDIF(", ")")
|
T_SRP_IFDEC(knd) =>
prints("T_SRP_IFDEC(", knd, ")")
|
T_SRP_ELSIF(knd) =>
prints("T_SRP_ELSIF(", knd, ")")
//
|
T_SRP_NONFIX() =>
prints("T_SRP_NONFIX(", ")")
|
T_SRP_FIXITY(knd) =>
prints("T_SRP_FIXITY(", knd, ")")
//
|T_SRP_STATIC() =>
prints("T_SRP_STATIC(", ")")
|T_SRP_EXTERN() =>
prints("T_SRP_EXTERN(", ")")
|T_SRP_STAVAL() =>
prints("T_SRP_STAVAL(", ")")
|T_SRP_EXTVAL() =>
prints("T_SRP_EXTVAL(", ")")
//
|
T_SRP_DEFINE() =>
prints("T_SRP_DEFINE(", ")")
|
T_SRP_MACDEF() =>
prints("T_SRP_MACDEF(", ")")
//
|
T_SRP_SYMLOAD() =>
prints("T_SRP_SYMLOAD(", ")")
//
|
T_SRP_INCLUDE() =>
prints("T_SRP_INCLUDE(", ")")
(*
|
T_SRP_INPASTE() =>
prints("T_SRP_INPASTE(", ")")
*)
//
|
T_SRP_STALOAD() =>
prints("T_SRP_STALOAD(", ")")
//
|
T_SRP_EXTCODE() =>
prints("T_SRP_EXTCODE(", ")")
//
(* ****** ****** *)
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

(* end of [ATS3/XATSOPT_srcgen2_DATS_lexing0_print0.dats] *)
