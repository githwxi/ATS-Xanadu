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
(*
|D3Cvaldclst _ =>
f0_valdclst(d3cl, env0)
|D3Cvardclst _ =>
f0_vardclst(d3cl, env0)
*)
//
|D3Cfundclst _ =>
f0_fundclst(d3cl, env0)
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
d3ecl1(loc0, D3C1errck(lvl0, dcl1))
//
end//let//end-of-[D3Cerrck(lvl0,dcl1)]
//
(* ****** ****** *)
//
|
_(*otherwise*) =>
let
  val node =
  D3C1d3ecl(d3cl) in d3ecl1(loc0, node)
end//let
) where//end-of-[d3ecl_trx3cpy(d3cl,env0)]
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
(* ****** ****** *)
//
fun
f0_fundclst
(d3cl: d3ecl
,env0: !env3cpy): d3ecl1 =
let
//
val-
D3Cfundclst
( tknd, tqas
, d2cs, d3fs) = d3cl.node()
//
val d3fs =
d3fundclist_trx3cpy(d3fs, env0)
//
in//let
d3ecl1(loc0,
D3C1fundclst(tknd, tqas, d2cs, d3fs))
end//let
//
(* ****** ****** *)
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
//
#implfun
d3fundcl_trx3cpy
  (dfun, env0) = let
//
val loc0 =
d3fundcl_get_lctn(dfun)
//
val dvar =
d3fundcl_get_dpid(dfun)
val f3as =
d3fundcl_get_farg(dfun)
val sres =
d3fundcl_get_sres(dfun)
val tdxp =
d3fundcl_get_tdxp(dfun)
val wsxp =
d3fundcl_get_wsxp(dfun)
//
(*
val (  ) = prerrsln
("d3fundcl_trx3cpy: f3as = ", f3as)
val (  ) = prerrsln
("d3fundcl_trx3cpy: tdxp = ", tdxp)
*)
//
val f3as =
f3arglst_trx3cpy(f3as, env0)
val tdxp =
teqd3exp_trx3cpy(tdxp, env0)
//
(*
val (  ) = prerrsln
("d3fundcl_trx3cpy: f3as = ", f3as)
val (  ) = prerrsln
("d3fundcl_trx3cpy: tdxp = ", tdxp)
*)
//
in//let
(
  d3fundcl1_make_args
  (loc0, dvar, f3as, sres, tdxp, wsxp))
end//let
(*let*)//end-of-[d3fundcl_trx3cpy(dfun,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_trx3cpy_decl00.dats] *)
(***********************************************************************)
