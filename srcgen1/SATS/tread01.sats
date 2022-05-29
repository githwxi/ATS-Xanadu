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
// Start Time: June, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt"
(* ****** ****** *)
//
#staload "./staexp1.sats"
#staload "./dynexp1.sats"
//
(* ****** ****** *)
//
typedef
treader01
(a:t@ype) = (a) -> void
//
(* ****** ****** *)

datatype
trerr01 =
| TRERR01g1exp of (g1exp)
| TRERR01d1ecl of (d1ecl)

typedef
trerr01lst = List0(trerr01)

(* ****** ****** *)
//
fun//{}
trerr01_add(trerr01): void
//
(* ****** ****** *)
//
fun
tread01_package
  ( p1kg: d1transd ): void
//
(* ****** ****** *)
//
fun//{}
tread01_g1exp: treader01(g1exp)
fun//{}
tread01_g1expopt: treader01(g1expopt)
fun//{}
tread01_g1explst: treader01(g1explst)
//
fun//{}
tread01_g1arg: treader01(g1arg)
fun//{}
tread01_g1marg: treader01(g1marg)
fun//{}
tread01_g1arglst: treader01(g1arglst)
fun//{}
tread01_g1marglst: treader01(g1marglst)
//
(* ****** ****** *)

fun//{}
tread01_sort1: treader01(sort1)
fun//{}
tread01_sort1opt: treader01(sort1opt)

(* ****** ****** *)
//
fun//{}
tread01_s1arg: treader01(s1arg)
fun//{}
tread01_s1marg: treader01(s1marg)
fun//{}
tread01_s1arglst: treader01(s1arglst)
fun//{}
tread01_s1marglst: treader01(s1marglst)
//
(* ****** ****** *)
//
fun//{}
tread01_t1arg: treader01(t1arg)
fun//{}
tread01_t1marg: treader01(t1marg)
fun//{}
tread01_t1arglst: treader01(t1arglst)
fun//{}
tread01_t1marglst: treader01(t1marglst)
//
(* ****** ****** *)
//
fun//{}
tread01_s1uni: treader01(s1uni)
fun//{}
tread01_s1unilst: treader01(s1unilst)
//
(* ****** ****** *)
//
fun//{}
tread01_s1exp: treader01(s1exp)
fun//{}
tread01_s1expopt: treader01(s1expopt)
fun//{}
tread01_s1explst: treader01(s1explst)
//
(* ****** ****** *)
//
fun//{}
tread01_s1qua: treader01(s1qua)
fun//{}
tread01_s1qualst: treader01(s1qualst)
//
(* ****** ****** *)
//
fun
tread01_s1rtdef: treader01(s1rtdef)
//
(* ****** ****** *)
//
fun//{}
tread01_f1unarrow: treader01(f1unarrow)
//
(* ****** ****** *)
//
fun//{}
tread01_effs1expopt: treader01(effs1expopt)
//
(* ****** ****** *)
//
fun//{}
tread01_d1atcon: treader01(d1atcon)
fun//{}
tread01_d1atconlst: treader01(d1atconlst)
//
(* ****** ****** *)
//
fun//{}
tread01_d1pat: treader01(d1pat)
fun//{}
tread01_d1patlst: treader01(d1patlst)
//
(* ****** ****** *)
//
fun//{}
tread01_d1exp: treader01(d1exp)
fun//{}
tread01_d1expopt: treader01(d1expopt)
fun//{}
tread01_d1explst: treader01(d1explst)
//
(* ****** ****** *)
//
fun//{}
tread01_d1ecl: treader01(d1ecl)
fun//{}
tread01_d1eclist: treader01(d1eclist)
//
(* ****** ****** *)
//
fun//{}
tread01_abstdf1: treader01(abstdf1)
//
(* ****** ****** *)
//
fun//{}
tread01_teqd1expopt: treader01(teqd1expopt)
fun//{}
tread01_wths1expopt: treader01(wths1expopt)
//
(* ****** ****** *)
//
fun//{}
tread01_wd1eclseq: treader01(wd1eclseq)
fun//{}
tread01_d1atypelst: treader01(d1atypelst)
//
(* ****** ****** *)
//
fun//{}
tread01_f1arg: treader01(f1arg)
fun//{}
tread01_f1arglst: treader01(f1arglst)
//
fun//{}
tread01_q1arg: treader01(q1arg)
fun//{}
tread01_q1arglst: treader01(q1arglst)
//
fun//{}
tread01_sq1arg: treader01(sq1arg)
fun//{}
tread01_sq1arglst: treader01(sq1arglst)
//
fun//{}
tread01_tq1arg: treader01(tq1arg)
fun//{}
tread01_tq1arglst: treader01(tq1arglst)
//
(* ****** ****** *)
//
fun//{}
tread01_ti1arg: treader01(ti1arg)
fun//{}
tread01_ti1arglst: treader01(ti1arglst)
//
(* ****** ****** *)
//
fun//{}
tread01_d1valdecl: treader01(d1valdecl)
fun//{}
tread01_d1vardecl: treader01(d1vardecl)
fun//{}
tread01_d1fundecl: treader01(d1fundecl)
//
fun//{}
tread01_d1valdeclist: treader01(d1valdeclist)
fun//{}
tread01_d1vardeclist: treader01(d1vardeclist)
fun//{}
tread01_d1fundeclist: treader01(d1fundeclist)
//
(* ****** ****** *)

(* end of [xats_tread01.sats] *)
