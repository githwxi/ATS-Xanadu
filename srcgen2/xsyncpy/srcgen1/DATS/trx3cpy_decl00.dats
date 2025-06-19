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
Sun Jun  1 10:06:41 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"xatslib\
/libcats\
/HATS/libcats_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/dynexp3.sats"
#staload
"./../SATS/trx3cpy.sats"
//
(* ****** ****** *)
//
#staload
"./../../../SATS/dynexp3.sats"
//
#symload node with d3ecl_get_node
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3ecl_trx3cpy
(d3cl, env0) =
(
case+
d3cl.node() of
//
|D3Cstatic _ =>
f0_static(d3cl, env0)
|D3Cextern _ =>
f0_extern(d3cl, env0)
//
(* ****** ****** *)
//
|D3Cdclst0 _ =>
f0_dclst0(d3cl, env0)
|D3Clocal0 _ =>
f0_local0(d3cl, env0)
//
(* ****** ****** *)
//
|D3Cinclude _ =>
f0_include(d3cl, env0)
//
(* ****** ****** *)
//
|D3Cerrck
(lvl0, dcl1) =>
let
//
val dcl1 =
(
  d3ecl_trx3cpy(dcl1, env0))
in//
//
d3ecl1
(loc0, D3C1errck(lvl0, dcl1))
//
end//let//end-of-[D3Cerrck(...)]
//
(* ****** ****** *)
//
|
_(*otherwise*) =>
(
  d3ecl1(loc0, D3C1d3ecl(d3cl)))
) where // end-of-[d3ecl_trx3cpy]
{
//
val loc0 = d3cl.lctn()
//
fun
f0_static
(d3cl: d3ecl
,env0: !env3cpy): d3ecl1 =
let
//
val-
D3Cstatic
(tknd, dcl1) = d3cl.node()
val dcl1 =
(
  d3ecl_trx3cpy(dcl1, env0))
in//let
  d3ecl1
  (loc0, D3C1static(tknd, dcl1))
end//let
//
fun
f0_extern
(d3cl: d3ecl
,env0: !env3cpy): d3ecl1 =
let
//
val-
D3Cextern
(tknd, dcl1) = d3cl.node()
val dcl1 =
(
  d3ecl_trx3cpy(dcl1, env0))
in//let
  d3ecl1
  (loc0, D3C1extern(tknd, dcl1))
end//let
//
fun
f0_dclst0
(d3cl: d3ecl
,env0: !env3cpy): d3ecl1 =
let
//
val-
D3Cdclst0
(   dcls   ) = d3cl.node()
in//let
(
d3ecl1(loc0, D3C1dclst0(dcls))
) where
{
val dcls =
(
  d3eclist_trx3cpy(dcls, env0)) }
end//let
//
fun
f0_local0
(d3cl: d3ecl
,env0: !env3cpy): d3ecl1 =
let
//
val-
D3Clocal0
(head, body) = d3cl.node()
//
val head =
(
d3eclist_trx3cpy(head, env0))
val body =
(
d3eclist_trx3cpy(body, env0))
//
in//let
d3ecl1(loc0, D3C1local0(head, body))
end//let
//
fun
f0_include
(d3cl: d3ecl
,env0: !env3cpy): d3ecl1 =
let
//
val-
D3Cinclude
(sd01
,tknd, gexp
,fopt, dopt) = d3cl.node()
//
val
dopt =
d3eclistopt_trx3cpy(dopt, env0)
//
in//let
//
d3ecl1
( loc0
, D3C1include
  (sd01, tknd, gexp, fopt, dopt))
//
end//let
//
(*
val (  ) =
printsln("d3ecl_trx3cpy: loc0 = ", loc0)
val (  ) =
printsln("d3ecl_trx3cpy: d3cl = ", d3cl)
*)
//
}(*where*)//end-of-[d3ecl_trx3cpy(d3cl,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_trx3cpy_decl00.dats] *)
(***********************************************************************)
