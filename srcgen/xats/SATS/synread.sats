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
// Start Time: 2018-09-03
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload "./lexing.sats"

(* ****** ****** *)

#staload "./staexp0.sats"
#staload "./dynexp0.sats"

(* ****** ****** *)
//
typedef
synreader
(a:t@ype) = (a) -> void
//
(* ****** ****** *)
(*
//
abstbox
synreadst_type = ptr
typedef
synreadst = synreadst_type
//
*)
(* ****** ****** *)
//
datatype
tkind =
//
| K_INT1 of ()
| K_CHAR of ()
| K_STRING of ()
//
| K_LAM of ()
| K_ENDLAM of ()
//
| K_LET of ()
| K_ENDLET of ()
//
| K_WHERE of ()
| K_ENDWHERE of ()
//
| K_WITH of ()
//
| K_LOCAL of ()
| K_ENDLOCAL of ()
//
| K_TUPLE of ()
| K_RECORD of ()
//
| K_EXISTS of ()
//
| K_QUALID of () // qualified identifier
//
| K_SYMBOL of symbol
//
| K_CLOSED_chr of ()
| K_CLOSED_str of ()
//
(* ****** ****** *)
//
datatype synerr =
//
| SYNERRi0dnt of (i0dnt)
//
| SYNERRl0abl of (l0abl)
| SYNERRs0ymb of (s0ymb)
//
| SYNERRt0int of (t0int)
| SYNERRt0chr of (t0chr)
| SYNERRt0str of (t0str)
| SYNERRt0flt of (t0flt)
//
| SYNERRs0tid of (i0dnt)
//
| SYNERRs0eid of (i0dnt)
//
| SYNERRsort0 of (sort0)
//
| SYNERRs0arg of (s0arg)
| SYNERRs0marg of (s0marg)
//
| SYNERRs0exp of (s0exp)
//
| SYNERRd0pid of (i0dnt)
| SYNERRd0eid of (i0dnt)
//
| SYNERRd0ecl of (d0ecl)
//
| SYNERRf0arg of (f0arg)
| SYNERRq0arg of (q0arg)
| SYNERRtq0arg of (tq0arg)
//
| SYNERRtoken of
    (tkind, token) // token mismatch
  // SYNERRtoken
//
| SYNERRf0unarrow of (token) // => | =<
//
| SYNERRsignint_opr of (token) // sign: + or -
//
typedef
synerrlst = List0(synerr)
//
(* ****** ****** *)
//
fun{}
synerr_add(synerr): void
//
(* ****** ****** *)
//
fun
synread_main(d0eclist): void
//
(* ****** ****** *)
//
fun{}
synread_i0dnt: synreader(i0dnt)
//
(* ****** ****** *)
//
fun{}
synread_l0abl: synreader(l0abl)
//
fun{}
synread_s0ymb: synreader(s0ymb)
//
(* ****** ****** *)
//
fun{}
synread_t0int: synreader(t0int)
fun{}
synread_t0chr: synreader(t0chr)
fun{}
synread_t0flt: synreader(t0flt)
fun{}
synread_t0str: synreader(t0str)
//
(* ****** ****** *)
//
fun{}
synread_s0tid: synreader(s0tid)
fun{}
synread_s0eid: synreader(s0eid)
fun{}
synread_sq0eid: synreader(sq0eid)
//
(* ****** ****** *)
//
fun{}
synread_i0dntlst: synreader(i0dntlst)
//
(* ****** ****** *)
//
fun{}
synread_sort0: synreader(sort0)
fun{}
synread_sort0lst: synreader(sort0lst)
fun{}
synread_sort0opt: synreader(sort0opt)
//
(* ****** ****** *)
//
fun{}
synread_s0arg: synreader(s0arg)
fun{}
synread_s0marg: synreader(s0marg)
fun{}
synread_s0arglst: synreader(s0arglst)
fun{}
synread_s0marglst: synreader(s0marglst)
//
(* ****** ****** *)
//
fun{}
synread_s0qua: synreader(s0qua)
fun{}
synread_s0qualst: synreader(s0qualst)
//
(* ****** ****** *)
//
fun{}
synread_s0exp: synreader(s0exp)
fun{}
synread_s0explst: synreader(s0explst)
fun{}
synread_s0expopt: synreader(s0expopt)
//
(* ****** ****** *)
//
fun{}
synread_labs0exp: synreader(labs0exp)
fun{}
synread_labs0explst: synreader(labs0explst)
//
(* ****** ****** *)

fun{}
synread_s0exp_RPAREN: synreader(s0exp_RPAREN)
fun{}
synread_labs0exp_RBRACE: synreader(labs0exp_RBRACE)

(* ****** ****** *)

fun{}
synread_effs0expopt: synreader(effs0expopt)

(* ****** ****** *)
//
fun{}
synread_d0pid: synreader(d0pid)
//
fun{}
synread_d0pat: synreader(d0pat)
fun{}
synread_labd0pat: synreader(labd0pat)
//
fun{}
synread_d0patlst: synreader(d0patlst)
fun{}
synread_labd0patlst: synreader(labd0patlst)
//
(* ****** ****** *)
//
fun{}
synread_d0pat_RPAREN: synreader(d0pat_RPAREN)
//
(* ****** ****** *)
//
fun{}
synread_d0eid: synreader(d0eid)
fun{}
synread_dq0eid: synreader(dq0eid)
//
(* ****** ****** *)
//
fun{}
synread_d0exp: synreader(d0exp)
fun{}
synread_labd0exp: synreader(labd0exp)
//
fun{}
synread_d0expopt: synreader(d0expopt)
fun{}
synread_d0explst: synreader(d0explst)
fun{}
synread_labd0explst: synreader(labd0explst)
//
(* ****** ****** *)

fun{}
synread_d0exp_THEN: synreader(d0exp_THEN)
fun{}
synread_d0exp_ELSE: synreader(d0exp_ELSE)

(* ****** ****** *)

fun{}
synread_d0exp_RPAREN: synreader(d0exp_RPAREN)

(* ****** ****** *)
//
fun{}
synread_d0ecl: synreader(d0ecl)
fun{}
synread_d0eclist: synreader(d0eclist)
//
(* ****** ****** *)

fun{}
synread_d0eclseq_WHERE: synreader(d0eclseq_WHERE)

(* ****** ****** *)

fun{}
synread_f0unarrow: synreader(f0unarrow)

(* ****** ****** *)
//
fun{}
synread_f0arglst: synreader(f0arglst)
fun{}
synread_q0arglst: synreader(q0arglst)
fun{}
synread_tq0arglst: synreader(tq0arglst)
//
fun{}
synread_wths0expopt: synreader(wths0expopt)
//
fun{}
synread_teqd0expopt: synreader(teqd0expopt)
//
(* ****** ****** *)

fun{}
synread_v0aldeclist: synreader(v0aldeclist)
fun{}
synread_v0ardeclist: synreader(v0ardeclist)
fun{}
synread_f0undeclist: synreader(f0undeclist)

(* ****** ****** *)
//
fun{}
synread_INT1: synreader(token)
fun{}
synread_INT12: synreader(token)
fun{}
synread_INT123: synreader(token)
//
(* ****** ****** *)

fun{}
synread_CHAR: synreader(token)

(* ****** ****** *)

fun{}
synread_STRING: synreader(token)

(* ****** ****** *)
//
fun{}
synread_EQ: synreader(token)
//
fun{}
synread_LT: synreader(token)
fun{}
synread_GT: synreader(token)
fun{}
synread_LTGT: synreader(token)
fun{}
synread_LT_GT
(t0: token, t1: token): void
//
fun{}
synread_BAR: synreader(token)
fun{}
synread_CLN: synreader(token)
fun{}
synread_DOT: synreader(token)
fun{}
synread_SMCLN: synreader(token)
//
fun{}
synread_EQLT: synreader(token)
fun{}
synread_EQGT: synreader(token)
//
fun{}
synread_MSLT: synreader(token)
(*
fun{}
synread_MSGT: synreader(token)
*)
//
fun{}
synread_LPAREN: synreader(token)
fun{}
synread_RPAREN: synreader(token)
//
fun{}
synread_LBRACE: synreader(token)
fun{}
synread_RBRACE: synreader(token)
//
fun{}
synread_LBRACK: synreader(token)
fun{}
synread_RBRACK: synreader(token)
fun{}
synread_EXISTS: synreader(token)
//
(* ****** ****** *)
//
fun{}
synread_LAM: synreader(token)
fun{}
synread_FIX: synreader(token)
//
fun{}
synread_ENDLAM: synreader(token)
fun{}
synread_ENDFIX: synreader(token)
fun{}
synread_ENDLAM_opt: synreader(tokenopt)
fun{}
synread_ENDFIX_opt: synreader(tokenopt)
//
(* ****** ****** *)
//
fun{}
synread_LET: synreader(token)
fun{}
synread_ENDLET: synreader(token)
//
(* ****** ****** *)
//
fun{}
synread_WHERE: synreader(token)
fun{}
synread_ENDWHERE: synreader(token)
fun{}
synread_ENDWHERE_opt: synreader(tokenopt)
//
(* ****** ****** *)
//
fun{}
synread_WITH: synreader(token)
//
(* ****** ****** *)
//
fun{}
synread_LOCAL: synreader(token)
fun{}
synread_ENDLOCAL: synreader(token)
//
(* ****** ****** *)
//
fun{}
synread_TUPLE: synreader(token)
fun{}
synread_RECORD: synreader(token)
//
(* ****** ****** *)
//
fun{}
synread_IDENT_qual: synreader(token)
//
(* ****** ****** *)
//
(*
fun{}
synread_SORTDEF: synreader(token)
fun{}
synread_SEXPDEF: synreader(token)
*)
//
(* ****** ****** *)
//
fun{}
synread_precopt: synreader(precopt)
fun{}
synread_precmod: synreader(precmod)
fun{}
synread_signint: synreader(signint)
//
(* ****** ****** *)
//
fun{}
synread_s0rtdef: synreader(s0rtdef)
//
(* ****** ****** *)

(* end of [xats_synread.sats] *)
