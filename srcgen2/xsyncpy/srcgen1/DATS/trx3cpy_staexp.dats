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
Mon Jun 30 02:37:02 AM EDT 2025
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
"./../SATS/trx3cpy.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/mytmplib00.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../../../SATS/staexp2.sats"
#staload
"./../../../SATS/statyp2.sats"
//
#symload sort with s2typ_get_sort
#symload node with s2typ_get_node
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
s2typ_trx3cpy
(t2p0, env0) =
let
//
val s2t0 = t2p0.sort()
//
in//let
//
case+
t2p0.node() of
//
|T2Ptrcd
(trcd
,npf1, ltps) =>
let
val ltqs =
l2t2plst_trx3cpy(ltps, env0)
in//let
s2typ1
(s2t0,T2P1trcd(trcd,npf1,ltqs))
end//let
//
|
_(*otherwise*) =>
(
  s2typ1(s2t0, T2P1s2typ(t2p0)) )
//
end(*let*)//end-of-[s2typ_trx3cpy(t2p0,env0)]
//
(* ****** ****** *)
//
#implfun
l2t2p_trx3cpy
(lt2p, env0) =
(
S2LAB(l0, t2q0)) where
{
val+S2LAB(l0, t2p0) = lt2p
val t2q0 = s2typ_trx3cpy(t2p0, env0)
}(*where*)//end-of[l2t2p_trx3cpy(lt2p,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_trx3cpy_staexp.dats] *)
(***********************************************************************)
