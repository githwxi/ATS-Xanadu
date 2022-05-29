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
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt"
(* ****** ****** *)
//
#staload "./lexing0.sats"
//
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
| K_AS of ()
| K_OF of ()
//
| K_LAM of ()
| K_ENDLAM of ()
//
| K_LET of ()
| K_ENDLET of ()
//
| K_TRY of ()
| K_ENDTRY of ()
//
| K_WHERE of ()
| K_ENDWHERE of ()
//
| K_WHEN of ()
| K_WITH of ()
//
| K_LOCAL of ()
| K_ENDLOCAL of ()
//
| K_TRCD1 of ()
| K_TRCD2 of ()
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
| SYNERRqname of (token)
//
| SYNERRl0abl of (l0abl)
| SYNERRs0ymb of (s0ymb)
//
| SYNERRg0nid of (i0dnt)
| SYNERRg0nam of (g0nam)
//
| SYNERRg0eid of (i0dnt)
| SYNERRg0exp of (g0exp)
| SYNERRg0arg of (g0arg)
| SYNERRg0marg of (g0marg)
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
| SYNERRt0arg of (t0arg)
| SYNERRs0marg of (s0marg)
| SYNERRt0marg of (t0marg)
//
| SYNERRs0uni of (s0uni)
//
| SYNERRs0exp of (s0exp)
//
| SYNERRd0pid of (i0dnt)
| SYNERRd0eid of (i0dnt)
//
| SYNERRd0ecl of (d0ecl)
| SYNERRifgua of (d0ecl)
//
| SYNERRf0arg of (f0arg)
| SYNERRq0arg of (q0arg)
| SYNERRtq0arg of (tq0arg)
//
| SYNERRtoken of
    (tkind, token) // token mismatch
  // SYNERRtoken
//
| SYNERRfarrow of (token) // => | =<
//
| SYNERRsignopr of (token) // sign: + or -
// HX-2021-01-24: the package is
| SYNERRd0parsed of (d0parsed) // missing
//
(* ****** ****** *)
//
datatype
synpth =
| synpth_nil of ()
| synpth_cons of (int, synpth)
datatype
syndff(syn:type) =
| syndff01 of (synpth, syn)
| syndff10 of (synpth, syn)
| syndff11 of (synpth, syn, syn)
//
(* ****** ****** *)
//
typedef
synerrlst = List0(synerr)
typedef
syndfflst(a:type) = List0(syndff(a))
//
(* ****** ****** *)
//
fun//{}
synerr_add(synerr): void
//
(* ****** ****** *)
//
fun
synread_package
( p0kg: d0parsed ): void
//
(* ****** ****** *)
//
fun//{}
synread_i0dnt: synreader(i0dnt)
//
(* ****** ****** *)
//
fun//{}
synread_qname: synreader(token)
//
(* ****** ****** *)
//
fun//{}
synread_l0abl: synreader(l0abl)
//
fun//{}
synread_s0ymb: synreader(s0ymb)
//
(* ****** ****** *)
//
fun//{}
synread_g0nid: synreader(g0nid)
fun//{}
synread_g0nam: synreader(g0nam)
fun//{}
synread_g0namlst: synreader(g0namlst)
//
(* ****** ****** *)
//
fun//{}
synread_g0eid: synreader(g0eid)
fun//{}
synread_g0exp: synreader(g0exp)
fun//{}
synread_g0explst: synreader(g0explst)
//
(* ****** ****** *)
fun//{}
synread_g0exp_THEN: synreader(g0exp_THEN)
fun//{}
synread_g0exp_ELSE: synreader(g0exp_ELSE)
(* ****** ****** *)
//
fun//{}
synread_g0arg: synreader(g0arg)
fun//{}
synread_g0marg: synreader(g0marg)
fun//{}
synread_g0arglst: synreader(g0arglst)
fun//{}
synread_g0marglst: synreader(g0marglst)
//
(* ****** ****** *)
//
fun//{}
synread_t0int: synreader(t0int)
fun//{}
synread_t0chr: synreader(t0chr)
fun//{}
synread_t0flt: synreader(t0flt)
fun//{}
synread_t0str: synreader(t0str)
//
(* ****** ****** *)
//
fun//{}
synread_s0tid: synreader(s0tid)
fun//{}
synread_s0eid: synreader(s0eid)
fun//{}
synread_sq0eid: synreader(sq0eid)
//
(* ****** ****** *)
//
fun//{}
synread_i0dntlst: synreader(i0dntlst)
//
(* ****** ****** *)
//
fun//{}
synread_sort0: synreader(sort0)
fun//{}
synread_sort0lst: synreader(sort0lst)
fun//{}
synread_sort0opt: synreader(sort0opt)
//
(* ****** ****** *)
//
fun//{}
synread_s0arg: synreader(s0arg)
fun//{}
synread_s0marg: synreader(s0marg)
fun//{}
synread_s0arglst: synreader(s0arglst)
fun//{}
synread_s0marglst: synreader(s0marglst)
//
(* ****** ****** *)
//
fun//{}
synread_t0arg: synreader(t0arg)
fun//{}
synread_t0marg: synreader(t0marg)
fun//{}
synread_t0arglst: synreader(t0arglst)
fun//{}
synread_t0marglst: synreader(t0marglst)
//
(* ****** ****** *)
//
fun//{}
synread_s0qua: synreader(s0qua)
fun//{}
synread_s0qualst: synreader(s0qualst)
//
(* ****** ****** *)
//
fun//{}
synread_s0uni: synreader(s0uni)
fun//{}
synread_s0unilst: synreader(s0unilst)
//
(* ****** ****** *)
//
fun//{}
synread_s0exp: synreader(s0exp)
fun//{}
synread_s0explst: synreader(s0explst)
fun//{}
synread_s0expopt: synreader(s0expopt)
//
(* ****** ****** *)
//
fun//{}
synread_labs0exp: synreader(labs0exp)
fun//{}
synread_labs0explst: synreader(labs0explst)
//
(* ****** ****** *)

fun//{}
synread_s0exp_RPAREN: synreader(s0exp_RPAREN)
fun//{}
synread_labs0exp_RBRACE: synreader(labs0exp_RBRACE)

(* ****** ****** *)

fun//{}
synread_f0unarrow: synreader(f0unarrow)

(* ****** ****** *)

fun//{}
synread_effs0expopt: synreader(effs0expopt)

(* ****** ****** *)
//
fun//{}
synread_d0atcon: synreader(d0atcon)
fun//{}
synread_d0atconlst: synreader(d0atconlst)
//
(* ****** ****** *)
//
fun//{}
synread_d0pid: synreader(d0pid)
//
fun//{}
synread_d0pat: synreader(d0pat)
fun//{}
synread_labd0pat: synreader(labd0pat)
//
fun//{}
synread_d0patlst: synreader(d0patlst)
fun//{}
synread_labd0patlst: synreader(labd0patlst)
//
(* ****** ****** *)
//
fun//{}
synread_d0pat_RPAREN: synreader(d0pat_RPAREN)
//
(* ****** ****** *)
//
fun//{}
synread_d0eid: synreader(d0eid)
fun//{}
synread_dq0eid: synreader(dq0eid)
//
(* ****** ****** *)
//
fun//{}
synread_d0exp: synreader(d0exp)
fun//{}
synread_labd0exp: synreader(labd0exp)
//
fun//{}
synread_d0expopt: synreader(d0expopt)
fun//{}
synread_d0explst: synreader(d0explst)
fun//{}
synread_d0expseq: synreader(d0explst)
fun//{}
synread_labd0explst: synreader(labd0explst)
//
(* ****** ****** *)

fun//{}
synread_d0exp_THEN: synreader(d0exp_THEN)
fun//{}
synread_d0exp_ELSE: synreader(d0exp_ELSE)

(* ****** ****** *)

fun//{}
synread_d0exp_RPAREN: synreader(d0exp_RPAREN)

(* ****** ****** *)
//
fun//{}
synread_d0ecl: synreader(d0ecl)
fun//{}
synread_d0eclist: synreader(d0eclist)
//
fun//{}
synread_ifguardlst: synreader(d0eclist)
//
(* ****** ****** *)
//
fun//{}
synread_INT1: synreader(token)
fun//{}
synread_INT12: synreader(token)
fun//{}
synread_INT123: synreader(token)
//
(* ****** ****** *)

fun//{}
synread_CHAR: synreader(token)

(* ****** ****** *)

fun//{}
synread_STRING: synreader(token)

(* ****** ****** *)
//
fun//{}
synread_EQ: synreader(token)
//
fun//{}
synread_LT: synreader(token)
fun//{}
synread_GT: synreader(token)
fun//{}
synread_LTGT: synreader(token)
fun//{}
synread_LT_GT
(t0: token, t1: token): void
//
fun//{}
synread_BAR: synreader(token)
fun//{}
synread_CLN: synreader(token)
fun//{}
synread_DOT: synreader(token)
fun//{}
synread_SMCLN: synreader(token)
//
fun//{}
synread_EQLT: synreader(token)
fun//{}
synread_EQGT: synreader(token)
//
fun//{}
synread_MSLT: synreader(token)
(*
fun//{}
synread_MSGT: synreader(token)
*)
//
//
fun//{}
synread_DOTLT: synreader(token)
fun//{}
synread_GTDOT: synreader(token)
//
//
fun//{}
synread_LPAREN: synreader(token)
fun//{}
synread_RPAREN: synreader(token)
//
fun//{}
synread_LBRACE: synreader(token)
fun//{}
synread_RBRACE: synreader(token)
//
fun//{}
synread_LBRACK: synreader(token)
fun//{}
synread_RBRACK: synreader(token)
fun//{}
synread_EXISTS: synreader(token)
//
(* ****** ****** *)
//
fun//{}
synread_AS: synreader(token)
fun//{}
synread_OF: synreader(token)
//
(* ****** ****** *)
//
fun//{}
synread_LAM: synreader(token)
fun//{}
synread_FIX: synreader(token)
//
fun//{}
synread_ENDLAM: synreader(token)
fun//{}
synread_ENDFIX: synreader(token)
fun//{}
synread_ENDLAM_opt: synreader(tokenopt)
fun//{}
synread_ENDFIX_opt: synreader(tokenopt)
//
(* ****** ****** *)
//
fun//{}
synread_LET: synreader(token)
fun//{}
synread_ENDLET: synreader(token)
//
(* ****** ****** *)
//
fun//{}
synread_TRY: synreader(token)
fun//{}
synread_ENDTRY: synreader(token)
//
(* ****** ****** *)
//
fun//{}
synread_WHERE: synreader(token)
fun//{}
synread_ENDWHERE: synreader(token)
fun//{}
synread_ENDWHERE_opt: synreader(tokenopt)
//
(* ****** ****** *)
//
fun//{}
synread_WHEN: synreader(token)
fun//{}
synread_WITH: synreader(token)
//
(* ****** ****** *)
//
fun//{}
synread_LOCAL: synreader(token)
fun//{}
synread_ENDLOCAL: synreader(token)
//
(* ****** ****** *)
//
fun//{}
synread_TRCD1: synreader(token)
fun//{}
synread_TRCD2: synreader(token)
//
(* ****** ****** *)
//
fun//{}
synread_IDENT_qual: synreader(token)
//
(* ****** ****** *)
//
(*
fun//{}
synread_SORTDEF: synreader(token)
fun//{}
synread_SEXPDEF: synreader(token)
*)
//
(* ****** ****** *)
//
fun//{}
synread_precopt: synreader(precopt)
fun//{}
synread_precmod: synreader(precmod)
fun//{}
synread_signint: synreader(signint)
//
(* ****** ****** *)
//
fun//{}
synread_s0rtdef: synreader(s0rtdef)
//
(* ****** ****** *)
//
fun//{}
synread_abstdf0: synreader(abstdf0)
//
(* ****** ****** *)
//
fun//{}
synread_g0expdef: synreader(g0expdef)
fun//{}
synread_d0macdef: synreader(d0macdef)
//
(* ****** ****** *)

fun//{}
synread_d0gua: synreader(d0gua)
fun//{}
synread_d0gualst: synreader(d0gualst)

(* ****** ****** *)

fun//{}
synread_d0clau: synreader(d0clau) 
fun//{}
synread_d0gpat: synreader(d0gpat) 
fun//{}
synread_d0claulst: synreader(d0claulst) 

(* ****** ****** *)
//
fun//{}
synread_d0arglst: synreader(d0arglst)
//
fun//{}
synread_a0typlst: synreader(a0typlst)
fun//{}
synread_a0typlstopt: synreader(a0typlstopt)
//
(* ****** ****** *)
fun//{}
synread_st0inv: synreader(st0inv)
fun//{}
synread_st0qua: synreader(st0qua)
fun//{}
synread_d0typlst: synreader(d0typlst)
(* ****** ****** *)
//
fun//{}
synread_wd0eclseq: synreader(wd0eclseq)
fun//{}
synread_d0atypelst: synreader(d0atypelst)
//
(* ****** ****** *)
//
fun//{}
synread_d0cstdeclist: synreader(d0cstdeclist)
//
(* ****** ****** *)
//
fun//{}
synread_f0arglst: synreader(f0arglst)
fun//{}
synread_q0arglst: synreader(q0arglst)
fun//{}
synread_tq0arglst: synreader(tq0arglst)
//
fun//{}
synread_wths0expopt: synreader(wths0expopt)
//
fun//{}
synread_teqd0expopt: synreader(teqd0expopt)
//
(* ****** ****** *)

fun//{}
synread_d0valdeclist: synreader(d0valdeclist)
fun//{}
synread_d0vardeclist: synreader(d0vardeclist)
fun//{}
synread_d0fundeclist: synreader(d0fundeclist)

(* ****** ****** *)

fun//{}
synread_d0eclseq_WHERE: synreader(d0eclseq_WHERE)

(* ****** ****** *)

(* end of [xats_synread.sats] *)
