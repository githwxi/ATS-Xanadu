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
Wed 26 Jul 2023 04:00:12 PM EDT
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
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/tread33.sats"
(* ****** ****** *)
#symload lctn with d3pat_get_lctn
#symload node with d3pat_get_node
#symload styp with d3pat_get_styp
#symload styp with d3pat_set_styp
(* ****** ****** *)
#symload lctn with d3exp_get_lctn
#symload node with d3exp_get_node
#symload styp with d3exp_get_styp
#symload styp with d3exp_set_styp
(* ****** ****** *)
//
fun
d3pat_errck
(lvl0: sint
,d3p0: d3pat): d3pat =
let
val loc0 = d3p0.lctn()
in//let
d3pat_make_node
(loc0, D3Perrck(lvl0,d3p0))
end//let//end-of(d3pat_errck)
//
(* ****** ****** *)
//
fun
d3exp_errck
(lvl0: sint
,d3e0: d3exp): d3exp =
let
val loc0 = d3e0.lctn()
in//let
d3exp_make_node
(loc0, D3Eerrck(lvl0,d3e0))
end//let//end-of(d3exp_errck)
//
(* ****** ****** *)
(*
HX-2023:
Various d3pat-errck functions
*)
(* ****** ****** *)
//
fun
d3pat_var_errck
(loc0: loc_t
,t2p0: s2typ
,d3v1: d2var): d3pat =
let
val lvl = 0 in//let
d3pat_errck
( lvl+1
, d3pat(loc0, t2p0, D3Pvar(d3v1)))
endlet//end of [d3pat_var_errck(...)]
//
(* ****** ****** *)
(*
HX-2023:
Various d3exp-errck functions
*)
(* ****** ****** *)
//
fun
d3exp_var_errck
(loc0: loc_t
,t2p0: s2typ
,d3v1: d2var): d3exp =
let
val lvl = 0 in//let
d3exp_errck
( lvl+1
, d3exp(loc0, t2p0, D3Evar(d3v1)))
endlet//end of [d3exp_var_errck(...)]
//
(* ****** ****** *)
//
#implfun
tread33_d3pat
( d3p0, err ) =
(
case+
d3p0.node() of
//
|
D3Pvar _ =>
f0_var(d3p0, err)
//
|D3Pint _ => d3p0
|D3Pbtf _ => d3p0
|D3Pchr _ => d3p0
|D3Pflt _ => d3p0
|D3Pstr _ => d3p0
//
| _(*otherwise*) =>
let
val lvl0 = 1
in//let
(
err := err+1; d3pat_errck(lvl0,d3p0))
endlet // end of [ _(* otherwise *) ]
//
) where // end-of-[(*case+(d3p0)-of*)]
{
//
(* ****** ****** *)
//
fun
f0_var
( d3p: d3pat
, err: &sint >> _): d3pat =
let
//
val e00 = err
//
val t2p = d3p.styp()
val t2p =
tread33_s2typ(t2p, err)
//
val ( ) = d3p.styp(t2p)
//
val-
D3Pvar(d2v1) = d3p.node()
//
in//let
if
(err=e00)
then (d3p) else
let
val loc = d3p.lctn() in
d3pat_var_errck(loc, t2p, d2v1) endlet
end (*let*) // end of [f0_var(d3p,err)]
//
(* ****** ****** *)
//
} (*where*)//end[tread33_d3pat(d3p0,err)]

(* ****** ****** *)
//
#implfun
tread33_d3exp
( d3e0, err ) =
(
case+
d3e0.node() of
//
|
D3Evar _ =>
f0_var(d3e0, err)
//
|D3Eint _ => d3e0
|D3Ebtf _ => d3e0
|D3Echr _ => d3e0
|D3Eflt _ => d3e0
|D3Estr _ => d3e0
//
|D3Ei00 _ => d3e0
|D3Eb00 _ => d3e0
|D3Ec00 _ => d3e0
|D3Ef00 _ => d3e0
|D3Es00 _ => d3e0
//
|
_(* otherwise *) =>
let
val lvl0 = 1 in//let
(
err := err+1; d3exp_errck(lvl0,d3e0))
endlet // end of [ _(* otherwise *) ]
//
) where // end-of-[(*case+(d3e0)-of*)]
{
//
(* ****** ****** *)
//
fun
f0_var
( d3e: d3exp
, err: &sint >> _): d3exp =
let
//
val e00 = err
//
val t2p = d3e.styp()
val t2p =
tread33_s2typ(t2p, err)
//
val ( ) = d3e.styp(t2p)
//
val-
D3Evar(d2v1) = d3e.node()
//
in//let
if
(err=e00)
then (d3e) else
let
val loc = d3e.lctn() in
d3exp_var_errck(loc, t2p, d2v1) endlet
end (*let*) // end of [f0_var(d3e,err)]
//
(* ****** ****** *)
//
} (*where*)//end-[tread33_d3exp(d3e0,err)]

(* ****** ****** *)
//
#implfun
tread33_d3patlst
  (  d3ps, err  ) =
(
  list_tread33_fnp(d3ps, err, tread33_d3pat))
//
(* ****** ****** *)
//
#implfun
tread33_d3explst
  (  d3es, err  ) =
(
  list_tread33_fnp(d3es, err, tread33_d3exp))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread33_dynexp.dats] *)
