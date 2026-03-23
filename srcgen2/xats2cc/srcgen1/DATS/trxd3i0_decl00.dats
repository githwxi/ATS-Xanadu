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
Sat Mar 14 07:45:28 PM EDT 2026
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
#include
"./../HATS/mytmplib00.hats"
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
d3ecl_trxd3i0
(d3cl, env0) =
let
//
val () =
prerrsln("\
d3ecl_trxd3i0: d3cl = ", d3cl)
//
in//let
//
case+
d3cl.node() of
(* ****** ****** *)
//
|D3Cdclst0 _ =>
(
  f0_dclst0(d3cl, env0))
//
|D3Clocal0 _ =>
(
  f0_local0(d3cl, env0))
//
(* ****** ****** *)
|_(* otherwise *) => i0dcl_none1(d3cl)
(* ****** ****** *)
//
end where//let//endof(d3ecl_trxd3i0(...))
{
//
(* ****** ****** *)
//
fun
f0_dclst0
(
d3cl: d3ecl,
env0: !envd3i0): i0dcl =
let
//
val loc0 = d3cl.lctn()
val-
D3Cdclst0
(   dcls   ) = d3cl.node()
//
val
dcls =
d3eclist_trxd3i0(dcls, env0)
//
in//let
//
(
  i0dcl(loc0, I0Ddclst0( dcls )))
//
end//let//end-of-[f0_dclst0(d3cl, env0)]
//
(* ****** ****** *)
//
fun
f0_local0
(
d3cl: d3ecl,
env0: !envd3i0): i0dcl =
let
//
val loc0 = d3cl.lctn()
val-
D3Clocal0
(head, body) = d3cl.node()
//
val
head =
d3eclist_trxd3i0(head, env0)
val
body =
d3eclist_trxd3i0(body, env0)
//
in//let
//
i0dcl(loc0, I0Dlocal0(head, body))
//
end//let//end-of-[f0_local0(d3cl,env0)]
//
(* ****** ****** *)
//
}(*where*)//end-of-[d3ecl_trxd3i0(d3cl,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_trxd3i0_decl00.dats] *)
(***********************************************************************)
