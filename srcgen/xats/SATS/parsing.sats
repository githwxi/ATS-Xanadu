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
// Start Time: June, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
// HX-2018-10:
// Note that comments in this file
// may be obsolete and/or inaccurate
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
LOC = "./locinfo.sats"
typedef loc_t = $LOC.location
#staload
FIL = "./filpath.sats"
typedef filpath = $FIL.filpath
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
  typedef s0ymb = $STAEXP0.s0ymb
//
  typedef g0eid = $STAEXP0.g0eid
//
  typedef s0tid = $STAEXP0.s0tid
  typedef s0eid = $STAEXP0.s0eid
  typedef d0pid = $STAEXP0.d0pid
  typedef d0eid = $STAEXP0.d0eid
//
  typedef g0exp = $STAEXP0.g0exp
//
  typedef sort0 = $STAEXP0.sort0
  typedef s0exp = $STAEXP0.s0exp
//
  typedef s0arg = $STAEXP0.s0arg
//
  typedef s0qua = $STAEXP0.s0qua
  typedef s0uni = $STAEXP0.s0uni
//
  typedef sq0eid = $STAEXP0.sq0eid
  typedef dq0eid = $STAEXP0.dq0eid
//
  typedef d0tsort = $STAEXP0.d0tsort
  typedef s0rtdef = $STAEXP0.s0rtdef
//
  typedef d0atcon = $STAEXP0.d0atcon
  typedef d0atype = $STAEXP0.d0atype
//
  typedef labs0exp = $STAEXP0.labs0exp
//
  typedef s0explst = $STAEXP0.s0explst
  typedef s0arglst = $STAEXP0.s0arglst
  typedef s0qualst = $STAEXP0.s0qualst
  typedef s0unilst = $STAEXP0.s0unilst
  typedef d0tsortlst = $STAEXP0.d0tsortlst
  typedef d0atconlst = $STAEXP0.d0atconlst
  typedef d0atypelst = $STAEXP0.d0atypelst
//
  typedef effs0expopt = $STAEXP0.effs0expopt
//
(* ****** ****** *)

#staload
DYNEXP0 = "./dynexp0.sats"
//
  typedef d0pat = $DYNEXP0.d0pat
  typedef d0exp = $DYNEXP0.d0exp
//
  typedef d0arg = $DYNEXP0.d0arg
  typedef f0arg = $DYNEXP0.f0arg
//
  typedef labd0pat = $DYNEXP0.labd0pat
  typedef labd0exp = $DYNEXP0.labd0exp
//
  typedef d0patlst = $DYNEXP0.d0patlst
  typedef d0explst = $DYNEXP0.d0explst
  typedef labd0patlst = $DYNEXP0.labd0patlst
  typedef labd0explst = $DYNEXP0.labd0explst
//
(* ****** ****** *)
//
  typedef d0ecl = $DYNEXP0.d0ecl
  typedef d0eclist = $DYNEXP0.d0eclist
//
(* ****** ****** *)
//
abstflt
tokbuf_tflt =
$extype"xats_tokbuf_struct"
//
  typedef tokbuf = tokbuf_tflt
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
//
fun
p_EQ: parser(token)
fun
p_GT: parser(token)
//
fun
p_BAR: parser(token)
fun
p_CLN: parser(token)
//
fun
p_EQGT: parser(token)
fun
p_GTDOT: parser(token)
//
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
//
fun
p_OF: parser(token)
//
fun
p_IN: parser(token)
//
fun
p_WITH: parser(token)
//
(* ****** ****** *)
//
fun
p_END: parser(token)
//
fun
p_ENDLET: parser(token)
fun
p_ENDTRY: parser(token)
fun
p_ENDLOCAL: parser(token)
//
(* ****** ****** *)
//
fun
popt_EQ: parser(tokenopt)
//
fun
popt_IN: parser(tokenopt)
//
fun
popt_BAR: parser(tokenopt)
//
fun
popt_SMCLN: parser(tokenopt)
//
fun
popt_LBRACE: parser(tokenopt)
//
(* ****** ****** *)
//
fun
popt_ENDIF: parser(tokenopt)
fun
popt_ENDCASE: parser(tokenopt)
//
(* ****** ****** *)
//
fun
popt_ENDLAM: parser(tokenopt)
fun
popt_ENDFIX: parser(tokenopt)
//
(* ****** ****** *)

fun
popt_SRP_THEN: parser(tokenopt)

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

fun p_s0ymb: parser(s0ymb)

(* ****** ****** *)

fun t_g0eid(tnode): bool
fun p_g0eid: parser(g0eid)

(* ****** ****** *)
//
fun t_s0tid(tnode): bool
fun t_s0aid(tnode): bool
fun t_s0eid(tnode): bool
//
fun p_s0tid: parser(s0tid) // srt id
fun p_s0aid: parser(s0eid) // arg id
fun p_s0eid: parser(s0eid) // exp id
//
(* ****** ****** *)
//
fun t_d0pid(tnode): bool
fun t_d0eid(tnode): bool
//
fun p_d0pid: parser(d0pid) // pat id
fun p_d0eid: parser(d0eid) // exp id
//
(* ****** ****** *)
//
fun p_sq0eid: parser(sq0eid) // qualid
fun p_dq0eid: parser(dq0eid) // qualid
//
(* ****** ****** *)

fun p_g0exp : parser(g0exp)

(* ****** ****** *)
//
typedef
g0marg = $STAEXP0.g0marg
typedef
g0marglst = $STAEXP0.g0marglst
fun
p_g0marg: parser(g0marg)
fun
p_g0margseq: parser(g0marglst)
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
s0arg ::
| s0aid [COLON sort0]
*)
fun p_s0arg: parser(s0arg)
fun
p_s0argseq_COMMA: parser(s0arglst)
//
(* ****** ****** *)
//
(*
d0tsort ::=
| s0tid EQ s0rtconseq_BAR
*)
fun
p_d0tsort: parser(d0tsort)
fun
p_d0tsortseq_AND: parser(d0tsortlst)
//
(* ****** ****** *)
//
(*
s0rtdef ::=
| sort0
| LBRACE
  s0arg BAR s0expseq_SMCLN
  RBRACE
*)
fun
p_s0rtdef: parser(s0rtdef)
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
//
(* ****** ****** *)
//
fun
p_labs0exp : parser(labs0exp)
//
fun
p_s0expseq_COMMA : parser(s0explst)
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
fun
popt_idsort0_anno: parser(sort0opt)
//
(* ****** ****** *)
//
fun
p_s0qua: parser(s0qua)
fun
p_s0quaseq_BARSMCLN: parser(s0qualst)
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
//
fun // GT excluded
p_appsort0_NGT: parser(sort0)
//
fun // GT excluded
p_apps0exp_NGT: parser(s0exp)
//
(* ****** ****** *)
//
fun
p_effs0expopt: parser(effs0expopt)
//
(* ****** ****** *)
//
(*
d0atype ::=
| s0eid s0marg EQ d0atconseq_BAR
*)
//
fun
p_d0atcon: parser(d0atcon)
fun
p_d0atype: parser(d0atype)
fun
p_d0atconseq_BAR: parser(d0atconlst)
fun
p_d0atypeseq_AND: parser(d0atypelst)
//
fun
p_WHERE_sexpdefseq: parser(d0eclist)
//
(* ****** ****** *)

fun p_d0arg : parser(d0arg)

(* ****** ****** *)
//
fun p_d0pat : parser(d0pat)
(*
labd0pat ::= l0abl EQ d0pat
*)
fun p_labd0pat : parser(labd0pat)
//
(* ****** ****** *)

fun p_f0arg : parser(f0arg)

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

typedef
fparser(a:type) =
( int(*flag*)
, (*buf*)&tokbuf >> _
, (*err*)&int >> int) -> a

fun fp_d0ecl : fparser(d0ecl)
fun fp_d0eclseq : fparser(d0eclist)
fun fptop_d0eclseq : fparser(d0eclist)

(* ****** ****** *)
//
fun p_d0ecl_sta : parser(d0ecl)
fun p_d0ecl_dyn : parser(d0ecl)
//
fun p_d0eclseq_sta : parser(d0eclist)
fun p_d0eclseq_dyn : parser(d0eclist)
//
fun ptop_d0eclseq_sta : parser(d0eclist)
fun ptop_d0eclseq_dyn : parser(d0eclist)
//
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
pstar_SMCLN_fun
  {a:type}
(
  buf: &tokbuf >> _, err: &int >> _, fpar: parser(a)
) : List0_vt(a) // end of [pstar_SMCLN_fun]
//
fun
pstar_BARSMCLN_fun
  {a:type}
(
  buf: &tokbuf >> _, err: &int >> _, fpar: parser(a)
) : List0_vt(a) // end of [pstar_BARSMCLN_fun]
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
//
// HX-2018-10-07
// static/dynamic: 0/1
//
fun
parse_from_stdin_toplevel
  (stadyn: int): d0eclist
fun
parse_from_fileref_toplevel
  (stadyn: int, inp: FILEref): d0eclist
// end of [parse_from_fileref_toplevel]
//
(* ****** ****** *)
//
fun
parse_from_filpath_toplevel
(stadyn: int, inp: filpath): Option_vt(d0eclist)
//
(* ****** ****** *)

(* end of [xats_parsing.sats] *)
