(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
Fri 28 Jul 2023 09:39:54 PM EDT
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
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/tread33.sats"
(* ****** ****** *)
//
(* ****** ****** *)
#symload styp with x2t2p_get_styp
(* ****** ****** *)
#symload node with s2typ_get_node
#symload sort with s2typ_get_sort
(* ****** ****** *)
//
(* ****** ****** *)
//
fun
s2typ_errck
(lvl0: sint
,t2p0: s2typ): s2typ =
let
val s2t0 = t2p0.sort()
in//let
s2typ_make_node
(s2t0, T2Perrck(lvl0,t2p0))
end//let//end-of(s2typ_errck)
//
(* ****** ****** *)
//
fun
s2typ_lft_errck
(s2t0: sort2
,t2p1: s2typ): s2typ =
let
val lvl0 = 1
in//let
s2typ_errck
(lvl0, s2typ(s2t0, T2Plft(t2p1)))
end//let//end-of(s2typ_lft_errck(...))
//
(* ****** ****** *)
//
#implfun
tread33_s2typ
( t2p0, err ) =
(
case+
t2p0.node() of
//
|T2Pbas _ => t2p0
|T2Pcst _ => t2p0
//
|T2Plft _ => f0_lft(t2p0, err)
//
|T2Pxtv _ => f0_xtv(t2p0, err)
//
|
_(* otherwise *) =>
let
val lvl0 = 1
in//let
(
err := err+1; s2typ_errck(lvl0,t2p0))
endlet // end of [ _(* otherwise *) ]
) where // end-of-[(*case+(t2p0)-of*)]
{
//
(* ****** ****** *)
//
fun
f0_lft
( t2p: s2typ
, err: &sint >> _): s2typ =
let
//
val e00 = err
//
val-
T2Plft(t2p1) = t2p.node()
//
val
t2p1 = tread33_s2typ(t2p1, err)
in//let
if
(err=e00)
then (t2p) else
(
  s2typ_lft_errck(t2p.sort(), t2p1))
end(*let*)// end-of-[ f0_lft(t2p,err) ]
//
(* ****** ****** *)
//
fun
f0_xtv
( t2p: s2typ
, err: &sint >> _): s2typ =
let
val-
T2Pxtv(xtv1) = t2p.node()
in//let
let
val
t2p1 = xtv1.styp((*void*))
in//let
case+
t2p1.node() of
|T2Pnone0() =>
let
val
lvl = 1 in s2typ_errck(lvl,t2p) end
|_(*else*) => tread33_s2typ(t2p1,err)
end(*let*)
end(*let*)// end-of-[ f0_xtv(t2p,err) ]
//
(* ****** ****** *)
//
// (*
val (  ) =
prerrln("tread33_s2typ: t2p0 = ", t2p0)
// *)
//
} (*where*)//end[ tread33_s2typ(t2p0,err) ]
//
(* ****** ****** *)
//
#implfun
tread33_s2typlst
  (  t2ps, err  ) =
(
  list_tread33_fnp(t2ps, err, tread33_s2typ))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread33_staexp.dats] *)
