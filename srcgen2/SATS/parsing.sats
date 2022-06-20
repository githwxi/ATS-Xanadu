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
#typedef d0pid = $S0E.d0pid
#typedef d0eid = $S0E.d0eid
//
#typedef g0nam = $S0E.g0nam
#typedef g0exp = $S0E.g0exp
//
#typedef sort0 = $S0E.sort0
#typedef s0exp = $S0E.s0exp
#typedef s0tdf = $S0E.s0tdf
//
#typedef s0arg = $S0E.s0arg
#typedef s0mag = $S0E.s0mag
#typedef t0arg = $S0E.t0arg
#typedef t0mag = $S0E.t0mag
//
(* ****** ****** *)

#typedef d0pat = $D0E.d0pat
#typedef d0exp = $D0E.d0exp
#typedef d0ecl = $D0E.d0ecl

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
fun p1_ENDLET: p1_fun(token)
fun p1_ENDTRY: p1_fun(token)
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

fun t0_g0nid(tnode): bool
fun t0_g0eid(tnode): bool

fun t0_s0tid(tnode): bool
fun t0_s0aid(tnode): bool
fun t0_s0eid(tnode): bool

fun t0_d0pid(tnode): bool
fun t0_d0eid(tnode): bool

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

fun p1_d0pid: p1_fun(d0pid)
fun p1_d0eid: p1_fun(d0eid)

(* ****** ****** *)

fun p1_l0abl: p1_fun(l0abl)

(* ****** ****** *)

fun p1_s0ymb: p1_fun(s0ymb)

(* ****** ****** *)

fun p1_g0nid: p1_fun(g0nid)
fun p1_g0eid: p1_fun(g0eid)

(* ****** ****** *)
//
(*
sort0 ::= {atmsort0}+
*)
fun p1_sort0: p1_fun(sort0)
//
(* ****** ****** *)
//
fun p1_s0exp: p1_fun(s0exp)
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
(* ****** ****** *)
fun
p1_sort0_app_NGT: p1_fun(sort0)
(* ****** ****** *)
fun
p1_s0exp_app_NEQ: p1_fun(s0exp)
fun
p1_s0exp_app_NGT: p1_fun(s0exp)
(* ****** ****** *)
//
#typedef
fp_fun(syn:type) =
( sint // flag=0/1
, !tkbf0, &sint >> _) -> syn
//
#typedef d0eclist = list(d0ecl)
//
fun
fp_d0ecl: fp_fun(d0ecl)
fun
fp_d0eclseq: fp_fun(d0eclist)
//
fun
fp_d0eclseq_top: fp_fun(d0eclist)
//
(* ****** ****** *)
fun
p1_d0eclseq_sta: p1_fun(d0eclist)
fun
p1_d0eclseq_dyn: p1_fun(d0eclist)
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
