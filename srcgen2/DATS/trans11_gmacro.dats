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
#staload "./../SATS/trans01.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
#staload "./../SATS/gmacro1.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with g1arg_get_lctn
#symload node with g1arg_get_node
(* ****** ****** *)
#symload lctn with g1mag_get_lctn
#symload node with g1mag_get_node
(* ****** ****** *)
#symload lctn with g1exp_get_lctn
#symload node with g1exp_get_node
(* ****** ****** *)
#extern
fun
trans11_g1mac_subs
( env0:
! tr11env
, body: g1mac, genv: g1env): g1mac
(* ****** ****** *)

local
//
#absimpl
g1env_tbox =
list@(g1id0, g1mac)
//
in//local

(* ****** ****** *)

fun
g1env_nil
((*void*)): g1env = list_nil()

(* ****** ****** *)

fun
g1env_extends
( genv: g1env
, gids: g1ids
, g1ms: g1maclst) =
(
case+ gids of
|
list_nil() => genv
|
list_cons(gid1, gids) =>
(
case+ g1ms of
|
list_nil() => genv
|
list_cons
(g1m1, g1ms) =>
g1env_extends
(genv, gids, g1ms) where
{
val
genv =
list_cons(@(gid1, g1m1), genv) }
)
) (*case+*)
// end of [g1env_extends(genv,...)]

(* ****** ****** *)

end (*local*) // end of [local(g1env)]

(* ****** ****** *)

local

(* ****** ****** *)

fun
f0_garg
( g1a0
: g1arg): g1id0 =
(
case+
g1a0.node() of
//
|
G1ARGnode(tok1) =>
(
case-
tok1.node() of
|T_IDALP(nam1) => symbl(nam1)
|T_IDSYM(nam1) => symbl(nam1))
//
) (*case+*) // end of [f0_garg(g1a0)]

fun
f0_g1as
( g1as
: g1arglst): g1ids =
(
list_map
<x0><y0>(g1as)) where
{
//
  #typedef x0 = g1arg
  #typedef y0 = g1id0
//
  #impltmp
  map$fopr<x0><y0>(x0) = f0_garg(x0)
//
} (*where*) // end of [f0_g1as(g1as)]

(* ****** ****** *)

fun
f0_gexp
( g1e0
: g1exp): g1mac =
(
case+
g1e0.node() of
//
|
G1Eint(tok) =>
G1Mint(int) where
{
val int = token2sint(tok)
}
|
G1Ebtf(tok) =>
G1Mbtf(btf) where
{
val btf = token2sbtf(tok)
}
|
G1Echr(tok) =>
G1Mchr(chr) where
{
val chr = token2schr(tok)
}
//
|
G1Eid0(gid) => G1Mid0(gid)
//
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

fun
f0_gmag
(g1ma: g1mag): g1ids =
(
case-
g1ma.node() of
(*
|G1MAGsarg(g1as) => list_nil()
*)
|G1MAGdarg(g1as) => f0_g1as(g1as)
) (*case-*) // end of [f0_mag(g1ma)]

(* ****** ****** *)

fun
f0_gmas
( gmas
: g1maglst
, def1: g1mac): g1mac =
(
case+ gmas of
|
list_nil
((*void*)) => def1
|
list_cons
(g1ma, gmas) =>
let
val gids = f0_gmag(g1ma)
in//let
G1Mlam0(gids, f0_gmas(gmas, def1))
end // end-of-(list_cons(g1ma,gmas))
) (*case+*) // end of [f0_gmas(gmas,...)]

(* ****** ****** *)
in//local
(* ****** ****** *)

#implfun
trans11_gmdef
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
optn_cons
(  g1e1  ) =>
f0_gexp(g1e1)
|
optn_nil() => G1Mnone0()): g1mac
//
} (*where*) // end of [trans11_gmdef(...)]

end (*local*) // end of [local(trans11_gmdef)]

(* ****** ****** *)

local

(* ****** ****** *)

fun
f0_apps
( env0:
! tr11env
, g1m0: g1mac): g1mac =
(
f0_apps_els1
(env0, g1f0, g1ms)) where
//
{
val-
G1Mapps(g1f0, g1ms) = g1m0
}

(* ****** ****** *)

and
f0_apps_els1
( env0:
! tr11env
, g1f0: g1mac
, g1ms: g1maclst): g1mac =
(
case+ g1f0 of
|
_(*otherwise*) =>
f0_apps_els2(env0, g1f0, g1ms)
)

and
f0_apps_els2
( env0:
! tr11env
, g1f0
: g1mac
, g1ms
: g1maclst): g1mac =
(
case+ g1f0 of
|
G1Mlam0
(gmas, body) =>
(
trans11_g1mac_subs
(env0, body, genv)) where
{
  val genv =
  g1env_nil((*void*))
  val genv =
  g1env_extends(genv, gmas, g1ms)
}
| _(*non-G1Mlam*) => G1Mapps(g1f0, g1ms)
)

(* ****** ****** *)
//
fun
f0_gmac
( env0:
! tr11env
, g1m0: g1mac): g1mac =
(
//
case+ g1m0 of
//
| G1Mint _ => g1m0
| G1Mbtf _ => g1m0
| G1Mstr _ => g1m0
//
| G1Msexp _ => g1m0
| G1Mdpat _ => g1m0
| G1Mdexp _ => g1m0
//
|
G1Mid0 _ => f0_gid0(env0, g1m0)
//
(*
|
G1Mif0 _ => f0_cond(env0, g1m0)
*)
//
|
G1Mapps _ => f0_apps(env0, g1m0)
//
| _(* rest-of-G1M... *) => ( g1m0 )
//
) where
{
(*
  val () =
  prerrln("f0_gmac: g1m0 = ", g1m0)
*)
} (*where*) // end of [f0_g1m0(env0,g1m0)]
//
and
f0_gid0
( env0:
! tr11env
, g1m0: g1mac): g1mac =
let
val-
G1Mid0(sym1) = g1m0
val
opt1 =
tr11env_search_opt(env0, sym1)
in//let
case+ opt1 of
| ~
optn_vt_nil() => g1m0
| ~
optn_vt_cons(g1m0) => f0_gmac(env0, g1m0)
end (*let*) // end of [f0_gid0(env0,g1m0)]
//
(* ****** ****** *)
in//local
(* ****** ****** *)

#implfun
trans11_g1mac
( env0, g1m0 ) =
(
f0_gmac(env0, g1m0)) where
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
(env0, g1f0, g1ms) =
(
f0_apps_els1(env0, g1f0, g1ms)) where
{
(*
val () =
prerrln("trans11_g1mac_apps: g1f0 = ", g1f0)
val () =
prerrln("trans11_g1mac_apps: g1ms = ", g1ms)
*)
} (*where*) // end-(trans11_g1mac_apps(g1f0,g1ms))

(* ****** ****** *)

end (*local*) // end of [local(trans11_g1mac/apps)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans11_gmacro.dats] *)
