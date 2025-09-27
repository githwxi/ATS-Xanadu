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
Start Time: June 17th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload
LEX = "./lexing0.sats"
(* ****** ****** *)
#staload
S0E = "./staexp0.sats"
#staload
D0E = "./dynexp0.sats"
(* ****** ****** *)
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
(* ****** ****** *)
#define
ATS_PACKNAME // namespace
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
#typedef token = $LEX.token
(* ****** ****** *)
#typedef i0dnt = $S0E.i0dnt
(* ****** ****** *)
#typedef l0abl = $S0E.l0abl
#typedef s0ymb = $S0E.s0ymb
(* ****** ****** *)
#typedef s0qid = $S0E.s0qid
#typedef d0qid = $S0E.d0qid
(* ****** ****** *)
#typedef t0int = $S0E.t0int
#typedef t0chr = $S0E.t0chr
#typedef t0flt = $S0E.t0flt
#typedef t0str = $S0E.t0str
(* ****** ****** *)
#typedef g0exp = $S0E.g0exp
#typedef g0mag = $S0E.g0mag
(* ****** ****** *)
#typedef sort0 = $S0E.sort0
#typedef s0exp = $S0E.s0exp
#typedef l0s0e = $S0E.l0s0e
(* ****** ****** *)
#typedef s0arg = $S0E.s0arg
#typedef s0mag = $S0E.s0mag
#typedef t0arg = $S0E.t0arg
#typedef t0mag = $S0E.t0mag
(* ****** ****** *)
#typedef s0qua = $S0E.s0qua
#typedef s0uni = $S0E.s0uni
(* ****** ****** *)
#typedef s0tdf = $S0E.s0tdf
(* ****** ****** *)
#typedef d0pat = $D0E.d0pat
#typedef d0exp = $D0E.d0exp
(* ****** ****** *)
#typedef l0d0p = $D0E.l0d0p
#typedef l0d0e = $D0E.l0d0e
(* ****** ****** *)
#typedef f0arg = $D0E.f0arg
#typedef s0res = $D0E.s0res
#typedef d0res = $D0E.d0res
(* ****** ****** *)
#typedef t0qua = $D0E.t0qua
#typedef t0inv = $D0E.t0inv
(* ****** ****** *)
#typedef d0cls = $D0E.d0cls
#typedef d0gua = $D0E.d0gua
#typedef d0gpt = $D0E.d0gpt
(* ****** ****** *)
#typedef d0ecl = $D0E.d0ecl
(* ****** ****** *)
#typedef a0tdf = $D0E.a0tdf
(* ****** ****** *)
#typedef
s0exp_RPAREN = $S0E.s0exp_RPAREN
#typedef
l0s0e_RBRACE = $S0E.l0s0e_RBRACE
(* ****** ****** *)
#typedef i0dntopt = $S0E.i0dntopt
#typedef i0dntlst = $S0E.i0dntlst
(* ****** ****** *)
#typedef g0explst = $S0E.g0explst
#typedef g0expopt = $S0E.g0expopt
(* ****** ****** *)
#typedef g0maglst = $S0E.g0maglst
(* ****** ****** *)
#typedef s0expopt = $S0E.s0expopt
#typedef sort0opt = $S0E.sort0opt
(* ****** ****** *)
#typedef sort0lst = $S0E.sort0lst
#typedef s0explst = $S0E.s0explst
#typedef l0s0elst = $S0E.l0s0elst
(* ****** ****** *)
#typedef s0arglst = $S0E.s0arglst
#typedef s0maglst = $S0E.s0maglst
#typedef t0arglst = $S0E.t0arglst
#typedef t0maglst = $S0E.t0maglst
(* ****** ****** *)
#typedef s0qualst = $S0E.s0qualst
#typedef s0unilst = $S0E.s0unilst
(* ****** ****** *)
(* ****** ****** *)
//
#typedef
d0exp_THEN = $D0E.d0exp_THEN
#typedef
d0exp_ELSE = $D0E.d0exp_ELSE
//
#typedef
d0pat_RPAREN = $D0E.d0pat_RPAREN
#typedef
l0d0p_RBRACE = $D0E.l0d0p_RBRACE
//
#typedef
d0exp_RPAREN = $D0E.d0exp_RPAREN
#typedef
l0d0e_RBRACE = $D0E.l0d0e_RBRACE
//
#typedef
d0eclseq_WHERE = $D0E.d0eclseq_WHERE
//
(* ****** ****** *)
(* ****** ****** *)
#typedef f0unarrw = $D0E.f0unarrw
(* ****** ****** *)
#typedef d0patopt = $D0E.d0patopt
#typedef d0expopt = $D0E.d0expopt
(* ****** ****** *)
#typedef d0patlst = $D0E.d0patlst
#typedef l0d0plst = $D0E.l0d0plst
#typedef d0explst = $D0E.d0explst
#typedef l0d0elst = $D0E.l0d0elst
(* ****** ****** *)
#typedef f0arglst = $D0E.f0arglst
(* ****** ****** *)
#typedef t0qualst = $D0E.t0qualst
(* ****** ****** *)
#typedef d0clslst = $D0E.d0clslst
#typedef d0gualst = $D0E.d0gualst
(* ****** ****** *)
#typedef d0eclist = $D0E.d0eclist
(* ****** ****** *)
#typedef d0parsed = $D0E.d0parsed
(* ****** ****** *)
#typedef d0eclistopt = optn(d0eclist)
(* ****** ****** *)
//
fun
d0parsed_of_pread00
(prgm: d0parsed): d0parsed
//
(* ****** ****** *)
//
#typedef
fpread00
(syn: tx) =
(syn , &sint >> _) -> (syn)
//
(* ****** ****** *)
(*
//HX: for checking statics
*)
(* ****** ****** *)
fun pread00_i0dnt: fpread00(i0dnt)
(* ****** ****** *)
fun pread00_l0abl: fpread00(l0abl)
fun pread00_s0ymb: fpread00(s0ymb)
(* ****** ****** *)
fun pread00_s0qid: fpread00(s0qid)
fun pread00_d0qid: fpread00(d0qid)
(* ****** ****** *)
fun pread00_g0exp: fpread00(g0exp)
fun pread00_g0mag: fpread00(g0mag)
(* ****** ****** *)
fun pread00_sort0: fpread00(sort0)
fun pread00_s0exp: fpread00(s0exp)
fun pread00_l0s0e: fpread00(l0s0e)
(* ****** ****** *)
fun pread00_s0arg: fpread00(s0arg)
fun pread00_s0mag: fpread00(s0mag)
fun pread00_t0arg: fpread00(t0arg)
fun pread00_t0mag: fpread00(t0mag)
fun pread00_s0qua: fpread00(s0qua)
(* ****** ****** *)
fun pread00_s0tdf: fpread00(s0tdf)
(* ****** ****** *)
#symload pread00 with pread00_i0dnt
#symload pread00 with pread00_s0qid
#symload pread00 with pread00_d0qid
(* ****** ****** *)
#symload pread00 with pread00_g0exp
#symload pread00 with pread00_g0mag
(* ****** ****** *)
#symload pread00 with pread00_sort0
#symload pread00 with pread00_s0exp
#symload pread00 with pread00_l0s0e
(* ****** ****** *)
#symload pread00 with pread00_s0arg
#symload pread00 with pread00_s0mag
#symload pread00 with pread00_t0arg
#symload pread00 with pread00_t0mag
#symload pread00 with pread00_s0qua
(* ****** ****** *)
//
fun
list_pread00_fnp
{syn:tx}
( lst: list(syn)
, err: &sint >> _
, fpr: fpread00(syn)): list(syn)
//
fun
optn_pread00_fnp
{syn:tx}
( opt: optn(syn)
, err: &sint >> _
, fpr: fpread00(syn)): optn(syn)
//
(* ****** ****** *)
fun
pread00_i0dntopt: fpread00(i0dntopt)
fun
pread00_i0dntlst: fpread00(i0dntlst)
(* ****** ****** *)
fun
pread00_g0explst: fpread00(g0explst)
fun
pread00_g0expopt: fpread00(g0expopt)
(* ****** ****** *)
fun
pread00_g0maglst: fpread00(g0maglst)
(* ****** ****** *)
fun
pread00_sort0lst: fpread00(sort0lst)
fun
pread00_sort0opt: fpread00(sort0opt)
(* ****** ****** *)
fun
pread00_s0explst: fpread00(s0explst)
fun
pread00_s0expopt: fpread00(s0expopt)
(* ****** ****** *)
fun
pread00_l0s0elst: fpread00(l0s0elst)
(* ****** ****** *)
fun
pread00_s0arglst: fpread00(s0arglst)
fun
pread00_s0maglst: fpread00(s0maglst)
fun
pread00_t0arglst: fpread00(t0arglst)
fun
pread00_t0maglst: fpread00(t0maglst)
fun
pread00_s0qualst: fpread00(s0qualst)
(* ****** ****** *)
#symload pread00 with pread00_sort0opt
#symload pread00 with pread00_s0expopt
#symload pread00 with pread00_sort0lst
#symload pread00 with pread00_s0explst
#symload pread00 with pread00_l0s0elst
(* ****** ****** *)
#symload pread00 with pread00_s0arglst
#symload pread00 with pread00_s0maglst
#symload pread00 with pread00_t0maglst
#symload pread00 with pread00_s0qualst
(* ****** ****** *)
fun
pread00_s0exp_RPAREN: fpread00(s0exp_RPAREN)
fun
pread00_l0s0e_RBRACE: fpread00(l0s0e_RBRACE)
(* ****** ****** *)
(*
//HX: for checking dynamics
*)
(* ****** ****** *)
fun pread00_d0pat: fpread00(d0pat)
fun pread00_l0d0p: fpread00(l0d0p)
fun pread00_d0exp: fpread00(d0exp)
fun pread00_l0d0e: fpread00(l0d0e)
(* ****** ****** *)
fun pread00_f0arg: fpread00(f0arg)
(* ****** ****** *)
fun pread00_s0res: fpread00(s0res)
fun pread00_d0res: fpread00(d0res)
(* ****** ****** *)
fun pread00_t0inv: fpread00(t0inv)
(* ****** ****** *)
fun pread00_d0cls: fpread00(d0cls)
fun pread00_d0gua: fpread00(d0gua)
fun pread00_d0gpt: fpread00(d0gpt)
(* ****** ****** *)
fun pread00_d0ecl: fpread00(d0ecl)
(* ****** ****** *)
fun pread00_a0tdf: fpread00(a0tdf)
(* ****** ****** *)
fun
pread00_d0patopt: fpread00(d0patopt)
fun
pread00_d0expopt: fpread00(d0expopt)
(* ****** ****** *)
//
fun
pread00_d0patlst: fpread00(d0patlst)
fun
pread00_d0explst: fpread00(d0explst)
//
fun
pread00_d0expseq: fpread00(d0explst)
//
fun
pread00_l0d0plst: fpread00(l0d0plst)
fun
pread00_l0d0elst: fpread00(l0d0elst)
//
(* ****** ****** *)
fun
pread00_f0arglst: fpread00(f0arglst)
(* ****** ****** *)
fun
pread00_d0clslst: fpread00(d0clslst)
fun
pread00_d0gualst: fpread00(d0gualst)
(* ****** ****** *)
fun
pread00_d0eclist: fpread00(d0eclist)
(* ****** ****** *)
fun
pread00_d0eclistopt: fpread00(d0eclistopt)
(* ****** ****** *)
//
#symload pread00 with pread00_d0pat
#symload pread00 with pread00_d0exp
#symload pread00 with pread00_d0ecl
//
#symload pread00 with pread00_d0patlst
#symload pread00 with pread00_d0explst
#symload pread00 with pread00_d0eclist
//
#symload pread00 with pread00_d0eclistopt
//
(* ****** ****** *)
//
fun
pread00_d0pat_RPAREN: fpread00(d0pat_RPAREN)
fun
pread00_l0d0p_RBRACE: fpread00(l0d0p_RBRACE)
//
(* ****** ****** *)
//
fun
pread00_d0exp_THEN: fpread00(d0exp_THEN)
fun
pread00_d0exp_ELSE: fpread00(d0exp_ELSE)
//
(* ****** ****** *)
//
fun
pread00_d0exp_RPAREN: fpread00(d0exp_RPAREN)
fun
pread00_l0d0e_RBRACE: fpread00(l0d0e_RBRACE)
//
(* ****** ****** *)
fun
pread00_d0eclseq_WHERE: fpread00(d0eclseq_WHERE)
(* ****** ****** *)
//
//HX-2022-06-18: printing errmsgs
//
(* ****** ****** *)
fun s0ymb_fpemsg(FILR, s0ymb): void
(* ****** ****** *)
fun i0dnt_fpemsg(FILR, i0dnt): void
(* ****** ****** *)
fun l0abl_fpemsg(FILR, l0abl): void
(* ****** ****** *)
fun t0int_fpemsg(FILR, t0int): void
fun t0chr_fpemsg(FILR, t0chr): void
fun t0flt_fpemsg(FILR, t0flt): void
fun t0str_fpemsg(FILR, t0str): void
(* ****** ****** *)
fun s0qid_fpemsg(FILR, s0qid): void
fun d0qid_fpemsg(FILR, d0qid): void
(* ****** ****** *)
fun g0exp_fpemsg(FILR, g0exp): void
(* ****** ****** *)
fun sort0_fpemsg(FILR, sort0): void
fun s0exp_fpemsg(FILR, s0exp): void
fun l0s0e_fpemsg(FILR, l0s0e): void
(* ****** ****** *)
fun s0arg_fpemsg(FILR, s0arg): void
fun s0mag_fpemsg(FILR, s0mag): void
fun t0arg_fpemsg(FILR, t0arg): void
fun t0mag_fpemsg(FILR, t0mag): void
(* ****** ****** *)
fun s0qua_fpemsg(FILR, s0qua): void
fun s0uni_fpemsg(FILR, s0uni): void
(* ****** ****** *)
fun s0tdf_fpemsg(FILR, s0tdf): void
(* ****** ****** *)
fun
i0dntlst_fpemsg(FILR, i0dntlst): void
(* ****** ****** *)
fun
g0expopt_fpemsg(FILR, g0expopt): void
(* ****** ****** *)
fun
sort0opt_fpemsg(FILR, sort0opt): void
fun
s0expopt_fpemsg(FILR, s0expopt): void
(* ****** ****** *)
fun
sort0lst_fpemsg(FILR, sort0lst): void
fun
s0explst_fpemsg(FILR, s0explst): void
fun
l0s0elst_fpemsg(FILR, l0s0elst): void
(* ****** ****** *)
fun
s0arglst_fpemsg(FILR, s0arglst): void
fun
s0maglst_fpemsg(FILR, s0maglst): void
fun
t0arglst_fpemsg(FILR, t0arglst): void
fun
t0maglst_fpemsg(FILR, t0maglst): void
(* ****** ****** *)
fun
s0qualst_fpemsg(FILR, s0qualst): void
fun
s0unilst_fpemsg(FILR, s0unilst): void
(* ****** ****** *)
//
fun
s0exp_RPAREN_fpemsg
  (out: FILR, srp: s0exp_RPAREN): void
fun
l0s0e_RBRACE_fpemsg
  (out: FILR, lsrb: l0s0e_RBRACE): void
//
(* ****** ****** *)
fun d0pat_fpemsg(FILR, d0pat): void
fun d0exp_fpemsg(FILR, d0exp): void
fun l0d0p_fpemsg(FILR, l0d0p): void
fun l0d0e_fpemsg(FILR, l0d0e): void
(* ****** ****** *)
fun d0cls_fpemsg(FILR, d0cls): void
fun d0gua_fpemsg(FILR, d0gua): void
fun d0gpt_fpemsg(FILR, d0gpt): void
(* ****** ****** *)
fun d0ecl_fpemsg(FILR, d0ecl): void
(* ****** ****** *)
fun
d0patopt_fpemsg(FILR, d0patopt): void
fun
d0expopt_fpemsg(FILR, d0expopt): void
(* ****** ****** *)
fun
d0patlst_fpemsg(FILR, d0patlst): void
fun
l0d0plst_fpemsg(FILR, l0d0plst): void
fun
d0explst_fpemsg(FILR, d0explst): void
fun
l0d0elst_fpemsg(FILR, l0d0elst): void
(* ****** ****** *)
fun
d0clslst_fpemsg(FILR, d0clslst): void
fun
d0gualst_fpemsg(FILR, d0gualst): void
(* ****** ****** *)
fun
d0eclist_fpemsg(FILR, d0eclist): void
(* ****** ****** *)
fun
f0unarrw_fpemsg(FILR, f0unarrw): void
(* ****** ****** *)
//
fun
d0parsed_fpemsg
( out: FILR, dpar: d0parsed ): void
fun
d0eclistopt_fpemsg
( out: FILR, dopt: d0eclistopt ): void
//
(* ****** ****** *)
//
fun
d0exp_THEN_fpemsg
  (out: FILR, dthn: d0exp_THEN): void
fun
d0exp_ELSE_fpemsg
  (out: FILR, dthn: d0exp_ELSE): void
//
(* ****** ****** *)
//
fun
d0pat_RPAREN_fpemsg
  (out: FILR, drp0: d0pat_RPAREN): void
fun
l0d0p_RBRACE_fpemsg
  (out: FILR, ldrb: l0d0p_RBRACE): void
//
(* ****** ****** *)
//
fun
d0exp_RPAREN_fpemsg
  (out: FILR, drp0: d0exp_RPAREN): void
fun
l0d0e_RBRACE_fpemsg
  (out: FILR, ldrb: l0d0e_RBRACE): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_SATS_pread00.sats] *)
(***********************************************************************)
