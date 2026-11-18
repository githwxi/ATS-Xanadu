(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
//
Sat Oct  3 04:43:50 PM EDT 2026
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
(* ****** ****** *)
#staload
"./../../../SATS/staexp2.sats"
#staload
"./../../../SATS/statyp2.sats"
#staload
"./../../../SATS/dynexp2.sats"
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/trxd3i0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
s2exp_trxd3i0
(s2e0, env0) =
let
//
val s2t0 = s2e0.sort()
//
(*
val (  ) =
prerrsln("\
s2exp_trxd3i0: s2e0 = ", s2e0)
*)
//
in//let
//
case+
s2e0.node() of
(* ****** ****** *)
|
_(*otherwise*) =>
(
s2typ_trxd3i0(t2p0, env0))
where
{
  val t2p0 = s2exp_stpize(s2e0) }
(*
|
_(*otherwise*) => i0typ_s2exp(s2e0)
*)
//
(* ****** ****** *)
//
end where//let//endof(s2exp_trxd3i0(...))
{
//
//
}(*where*)//end-of-[s2exp_trxd3i0(s2e0,env0)]
//
(* ****** ****** *)
//
#implfun
l2s2e_trxd3i0
(ls2e, env0) =
let
val
S2LAB(l0, s2e0) = ls2e
in//let
//
(
  I0LAB(l0, i0t0)) where
{
  val i0t0 = s2exp_trxd3i0(s2e0, env0) }
end(*let*)//end-of-[l2s2e_trxd3i0(ls2e,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_DATS_trxd3i0_staexp.dats] *)
(***********************************************************************)
