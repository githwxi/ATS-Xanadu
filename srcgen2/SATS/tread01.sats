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
(*
Sun Jul 24 18:17:29 EDT 2022
*)
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
(* ****** ****** *)
#staload
S1E = "./staexp1.sats"
#staload
D1E = "./dynexp1.sats"
(* ****** ****** *)
#typedef token = $LEX.token
(* ****** ****** *)
#typedef g1exp = $S1E.g1exp
(* ****** ****** *)
#typedef sort1 = $S1E.sort1
#typedef s1exp = $S1E.s1exp
#typedef l1s1e = $S1E.l1s1e
(* ****** ****** *)
#typedef s1arg = $S1E.s1arg
#typedef s1mag = $S1E.s1mag
#typedef t1arg = $S1E.t1arg
#typedef t1mag = $S1E.t1mag
(* ****** ****** *)
#typedef s1qua = $S1E.s1qua
(* ****** ****** *)
#typedef s1uni = $S1E.s1uni
(* ****** ****** *)
#typedef s1tdf = $S1E.s1tdf
(* ****** ****** *)
#typedef s1tcn = $S1E.s1tcn
#typedef d1tst = $S1E.d1tst
(* ****** ****** *)
#typedef d1tcn = $S1E.d1tcn
#typedef d1typ = $S1E.d1typ
(* ****** ****** *)
#typedef d1pat = $D1E.d1pat
#typedef d1exp = $D1E.d1exp
#typedef l1d1p = $D1E.l1d1p
#typedef l1d1e = $D1E.l1d1e
(* ****** ****** *)
#typedef f1arg = $D1E.f1arg
(* ****** ****** *)
#typedef s1res = $D1E.s1res
(* ****** ****** *)
#typedef d1ecl = $D1E.d1ecl
(* ****** ****** *)
#typedef a1tdf = $D1E.a1tdf
(* ****** ****** *)
#typedef teqd1exp = $D1E.teqd1exp
#typedef wths1exp = $D1E.wths1exp
(* ****** ****** *)
#typedef d1valdcl = $D1E.d1valdcl
#typedef d1vardcl = $D1E.d1vardcl
#typedef d1fundcl = $D1E.d1fundcl
#typedef d1cstdcl = $D1E.d1cstdcl
(* ****** ****** *)
#typedef g1explst = $S1E.g1explst
#typedef g1expopt = $S1E.g1expopt
(* ****** ****** *)
#typedef sort1lst = $S1E.sort1lst
#typedef sort1opt = $S1E.sort1opt
(* ****** ****** *)
#typedef s1explst = $S1E.s1explst
#typedef s1expopt = $S1E.s1expopt
(* ****** ****** *)
#typedef l1s1elst = $S1E.l1s1elst
(* ****** ****** *)
#typedef s1arglst = $S1E.s1arglst
#typedef s1maglst = $S1E.s1maglst
#typedef t1arglst = $S1E.t1arglst
#typedef t1maglst = $S1E.t1maglst
(* ****** ****** *)
#typedef s1qualst = $S1E.s1qualst
(* ****** ****** *)
#typedef s1unilst = $S1E.s1unilst
(* ****** ****** *)
#typedef s1tcnlst = $S1E.s1tcnlst
#typedef d1tstlst = $S1E.d1tstlst
(* ****** ****** *)
#typedef d1tcnlst = $S1E.d1tcnlst
#typedef d1typlst = $S1E.d1typlst
(* ****** ****** *)
#typedef d1patlst = $D1E.d1patlst
(* ****** ****** *)
#typedef d1explst = $D1E.d1explst
#typedef d1expopt = $D1E.d1expopt
(* ****** ****** *)
#typedef l1d1plst = $D1E.l1d1plst
#typedef l1d1elst = $D1E.l1d1elst
(* ****** ****** *)
#typedef f1arglst = $D1E.f1arglst
(* ****** ****** *)
#typedef d1eclist = $D1E.d1eclist
(* ****** ****** *)
#typedef d1parsed = $D1E.d1parsed
(* ****** ****** *)
#typedef wd1eclseq = $D1E.wd1eclseq
(* ****** ****** *)
#typedef d1valdclist = $D1E.d1valdclist
#typedef d1vardclist = $D1E.d1vardclist
#typedef d1fundclist = $D1E.d1fundclist
#typedef d1cstdclist = $D1E.d1cstdclist
(* ****** ****** *)
#typedef d1eclistopt = $D1E.d1eclistopt
(* ****** ****** *)
//
fun
d1parsed_tread01
(dpar: d1parsed): (d1parsed)
//
(* ****** ****** *)
//
#typedef
ftread01
(syn: tx) =
(syn , &sint >> _) -> ( syn )
//
(* ****** ****** *)
fun tread01_g1exp: ftread01(g1exp)
(* ****** ****** *)
fun tread01_sort1: ftread01(sort1)
fun tread01_s1exp: ftread01(s1exp)
fun tread01_l1s1e: ftread01(l1s1e)
(* ****** ****** *)
fun tread01_s1arg: ftread01(s1arg)
fun tread01_s1mag: ftread01(s1mag)
fun tread01_t1arg: ftread01(t1arg)
fun tread01_t1mag: ftread01(t1mag)
(* ****** ****** *)
fun tread01_s1qua: ftread01(s1qua)
(* ****** ****** *)
fun tread01_s1uni: ftread01(s1uni)
(* ****** ****** *)
fun tread01_s1tdf: ftread01(s1tdf)
(* ****** ****** *)
fun tread01_s1tcn: ftread01(s1tcn)
fun tread01_d1tst: ftread01(d1tst)
(* ****** ****** *)
fun tread01_d1tcn: ftread01(d1tcn)
fun tread01_d1typ: ftread01(d1typ)
(* ****** ****** *)
fun tread01_d1pat: ftread01(d1pat)
fun tread01_d1exp: ftread01(d1exp)
(* ****** ****** *)
fun tread01_f1arg: ftread01(f1arg)
(* ****** ****** *)
fun tread01_s1res: ftread01(s1res)
(* ****** ****** *)
fun tread01_d1ecl: ftread01(d1ecl)
(* ****** ****** *)
fun tread01_a1tdf: ftread01(a1tdf)
(* ****** ****** *)
//
fun
list_tread01_fnp
{syn:tx}
( lst: list(syn)
, err: &sint >> _
, fpr: ftread01(syn)): list(syn)
//
fun
optn_tread01_fnp
{syn:tx}
( opt: optn(syn)
, err: &sint >> _
, fpr: ftread01(syn)): optn(syn)
//
(* ****** ****** *)
fun
tread01_g1explst: ftread01(g1explst)
fun
tread01_g1expopt: ftread01(g1expopt)
(* ****** ****** *)
fun
tread01_sort1lst: ftread01(sort1lst)
fun
tread01_sort1opt: ftread01(sort1opt)
(* ****** ****** *)
fun
tread01_s1explst: ftread01(s1explst)
fun
tread01_s1expopt: ftread01(s1expopt)
(* ****** ****** *)
fun
tread01_l1s1elst: ftread01(l1s1elst)
(* ****** ****** *)
fun
tread01_s1arglst: ftread01(s1arglst)
fun
tread01_s1maglst: ftread01(s1maglst)
(* ****** ****** *)
fun
tread01_t1arglst: ftread01(t1arglst)
fun
tread01_t1maglst: ftread01(t1maglst)
(* ****** ****** *)
fun
tread01_s1qualst: ftread01(s1qualst)
(* ****** ****** *)
fun
tread01_s1unilst: ftread01(s1unilst)
(* ****** ****** *)
fun
tread01_s1tcnlst: ftread01(s1tcnlst)
fun
tread01_d1tstlst: ftread01(d1tstlst)
(* ****** ****** *)
fun
tread01_d1tcnlst: ftread01(d1tcnlst)
fun
tread01_d1typlst: ftread01(d1typlst)
(* ****** ****** *)
fun
tread01_d1patlst: ftread01(d1patlst)
(* ****** ****** *)
fun
tread01_d1explst: ftread01(d1explst)
fun
tread01_d1expopt: ftread01(d1expopt)
(* ****** ****** *)
fun
tread01_f1arglst: ftread01(f1arglst)
(* ****** ****** *)
fun
tread01_d1eclist: ftread01(d1eclist)
(* ****** ****** *)
fun
tread01_teqd1exp: ftread01(teqd1exp)
fun
tread01_wths1exp: ftread01(wths1exp)
(* ****** ****** *)
fun
tread01_d1valdcl: ftread01(d1valdcl)
fun
tread01_d1vardcl: ftread01(d1vardcl)
fun
tread01_d1fundcl: ftread01(d1fundcl)
fun
tread01_d1cstdcl: ftread01(d1cstdcl)
(* ****** ****** *)
fun
tread01_wd1eclseq: ftread01(wd1eclseq)
(* ****** ****** *)
fun
tread01_d1valdclist: ftread01(d1valdclist)
fun
tread01_d1vardclist: ftread01(d1vardclist)
fun
tread01_d1fundclist: ftread01(d1fundclist)
fun
tread01_d1cstdclist: ftread01(d1cstdclist)
(* ****** ****** *)
fun
tread01_d1eclistopt: ftread01(d1eclistopt)
(* ****** ****** *)
//
//HX-2022-08-16: printing errmsgs
//
fun g1exp_fpemsg(FILR, g1exp): void
(* ****** ****** *)
fun sort1_fpemsg(FILR, sort1): void
fun s1exp_fpemsg(FILR, s1exp): void
fun l1s1e_fpemsg(FILR, l1s1e): void
(* ****** ****** *)
fun g1explst_fpemsg(FILR, g1explst): void
(* ****** ****** *)
fun sort1lst_fpemsg(FILR, sort1lst): void
fun s1explst_fpemsg(FILR, s1explst): void
fun l1s1elst_fpemsg(FILR, l1s1elst): void
(* ****** ****** *)
fun d1pat_fpemsg(FILR, d1pat): void
fun d1exp_fpemsg(FILR, d1exp): void
fun l1d1p_fpemsg(FILR, l1d1p): void
fun l1d1e_fpemsg(FILR, l1d1e): void
(* ****** ****** *)
fun d1ecl_fpemsg(FILR, d1ecl): void
(* ****** ****** *)
fun d1patlst_fpemsg(FILR, d1patlst): void
fun d1explst_fpemsg(FILR, d1explst): void
fun l1d1plst_fpemsg(FILR, l1d1plst): void
fun l1d1elst_fpemsg(FILR, l1d1elst): void
(* ****** ****** *)
fun d1eclist_fpemsg(FILR, d1eclist): void
(* ****** ****** *)
//
fun
d1parsed_fpemsg
( out: FILR, dpar: d1parsed ): void
fun
d1eclistopt_fpemsg
( out: FILR, dopt: d1eclistopt ): void
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_tread01.sats] *)
