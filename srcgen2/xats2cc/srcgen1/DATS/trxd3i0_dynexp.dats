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
(* ****** ****** *)
//
|D3Pany _ =>
(
  f0_any(d3p0, env0))
|D3Pvar _ =>
(
  f0_var(d3p0, env0))
//
(* ****** ****** *)
//
|D3Pint _ =>
(
  f0_int(d3p0, env0))
|D3Pbtf _ =>
(
  f0_btf(d3p0, env0))
|D3Pchr _ =>
(
  f0_chr(d3p0, env0))
|D3Pflt _ =>
(
  f0_flt(d3p0, env0))
|D3Pstr _ =>
(
  f0_str(d3p0, env0))
//
(* ****** ****** *)
|D3Pcon _ =>
(
  f0_con(d3p0, env0))
(* ****** ****** *)
//
|D3Pdap1 _ =>
(
  f0_dap1(d3p0, env0))
|D3Pdapp _ =>
(
  f0_dapp(d3p0, env0))
//
(* ****** ****** *)
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
end(*let*)//end-of-[f0_var(d3p0,env0)]
//
(* ****** ****** *)
//
fun
f0_int
( d3p0: d3pat
, env0: !envd3i0): i0pat =
let
//
val-
D3Pint
(   tint   ) = d3p0.node()
//
val t2p0 = d3p0.styp((*0*))
val loc0 = d3p0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
in//let
(
i0pat(loc0, i0t0, I0Pint(tint)))
end(*let*)//end-of-[f0_int(d3p0,env0)]
//
(* ****** ****** *)
//
fun
f0_btf
( d3p0: d3pat
, env0: !envd3i0): i0pat =
let
//
val-
D3Pbtf
(   sym1   ) = d3p0.node()
//
val t2p0 = d3p0.styp((*0*))
val loc0 = d3p0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
in//let
(
i0pat(loc0, i0t0, I0Pbtf(sym1)))
end(*let*)//end-of-[f0_btf(d3p0,env0)]
//
(* ****** ****** *)
//
fun
f0_chr
( d3p0: d3pat
, env0: !envd3i0): i0pat =
let
//
val-
D3Pchr
(   tchr   ) = d3p0.node()
//
val t2p0 = d3p0.styp((*0*))
val loc0 = d3p0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
in//let
(
i0pat(loc0, i0t0, I0Pchr(tchr)))
end(*let*)//end-of-[f0_chr(d3p0,env0)]
//
(* ****** ****** *)
//
fun
f0_flt
( d3p0: d3pat
, env0: !envd3i0): i0pat =
let
//
val-
D3Pflt
(   tflt   ) = d3p0.node()
//
val t2p0 = d3p0.styp((*0*))
val loc0 = d3p0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
in//let
(
i0pat(loc0, i0t0, I0Pflt(tflt)))
end(*let*)//end-of-[f0_flt(d3p0,env0)]
//
(* ****** ****** *)
//
fun
f0_str
( d3p0: d3pat
, env0: !envd3i0): i0pat =
let
//
val-
D3Pstr
(   tstr   ) = d3p0.node()
//
val t2p0 = d3p0.styp((*0*))
val loc0 = d3p0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
in//let
(
i0pat(loc0, i0t0, I0Pstr(tstr)))
end(*let*)//end-of-[f0_str(d3p0,env0)]
//
(* ****** ****** *)
//
fun
f0_con
( d3p0: d3pat
, env0: !envd3i0): i0pat =
let
//
val-
D3Pcon
(   dcon   ) = d3p0.node()
//
val t2p0 = d3p0.styp((*0*))
val loc0 = d3p0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
in//let
(
i0pat(loc0, i0t0, I0Pcon(dcon)))
end(*let*)//end-of-[f0_con(d3p0,env0)]
//
(* ****** ****** *)
//
fun
f0_dap1
( d3p0: d3pat
, env0: !envd3i0): i0pat =
let
//
val-
D3Pdap1
(   d3f0   ) = d3p0.node()
//
val t2p0 = d3p0.styp((*0*))
val loc0 = d3p0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
val i3f0 =
(
  d3pat_trxd3i0(d3f0, env0))
//
in//let
(
i0pat(loc0, i0t0, I0Pdap1(i3f0)))
end(*let*)//end-of-[f0_dap1(d3p0,env0)]
//
(* ****** ****** *)
//
fun
f0_dapp
( d3p0: d3pat
, env0: !envd3i0): i0pat =
let
//
val-
D3Pdapp
(d3f0
,npf1, d3ps) = d3p0.node()
//
val t2p0 = d3p0.styp((*0*))
val loc0 = d3p0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
val i3f0 =
(
  d3pat_trxd3i0(d3f0, env0))
val i3ps =
(
  d3patlst_trxd3i0(d3ps, env0))
//
in//let
(
i0pat_make_ityp$node(loc0,
  i0t0, I0Pdapp(i3f0,npf1,i3ps)))
end(*let*)//end-of-[f0_dapp(d3p0,env0)]
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
