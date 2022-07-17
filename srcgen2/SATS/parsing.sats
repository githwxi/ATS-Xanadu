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
//
(*
Author: Hongwei Xi
Start Time: June 13th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./..\
/HATS/xatsopt_sats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME // namespace
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
//
#staload
LEX = "./lexing0.sats"
#staload
S0E = "./staexp0.sats"
#staload
D0E = "./dynexp0.sats"
//
(* ****** ****** *)
//
#typedef tnode = $LEX.tnode
#typedef token = $LEX.token
//
#typedef t0int = $S0E.t0int
#typedef t0chr = $S0E.t0chr
#typedef t0flt = $S0E.t0flt
#typedef t0str = $S0E.t0str
//
#typedef l0abl = $S0E.l0abl
#typedef s0ymb = $S0E.s0ymb
//
#typedef g0nid = $S0E.g0nid
#typedef g0eid = $S0E.g0eid
//
#typedef i0dnt = $S0E.i0dnt
#typedef s0tid = $S0E.s0tid
#typedef s0aid = $S0E.s0aid
#typedef s0eid = $S0E.s0eid
#typedef s0qid = $S0E.s0qid
//
#typedef d0pid = $S0E.d0pid
#typedef d0eid = $S0E.d0eid
#typedef d0qid = $S0E.d0qid
//
#typedef g0nam = $S0E.g0nam
#typedef g0exp = $S0E.g0exp
//
#typedef sort0 = $S0E.sort0
#typedef s0exp = $S0E.s0exp
//
#typedef s0tcn = $S0E.s0tcn
#typedef d0tst = $S0E.d0tst
#typedef s0tdf = $S0E.s0tdf
//
#typedef s0arg = $S0E.s0arg
#typedef s0mag = $S0E.s0mag
#typedef t0arg = $S0E.t0arg
#typedef t0mag = $S0E.t0mag
#typedef s0qua = $S0E.s0qua
//
(* ****** ****** *)
#typedef s0uni = $S0E.s0uni
#typedef d0tcn = $S0E.d0tcn
#typedef d0typ = $S0E.d0typ
(* ****** ****** *)
#typedef a0typ = $D0E.a0typ
#typedef d0arg = $D0E.d0arg
#typedef f0arg = $D0E.f0arg
(* ****** ****** *)
#typedef s0eff = $D0E.s0eff
#typedef s0res = $D0E.s0res
(* ****** ****** *)
#typedef t0qua = $D0E.t0qua
#typedef t0inv = $D0E.t0inv
#typedef d0res = $D0E.d0res
(* ****** ****** *)
//
#typedef d0pat = $D0E.d0pat
#typedef d0exp = $D0E.d0exp
#typedef d0ecl = $D0E.d0ecl
//
#typedef l0d0p = $D0E.l0d0p
#typedef l0d0e = $D0E.l0d0e
//
(* ****** ****** *)
#typedef d0cls = $D0E.d0cls
#typedef d0gua = $D0E.d0gua
#typedef d0gpt = $D0E.d0gpt
(* ****** ****** *)

#typedef a0tdf = $D0E.a0tdf

(* ****** ****** *)

#typedef s0explst = $S0E.s0explst

(* ****** ****** *)
#typedef d0valdcl = $D0E.d0valdcl
#typedef d0vardcl = $D0E.d0vardcl
(* ****** ****** *)

#typedef wd0eclseq = $D0E.wd0eclseq

(* ****** ****** *)
//
#absvwtp tkbf0_vtbx
#vwtpdef tkbf0 = tkbf0_vtbx
//
(* ****** ****** *)
//
#typedef
p1_fun(r0:type) =
(!tkbf0, &sint >> _)->(r0)
#typedef
pq_fun(r0:type) =
(!tkbf0, &sint >> _)->optn(r0)
//
(* ****** ****** *)
//
fun
tokbuf_free(~tkbf0): void
#symload free with tokbuf_free
//
(* ****** ****** *)
//
fun
tokbuf_getk0(!tkbf0): token
fun
tokbuf_getk1(!tkbf0): token
fun
tokbuf_skip1(!tkbf0): (void)
//
#symload getk0 with tokbuf_getk0
#symload getk1 with tokbuf_getk1
#symload skip1 with tokbuf_skip1
//
(* ****** ****** *)
//
#absvwtp tmark_type == sint
#vwtpdef tmark = tmark_type
//
fun
tokbuf_mark_get(!tkbf0): tmark
fun
tokbuf_mark_clr(!tkbf0, tmark): void
fun
tokbuf_mark_set(!tkbf0, tmark): void
//
(* ****** ****** *)
//
fun
tokbuf_make_list_vt
  (tks: list_vt(token)): tkbf0
#symload tokbuf with tokbuf_make_list_vt
//
(* ****** ****** *)
//
fun p1_EQ0: p1_fun(token)
fun pq_EQ0: pq_fun(token)
//
fun p1_GT0: p1_fun(token)
//
fun p1_BAR: p1_fun(token)
fun pq_BAR: pq_fun(token)
//
fun p1_CLN: p1_fun(token)
//
fun p1_EQGT: p1_fun(token)
//
fun p1_GTDOT: p1_fun(token)
//
(* ****** ****** *)
//
fun pq_SMCLN: pq_fun(token)
//
(* ****** ****** *)
//
fun p1_LPAREN: p1_fun(token)
fun p1_RPAREN: p1_fun(token)
fun p1_LBRCKT: p1_fun(token)
fun p1_RBRCKT: p1_fun(token)
fun p1_LBRACE: p1_fun(token)
fun pq_LBRACE: pq_fun(token)
fun p1_RBRACE: p1_fun(token)
//
(* ****** ****** *)
//
fun p1_OF0: p1_fun(token)
//
fun p1_IN0: p1_fun(token)
fun pq_IN0: pq_fun(token)
//
fun p1_WITH: p1_fun(token)
//
(* ****** ****** *)
//
fun p1_END: p1_fun(token)
//
fun pq_ENDLAM: pq_fun(token)
fun pq_ENDFIX: pq_fun(token)
//
fun pq_ENDTRY: pq_fun(token)
//
fun p1_ENDLET: p1_fun(token)
fun p1_ENDLOC: p1_fun(token)
//
(* ****** ****** *)

fun pq_SRP_THEN: pq_fun(token)

(* ****** ****** *)

fun t0_t0int(tnode): bool
fun t0_t0chr(tnode): bool
fun t0_t0flt(tnode): bool
fun t0_t0str(tnode): bool

(* ****** ****** *)
fun t0_dtsel(tnode): bool
(* ****** ****** *)

fun t0_g0nid(tnode): bool
fun t0_g0eid(tnode): bool

fun t0_s0tid(tnode): bool
fun t0_s0aid(tnode): bool
fun t0_s0eid(tnode): bool

fun t0_d0pid(tnode): bool
fun t0_d0eid(tnode): bool

(* ****** ****** *)
//
fun
t0_dctkind: tnode -> bool
//
(* ****** ****** *)

fun p1_t0int: p1_fun(t0int)
fun p1_t0chr: p1_fun(t0chr)
fun p1_t0flt: p1_fun(t0flt)
fun p1_t0str: p1_fun(t0str)

(* ****** ****** *)

fun p1_i0dnt: p1_fun(i0dnt)

fun p1_s0tid: p1_fun(s0tid)

fun p1_s0aid: p1_fun(s0aid)
fun p1_s0eid: p1_fun(s0eid)
fun p1_s0qid: p1_fun(s0qid)

fun p1_d0pid: p1_fun(d0pid)
fun p1_d0eid: p1_fun(d0eid)
fun p1_d0qid: p1_fun(d0qid)

(* ****** ****** *)

fun p1_g0nid: p1_fun(g0nid)
fun p1_g0eid: p1_fun(g0eid)

(* ****** ****** *)

fun p1_l0abl: p1_fun(l0abl)

(* ****** ****** *)

fun p1_s0ymb: p1_fun(s0ymb)

(* ****** ****** *)
//
fun p1_g0nam: p1_fun(g0nam)
fun p1_g0exp: p1_fun(g0exp)
//
(* ****** ****** *)
//
(*
sort0 ::= {atmsort0}+
*)
fun p1_sort0: p1_fun(sort0)
//
(* ****** ****** *)
//
fun p1_s0tcn: p1_fun(s0tcn)
fun p1_d0tst: p1_fun(d0tst)
//
(* ****** ****** *)
//
fun p1_s0exp: p1_fun(s0exp)
//
(* ****** ****** *)
//
fun p1_d0pat: p1_fun(d0pat)
fun p1_l0d0p: p1_fun(l0d0p)
//
fun p1_d0exp: p1_fun(d0exp)
fun p1_l0d0e: p1_fun(l0d0e)
//
fun p1_d0cls: p1_fun(d0cls)
fun p1_d0gua: p1_fun(d0gua)
fun p1_d0gpt: p1_fun(d0gpt)
//
(* ****** ****** *)
//
(*
s0tdf ::=
| sort0
| LBRACE
  s0arg BAR s0expseq_SMCLN
  RBRACE
*)
fun p1_s0tdf: p1_fun(s0tdf)
//
(* ****** ****** *)
fun
pq_sort0_anno: pq_fun(sort0)
fun
pq_ids0t_anno: pq_fun(sort0)
(* ****** ****** *)
//
#typedef s0tcnlst=list(s0tcn)
#typedef d0tstlst=list(d0tst)
//
(* ****** ****** *)
//
#typedef s0arglst=list(s0arg)
#typedef s0maglst=list(s0mag)
#typedef t0arglst=list(t0arg)
#typedef t0maglst=list(t0mag)
//
#typedef s0qualst=list(s0qua)
//
(* ****** ****** *)
//
#typedef s0unilst=list(s0uni)
#typedef d0tcnlst=list(d0tcn)
#typedef d0typlst=list(d0typ)
//
(* ****** ****** *)
//
#typedef a0typlst=list(a0typ)
#typedef d0arglst=list(d0arg)
#typedef f0arglst=list(f0arg)
//
(* ****** ****** *)
//
#typedef d0patlst=list(d0pat)
#typedef d0explst=list(d0exp)
#typedef d0clslst=list(d0cls)
#typedef d0eclist=list(d0ecl)
//
(* ****** ****** *)
//
fun
p1_s0magseq: p1_fun(s0maglst)
fun
p1_t0magseq: p1_fun(t0maglst)
//
(* ****** ****** *)
fun
p1_sort0_app_NGT0: p1_fun(sort0)
(* ****** ****** *)
fun
p1_s0exp_app_NEQ0: p1_fun(s0exp)
fun
p1_s0exp_app_NGT0: p1_fun(s0exp)
(* ****** ****** *)
//
fun
p1_s0tcnseq_BAR: p1_fun(s0tcnlst)
fun
p1_d0tstseq_AND: p1_fun(d0tstlst)
//
(* ****** ****** *)
fun
p1_s0argseq_COMMA: p1_fun(s0arglst)
fun
p1_t0argseq_COMMA: p1_fun(t0arglst)
fun
p1_s0quaseq_BSCLN: p1_fun(s0qualst)
(* ****** ****** *)
fun
p1_s0expseq_COMMA: p1_fun(s0explst)
fun
p1_s0expseq_SMCLN: p1_fun(s0explst)
(* ****** ****** *)
//
(*
d0typ ::=
| s0eid s0mag EQ d0tcnseq_BAR
*)
//
fun p1_s0uni: p1_fun( s0uni )
fun p1_d0tcn: p1_fun( d0tcn )
fun p1_d0typ: p1_fun( d0typ )
//
fun p1_a0typ: p1_fun( a0typ )
fun p1_d0arg: p1_fun( d0arg )
fun p1_f0arg: p1_fun( f0arg )
//
(* ****** ****** *)
//
(*
fun p1_s0eff: p1_fun( s0eff )
*)
fun p1_s0res: p1_fun( s0res )
//
fun p1_d0res: p1_fun( d0res )
//
(* ****** ****** *)
fun
pq_s0exp_anno: pq_fun( s0exp )
(* ****** ****** *)
//
fun
p1_s0uniseq: p1_fun( s0unilst )
fun
p1_d0tcnseq_BAR: p1_fun(d0tcnlst)
fun
p1_d0typseq_AND: p1_fun(d0typlst)
//
(* ****** ****** *)
//
fun
p1_WHERE_sexpdefseq: p1_fun(d0eclist)
//
(* ****** ****** *)
//
#typedef
fp_fun(syn:type) =
( sint // flag=0/1
, !tkbf0, &sint >> _) -> syn
//
#typedef d0eclist = list(d0ecl)
//
(* ****** ****** *)
//
fun
fp_d0ecl: fp_fun(d0ecl)
//
fun
p1_a0tdf: p1_fun(a0tdf)
//
(* ****** ****** *)
fun
p1_f0argseq: p1_fun(f0arglst)
fun
p1_f0argsq1: p1_fun(f0arglst)
(* ****** ****** *)
//
fun
fp_d0eclseq: fp_fun(d0eclist)
//
(* ****** ****** *)
//
fun
fp_d0eclsq1: fp_fun(d0eclist)
//
(* ****** ****** *)
fun
p1_d0eclseq_sta: p1_fun(d0eclist)
fun
p1_d0eclseq_dyn: p1_fun(d0eclist)
(* ****** ****** *)
fun
p1_d0eclsq1_sta: p1_fun(d0eclist)
fun
p1_d0eclsq1_dyn: p1_fun(d0eclist)
(* ****** ****** *)
(*
//
HX-2022-06-16:
various helper functions for
parsing general syntactic entities
//
*)
(* ****** ****** *)
//
fun
ps_p1fun{a:tx}
(
  buf: !tkbf0
, err: &int >> int, pfn: p1_fun(a)
) : list_vt(a) // end of [ps_p1fun]
//
(* ****** ****** *)
//
fun
ps_AND_p1fun{a:tx}
(
  buf: !tkbf0
, err: &(int) >> int, pfn: p1_fun(a)
) : list_vt(a) // end of [ps_AND_p1fun]
fun
ps_BAR_p1fun{a:tx}
(
  buf: !tkbf0
, err: &(int) >> int, pfn: p1_fun(a)
) : list_vt(a) // end of [ps_BAR_p1fun]
//
(* ****** ****** *)
//
fun
ps_COMMA_p1fun{a:tx}
(
  buf: !tkbf0
, err: &(int) >> int, pfn: p1_fun(a)
) : list_vt(a) //end-of-[ps_COMMA_p1fun]
fun
ps_SMCLN_p1fun{a:tx}
(
  buf: !tkbf0
, err: &(int) >> int, pfn: p1_fun(a)
) : list_vt(a) //end-of-[ps_SMCLN_p1fun]
fun
ps_BSCLN_p1fun{a:tx}
(
  buf: !tkbf0
, err: &(int) >> int, pfn: p1_fun(a)
) : list_vt(a) //end-of-[ps_SMCLN_p1fun]
//
(* ****** ****** *)
fun
ps_sep_p1fun{a:tx}
(
  buf: !tkbf0
, err: &int >> int
, fsp: tnode -> bool, pfn: p1_fun(a)
) : list_vt(a) // end of [ps_sep_p1fun]
//
(* ****** ****** *)
(*
// HX-2022-06-16:
// Some testing functions
*)
(* ****** ****** *)
//
fun
<r0:t0>
p1_fun_test_strn
(inp: strn, pfn: p1_fun(r0)): optn(r0)
fun
<r0:t0>
pq_fun_test_strn
(inp: strn, pfn: pq_fun(r0)): optn(r0)
//
(* ****** ****** *)
fun
<r0:t0>
p1_fun_test_fpath
(fpx: strn, pfn: p1_fun(r0)): optn(r0)
fun
<r0:t0>
pq_fun_test_fpath
(fpx: strn, pfn: pq_fun(r0)): optn(r0)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_parsing.sats] *)
