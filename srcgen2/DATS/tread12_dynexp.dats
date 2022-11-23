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
Fri 11 Nov 2022 03:46:50 PM EST
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
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/tread12.sats"
(* ****** ****** *)
//
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with d2pat_get_lctn
#symload node with d2pat_get_node
(* ****** ****** *)
#symload lctn with d2exp_get_lctn
#symload node with d2exp_get_node
(* ****** ****** *)
//
(* ****** ****** *)
//
fun
d2pat_errck
(lvl0: sint
,d2p0: d2pat): d2pat =
let
val loc0 = d2p0.lctn()
in//let
d2pat_make_node
(loc0, D2Perrck(lvl0, d2p0))
end (*let*)//end-of(d2pat_errck)
//
(* ****** ****** *)
//
fun
d2exp_errck
(lvl0: sint
,d2e0: d2exp): d2exp =
let
val loc0 = d2e0.lctn()
in//let
d2exp_make_node
(loc0, D2Eerrck(lvl0, d2e0))
end (*let*)//end-of(d2exp_errck)
//
(* ****** ****** *)
//
fun
d2pat_errvl_a1
(d2p0: d2pat): sint =
(
case+ d2p0.node() of
|
D2Perrck
(lvl0, _) => lvl0 | _ => 0
)
#symload
d2pat_errvl with d2pat_errvl_a1
#symload errvl with d2pat_errvl_a1
//
(* ****** ****** *)
//
fun
d2pat_errvl_a2
(d2p1: d2pat
,d2p2: d2pat): sint =
gmax
(errvl(d2p1),errvl(d2p2))
#symload
d2pat_errvl with d2pat_errvl_a2
#symload errvl with d2pat_errvl_a2
//
(* ****** ****** *)
//
fun
d2pat_bang_errck
(loc0: loc_t
,d2p1: d2pat): d2pat =
let
val lvl0 = errvl(d2p1) in//let
d2pat_errck
(lvl0+1,d2pat(loc0, D2Pbang(d2p1)))
endlet // end of [d2pat_bang_errck(...)]
//
fun
d2pat_flat_errck
(loc0: loc_t
,d2p1: d2pat): d2pat =
let
val lvl0 = errvl(d2p1) in//let
d2pat_errck
(lvl0+1,d2pat(loc0, D2Pflat(d2p1)))
endlet // end of [d2pat_flat_errck(...)]
//
fun
d2pat_free_errck
(loc0: loc_t
,d2p1: d2pat): d2pat =
let
val lvl0 = errvl(d2p1) in//let
d2pat_errck
(lvl0+1,d2pat(loc0, D2Pfree(d2p1)))
endlet // end of [d2pat_free_errck(...)]
//
(* ****** ****** *)
//
#implfun
tread12_d2pat
( d2p0, err ) =
(
case+
d2p0.node() of
//
|D2Pint _ => d2p0
|D2Pbtf _ => d2p0
|D2Pchr _ => d2p0
|D2Pflt _ => d2p0
|D2Pstr _ => d2p0
//
|D2Pcon _ => d2p0
|D2Pcons _ => d2p0
//
|D2Pbang(d2p1) => f0_bang(d2p0, err)
|D2Pflat(d2p1) => f0_flat(d2p0, err)
|D2Pfree(d2p1) => f0_free(d2p0, err)
//
| _(*otherwise*) =>
let
val lvl0 = 1
in//let
(
err := err+1; d2pat_errck(lvl0,d2p0))
endlet // end of [ _(* otherwise *) ]
//
) where // end-of-[(*case+(d2p0)-of*)]
{
//
(* ****** ****** *)
//
fun
f0_bang
(d2p: d2pat
,err: &sint >> _): d2pat =
let
//
val e00 = err
//
val-
D2Pbang(d2p1) = d2p.node()
val
d2p1 = tread12_d2pat(d2p1, err)
in//let
if
(e00=err)
then (d2p) else
d2pat_bang_errck(d2p.lctn(), d2p1)
end (*let*) // end of [f0_bang(d2p,err)]
//
(* ****** ****** *)
//
fun
f0_flat
(d2p: d2pat
,err: &sint >> _): d2pat =
let
//
val e00 = err
//
val-
D2Pflat(d2p1) = d2p.node()
val
d2p1 = tread12_d2pat(d2p1, err)
in//let
if
(e00=err)
then (d2p) else
d2pat_flat_errck(d2p.lctn(), d2p1)
end (*let*) // end of [f0_flat(d2p,err)]
//
(* ****** ****** *)
//
fun
f0_free
(d2p: d2pat
,err: &sint >> _): d2pat =
let
//
val e00 = err
//
val-
D2Pfree(d2p1) = d2p.node()
val
d2p1 = tread12_d2pat(d2p1, err)
in//let
if
(e00=err)
then (d2p) else
d2pat_free_errck(d2p.lctn(), d2p1)
end (*let*) // end of [f0_free(d2p,err)]
//
(* ****** ****** *)
//
(*
val (  ) =
prerrln("tread12_d2pat: d2p0 = ", d2p0)
*)
//
} (*where*)//end[tread12_d2pat(d2p0,err)]
//
(* ****** ****** *)
//
#implfun
tread12_d2exp
( d2e0, err ) =
(
case+
d2e0.node() of
//
|D2Eid0 _ =>
d2exp_errck
(lvl0, d2e0) where
{
val lvl0 = 1
val (  ) = err := err+1 }
//
|D2Eint _ => d2e0
|D2Ebtf _ => d2e0
|D2Echr _ => d2e0
|D2Eflt _ => d2e0
|D2Estr _ => d2e0
//
|D2Evar _ => d2e0
//
|D2Econ _ => d2e0
|D2Ecst _ => d2e0
//
|D2Econs _ => d2e0
|D2Ecsts _ => d2e0
//
| _(*otherwise*) =>
let
val lvl0 = 1
in//let
(
err := err+1; d2exp_errck(lvl0,d2e0))
endlet // end of [ _(* otherwise *) ]
//
) where // end-of-[(*case+(d2e0)-of*)]
{
//
(*
val (  ) =
prerrln("tread12_d2exp: d2e0 = ", d2e0)
*)
//
} (*where*)//end[tread12_d2exp(d2e0,err)]
//
(* ****** ****** *)
//
(* ****** ****** *)
//
#implfun
tread12_d2patlst
  (  d2ps, err  ) =
list_tread12_fnp(d2ps, err, tread12_d2pat)
//
#implfun
tread12_d2explst
  (  d2es, err  ) =
list_tread12_fnp(d2es, err, tread12_d2exp)
//
(* ****** ****** *)
//
#implfun
tread12_d2expopt
  (  d2es, err  ) =
optn_tread12_fnp(d2es, err, tread12_d2exp)
//
(* ****** ****** *)
//
#implfun
tread12_l2d2plst
  (  ldes, err  ) =
list_tread12_fnp(ldes, err, tread12_l2d2p)
//
#implfun
tread12_l2d2elst
  (  ldes, err  ) =
list_tread12_fnp(ldes, err, tread12_l2d2e)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread12_dynexp.dats] *)
