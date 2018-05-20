(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
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
// Start Time: May, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

#staload "./../SATS/lexing.sats"
#staload "./../SATS/location.sats"

(* ****** ****** *)

local

absimpl
token_tbox = $rec{
token_loc= loc_t, token_node= tnode
} (* token_tbox *)

in (* in-of-local *)

implement
{}(*tmp*)
token_make(loc, node) =
$rec{
  token_loc= loc, token_node= node
} (* end of [token_make] *)

implement
{}(*tmp*)
token_get_loc(tok) = tok.token_loc
implement
{}(*tmp*)
token_get_node(tok) = tok.token_node

end // end of [local]

(* ****** ****** *)
//
implement
print_token
  (tok) = fprint_token(stdout_ref, tok)
implement
prerr_token
  (tok) = fprint_token(stderr_ref, tok)
//
(* ****** ****** *)

implement
fprint_token
  (out, tok) =
(
case+ tok.node() of
//
| T_EOF() => fprint(out, "EOF")
| T_ERR() => fprint(out, "ERR")
//
| T_IDENT_alp(x) =>
  fprint!(out, "IDENT_alp(", x, ")")
| T_IDENT_sym(x) =>
  fprint!(out, "IDENT_sym(", x, ")")
//
| T_INT(rep) =>
  fprint!(out, "INT(", rep, ")")
| T_INT(base, rep, _(*sfx*)) =>
  fprint!(out, "INT(", base, ", ", rep, ")")
//
| T_CHAR(chr) =>
  let
    val chr = int2char0(chr)
  in
    fprint!(out, "CHAR(", chr, ")")
  end
| T_STRING(str) =>
  fprint!(out, "STRING(", str, ")")
//
| T_FLOAT(rep) =>
  fprint!(out, "FLOAT(", rep, ")")
| T_FLOAT(base, rep, _(*sfx*)) =>
  fprint!(out, "FLOAT(", base, ", ", rep, ")")
//
| T_CDATA(cdata, asz) => fprint!(out, "CDATA(...)")
//
| T_COMMA() => fprint(out, "COMMA")
| T_SEMICOLON() => fprint(out, "SEMICOLON")
//
| T_LPAREN() => fprint(out, "LPAREN")
| T_RPAREN() => fprint(out, "RPAREN")
| T_LBRACE() => fprint(out, "LBRACE")
| T_RBRACE() => fprint(out, "RBRACE")
| T_LBRACKET() => fprint(out, "LBRACKET")
| T_RBRACKET() => fprint(out, "RBRACKET")
//
| T_COMMENT_line() => fprint(out, "T_COMMENT_line")
| T_COMMENT_rest() => fprint(out, "T_COMMENT_rest")
| T_COMMENT_block() => fprint(out, "T_COMMENT_block")
//
) (* end of [fprint_token] *)

(* ****** ****** *)

implement
tnode_is_comment
  (node) =
(
  case+ node of
  | T_COMMENT_line() => true
  | T_COMMENT_rest() => true
  | T_COMMENT_block() => true
  | _ (* non-T_COMMENT_... *) => false
)

(* ****** ****** *)

(* end of [xats_lexing_token.dats] *)
