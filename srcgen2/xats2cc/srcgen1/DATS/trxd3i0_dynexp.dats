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
Sat Mar 14 07:27:49 PM EDT 2026
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
#staload
"./../../../SATS/dynexp3.sats"
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/trxd3i0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3pat_trxd3i0
(d3p0, env0) =
let
//
val () =
prerrsln("\
d3pat_trxd3i0: d3p0 = ", d3p0)
//
in//let
//
case+
d3p0.node() of
//
|D3Pany _ =>
(
  f0_any(d3p0, env0))
|D3Pvar _ =>
(
  f0_var(d3p0, env0))
//
end where
{
//
fun
f0_any
( d3p0: d3pat
, env0: !envd3i0): i0pat =
let
//
val-
D3Pany() = d3p0.node()
//
val t2p0 = d3p0.styp((*0*))
val loc0 = d3p0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
in//let
(
  i0pat(loc0, i0t0, I0Pany(*0*)))
end(*let*)//end-of-[f0_any(d3p0,env0)]
//
(* ****** ****** *)
//
fun
f0_var
( d3p0: d3pat
, env0: !envd3i0): i0pat =
let
//
val-
D3Pvar
(   d2v1   ) = d3p0.node()
//
val t2p0 = d3p0.styp((*0*))
val loc0 = d3p0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
in//let
(
  i0pat(loc0, i0t0, I0Pvar(d2v1)))
end(*let*)//end-of-[f0_any(d3p0,env0)]
//
(* ****** ****** *)
//
}(*where*)//end-of-[d3pat_trxd3i0(d3p0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_trxd3i0_dynexp.dats] *)
(***********************************************************************)
