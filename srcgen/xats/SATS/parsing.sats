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
// Start Time: June, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

%{#
#include "CATS/parsing.cats"
%} // end of [%{#]

(* ****** ****** *)
//
#staload
SYM = "./symbol.sats"
typedef kword = $SYM.symbol
#staload
LOC = "./location.sats"
typedef loc_t = $LOC.location
//
(* ****** ****** *)
//
#staload
LEXING = "./lexing.sats"
//
  typedef tnode = $LEXING.tnode
  typedef token = $LEXING.token
  typedef tokenlst = List0(token)
  typedef tokenopt = Option(token)
//
(* ****** ****** *)
//
#staload
STAEXP0 = "./staexp0.sats"
//
  typedef t0int = $STAEXP0.t0int
  typedef t0chr = $STAEXP0.t0chr
  typedef t0flt = $STAEXP0.t0flt
  typedef t0str = $STAEXP0.t0str
//
  typedef i0dnt = $STAEXP0.i0dnt
  typedef l0abl = $STAEXP0.l0abl
//
  typedef s0tid = $STAEXP0.s0tid
  typedef s0eid = $STAEXP0.s0eid
  typedef d0pid = $STAEXP0.d0pid
  typedef d0eid = $STAEXP0.d0eid
//
  typedef sort0 = $STAEXP0.sort0
  typedef s0exp = $STAEXP0.s0exp
//
  typedef s0arg = $STAEXP0.s0arg
//
  typedef s0qua = $STAEXP0.s0qua
  typedef s0uni = $STAEXP0.s0uni
//
  typedef d0tsort = $STAEXP0.d0tsort
  typedef s0rtdef = $STAEXP0.s0rtdef
//
  typedef d0atype = $STAEXP0.d0atype
//
  typedef labs0exp = $STAEXP0.labs0exp
//
  typedef s0qualst = $STAEXP0.s0qualst
  typedef s0unilst = $STAEXP0.s0unilst
  typedef d0tsortlst = $STAEXP0.d0tsortlst
  typedef d0atypelst = $STAEXP0.d0atypelst
//
//
(* ****** ****** *)

#staload
DYNEXP0 = "./dynexp0.sats"
//
  typedef d0exp = $DYNEXP0.d0exp
//
  typedef d0arg = $DYNEXP0.d0arg
//
  typedef labd0exp = $DYNEXP0.labd0exp
//
  typedef d0ecl = $DYNEXP0.d0ecl
  typedef d0eclist = List0(d0ecl)
//
(* ****** ****** *)
//
abstflat
tokbuf_tflat =
$extype"xats_tokbuf_struct"
//
  typedef tokbuf = tokbuf_tflat
//
(* ****** ****** *)
//
absvtbox
tokbuf_mark_vtbox = (ptr)
vtypedef
tokbuf_mark = tokbuf_mark_vtbox
//
(* ****** ****** *)
//
fun
tokbuf_getok0
  (buf: &tokbuf >> _): token
fun
tokbuf_getok1
  (buf: &tokbuf >> _): token
//
fun
tokbuf_incby1
  (buf: &tokbuf >> _): (void)
//
overload .get0 with tokbuf_getok0
overload .get1 with tokbuf_getok1
overload .incby1 with tokbuf_incby1
//
(* ****** ****** *)
//
fun
tokbuf_get_mark
(buf: &tokbuf >> _): tokbuf_mark
fun
tokbuf_set_mark
(buf: &tokbuf >> _, mk0: tokbuf_mark): void
//
fun
tokbuf_clear_mark
(buf: &tokbuf >> _, mk0: tokbuf_mark): void
//
overload .get_mark with tokbuf_get_mark
overload .set_mark with tokbuf_set_mark
overload .clear_mark with tokbuf_clear_mark
//
(* ****** ****** *)
//
fun
tokbuf_initize_list
  (buf: &tokbuf? >> _, toks: tokenlst): void
//
(* ****** ****** *)
//
(*
typedef
parser(res:t@ype) =
(&tokbuf >> _) -> res
*)
//
typedef
parser(res:t@ype) =
(&tokbuf >> _, &int >> _) -> res
//
(* ****** ****** *)

fun
p_EQ: parser(token)
fun
p_BAR: parser(token)
fun
p_EQGT: parser(token)
fun
p_COLON: parser(token)

(* ****** ****** *)

fun
p_LPAREN: parser(token)
fun
p_RPAREN: parser(token)
fun
p_LBRACE: parser(token)
fun
p_RBRACE: parser(token)
fun
p_LBRACK: parser(token)
fun
p_RBRACK: parser(token)

(* ****** ****** *)

fun
p_IN: parser(token)
fun
p_END: parser(token)
fun
p_ENDLET: parser(token)
fun
p_ENDWHERE: parser(token)
fun
p_ENDLOCAL: parser(token)

(* ****** ****** *)

fun
popt_BAR: parser(tokenopt)
fun
popt_LBRACE: parser(tokenopt)

(* ****** ****** *)
//
fun t_t0int(tnode): bool
fun t_t0chr(tnode): bool
fun t_t0flt(tnode): bool
fun t_t0str(tnode): bool
//
fun p_t0int: parser(t0int)
fun p_t0chr: parser(t0chr)
fun p_t0flt: parser(t0flt)
fun p_t0str: parser(t0str)
//
(* ****** ****** *)

fun p_i0dnt: parser(i0dnt)

(* ****** ****** *)

fun p_l0abl: parser(l0abl)

(* ****** ****** *)
//
fun t_s0tid(tnode): bool
fun t_s0eid(tnode): bool
fun t_d0pid(tnode): bool
fun t_d0eid(tnode): bool
//
fun p_s0tid: parser(s0tid)
fun p_s0eid: parser(s0eid)
//
fun p_d0pid: parser(d0pid)
fun p_d0eid: parser(d0eid)
//
(* ****** ****** *)
//
(*
sort0 ::= {atmsort0}+
*)
fun p_sort0 : parser(sort0)
//
(* ****** ****** *)
//
(*
d0tsort ::=
| s0tid EQ s0rtconseq_BAR
*)
fun p_d0tsort: parser(d0tsort)
fun p_d0tsortseq_AND: parser(d0tsortlst)
//
(* ****** ****** *)
//
(*
s0arg ::
| s0aid [COLON sort0]
*)
fun
p_s0arg: parser(s0arg)
//
(* ****** ****** *)
//
(*
s0rtdef ::=
| sort0
| LBRACE s0arg BAR s0expseq_SEMICOLON RBRACE
*)
fun p_s0rtdef: parser(s0rtdef)
//
(* ****** ****** *)
//
(*
s0exp ::= {atms0exp}+
*)
fun p_s0exp : parser(s0exp)
//
(*
labs0exp ::= l0abl EQ s0exp
*)
fun p_labs0exp : parser(labs0exp)
//
(* ****** ****** *)
//
(*
s0marg ::=
| s0eid
| LPAREN s0argseq_COMMA RPAREN
*)
//
typedef
s0marg = $STAEXP0.s0marg
typedef
s0marglst = $STAEXP0.s0marglst
fun
p_s0marg: parser(s0marg)
fun
p_s0margseq: parser(s0marglst)
//
typedef
t0marg = $STAEXP0.t0marg
typedef
t0marglst = $STAEXP0.t0marglst
fun
p_t0marg: parser(t0marg)
fun
p_t0margseq: parser(t0marglst)
//
typedef
sort0opt = $STAEXP0.sort0opt
fun
popt_sort0_anno: parser(sort0opt)
//
(* ****** ****** *)
//
fun
p_s0qua: parser(s0qua)
fun
p_s0quaseq_BARSEMI: parser(s0qualst)
//
(* ****** ****** *)

fun p_s0uni: parser(s0uni)
fun p_s0uniseq: parser(s0unilst)

(* ****** ****** *)

typedef
s0expopt = $STAEXP0.s0expopt
fun
popt_s0exp_anno: parser(s0expopt)

(* ****** ****** *)
//
fun // EQ excluded
p_apps0exp_NEQ: parser(s0exp)
and // GT excluded
p_apps0exp_NGT: parser(s0exp)
//
(* ****** ****** *)
//
(*
d0atype ::=
| s0eid s0marg EQ d0atconseq_BAR
*)
//
fun p_d0atype: parser(d0atype)
fun p_d0atypeseq_AND: parser(d0atypelst)
//
fun p_WHERE_sexpdefseq: parser(d0eclist)
//
(* ****** ****** *)

fun p_d0arg : parser(d0arg)

(* ****** ****** *)

//
fun p_d0exp : parser(d0exp)
//
(*
labd0exp ::= l0abl EQ d0exp
*)
fun p_labd0exp : parser(labd0exp)
//
(* ****** ****** *)

fun p_d0ecl : parser(d0ecl)
fun p_d0eclseq : parser(d0eclist)
fun p_d0eclseq_top : parser(d0eclist)

(* ****** ****** *)

datavtype
synent1
(a1:vtype) = SYNENT1 of (a1)
datavtype
synent2
( a1:vtype
, a2:vtype) = SYNENT2 of (a1, a2)
datavtype
synent3
( a1:vtype
, a2:vtype
, a3: vtype) = SYNENT3 of (a1, a2, a3)

(* ****** ****** *)
//
(*
fun{}
synent_null: {a:type}() -> a
fun{}
synent_is_null: {a:type}(a) -> bool
fun{}
synent_isnot_null: {a:type}(a) -> bool
*)
//
(* ****** ****** *)
//
fun
pstar_fun
  {a:type}
(
  buf: &tokbuf >> _
, err: &int >> int, fpar: parser(a)
) : List0_vt(a) // end of [pstar_fun]
//
(* ****** ****** *)
//
fun
pstar_sep_fun
  {a:type}
(
  buf: &tokbuf >> _
, err: &int >> int
, fsep: (tnode) -> bool, fpar: parser(a)
) : List0_vt(a) // end of [pstar_sep_fun]
//
fun
pstar_AND_fun
  {a:type}
(
  buf: &tokbuf >> _, err: &int >> _, fpar: parser(a)
) : List0_vt(a) // end of [pstar_AND_fun]
fun
pstar_BAR_fun
  {a:type}
(
  buf: &tokbuf >> _, err: &int >> _, fpar: parser(a)
) : List0_vt(a) // end of [pstar_BAR_fun]
//
fun
pstar_COMMA_fun
  {a:type}
(
  buf: &tokbuf >> _, err: &int >> _, fpar: parser(a)
) : List0_vt(a) // end of [pstar_COMMA_fun]
//
fun
pstar_BARSEMI_fun
  {a:type}
(
  buf: &tokbuf >> _, err: &int >> _, fpar: parser(a)
) : List0_vt(a) // end of [pstar_BARSEMI_fun]
fun
pstar_SEMICOLON_fun
  {a:type}
(
  buf: &tokbuf >> _, err: &int >> _, fpar: parser(a)
) : List0_vt(a) // end of [pstar_SEMICOLON_fun]
//
(* ****** ****** *)

fun
pent2_fun_fun
  {a1,a2:type}
(
  buf: &tokbuf >> _, err: &int >> _
, fpar1: parser(a1), fpar2: parser(a2)
) : synent2(a1, a2) // pent2_fun_fun
fun
pent3_fun_fun_fun
  {a1,a2,a3:type}
(
  buf: &tokbuf >> _, err: &int >> _
, fpar1: parser(a1), fpar2: parser(a2), fpar3: parser(a3)
) : synent3(a1, a2, a3) // pent3_fun_fun_fun

(* ****** ****** *)

(* end of [xats_parsing.sats] *)
