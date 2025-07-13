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
Sat Jul  5 02:08:23 PM EDT 2025
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
"./../SATS/dynexp3.sats"
#staload
"./../SATS/trxltck.sats"
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
"prelude/SATS/gsyn000.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../../../SATS/staexp2.sats"
#staload
"./../../../SATS/statyp2.sats"
#staload
"./../../../SATS/dynexp2.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
s2typ_linq
(t2p0: s2typ): bool =
(
  sort2_linq(t2p0.sort()))
fun
d2var_linq
(d2v0: d2var): bool =
(
  s2typ_linq(d2v0.styp()))
//
fun
s2typ1_linq
(t2q0: s2typ1): bool =
(
  sort2_linq(t2q0.sort()))
//
#symload linq with sort2_linq
#symload linq with s2typ_linq
#symload linq with d2var_linq
#symload linq with s2typ1_linq
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
sort2_delin
(s2t0: sort2): sort2 =
(
case+ s2t0 of
|
S2Tbas(s2tb) =>
(
case+ s2tb of
|T2Bimpr
(knd, sym) =>
let
  val msk =
    lnot(g0s2u(2))
  val knd = g0s2u(knd)
  val knd =
    g0u2s(knd\land(msk))
in
  S2Tbas(T2Bimpr(knd, sym))
end
|_(*non-T2Bimpr*) => (s2t0)
)
|_(* non-S2Tbas *) => (s2t0)
)(*case+*)//end-of-[sort2_delin(...)]
//
(* ****** ****** *)
//
fun
s2typ1_delin
(t2q0: s2typ1): s2typ1 =
let
val s2t0 = t2q0.sort()
in//let
//
if
not(
linq(s2t0))
then t2q0 else
let
val s2t0 =
(
sort2_delin(s2t0))
in//let
s2typ1(s2t0, T2P1top1(t2q0))
end//else//end-of-[if]
end//end-of-[s2typ1_delin(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3pat1_trxltck
(d3p0, env0) =
let
//
val loc0 = d3p0.lctn()
val t2q0 = d3p0.styp()
//
val () =
prerrsln("\
d3pat1_trxltck: loc0 = ", loc0)
val () =
prerrsln("\
d3pat1_trxltck: d3p0 = ", d3p0)
//
in//let
//
case+
d3p0.node() of
//
|D3P1int(tint) => ( (*void*) )
|D3P1btf(sbtf) => ( (*void*) )
|D3P1chr(tchr) => ( (*void*) )
|D3P1flt(tflt) => ( (*void*) )
|D3P1str(tstr) => ( (*void*) )
//
|_(*otherwise*) => (   (*skipped*)    )
//
end(*let*)//end-of-[d3pat1_trxltck(d3e0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3exp1_trxltck
(d3e0, env0) =
let
//
val () =
prerrsln("\
d3exp1_trxltck: loc0 = ", loc0)
val () =
prerrsln("\
d3exp1_trxltck: d3e0 = ", d3e0)
//
in//let
//
case+
d3e0.node() of
//
|D3E1int(tint) =>
d3exp1
(loc0, t2q0, D3E1int(tint))
|D3E1btf(sbtf) =>
d3exp1
(loc0, t2q0, D3E1btf(sbtf))
|D3E1chr(tchr) =>
d3exp1
(loc0, t2q0, D3E1chr(tchr))
|D3E1flt(tflt) =>
d3exp1
(loc0, t2q0, D3E1flt(tflt))
|D3E1str(tstr) =>
d3exp1
(loc0, t2q0, D3E1str(tstr))
//
|D3E1var _ => f0_var(d3e0, env0)
//
(* ****** ****** *)
//
|D3E1flat _ => f0_flat(d3e0, env0)
//
(* ****** ****** *)
//
|D3E1assgn _ => f0_assgn(d3e0, env0)
//
(* ****** ****** *)
//
|_(*otherwise*) =>
d3exp1
(loc0, t2q0, D3E1errck(0(*lvl*), d3e0))
//
(* ****** ****** *)
//
end where
{
//
(* ****** ****** *)
//
val loc0 = d3e0.lctn()
val t2q0 = d3e0.styp()
//
(* ****** ****** *)
//
fun
f0_var
( d3e0: d3exp1
, env0: !envltck): d3exp1 =
let
//
val-
D3E1var
(   d2v1   ) = d3e0.node()
//
in//let
//
if
not(
linq(d2v1))
then
(
d3exp1
(loc0, t2q0, D3E1var(d2v1)))
else
let
val t2q1 =
envltck_dvar$take(env0, d2v1)
in//let
d3exp1(loc0, t2q1, D3E1var(d2v1))
end//let
//
end//let//end-of-[f0_var(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_flat
( d3e0: d3exp1
, env0: !envltck): d3exp1 =
let
//
val-
D3E1flat
(   d3e1   ) = d3e0.node()
//
val d3e1 =
(
  d3exp1_trxltck(d3e1, env0))
//
in//let
d3exp1(loc0, t2q0, D3E1flat(d3e1))
end//let//end-of-[f0_flat(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_assgn
( d3e0: d3exp1
, env0: !envltck): d3exp1 =
let
//
val-
D3E1assgn
(d3el, d3er) = d3e0.node()
//
(*
HX-2025-07-13:
[d3er] must be
handled ahead of [d3el]!
*)
val d3er =
(
  d3exp1_trxltck(d3er, env0))
//
val d3el =
(
  d3exp1_trxltck(d3el, env0))
//
in//let
d3exp1
(loc0, t2q0, D3E1assgn(d3el, d3er))
end//let//end-of-[f0_assgn(d3e0,env0)]
//
(* ****** ****** *)
//
}(*where*)//end-of-[d3exp1_trxltck(d3e0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_trxltck_dynexp.dats] *)
(***********************************************************************)
