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
//
fun
g1env_decode
(genv: g1env):
list@(g1id0, g1mac) = (genv)
//
(* ****** ****** *)
//
fun
g1env_nil
((*void*)): g1env = list_nil()
//
(* ****** ****** *)
//
fun
g1env_addlst
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
g1env_addlst
(genv, gids, g1ms) where
{
val
genv =
list_cons(@(gid1, g1m1), genv) }
)
) (*case+*)
// end of [g1env_addlst(genv,...)]
//
(* ****** ****** *)
//
fun
g1env_search_opt
( genv
: g1env, x0: g1id0): g1macopt_vt =
(
case+ genv of
|
list_nil() =>
optn_vt_nil()
|
list_cons((x1, v1), genv) =>
(
if
(x0 = x1)
then optn_vt_cons(v1)
else g1env_search_opt(genv, x0)))
// end-[g1env_search_opt(genv, ...)]
//
(* ****** ****** *)

end (*local*) // end of [local(g1env)]

(* ****** ****** *)
//
#implfun
g1env_fprint
( out, genv ) =
let
val
genv =
g1env_decode(genv)
in//let
print("G1ENV(", genv, ")")
end where
{
  #impltmp g_print$out<>() = out
} (*where*) // end of [g1env_fprint]
//
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
|G1Eint(tok) =>
(G1Mint(int)) where
{ val
  int = token2sint(tok)}
//
(*
|G1Ebtf(tok) =>
(G1Mbtf(btf)) where
{ val
  btf = token2sbtf(tok)}
*)
//
|G1Echr(tok) =>
(G1Mchr(chr)) where
{ val
  chr = token2schr(tok)}
//
|G1Estr(tok) =>
(G1Mstr(str)) where
{ val
  str = token2sstr(tok)}
//
|
G1Eid0(gid) => G1Mid0(gid)
//
|
G1Ea1pp
(g1f0, g1e1) =>
let
val
g1f0 = f0_gexp(g1f0)
in
  G1Mapps(g1f0, g1ms) where
{
val
g1ms =
(
case+
g1e1.node() of
|
G1Elist(g1es) => f0_g1es(g1es)
|
_(*non-G1Elist*) =>
let
val
g1m1 =
f0_gexp(g1e1) in list_sing(g1m1) end
)
}
end (*let*) // end of [G1Ea1pp(...)]
//
|
G1Ea2pp
(g1f0, g1e1, g1e2) =>
let
val g1f0 = f0_gexp(g1f0)
val g1e1 = f0_gexp(g1e1)
val g1e2 = f0_gexp(g1e2)
in//let
  G1Mapps
  (g1f0, list_pair(g1e1, g1e2))
end (*let*) // end of [G1Ea2pp(...)]
//
|
G1Elist(g1es) =>
(
case+ g1es of
|
list_nil() => G1Mnone0()
|
list_cons(g1e1, g1es) =>
let
val g1m1 = f0_gexp(g1e1)
in//let
G1Mlist
(list_cons(g1m1, f0_g1es(g1es)))
end (*let*) // end-(list_cons(...))
)
//
) where
{
(*
  val
  loc0 = g1e0.lctn()
  val () =
  prerrln("f0_gexp: loc0 = ", loc0)
  val () =
  prerrln("f0_gexp: g1e0 = ", g1e0)
*)
} (*where*) // end of [f0_gexp(g1e0)]

(* ****** ****** *)

and
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
case+
g1ma.node() of
//
(*
|G1MAGnone() => list_nil()
*)
|G1MAGsarg(g1as) => f0_g1as(g1as)
|G1MAGdarg(g1as) => f0_g1as(g1as)
//
) (*case+*) // end of [f0_gmag(g1ma)]

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
  g1env_addlst(genv, gmas, g1ms)
}
//
|
G1Msubs
(g1f1, genv) =>
(
case+ g1f1 of
|
G1Mlam0
(gmas, body) =>
(
trans11_g1mac_subs
(env0, body, genv)) where
{
  val genv =
  g1env_addlst(genv, gmas, g1ms)
}
| _(*non-G1Mlam*) => G1Mapps(g1f0, g1ms)
)
//
| _(*non-G1Mlam*) => G1Mapps(g1f0, g1ms)
//
) (*case+*) // end of [f0_apps_els2(...)]

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
G1Mift0 _ => f0_cond(env0, g1m0)
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
//
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
//
(* ****** ****** *)
//
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
//
(* ****** ****** *)

end (*local*) // end of [local(trans11_g1mac/apps)]

(* ****** ****** *)

local

(* ****** ****** *)

fun
f0_g1m0
( env0:
! tr11env
, g1m0: g1mac
, genv: g1env): g1mac =
(
case+ g1m0 of
//
| G1Mint _ => g1m0
| G1Mbtf _ => g1m0
| G1Mstr _ => g1m0
//
|
G1Mid0 _ =>
f0_gmid(env0, g1m0, genv)
//
|
G1Mift0 _ =>
f0_cond(env0, g1m0, genv)
//
|
G1Mapps _ =>
f0_apps(env0, g1m0, genv)
//
|
_(*otherwise*) => G1Msubs(g1m0, genv)
//
) (*case+*) // end of [f0_g1m0(...)]
//
and
f0_g1ms
( env0:
! tr11env
, g1ms
: g1maclst
, genv: g1env): g1maclst =
(
list_map_e1nv
<x0 >< y0><e1>
( g1ms , env0 )) where
{
//
#typedef x0 = g1mac
#typedef y0 = g1mac
#vwtpdef e1 = tr11env
//
#impltmp
map$fopr_e1nv
<x0><y0><e1>(x0, e1) = f0_g1m0(e1, x0, genv)
} (*where*) // end of [f0_g1ms(...)]
//
(* ****** ****** *)
//
and
f0_gmid
( env0:
! tr11env
, g1m0: g1mac
, genv: g1env): g1mac =
let
//
val-
G1Mid0(sym1) = g1m0
//
val
opt1 =
g1env_search_opt(genv, sym1)
//
in
case+ opt1 of
| ~
optn_vt_cons
(   g1m1   ) => g1m1
|
~optn_vt_nil
( (*void*) ) => let
//
val
opt1 =
tr11env_search_opt(env0, sym1)
//
in//let
case+ opt1 of
| ~
optn_vt_nil() => g1m0
| ~
optn_vt_cons
(   g1m1   ) => trans11_g1mac(env0, g1m1)
end // end of [None_vt]
//
end (*let*) // end of [f0_gmid(...)]
//
(* ****** ****** *)

and
f0_cond
( env0:
! tr11env
, g1m0: g1mac
, genv: g1env): g1mac =
let
//
val-
G1Mift0
( g1m1
, g1m2, g1m3) = g1m0
//
val
g1m1 =
f0_g1m0(env0, g1m1, genv)
//
in//let
//
case+ g1m1 of
//
|
G1Mbtf(btf) =>
(
if
(btf)
then f0_g1m0(env0, g1m2, genv)
else f0_g1m0(env0, g1m3, genv))
//
|
G1Mint(int) =>
(
if
(int != 0)
then f0_g1m0(env0, g1m2, genv)
else f0_g1m0(env0, g1m3, genv))
//
|
G1Mstr(str) =>
(
if
(str != "")
then f0_g1m0(env0, g1m2, genv)
else f0_g1m0(env0, g1m3, genv))
//
|
_(*non-if-redex*) =>
(
G1Mift0
(g1m1, g1m2, g1m3)) where
{
  val g1m2 = G1Msubs(g1m2, genv)
  val g1m3 = G1Msubs(g1m3, genv)
} (*where*) // end-of-(non-if-redex)
//
end (*let*) // end of [f0_cond(...)]

(* ****** ****** *)
//
and
f0_apps
( env0:
! tr11env
, g1m0: g1mac
, genv: g1env): g1mac =
let
//
val-
G1Mapps
(g1f0, g1ms) = g1m0
//
val
g1f0 = f0_g1m0(env0, g1f0, genv)
val
g1ms = f0_g1ms(env0, g1ms, genv)
//
in//let
trans11_g1mac_apps(env0, g1f0, g1ms)
end (*let*) // end of [f0_apps(...)]
//
(* ****** ****** *)
in(* in-of-local *)
(* ****** ****** *)
//
(* ****** ****** *)
//
#implfun
trans11_g1mac_subs
(env0, g1m0, genv) =
(
f0_g1m0
(env0, g1m0, genv)) where
{
(*
val () =
prerrln
("trans11_g1mac_subs: g1m0 = ", g1m0)
val () =
prerrln
("trans11_g1mac_subs: env0 = ", env0)
*)
} (*where*) // end of [trans11_g1mac_subs]
//
(* ****** ****** *)
//
end (*local*) // end of [local(trans11_g1mac_subs)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans11_gmacro.dats] *)
