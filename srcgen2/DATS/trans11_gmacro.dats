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
Sun 04 Dec 2022 01:39:21 AM EST
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
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
#staload "./../SATS/gmacro1.sats"
(* ****** ****** *)
#symload lctn with g1exp_get_lctn
#symload node with g1exp_get_node
(* ****** ****** *)

local

(* ****** ****** *)

fun
f0_gexp
( g1e0
: g1exp): g1mac =
(
case+
g1e0.node() of
|
G1Eid0(gid) => G1Mid0(gid)
) where
{
val () =
prerrln("f0_gexp: g1e0 = ", g1e0)
} (*where*) // end of [f0_gexp(g1e0)]

(* ****** ****** *)

fun
f0_g1es
( g1es
: g1explst): g1maclst =
list_vt2t
(
list_map
<x0><y0>(g1es)) where
{
//
  #typedef x0 = g1exp
  #typedef y0 = g1mac
//
  #impltmp
  map$fopr<x0><y0>(x0) = f0_gexp(x0)
//
} (*where*) // end of [f0_g1es(g1es)]

(* ****** ****** *)

in//local

#implfun
trans11_g1mdef
( gmas, def1 ) =
(
f0_gmas
(gmas, def1)) where
{
//
val def1 =
(
case+ def1 of
|
optn_cons(g1e1) =>
  f0_gexp(g1e1) | optn_nil() => G1Mnone0()
) : g1mac // end-of-val
//
} (*where*) // end of [trans11_g1mdef(...)]

end (*local*) // end of [local(trans11_g1mdef)]

(* ****** ****** *)

local

fun
auxapps
( g1m0
: g1mac): g1mac =
(
f0_apps_els1
(g1f0, g1ms)) where
//
{
val-
G1Mapps(g1f0, g1ms) = g1m0
}

and
f0_apps_els1
( g1f0
: g1mac
, g1ms
: g1maclst): g1mac =
f0_apps_els2(g1f0, g1ms)

and
f0_apps_els2
( g1f0
: g1mac
, g1ms
: g1maclst): g1mac =
(
case+ g1f0 of
|
G1Mlam0
(gmas, body) =>
(
trans11_g1mac_subs(body, env0)
) where
{
  val env0 =
  g1env_nil((*void*))
  val env0 =
  g1env_extends(env0, gmas, g1ms)
}
| _(*non-G1Mlam*) => G1Mapps(g1f0, g1ms)
)

in//local

(* ****** ****** *)

#implfun
trans11_g1mac
  (g1m0) =
(
  f0_g1m0(g1m0)) where
{
//
(*
val () =
prerrln("trans11_g1mac: g1m0 = ", g1m0)
*)
//
} (*where*) // end of [trans11_g1mac(g1m0)]

(* ****** ****** *)

#implfun
trans11_g1mac_apps
  (g1f0, g1ms) =
(
  f0_apps_els1(g1f0, g1ms)) where
{
(*
val () =
prerrln("trans11_g1mac_apps: g1f0 = ", g1f0)
val () =
prerrln("trans11_g1mac_apps: g1ms = ", g1ms)
*)
} (*where*) // end-(trans11_g1mac_apps(g1f0,g1ms))

(* ****** ****** *)

end (*local*) // end of [local(trans12_g1mac/apps)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans11_gmacro.dats] *)
