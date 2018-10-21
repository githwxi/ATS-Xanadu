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
#staload "./../SATS/location.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/lexing.sats"
#staload "./../SATS/staexp0.sats"
//
#staload "./../SATS/synread.sats"
//
(* ****** ****** *)
//
implement
{}(*tmp*)
synerr_add(xerr) = ()
//
(* ****** ****** *)

implement
{}(*tmp*)
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
    (SYNERRtoken(T_INT1(""), tok))
  in
    prerr(tok.loc());
    prerrln!(": synread_INT1: tok = ", tok)
  end // end of [let]
) (* end of [synread_INT1] *)

(* ****** ****** *)

implement
{}(*tmp*)
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
    (SYNERRtoken(T_EQ, tok))
  in
    prerr(tok.loc());
    prerrln!(": synread_EQ: tok = ", tok)
  end // end of [let]
) (* end of [synread_EQ] *)

(* ****** ****** *)

implement
{}(*tmp*)
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
    (SYNERRtoken(T_LT, tok))
  in
    prerr(tok.loc());
    prerrln!(": synread_LT: tok = ", tok)
  end // end of [let]
) (* end of [synread_LT] *)

(* ****** ****** *)

implement
{}(*tmp*)
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
    (SYNERRtoken(T_GT, tok))
  in
    prerr(tok.loc());
    prerrln!(": synread_GT: tok = ", tok)
  end // end of [let]
) (* end of [synread_GT] *)

(* ****** ****** *)

implement
{}(*tmp*)
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
    (SYNERRtoken(T_BAR, tok))
  in
    prerr(tok.loc());
    prerrln!(": synread_BAR: tok = ", tok)
  end // end of [let]
) (* end of [synread_BAR] *)

(* ****** ****** *)

implement
{}(*tmp*)
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
    (SYNERRtoken(T_EQGT, tok))
  in
    prerr(tok.loc());
    prerrln!(": synread_EQGT: tok = ", tok)
  end // end of [let]
) (* end of [synread_EQGT] *)

(* ****** ****** *)

implement
{}(*tmp*)
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
    (SYNERRtoken(T_MSLT, tok))
  in
    prerr(tok.loc());
    prerrln!(": synread_MSLT: tok = ", tok)
  end // end of [let]
) (* end of [synread_MSLT] *)

(* ****** ****** *)

implement
{}(*tmp*)
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
    (SYNERRtoken(T_LPAREN, tok))
  in
    prerr(tok.loc());
    prerrln!(": synread_LPAREN: tok = ", tok)
  end // end of [let]
) (* end of [synread_LPAREN] *)

(* ****** ****** *)

implement
{}(*tmp*)
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
    (SYNERRtoken(T_RPAREN, tok))
  in
    prerr(tok.loc());
    prerrln!(": synread_RPAREN: tok = ", tok)
  end // end of [let]
) (* end of [synread_RPAREN] *)

(* ****** ****** *)

implement
{}(*tmp*)
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
    (SYNERRtoken(T_LBRACE, tok))
  in
    prerr(tok.loc());
    prerrln!(": synread_LBRACE: tok = ", tok)
  end // end of [let]
) (* end of [synread_LBRACE] *)

(* ****** ****** *)

implement
{}(*tmp*)
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
    (SYNERRtoken(T_RBRACE, tok))
  in
    prerr(tok.loc());
    prerrln!(": synread_RBRACE: tok = ", tok)
  end // end of [let]
) (* end of [synread_RBRACE] *)

(* ****** ****** *)

implement
{}(*tmp*)
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
    (SYNERRtoken(T_LBRACK, tok))
  in
    prerr(tok.loc());
    prerrln!(": synread_LBRACK: tok = ", tok)
  end // end of [let]
) (* end of [synread_LBRACK] *)

(* ****** ****** *)

implement
{}(*tmp*)
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
    (SYNERRtoken(T_RBRACK, tok))
  in
    prerr(tok.loc());
    prerrln!(": synread_RBRACK: tok = ", tok)
  end // end of [let]
) (* end of [synread_RBRACK] *)

(* ****** ****** *)

implement
{}(*tmp*)
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
    (SYNERRtoken(T_EXISTS(0), tok))
  in
    prerr(tok.loc());
    prerrln!(": synread_EXISTS: tok = ", tok)
  end // end of [let]
) (* end of [synread_EXISTS] *)

(* ****** ****** *)

implement
{}(*tmp*)
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
    (SYNERRtoken(T_LAM(0), tok))
  in
    prerr(tok.loc());
    prerrln!(": synread_LAM: tok = ", tok)
  end // end of [let]
) (* end of [synread_LAM] *)

(* ****** ****** *)

implement
{}(*tmp*)
synread_ENDLAM
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
      (SYNERRtoken(T_ENDLAM, tok))
    in
      prerr(tok.loc());
      prerrln!(": synread_ENDLAM: tok = ", tok)
    end // end of [let]
  )
) (* end of [synread_ENDLAM] *)

(* ****** ****** *)

implement
{}(*tmp*)
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
    (SYNERRtoken(T_LET(), tok))
  in
    prerr(tok.loc());
    prerrln!(": synread_LET: tok = ", tok)
  end // end of [let]
) (* end of [synread_LET] *)

(* ****** ****** *)

implement
{}(*tmp*)
synread_ENDLET
  (tok) =
( case+
  tok.node() of
  | T_END _ => ()
  | T_ENDLET _ => ()
  | _(*non-ENDLET*) => let
      val () =
      synerr_add
      (SYNERRtoken(T_ENDLET, tok))
    in
      prerr(tok.loc());
      prerrln!(": synread_ENDLET: tok = ", tok)
    end // end of [let]
) (* end of [synread_ENDLET] *)

(* ****** ****** *)

implement
{}(*tmp*)
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
    (SYNERRtoken(T_LOCAL(), tok))
  in
    prerr(tok.loc());
    prerrln!(": synread_LOCAL: tok = ", tok)
  end // end of [let]
) (* end of [synread_LOCAL] *)

(* ****** ****** *)

implement
{}(*tmp*)
synread_ENDLOCAL
  (tok) =
( case+
  tok.node() of
  | T_END _ => ()
  | T_ENDLOCAL _ => ()
  | _(*non-ENDLOCAL*) => let
      val () =
      synerr_add
      (SYNERRtoken(T_ENDLOCAL, tok))
    in
      prerr(tok.loc());
      prerrln!(": synread_ENDLOCAL: tok = ", tok)
    end // end of [let]
) (* end of [synread_ENDLOCAL] *)

(* ****** ****** *)

implement
{}(*tmp*)
synread_TUPLE
  (tok) =
(
case+
tok.node() of
| T_TUPLE _ => ()
| _(* non-TUPLE *) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(T_TUPLE(0), tok))
  in
    prerr(tok.loc());
    prerrln!(": synread_TUPLE: tok = ", tok)
  end // end of [let]
)

(* ****** ****** *)

implement
{}(*tmp*)
synread_RECORD
  (tok) =
(
case+
tok.node() of
| T_RECORD _ => ()
| _(* non-RECORD *) =>
  let
    val () =
    synerr_add
    (SYNERRtoken(T_RECORD(0), tok))
  in
    prerr(tok.loc());
    prerrln!(": synread_RECORD: tok = ", tok)
  end // end of [let]
)

(* ****** ****** *)

implement
{}(*tmp*)
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
    (SYNERRtoken(T_IDENT_qual(""), tok))
  in
    prerr(tok.loc());
    prerrln!(": synread_IDENT_qual: tok = ", tok)
  end // end of [let]
)

(* ****** ****** *)

(*
implement
{}(*tmp*)
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
    prerr(tok.loc());
    prerrln!(": synread_SORTDEF: tok = ", tok)
  end // end of [let]
) (* end of [synread_SORTDEF] *)
*)

(* ****** ****** *)

(*
implement
{}(*tmp*)
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
    prerr(tok.loc());
    prerrln!(": synread_SEXPDEF: tok = ", tok)
  end // end of [let]
) (* end of [synread_SEXPDEF] *)
*)

(* ****** ****** *)

(* end of [xats_synread_basics.dats] *)
