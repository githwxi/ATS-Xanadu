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
Sat 01 Oct 2022 01:51:01 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
(* ****** ****** *)

#implfun
sort2_intq
(  s2t0  ) =
(
case+ s2t0 of
| S2Tbas(tbas) =>
(
case+ tbas of
| T2Bpred(name) =>
  (name = INT_symbl)
| _(*non-T2Bpred*) => false
) // end of [S2RTbas]
| _ (* non-S2Tbas *) => false
) (* case+ *) // end of [sort2_intq]

(* ****** ****** *)
//
#implfun
sort2_funq
(  s2t0  ) =
(
case+ s2t0 of
| S2Tfun _ => true | _ => false )
//
(* ****** ****** *)

#implfun
sort2_addrq
(   s2t0   ) =
(
case+ s2t0 of
| S2Tbas(tbas) =>
(
case+ tbas of
| T2Bpred(name) =>
  (name = ADDR_symbl)
| _(*non-T2Bpred*) => false
) // end of [S2RTbas]
| _ (* non-S2Tbas *) => false
) (* case+ *) // end of [sort2_addrq]

(* ****** ****** *)

#implfun
sort2_boolq
(   s2t0   ) =
(
case+ s2t0 of
| S2Tbas(tbas) =>
(
case+ tbas of
| T2Bpred(name) =>
  (name = BOOL_symbl)
| _(*non-T2Bpred*) => false
) // end of [S2RTbas]
| _ (* non-S2Tbas *) => false
) (* case+ *) // end of [sort2_boolq]

(* ****** ****** *)

#implfun
sort2_charq
(   s2t0   ) =
(
case+ s2t0 of
| S2Tbas(tbas) =>
(
case+ tbas of
| T2Bpred(name) =>
  (name = CHAR_symbl)
| _ (* non-T2Bpred *) => false
) // end of [S2RTbas]
| _ (* non-S2Tbas *) => false
) (* case+ *) // end of [sort2_charq]

(* ****** ****** *)
//
#implfun
sort2_imprq
(   s2t0   ) =
(
case+ s2t0 of
//
|
S2Tbas(tbas) =>
(
case+ tbas of
|
T2Bimpr _ => true
|
_(*non-T2Bimpr*) => false
)
//
|
S2Tf1un
(targ, tres) => sort2_imprq(tres)
//
| _(* rest-of-sort2 *) => ( false )
//
) (* case+ *) // end of [sort2_imprq]
//
(* ****** ****** *)
//
#implfun
sort2_prgmq
(   s2t0   ) =
(
case+ s2t0 of
|
S2Tbas(tbas) =>
(
case+ tbas of
|
T2Bimpr(knd, _) => sortprf(knd) <= 0
| _ => false
)
|
_ (* non-S2Tbas *) => false) // sort2_prgmq
//
(* ****** ****** *)
#implfun
t2abs_equal
(x1, x2) =
(x1.stmp() = x2.stmp())
(* ****** ****** *)
#implfun
t2dat_equal
(x1, x2) =
(x1.stmp() = x2.stmp())
(* ****** ****** *)
#impltmp
g_lte<t2bas> = lte_t2bas_t2bas
(* ****** ****** *)

#implfun
lte_t2bas_t2bas
(x1, x2) =
(
case+
(x1, x2) of
|
( T2Bpred(nm1)
, T2Bpred(nm2)) => (nm1 = nm2)
|
( T2Btabs(ta1)
, T2Btabs(ta2)) => t2abs_equal(ta1, ta2)
|
( T2Btdat(td1)
, T2Btdat(td2)) => t2dat_equal(td1, td2)
|
( T2Bimpr(kx1, _)
, T2Bimpr(kx2, _)) => subsort_test(kx1, kx2)
//
| (_(*rest*), _(*rest*)) => (   false   )
//
) (*case+*) // end of [lte_t2bas_t2bas(x1,x2)]

(* ****** ****** *)
#impltmp
g_lte<sort2> = lte_sort2_sort2
#impltmp
g_lte<sort2lst> = lte_sort2lst_sort2lst
(* ****** ****** *)
#implfun
lte_sort2_sort2
  (x1, x2) =
(
case+ x1 of
//
|
S2Tid0(tid1) =>
(
case+ x2 of
|
S2Tid0(tid2) => tid1 = tid2 | _ => false
)
//
|
S2Tint(int1) =>
(
case+ x2 of
|
S2Tint(int2) => int1 = int2 | _ => false
)
//
|
S2Tbas(stb1) =>
(
case+ x2 of
|
S2Tbas(stb2) => stb1 <= stb2 | _ => false
)
//
|
S2Ttup(sts1) =>
(
case+ x2 of
| S2Ttup(sts2) => sts1 <= sts2 | _ => false
)
//
|
S2Tf1un(arg1, res1) =>
(
case+ x2 of
|
S2Tf1un(arg2, res2) =>
if (arg2 <= arg1) then (res1 <= res2) else false
| _ (* non-S2Tf1un *) => false
)
//
|
S2Tapps(s2f1, arg1) =>
(
case+ x2 of
|
S2Tapps(s2f2, arg2) =>
if (s2f1 <= s2f2) then (arg1 <= arg2) else false
| _ (* non-S2Tfun *) => false
)
//
| _ (* rest-of-sort2 *) => false
(*
| S2Tf0un() => false
|
S2Tnone(s1t1) => false | S2Tnone((*void*)) => false
*)
//
) (* case+ *) // end of [lte_sort2_sort2(x1, x2)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_staexp2_utils1.dats] *)
