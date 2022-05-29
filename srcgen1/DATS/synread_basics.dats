(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author: Hongwei Xi
// Start Time: September, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/xsymbol.sats"
//
#staload "./../SATS/locinfo.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/lexing0.sats"
#staload "./../SATS/staexp0.sats"
//
#staload "./../SATS/synread.sats"
//
(* ****** ****** *)
//
extern
//
val K_EQ: tkind
and K_LT: tkind
and K_GT: tkind
and K_LTGT: tkind
//
and K_BAR: tkind
and K_CLN: tkind
and K_DOT: tkind
//
and K_SMCLN: tkind
//
and K_EQLT: tkind
and K_EQGT: tkind
//
and K_MSLT: tkind
(*
and K_MSGT: tkind
*)
//
and K_DOTLT: tkind
and K_GTDOT: tkind
//
and K_LPAREN: tkind
and K_RPAREN: tkind
and K_LBRACE: tkind
and K_RBRACE: tkind
and K_LBRACK: tkind
and K_RBRACK: tkind
//
implement K_EQ = K_SYMBOL(EQ_symbol)
//
implement K_LT = K_SYMBOL(LT_symbol)
implement K_GT = K_SYMBOL(GT_symbol)
implement K_LTGT = K_SYMBOL(LTGT_symbol)
//
implement K_BAR = K_SYMBOL(BAR_symbol)
implement K_CLN = K_SYMBOL(CLN_symbol)
implement K_DOT = K_SYMBOL(DOT_symbol)
//
implement K_SMCLN = K_SYMBOL(SMCLN_symbol)
//
implement K_EQLT = K_SYMBOL(EQLT_symbol)
implement K_EQGT = K_SYMBOL(EQGT_symbol)
//
implement K_MSLT = K_SYMBOL(MSLT_symbol)
(*
implement K_MSGT = K_SYMBOL(MSGT_symbol)
*)
//
implement K_DOTLT = K_SYMBOL(DOTLT_symbol)
implement K_GTDOT = K_SYMBOL(GTDOT_symbol)
//
implement K_LPAREN = K_SYMBOL(LPAREN_symbol)
implement K_RPAREN = K_SYMBOL(RPAREN_symbol)
implement K_LBRACK = K_SYMBOL(LBRACK_symbol)
implement K_RBRACK = K_SYMBOL(RBRACK_symbol)
implement K_LBRACE = K_SYMBOL(LBRACE_symbol)
implement K_RBRACE = K_SYMBOL(RBRACE_symbol)
//
(* ****** ****** *)

implement
//{}(*tmp*)
synread_INT1
  (tok) =
(
case+
tok.node() of
| T_INT1 _ => ()
| _(*non-INT1*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_INT1, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(INT1): ", tok);
  end // end of [let]
) (* end of [synread_INT1] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_CHAR
  (tok) =
(
case+
tok.node() of
//
| T_CHAR_nil _ => ()
//
| T_CHAR_char(rep) =>
  if
  (string_last(rep) != '\'')
  then let
    val () =
    synerr_add
    (SYNERRtoken(K_CLOSED_chr, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(CHAR): ", tok);
  end // end of [let] // end of [if]
//
| T_CHAR_slash(rep) =>
  if
  (string_last(rep) != '\'')
  then let
    val () =
    synerr_add
    (SYNERRtoken(K_CLOSED_chr, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(CHAR): ", tok);
  end // end of [let] // end of [if]
//
| _(*non-CHAR*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_CHAR, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(CHAR): ", tok);
  end // end of [let]
) where
{
//
fun
string_last
(cs: string): char =
(
  loop(c0, p0)
) where
{
  val c0 = int2char0(0)
  val p0 = string2ptr(cs)
  fun
  loop
  (c0: char, p0: ptr): char =
  let
    val c1 = $UN.ptr0_get<char>(p0)
  in
    if
    isneqz(c1)
    then loop(c1, ptr_succ<char>(p0)) else c0
  end // end of [let] // end of [loop]
}
//
} (* end of [synread_CHAR] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_STRING
  (tok) =
(
case+
tok.node() of
//
| T_STRING_closed _ =>
    ((*void*))
//
| T_STRING_unclsd _ =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_CLOSED_str, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(STRING): ", tok);
  end // end of [let]
//
| _(*non-STRING*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_STRING, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(STRING): ", tok);
  end // end of [let]
) (* end of [synread_STRING] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_EQ
  (tok) =
(
case+
tok.node() of
| T_EQ() => ()
| _(*non-EQ*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_EQ, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(EQ): ", tok);
  end // end of [let]
) (* end of [synread_EQ] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_LT
  (tok) =
(
case+
tok.node() of
| T_LT() => ()
| _(*non-LT*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_LT, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(LT): ", tok);
  end // end of [let]
) (* end of [synread_LT] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_GT
  (tok) =
(
case+
tok.node() of
| T_GT() => ()
| _(*non-GT*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_GT, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(GT): ", tok);
  end // end of [let]
) (* end of [synread_GT] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_LTGT
  (tok) =
(
case+
tok.node() of
| T_LTGT() => ()
| _(*non-LTGT*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_LTGT, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(LTGT): ", tok);
  end // end of [let]
) (* end of [synread_LTGT] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_LT_GT
(tbeg, tend) =
(
case+
tbeg.node() of
| T_LT() =>
  {
    val () = synread_GT(tend)
  }
| T_LTGT() =>
  {
    val () = synread_LTGT(tbeg)
  }
| _(*non-LT-LTGT*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_LT, tbeg))
  in
    prerrln!
    (tbeg.loc(), ": SYNERR(LT_GT): ", tbeg);
(*
    prerrln!
    (tend.loc(), ": SYNERR(LT_GT): ", tend);
*)
  end // end of [let]
) (* end of [synread_LT_GT] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_BAR
  (tok) =
(
case+
tok.node() of
| T_BAR() => ()
| _(*non-BAR*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_BAR, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(BAR): ", tok);
  end // end of [let]
) (* end of [synread_BAR] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_CLN
  (tok) =
(
case+
tok.node() of
| T_CLN() => ()
| _(*non-CLN*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_CLN, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(CLN): ", tok);
  end // end of [let]
) (* end of [synread_CLN] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_DOT
  (tok) =
(
case+
tok.node() of
| T_DOT() => ()
| _(*non-DOT*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_DOT, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(DOT): ", tok);
  end // end of [let]
) (* end of [synread_DOT] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_SMCLN
  (tok) =
(
case+
tok.node() of
| T_SMCLN() => ()
| _(*non-SMCLN*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_SMCLN, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(SMCLN): ", tok);
  end // end of [let]
) (* end of [synread_SMCLN] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_EQLT
  (tok) =
(
case+
tok.node() of
| T_EQLT() => ()
| _(*non-EQLT*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_EQLT, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(EQLT): ", tok);
  end // end of [let]
) (* end of [synread_EQLT] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_EQGT
  (tok) =
(
case+
tok.node() of
| T_EQGT() => ()
| _(*non-EQGT*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_EQGT, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(EQGT): ", tok);
  end // end of [let]
) (* end of [synread_EQGT] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_MSLT
  (tok) =
(
case+
tok.node() of
| T_MSLT() => ()
| _(*non-MSLT*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_MSLT, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(MSLT): ", tok)
  end // end of [let]
) (* end of [synread_MSLT] *)

(* ****** ****** *)

(*
implement
//{}(*tmp*)
synread_MSGT
  (tok) =
(
case+
tok.node() of
| T_MSGT() => ()
| _(*non-MSGT*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_MSGT, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(MSGT): ", tok)
  end // end of [let]
) (* end of [synread_MSGT] *)
*)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_DOTLT
  (tok) =
(
case+
tok.node() of
| T_DOTLT(_) => ()
| _(*non-DOTLT*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_DOTLT, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(DOTLT): ", tok)
  end // end of [let]
) (* end of [synread_DOTLT] *)

implement
//{}(*tmp*)
synread_GTDOT
  (tok) =
(
case+
tok.node() of
| T_GTDOT( ) => ()
| _(*non-GTDOT*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_GTDOT, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(GTDOT): ", tok)
  end // end of [let]
) (* end of [synread_GTDOT] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_LPAREN
  (tok) =
(
case+
tok.node() of
| T_LPAREN() => ()
| _(*non-LPAREN*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_LPAREN, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(LPAREN): ", tok)
  end // end of [let]
) (* end of [synread_LPAREN] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_RPAREN
  (tok) =
(
case+
tok.node() of
| T_RPAREN() => ()
| _(*non-RPAREN*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_RPAREN, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(RPAREN): ", tok)
  end // end of [let]
) (* end of [synread_RPAREN] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_LBRACE
  (tok) =
(
case+
tok.node() of
| T_LBRACE() => ()
| _(*non-LBRACE*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_LBRACE, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(LBRACE): ", tok)
  end // end of [let]
) (* end of [synread_LBRACE] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_RBRACE
  (tok) =
(
case+
tok.node() of
| T_RBRACE() => ()
| _(*non-RBRACE*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_RBRACE, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(RBRACE): ", tok)
  end // end of [let]
) (* end of [synread_RBRACE] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_LBRACK
  (tok) =
(
case+
tok.node() of
| T_LBRACK() => ()
| _(*non-LBRACK*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_LBRACK, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(LBRACK): ", tok)
  end // end of [let]
) (* end of [synread_LBRACK] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_RBRACK
  (tok) =
(
case+
tok.node() of
| T_RBRACK() => ()
| _(*non-RBRACK*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_RBRACK, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(RBRACK): ", tok)
  end // end of [let]
) (* end of [synread_RBRACK] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_EXISTS
  (tok) =
(
case+
tok.node() of
| T_EXISTS _ => ()
| _(*non-EXISTS*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_EXISTS, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(EXISTS): ", tok)
  end // end of [let]
) (* end of [synread_EXISTS] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_AS
  (tok) =
(
case+
tok.node() of
| T_AS _ => ()
| _(*non-AS*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_AS, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(AS): ", tok)
  end // end of [let]
) (* end of [synread_AS] *)

implement
//{}(*tmp*)
synread_OF
  (tok) =
(
case+
tok.node() of
| T_OF _ => ()
| _(*non-OF*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_OF, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(OF): ", tok)
  end // end of [let]
) (* end of [synread_OF] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_LAM
  (tok) =
(
case+
tok.node() of
| T_LAM _ => ()
| _(*non-LAM*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_LAM, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(LAM): ", tok)
  end // end of [let]
) (* end of [synread_LAM] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_ENDLAM_opt
  (opt) =
(
case+ opt of
| None() => ()
| Some(tok) =>
  (
  case+
  tok.node() of
  | T_END _ => ()
  | T_ENDLAM _ => ()
  | _(*non-ENDLAM*) => let
      val () =
      synerr_add
      (SYNERRtoken(K_ENDLAM, tok))
    in
      prerr(tok.loc());
      prerrln!(": SYNERR(ENDLAM): ", tok)
    end // end of [let]
  )
) (* end of [synread_ENDLAM_opt] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_LET
  (tok) =
(
case+
tok.node() of
| T_LET _ => ()
| _(*non-LET*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_LET(), tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(LET): ", tok)
  end // end of [let]
) (* end of [synread_LET] *)

implement
//{}(*tmp*)
synread_ENDLET
  (tok) =
( case+
  tok.node() of
  | T_END _ => ()
  | T_ENDLET _ => ()
  | _(*non-ENDLET*) => let
      val () =
      synerr_add
      (SYNERRtoken(K_ENDLET, tok))
    in
      prerr(tok.loc());
      prerrln!(": SYNERR(ENDLET): ", tok)
    end // end of [let]
) (* end of [synread_ENDLET] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_TRY
  (tok) =
(
case+
tok.node() of
| T_TRY _ => ()
| _(*non-TRY*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_TRY(), tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(TRY): ", tok)
  end // end of [let]
) (* end of [synread_TRY] *)

implement
//{}(*tmp*)
synread_ENDTRY
  (tok) =
( case+
  tok.node() of
  | T_END _ => ()
  | T_ENDTRY _ => ()
  | _(*non-ENDTRY*) => let
      val () =
      synerr_add
      (SYNERRtoken(K_ENDTRY, tok))
    in
      prerr(tok.loc());
      prerrln!(": SYNERR(ENDTRY): ", tok)
    end // end of [let]
) (* end of [synread_ENDTRY] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_WHERE
  (tok) =
(
case+
tok.node() of
| T_WHERE _ => ()
| _(*non-WHERE*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_WHERE(), tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(WHERE): ", tok)
  end // end of [let]
) (* end of [synread_WHERE] *)

(* ****** ****** *)
//
implement
//{}(*tmp*)
synread_ENDWHERE
  (tok) =
(
case+
tok.node() of
| T_END _ => ()
| T_ENDWHERE _ => ()
| _(*non-ENDWHERE*) => let
    val () =
    synerr_add
    (SYNERRtoken(K_ENDWHERE, tok))
  in
    prerr(tok.loc());
    prerrln!(": SYNERR(ENDWHERE): ", tok)
  end // end of [let]
)
//
implement
//{}(*tmp*)
synread_ENDWHERE_opt
  (opt) =
(
case+ opt of
| None() => ()
| Some(tok) => synread_ENDWHERE(tok)
) (* end of [synread_ENDWHERE_opt] *)
//
(* ****** ****** *)

implement
//{}(*tmp*)
synread_WHEN
  (tok) =
(
case+
tok.node() of
| T_WHEN _ => ()
| _(*non-WHEN*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_WHEN(), tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(WHEN): ", tok)
  end // end of [let]
) (* end of [synread_WHEN] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_WITH
  (tok) =
(
case+
tok.node() of
| T_WITH _ => ()
| _(*non-WITH*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_WITH(), tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(WITH): ", tok)
  end // end of [let]
) (* end of [synread_WITH] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_LOCAL
  (tok) =
(
case+
tok.node() of
| T_LOCAL _ => ()
| _(*non-LOCAL*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_LOCAL(), tok))
  in
    prerr(tok.loc());
    prerrln!(": SYNERR(LOCAL): ", tok)
  end // end of [let]
) (* end of [synread_LOCAL] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_ENDLOCAL
  (tok) =
( case+
  tok.node() of
  | T_END _ => ()
  | T_ENDLOCAL _ => ()
  | _(*non-ENDLOCAL*) => let
      val () =
      synerr_add
      (SYNERRtoken(K_ENDLOCAL, tok))
    in
      prerr(tok.loc());
      prerrln!(": SYNERR(ENDLOCAL): ", tok)
    end // end of [let]
) (* end of [synread_ENDLOCAL] *)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_TRCD1
  (tok) =
(
case+
tok.node() of
| T_TRCD1 _ => ()
| _(* non-TRCD1 *) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_TRCD1, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(TRCD1): ", tok)
  end // end of [let]
)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_TRCD2
  (tok) =
(
case+
tok.node() of
| T_TRCD2 _ => ()
| _(* non-TRCD2 *) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_TRCD2, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(TRCD2): ", tok)
  end // end of [let]
)

(* ****** ****** *)

implement
//{}(*tmp*)
synread_IDENT_qual
  (tok) =
(
case+
tok.node() of
| T_IDENT_qual _ => ()
| _(* non-IDENT_qual *) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(K_QUALID, tok))
  in
    prerr(tok.loc());
    prerrln!(": SYNERR(QUALID): ", tok)
  end // end of [let]
)

(* ****** ****** *)

(*
implement
//{}(*tmp*)
synread_SORTDEF
  (tok) =
(
case+
tok.node() of
| T_SORTDEF() => ()
| _(*non-*SORTDEF*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(T_SORTDEF, tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(SORTDEF): ", tok)
  end // end of [let]
) (* end of [synread_SORTDEF] *)
*)

(* ****** ****** *)

(*
implement
//{}(*tmp*)
synread_SEXPDEF
  (tok) =
(
case+
tok.node() of
| T_SEXPDEF _ => ()
| _(*non-*SEXPDEF*) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(T_SEXPDEF(0), tok))
  in
    prerrln!
    (tok.loc(), ": SYNERR(SEXPDEF): ", tok)
  end // end of [let]
) (* end of [synread_SEXPDEF] *)
*)

(* ****** ****** *)

(* end of [xats_synread_basics.dats] *)
