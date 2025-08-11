(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Tue Jul  1 05:34:24 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/statyp2.sats"
#staload
"./../SATS/dynexp3.sats"
#staload
"./../SATS/trxltck.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/libxatsopt.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload linq with sort2_linq
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
sort2_delin
(   s2t0   ) =
(
case+ s2t0 of
|
S2Tbas(s2tb) =>
(
case+ s2tb of
|T2Bimpr
(knd, sym) =>
let
  val msk =
    lnot(g0s2u(2))
  val knd = g0s2u(knd)
  val knd =
    g0u2s(knd\land(msk))
in
  S2Tbas(T2Bimpr(knd, sym))
end
|_(*non-T2Bimpr*) => (s2t0)
)
|_(* non-S2Tbas *) => (s2t0)
)(*case+*)//end-of-[sort2_delin(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
s2typ1_delin
(   t2q0   ) =
let
val s2t0 = t2q0.sort()
in//let
//
if
not(
linq(s2t0))
then t2q0 else
(
case+
t2q0.node() of
//
|T2P1lft(t2q1) =>
(
s2typ1
(s2t1, T2P1top1(t2q1)))
where
{
val s2t1 =
sort2_delin(t2q1.sort()) }
//
|
_(*otherwise*) =>
let
val s2t0 =
(
sort2_delin(s2t0))
in//let
s2typ1(s2t0, T2P1top1(t2q0))
end
//
)//else//end-of-[if]
//
end//end-of-[s2typ1_delin(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_trxltck_utils0.dats] *)
(***********************************************************************)
