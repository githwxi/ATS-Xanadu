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
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/tread33.sats"
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
(loc0, D3Perrck(lvl0, d3p0))
end (*let*)//end-of(d3pat_errck)
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
(loc0, D3Eerrck(lvl0, d3e0))
end (*let*)//end-of(d3exp_errck)
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
| _(*otherwise*) =>
let
val lvl0 = 1
in//let
(
err := err+1; d3exp_errck(lvl0,d3e0))
endlet // end of [ _(* otherwise *) ]
//
) where // end-of-[(*case+(d3e0)-of*)]
{
//
(* ****** ****** *)
(* ****** ****** *)
//
} (*where*)//end-[tread33_d3exp(d3e0,err)]

(* ****** ****** *)
//
#implfun
tread33_d3patlst
  (  d3ps, err  ) =
list_tread33_fnp(d3ps, err, tread33_d3pat)
//
(* ****** ****** *)
//
#implfun
tread33_d3explst
  (  d3es, err  ) =
list_tread33_fnp(d3es, err, tread33_d3exp)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread33_dynexp.dats] *)
