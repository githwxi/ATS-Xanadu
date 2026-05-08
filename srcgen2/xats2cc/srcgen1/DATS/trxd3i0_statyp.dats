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
Sat Mar 14 07:08:42 PM EDT 2026
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
s2typ_trxd3i0
(t2p0, env0) =
let
//
val s2t0 = t2p0.sort()
//
(*
val (  ) =
prerrsln("\
s2typ_trxd3i0: t2p0 = ", t2p0)
*)
//
in//let
//
case+
t2p0.node() of
(* ****** ****** *)
//
|T2Pcst(s2c) =>
(
i0typ(s2t0, I0Tcst(s2c)))
|T2Pvar(s2v) =>
(
i0typ(s2t0, I0Tvar(s2v)))
//
(* ****** ****** *)
//
|T2Papps
(t2f0, t2ps) =>
let
val i0f0 =
s2typ_trxd3i0(t2f0, env0)
val i0ts =
s2typlst_trxd3i0(t2ps, env0)
in//let
i0typ(s2t0, I0Tapps(i0f0, i0ts))
end(*let*)//end-of-[T2Papps(...)]
//
|T2Plam1
(s2vs, t2p1) =>
let
val i0t1 =
(
  s2typ_trxd3i0(t2p1, env0))
in//let
i0typ(s2t0, I0Tlam1(s2vs, i0t1))
end(*let*)//end-of-[T2Plam1(...)]
//
(* ****** ****** *)
//
|T2Ptext
(name, t2ps) =>
let
val i0ts =
s2typlst_trxd3i0(t2ps, env0)
in//let
i0typ(s2t0, I0Ttext(name, i0ts))
end(*let*)//end-of-[T2Ptext(...)]
//
(* ****** ****** *)
//
|
_(*otherwise*) => i0typ_none1(t2p0)
(* ****** ****** *)
//
end where//let//endof(s2typ_trxd3i0)
{
//
//
}(*where*)//end-of-[s2typ_trxd3i0(d3p0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_trxd3i0_statyp.dats] *)
(***********************************************************************)
