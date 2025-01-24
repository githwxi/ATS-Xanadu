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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
Start Time: May 28th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload
LOC = "./locinfo.sats"
#staload
BUF = "./lexbuf0.sats"
(* ****** ****** *)
#staload "./xbasics.sats"
(* ****** ****** *)
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
#typedef loc_t = $LOC.loc_t
#typedef lcsrc = $LOC.lcsrc
#vwtpdef lxbf1 = $BUF.lxbf1
#vwtpdef lxbf2 = $BUF.lxbf2
(* ****** ****** *)
#abstbox token_tbox // ptr
#typedef token = token_tbox
(* ****** ****** *)
//
datatype tnode =
//
| T_EOF of ((*void*))
| T_ERR of ((*void*))
//
| T_EOL of () // end-of-line
//
| T_BLANK of (strn) // blank
| T_CLNLT of (strn) // ( :< )
| T_DOTLT of (strn) // ( .< )
//
| T_SPCHR of (sint) // special
//
(*
// HX-2020-10-21:
// for internal names
*)
| T_IDENT of (strn) // string
//
| T_IDALP of (strn) // alnuml
| T_IDSYM of (strn) // symbol
//
| T_IDDLR of (strn) // $alnuml
| T_IDSRP of (strn) // #alnuml
//
| T_IDQUA of (strn) // $alnuml.
//
| T_INT01 of (strn(*rep*)) // base=10
| T_INT02 of (sint(*bas*), strn(*rep*))
| T_INT03 of
  (sint(*bas*), strn(*rep*), sint(*sfx*))
//
| T_FLT01 of (strn(*rep*)) // base=10
| T_FLT02 of (sint(*bas*), strn(*rep*))
| T_FLT03 of
  (sint(*bas*), strn(*rep*), sint(*sfx*))
//
| T_CHAR1_nil0 of (strn) // null: ''
| T_CHAR2_char of (strn) // regular: '?'
| T_CHAR3_blsh of (strn) // backslash: '\...'
//
// HX: Note that quotes are counted in [len]
| T_STRN1_clsd of // HX: may contain null-chars
  (strn, sint(*len*)) // closed: utf-8 // for text
| T_STRN2_ncls of // HX: may contain null-chars
  (strn, sint(*len*)) // unclosed: utf-8 // for text
//
| T_CMNT1_line of
  (strn(*init*), strn) // line-style // init: '//'
| T_CMNT2_rest of
  (strn(*init*), strn) // rest-style // init: '////'
| T_CMNT3_ccbl of
  (sint(*level*), strn) // block comments of cc-style
| T_CMNT4_mlbl of
  (sint(*level*), strn) // block comments of ml-style
//
  | T_AT0 of ()
//
  | T_BAR of () // |
  | T_CLN of () // :
  | T_DOT of () // .
//
  | T_EQ0 of () // =
//
  | T_LT0 of () // <
  | T_GT0 of () // >
//
  | T_DLR of () // $
  | T_SRP of () // #
//
(*
  | T_BANG of () // !
*)
  | T_EQLT of () // =<
  | T_EQGT of () // =>
//
  | T_LTGT of () // <>
  | T_GTLT of () // ><
//
  | T_MSLT of () // -<
  | T_MSGT of () // ->
//
  | T_GTDOT of () // >.
//
  | T_COMMA of () // ,
  | T_SMCLN of () // ;
//
  | T_BSLSH of () // \
(*
  | T_BSBAR of () // \|
*)
//
  | T_LPAREN of () // (
  | T_RPAREN of () // )
//
  | T_LBRCKT of () // [
  | T_RBRCKT of () // ]
//
  | T_LBRACE of () // {
  | T_RBRACE of () // }
//
  | T_EXISTS of int // #[
//
  | T_TRCD10 of (int) // @(/#(
                      // @tup/$tup
                      // @tup_t/$tup_t
                      // @tup_vt/$tup_vt
  | T_TRCD20 of (int) // @{/#{
                      // @rec/$rec
                      // @rec_t/$rec_t
                      // @rec_vt/$rec_vt
//
  | T_AS0 of () // 'as'
//
  | T_OF0 of () // 'of'
//
  | T_OP1 of () // 'op'
  | T_OP2 of token // 'opid'
  | T_OP3 of token // 'op()'
//
  | T_IN0 of () // 'in'
//
  | T_AND of () // 'and'
//
  | T_END of () // 'end'
//
  | T_IF0 of () // 'if'
  | T_SIF of () // static-if exp.
//
  | T_THEN of () // 'then'
  | T_ELSE of () // 'else'
//
  | T_WHEN of () // 'when'
  | T_WITH of () // 'with'
//
  | T_SCAS of () // static-case exps
// HX: for dynamic-cases:
  | T_CASE of caskind //case,case+/-
//
  | T_ENDST of () // for state-types
//
  | T_LAM of int // lam=lam0/lam@=lam1
  | T_FIX of int // fix=lam0/fix@=fix1
//
  | T_LET of () // 'let'
  | T_TRY of () // 'try'
  | T_WHERE of () // 'where'
//
  | T_LOCAL of () // 'local'
//
  | T_ENDIF0 of () // 'endif'
  | T_ENDCAS of () // 'endcas'
  | T_ENDLAM of () // 'endlam'
  | T_ENDFIX of () // 'endfix'
  | T_ENDLET of () // 'endlet'
  | T_ENDTRY of () // 'endtry'
  | T_ENDWHR of () // 'endwhr'/'endwhere'
  | T_ENDLOC of () // 'endloc'/'endlocal'
//
// fn0, fnx, fn1, fun, praxi,
| T_FUN of (funkind) // prfn0, prfn1, prfun, fcast
| T_VAL of (valkind) // val, val+, val-, prval, (mcval)
| T_VAR of (varkind) // var // there may be more kinds
//
| T_IMPLMNT of (implknd)
  //implmnt:generic//implprf:prval/fun//implval/fun/tmp/tmpr
//
  | T_STACST0 of ()
//
  | T_ABSSORT of ()
//
  | T_SORTDEF of ()
//
  | T_SEXPDEF of int(*kind*) // static defs
//
  | T_ABSIMPL of ()          // abstype-impl
  | T_ABSOPEN of ()          // abstype-open
  | T_ABSTYPE of int(*kind*) // abstract types
//
  | T_DATASORT of ()
//
  | T_EXCPTCON of ()
//
  | T_DATATYPE of int(*kind*)
//
  | T_WITHTYPE of int(*kind*)
//
  | T_DLR_RAISE of () // $raise
//
  | T_DLR_EXTNAM of () // $exname
  | T_DLR_EXISTS of () // $exists
//
(*
HX-2024-07-19:
Fri 19 Jul 2024 10:07:36 PM EDT
*)
  | T_DLR_SYNEXT of () // $synext
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
  | T_SRP_STATIC of () // #static
  | T_SRP_EXTERN of () // #extern
//
  | T_SRP_STAVAL of () // #staval
  | T_SRP_EXTVAL of () // #extval
//
  | T_SRP_DEFINE of () // #define
  | T_SRP_MACDEF of () // #macdef
//
  | T_SRP_SYMLOAD of () // #symload
//
  | T_SRP_STALOAD of () // #staload
(*
  | T_SRP_TMPLOAD of () // #tmpload
*)
  | T_SRP_DYNINIT of () // #dyninit
//
  | T_SRP_INCLUDE of () // #include
(*
  | T_SRP_INPASTE of () // #inpaste
*)
//
(*
HX-2024-07-20:
For supporting
co-programming with ATS
For inclusion of external code
Sat 20 Jul 2024 10:50:45 AM EDT
*)
  | T_SRP_EXTCODE of () // #extcode
//
// end-of-(datatype tnode)
//
(* ****** ****** *)
#typedef tokenlst = list(token)
#typedef tokenopt = optn(token)
(* ****** ****** *)
val T0IDSYM_AT0 : tnode
val T0IDSYM_BAR : tnode
val T0IDSYM_EQ0 : tnode
val T0IDSYM_LT0 : tnode
val T0IDSYM_GT0 : tnode
val T0IDSYM_EQGT : tnode
val T0IDSYM_LTGT : tnode
val T0IDSYM_MSLT : tnode
val T0IDSYM_MSGT : tnode
(* ****** ****** *)
val T0IDALP_NONE : tnode
(* ****** ****** *)
//
fun//<>
tnode_fprint(FILR, tnode): void
fun//<>
token_fprint(FILR, token): void
//
(* ****** ****** *)
//
fun//{}
token_get_lctn: (token) -> loc_t
fun//{}
token_get_node: (token) -> tnode
//
fun//{}
token_make_node
( loc: loc_t, tnd: tnode ): token
//
#symload lctn with token_get_lctn
#symload node with token_get_node
#symload token with token_make_node
//
(* ****** ****** *)
//
fun tnode_ANDq(tnode): bool
fun tnode_BARq(tnode): bool
fun tnode_CLNq(tnode): bool
//
#symload ANDq with tnode_ANDq
#symload BARq with tnode_BARq
#symload CLNq with tnode_CLNq
//
(* ****** ****** *)
//
fun
tnode_COMMAq : tnode -> bool
//
fun
tnode_SMCLNq : tnode -> bool
fun // BARSMCLN
tnode_BSCLNq : tnode -> bool
//
#symload COMMAq with tnode_COMMAq
#symload SMCLNq with tnode_SMCLNq
#symload BSCLNq with tnode_BSCLNq
//
(* ****** ****** *)
//
fun tnode_blankq(tnode): bool
fun tnode_iscmnt(tnode): bool
fun tnode_isskip(tnode): bool
//
#symload blankq with tnode_blankq
#symload iscmnt with tnode_iscmnt
#symload isskip with tnode_isskip
//
(* ****** ****** *)
//
fun
<obj:vt>
gobj_lexing$getc1
( buf: !obj ) : sint
fun
<obj:vt>
gobj_lexing$unget
(buf: !obj, ci0: sint): sint
//
(* ****** ****** *)
fun // HX: discard
<obj:vt> // the current clst
gobj_lexing$fcnil(buf: !obj): void
fun // HX: stringize
<obj:vt> // the current clst
gobj_lexing$fcseg(buf: !obj): strn
fun // HX: take out
<obj:vt> // the current clst
gobj_lexing$fclst(buf: !obj): list_vt(char)
(* ****** ****** *)
//
fun // this does
<obj:vt> // not need position info
gobj_lexing_tnode(buf: !obj): tnode
//
fun // HX: there is
<obj:vt> // need for position info
gobj_lexing_token(buf: !obj): token
//
(* ****** ****** *)
//
// HX: lxbf1-buf
fun // contains no position info
lxbf1_lexing_tnode
(    buf: !lxbf1    ): tnode
fun // contains no position info
lxbf1_lexing_tnodelst
(    buf: !lxbf1    ): list_vt(tnode)
//
(* ****** ****** *)
//
// HX: lxbf2-buf
fun // can provide position info
lxbf2_lexing_token(buf: !lxbf2): token
//
(* ****** ****** *)
fun
lexing_tnode_search(strn):tnode
fun
lexing_tnode_insert(strn,tnode):void
(* ****** ****** *)
//
fun // HX: start from
lexing_lctnize_all // postn(0, 0, 0)
( lcs: lcsrc
, txs: list_vt(tnode)): list_vt(token)
//
(* ****** ****** *)
//
fun // HX: preprocess a raw
lexing_preping_all // token list
(tks: list_vt(token)): list_vt(token)
//
(* ****** ****** *)
//
fun
strn_tokenize(src:strn): list_vt(token)
//
(* ****** ****** *)
//
// HX: An empty list 
fun // is returned in case of error
fpath_tokenize(fpx:strn): list_vt(token)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****************************************** *)
(* ****************************************** *)

(* end of [ATS3/XATSOPT_srcgen2_SATS_lexing0.sats] *)
