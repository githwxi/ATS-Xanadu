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
//
#staload LOC = "./location.sats"
  typedef loc_t = $LOC.location
//
#staload LEXBUF = "./lexbuf.sats"
  typedef lexbuf = $LEXBUF.lexbuf
//
(* ****** ****** *)
//
datatype
tnode =
//
  | T_EOF of ()
  | T_ERR of ()
//
  | T_EOL of () // end-of-line
//
  | T_AT of ()
  | T_BANG of ()
//
  | T_BLANK of (string) // blank
//
  | T_IDENT_alp of string // alnum
  | T_IDENT_sym of string // symbol
//
  | T_INT of (int(*base*), string)
  | T_INT of (int(*base*), string(*rep*), uint(*suffix*))
//
  | T_CHAR of (int) // ascii
  | T_STRING of (string) // utf-8 // for text
//
  | T_FLOAT of (int(*base*), string(*rep*))
  | T_FLOAT of (int(*base*), string(*rep*), uint(*suffix*))
//
  | {n:int}
    T_CDATA of (arrayref(char, n), size_t(n)) // binaries
//
  | T_COMMA of () // ,
  | T_SEMICOLON of () // ;
//
  | T_LPAREN of () // (
  | T_RPAREN of () // )
  | T_LBRACE of () // {
  | T_RBRACE of () // }
  | T_LBRACKET of () // [
  | T_RBRACKET of () // ]
//
  | T_SPECHAR of (int) // special char
//
  | T_COMMENT_line of () // line comment
  | T_COMMENT_rest of () // rest-of-file
  | T_COMMENT_block of () // (embeddable) block comment
//
abstbox token_tbox
//
(*
typedef
token =
$rec{
  token_loc= loc_t, token_node= tnode
} (* end of [token] *)
*)
//
typedef token = token_tbox
typedef tokenopt = Option(token)
vtypedef tokenopt_vt = Option_vt(token)
//
(* ****** ****** *)

fun{}
token_make
(loc: loc_t, node: tnode): token
// end of [token_make]

fun{}
token_get_loc(token): loc_t
fun{}
token_get_node(token): tnode
overload .loc with token_get_loc
overload .node with token_get_node

(* ****** ****** *)
//
fun
print_tnode : (tnode) -> void
fun
prerr_tnode : (tnode) -> void
fun
fprint_tnode : (FILEref, tnode) -> void
//
overload print with print_tnode
overload prerr with prerr_tnode
overload fprint with fprint_tnode
//
(* ****** ****** *)
//
fun
print_token : (token) -> void
fun
prerr_token : (token) -> void
fun
fprint_token : (FILEref, token) -> void
//
overload print with print_token
overload prerr with prerr_token
overload fprint with fprint_token
//
(* ****** ****** *)

fun tnode_is_comment(tnode): bool

(* ****** ****** *)
//
// HX:
// Check if a name refers to a special token;
// if the return is not T_EOF(), then it does
//
fun tnode_search(name: string): tnode
//
(* ****** ****** *)
//
fun lexing_tnode(lxbf: &lexbuf >> _): tnode
//
(* ****** ****** *)

(* end of [xats_lexing.sats] *)
