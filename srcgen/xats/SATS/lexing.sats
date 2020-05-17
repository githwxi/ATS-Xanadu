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
// Start Time: May, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload "./basics.sats"

(* ****** ****** *)
//
(*
#staload SYM = "./symbol.sats"
  typedef symbol = $SYM.symbol
*)
//
#staload LOC = "./locinfo.sats"
  typedef pos_t = $LOC.position
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
  | T_BLANK of (string) // blank
//
  | T_CLNLT of (string) // :<
  | T_DOTLT of (string) // .<
//
  | T_IDENT_alp of string // alnum
  | T_IDENT_sym of string // symbol
//
  | T_IDENT_srp of string // #alnum
  | T_IDENT_dlr of string // $alnum
//
  | T_IDENT_qual of string // $alnum.
//
  | T_INT1 of (string) // base=10
  | T_INT2 of (int(*base*), string(*rep*))
  | T_INT3 of (int(*base*), string(*rep*), int(*suffix*))
//
  | T_FLOAT1 of (string(*rep*)) // base=10
  | T_FLOAT2 of (int(*base*), string(*rep*))
  | T_FLOAT3 of (int(*base*), string(*rep*), int(*suffix*))
//
(*
  | T_CHAR of (int) // ascii
*)
  | T_CHAR_nil of (string) // ''
  | T_CHAR_char of (string) // '?'
  | T_CHAR_slash of (string) // '\...'
//
  | T_STRING_closed of (string) // utf-8 // for text
  | T_STRING_unclsd of (string) // utf-8 // for text
//
(*
  | {n:int}
    T_CDATA of (arrayref(char, n), size_t(n)) // binaries
*)
//
  | T_SPECHAR of (int) // special char
//
  | T_COMMENT_line of
    (string(*init*), string) // line comment
  | T_COMMENT_rest of
    (string(*init*), string) // rest comment
  | T_COMMENT_cblock of (int(*level*), string) // comment of c-style
  | T_COMMENT_mlblock of (int(*level*), string) // comment of ml-style
//
  | T_AT of ()
(*
  | T_BANG of ()
*)
//
  | T_BAR of () // |
  | T_CLN of () // :
  | T_DOT of () // .
//
  | T_EQ of () // =
//
  | T_LT of () // <
  | T_GT of () // >
//
  | T_DLR of () // $
  | T_SRP of () // #
//
  | T_EQLT of () // =<
  | T_EQGT of () // =>
//
  | T_LTGT of () // <>
  | T_GTLT of () // ><
//
  | T_MSLT of () // -<
(*
  | T_MSGT of () // ->
  | T_MSLTGT of () // -<>
*)
//
  | T_GTDOT of () // >.
//
  | T_COMMA of () // ,
  | T_SMCLN of () // ;
//
  | T_BSLASH of () // \
//
  | T_LPAREN of () // (
  | T_RPAREN of () // )
  | T_LBRACE of () // {
  | T_RBRACE of () // }
//
  | T_EXISTS of int
  | T_LBRACK of () // [
  | T_RBRACK of () // ]
//
  | T_TUPLE of (int) // @(/$(
                     // @tup/$tup
                     // @tup_t/$tup_t
                     // @tup_vt/$tup_vt
  | T_RECORD of (int) // @{/${
                      // @rec/$rec
                      // @rec_t/$rec_t
                      // @rec_vt/$rec_vt
//
(*
  | T_STRUCT of (int) // @struct/$struct
*)
//
  | T_AS of () // 'as'
//
  | T_OF of () // 'of'
//
  | T_OP of () // 'op'
  | T_OP_par of () // 'op('
  | T_OP_sym of (string) // 'opid'
//
  | T_IN of () // 'in'
//
  | T_AND of () // 'and'
//
  | T_END of () // 'end'
//
  | T_IF of () // 'if'
  | T_SIF of () // 'sif'
//
  | T_THEN of () // 'then'
  | T_ELSE of () // 'else'
//
  | T_WHEN of () // 'when'
  | T_WITH of () // 'with'
//
  | T_CASE of int
    // case, case+, case-
  | T_SCASE of () // 'scase'
//
  | T_ENDIF of () // 'endif'
  | T_ENDSIF of () // 'endsif'
  | T_ENDCASE of () // 'endcase'
  | T_ENDSCASE of () // 'endscase'
//
  | T_LAM of int
    // 'lam=lam1' and 'lam@=lam0'
  | T_FIX of int
    // 'fix=lam1' and 'fix@=fix0'
//
  | T_LET of () // 'let'
  | T_TRY of () // 'try'
  | T_WHERE of () // 'where'
  | T_LOCAL of () // 'local'
//
  | T_ENDLAM of () // 'endlam'
  | T_ENDLET of () // 'endlet'
  | T_ENDTRY of () // 'endtry'
  | T_ENDWHERE of () // 'endwhere'
  | T_ENDLOCAL of () // 'endlocal'
//
  | T_FUN of (funkind)
    // fn0, fnx, fn1, fun,
    // prfn0, prfn1, prfun, praxi, fcast
  | T_VAL of (valkind)
    // val, val+, val-, prval
//
  | T_VAR of ((*void*))
//
  | T_IMPLMNT of (impkind)
    // implmnt: generic
    // implprf: prval/fun
    // implval/fun/tmp/tmpr: val/fun/tmp/tmpr
//
  | T_ABSSORT of ()
//
  | T_SORTDEF of ()
//
  | T_SEXPDEF of int(*kind*)
//
  | T_ABSTYPE of int(*kind*)
//
  | T_ABSIMPL of ()
  | T_ABSOPEN of ()
//
  | T_DATASORT of ()
//
  | T_EXCPTCON of ()
//
  | T_DATATYPE of int(*kind*)
//
  | T_WITHTYPE of int(*kind*)
//
  | T_SRP_THEN of ()
  | T_SRP_ELSE of ()
  | T_SRP_IFDEC of int(*kind*)
  | T_SRP_ELSIF of int(*kind*)
  | T_SRP_ENDIF of ()
//
  | T_SRP_NONFIX of ()
  | T_SRP_FIXITY of int(*kind*)
//
  | T_SRP_STACST of () // #stacst
//
// #static
  | T_SRP_STATIC of () // locally
// #extern
  | T_SRP_EXTERN of () // globally
//
  | T_SRP_DEFINE of () // #define
  | T_SRP_MACDEF of () // #macdef
//
  | T_SRP_INCLUDE of () // #include
//
  | T_SRP_STALOAD of () // #staload
  | T_SRP_DYNLOAD of () // #dynload
//
  | T_SRP_SYMLOAD of () // #symload
//
abstbox token_tbox = $tup((*void*))
//
(*
typedef
token =
$rec{
  token_loc= loc_t, token_node= tnode
} (* end of [token] *)
*)
//
typedef tnodelst = List0(tnode)
vtypedef tnodelst_vt = List0_vt(tnode)
//
typedef token = token_tbox
//
typedef tokenlst = List0(token)
vtypedef tokenlst_vt = List0_vt(token)
//
typedef tokenopt = Option(token)
vtypedef tokenopt_vt = Option_vt(token)
//
(* ****** ****** *)

val T_IDENT_AT : tnode
val T_IDENT_EQ : tnode
val T_IDENT_LT : tnode
val T_IDENT_GT : tnode
val T_IDENT_EQGT : tnode
val T_IDENT_LTGT : tnode
val T_IDENT_MSGT : tnode
      
(* ****** ****** *)
//
fun//{}
token_make_node
(loc: loc_t, node: tnode): token
// end of [token_make_node]
//
fun//{}
token_get_loc(tok: token): loc_t
fun//{}
token_get_node(tok: token): tnode
//
overload .loc with token_get_loc
overload .node with token_get_node
//
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
//
fun
print2_tnode : (tnode) -> void
fun
prerr2_tnode : (tnode) -> void
fun
fprint2_tnode : (FILEref, tnode) -> void
//
overload print2 with print2_tnode
overload prerr2 with prerr2_tnode
overload fprint2 with fprint2_tnode
//
(* ****** ****** *)
//
fun
char2tnode(c0: int): tnode
//
(* ****** ****** *)
//
fun
tnode_is_AND : tnode -> bool
fun
tnode_is_BAR : tnode -> bool
fun
tnode_is_CLN : tnode -> bool
//
fun
tnode_is_COMMA : tnode -> bool
fun
tnode_is_SMCLN : tnode -> bool
//
fun
tnode_is_BARSMCLN : tnode -> bool
//
(* ****** ****** *)

fun tnode_is_blank(tnode): bool
fun tnode_is_comment(tnode): bool
fun tnode_is_skipped(tnode): bool

(* ****** ****** *)
//
// HX:
// Check if a given name refers to
// a special token; if the return is
// not T_EOF(), then it does!
//
fun
tnode_search(name: string): tnode
//
// HX:
// For the sake of initialization:
//
fun
tnode_insert
  (name: string, node: tnode): void
//
//
(* ****** ****** *)
//
fun
lexing_tnode(lxbf: &lexbuf >> _): tnode
//
(* ****** ****** *)
//
// HX:
// Attaching location info to tnode
//
fun
lexing_locatize_node
(pos: &pos_t >> _, node: tnode): token
fun
lexing_locatize_nodelst
(pos: &pos_t >> _, nodes: tnodelst): tokenlst_vt
//
(* ****** ****** *)
//
fun
string_is_qbeg: (string) -> bool
//
(* ****** ****** *)
//
fun
lexing_preprocess_tokenlst
  (tokens: tokenlst_vt): tokenlst_vt
//
(* ****** ****** *)
//
fun
string_tokenize
  {n:pos}(inptxt: string(n)): tokenlst_vt
//
(* ****** ****** *)
//
fun
fpath_tokenize
  (fpath: string): Option_vt(tokenlst_vt)
//
fun
fileref_tokenize(inpfil: FILEref): tokenlst_vt
//
(* ****** ****** *)

(* end of [xats_lexing.sats] *)
