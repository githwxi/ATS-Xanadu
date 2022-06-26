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
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME // namespace
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload
LEX = "./lexing0.sats"
#staload
S0E = "./staexp0.sats"
#staload
D0E = "./dynexp0.sats"
(* ****** ****** *)
#typedef token = $LEX.token
(* ****** ****** *)
#typedef i0dnt = $S0E.i0dnt
(* ****** ****** *)
#typedef t0int = $S0E.t0int
#typedef t0chr = $S0E.t0chr
#typedef t0flt = $S0E.t0flt
#typedef t0str = $S0E.t0str
(* ****** ****** *)
#typedef sort0 = $S0E.sort0
#typedef s0exp = $S0E.s0exp
#typedef l0s0e = $S0E.l0s0e
(* ****** ****** *)
#typedef s0arg = $S0E.s0arg
#typedef s0mag = $S0E.s0mag
#typedef s0qua = $S0E.s0qua
(* ****** ****** *)
#typedef
s0exp_RPAREN = $S0E.s0exp_RPAREN
#typedef
l0s0e_RBRACE = $S0E.l0s0e_RBRACE
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
#typedef s0qualst = $S0E.s0qualst
(* ****** ****** *)
#typedef d0pat = $D0E.d0pat
#typedef d0exp = $D0E.d0exp
#typedef d0ecl = $D0E.d0ecl
(* ****** ****** *)
#typedef
d0exp_RPAREN = $D0E.d0exp_RPAREN
#typedef
l0d0e_RBRACE = $D0E.l0d0e_RBRACE
(* ****** ****** *)
#typedef d0patopt = $D0E.d0patopt
#typedef d0expopt = $D0E.d0expopt
(* ****** ****** *)
#typedef d0patlst = $D0E.d0patlst
#typedef d0explst = $D0E.d0explst
#typedef d0eclist = $D0E.d0eclist
(* ****** ****** *)
//
#typedef
fpreadx0
(syn: tx) =
(syn , &sint >> _) -> syn
//
(* ****** ****** *)
(*
//HX: for checking statics
*)
(* ****** ****** *)
fun preadx0_i0dnt: fpreadx0(i0dnt)
(* ****** ****** *)
fun preadx0_sort0: fpreadx0(sort0)
fun preadx0_s0exp: fpreadx0(s0exp)
fun preadx0_l0s0e: fpreadx0(l0s0e)
(* ****** ****** *)
fun preadx0_s0arg: fpreadx0(s0arg)
fun preadx0_s0mag: fpreadx0(s0mag)
fun preadx0_s0qua: fpreadx0(s0qua)
(* ****** ****** *)
#symload preadx0 with preadx0_i0dnt
(* ****** ****** *)
#symload preadx0 with preadx0_sort0
#symload preadx0 with preadx0_s0exp
#symload preadx0 with preadx0_l0s0e
(* ****** ****** *)
#symload preadx0 with preadx0_s0arg
#symload preadx0 with preadx0_s0mag
#symload preadx0 with preadx0_s0qua
(* ****** ****** *)
fun
preadx0_sort0opt: fpreadx0(sort0opt)
fun
preadx0_s0expopt: fpreadx0(s0expopt)
(* ****** ****** *)
fun
preadx0_sort0lst: fpreadx0(sort0lst)
(* ****** ****** *)
fun
preadx0_s0explst: fpreadx0(s0explst)
fun
preadx0_l0s0elst: fpreadx0(l0s0elst)
(* ****** ****** *)
fun
preadx0_s0arglst: fpreadx0(s0arglst)
fun
preadx0_s0maglst: fpreadx0(s0maglst)
fun
preadx0_s0qualst: fpreadx0(s0qualst)
(* ****** ****** *)
#symload preadx0 with preadx0_sort0opt
#symload preadx0 with preadx0_s0expopt
#symload preadx0 with preadx0_sort0lst
#symload preadx0 with preadx0_s0explst
#symload preadx0 with preadx0_l0s0elst
(* ****** ****** *)
#symload preadx0 with preadx0_s0arglst
#symload preadx0 with preadx0_s0maglst
#symload preadx0 with preadx0_s0qualst
(* ****** ****** *)
fun
preadx0_s0exp_RPAREN: fpreadx0(s0exp_RPAREN)
fun
preadx0_l0s0e_RBRACE: fpreadx0(l0s0e_RBRACE)
(* ****** ****** *)
(*
//HX: for checking dynamics
*)
(* ****** ****** *)
fun preadx0_d0pat: fpreadx0(d0pat)
fun preadx0_d0exp: fpreadx0(d0exp)
fun preadx0_d0ecl: fpreadx0(d0ecl)
(* ****** ****** *)
fun
preadx0_d0patlst: fpreadx0(d0patlst)
fun
preadx0_d0explst: fpreadx0(d0explst)
fun
preadx0_d0eclist: fpreadx0(d0eclist)
(* ****** ****** *)
fun
preadx0_d0exp_RPAREN: fpreadx0(d0exp_RPAREN)
(*
fun
preadx0_l0d0e_RBRACE: fpreadx0(l0d0e_RBRACE)
*)
(* ****** ****** *)
//
//HX-2022-06-18: printing errmsgs
//
(* ****** ****** *)
fun i0dnt_fpemsg(FILR, i0dnt): void
(* ****** ****** *)
fun t0int_fpemsg(FILR, t0int): void
fun t0chr_fpemsg(FILR, t0chr): void
fun t0flt_fpemsg(FILR, t0flt): void
fun t0str_fpemsg(FILR, t0str): void
(* ****** ****** *)
fun sort0_fpemsg(FILR, sort0): void
fun s0exp_fpemsg(FILR, s0exp): void
fun l0s0e_fpemsg(FILR, l0s0e): void
(* ****** ****** *)
fun
sort0opt_fpemsg(FILR, sort0opt): void
fun
s0expopt_fpemsg(FILR, s0expopt): void
fun
sort0lst_fpemsg(FILR, sort0lst): void
fun
s0explst_fpemsg(FILR, s0explst): void
fun
l0s0elst_fpemsg(FILR, l0s0elst): void
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
fun d0ecl_fpemsg(FILR, d0ecl): void
(* ****** ****** *)
fun
d0patopt_fpemsg(FILR, d0patopt): void
fun
d0expopt_fpemsg(FILR, d0expopt): void
fun
d0patlst_fpemsg(FILR, d0patlst): void
fun
d0explst_fpemsg(FILR, d0explst): void
(* ****** ****** *)
fun
d0eclist_fpemsg(FILR, d0eclist): void
(* ****** ****** *)
//
fun
d0exp_RPAREN_fpemsg
  (out: FILR, drp: d0exp_RPAREN): void
fun
l0d0e_RBRACE_fpemsg
  (out: FILR, ldrb: l0d0e_RBRACE): void
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_preadx0.sats] *)
