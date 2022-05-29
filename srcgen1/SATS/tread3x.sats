(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author: Hongwei Xi
// Start Time: September, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt"
(* ****** ****** *)
//
#staload "./staexp1.sats"
#staload "./dynexp1.sats"
//
(* ****** ****** *)
//
#staload "./staexp2.sats"
#staload "./statyp2.sats"
#staload "./dynexp2.sats"
#staload "./dynexp3.sats"
//
(* ****** ****** *)
//
typedef
treader3x
(a:t@ype) = (a) -> void
//
(* ****** ****** *)
//
datatype trerr3x =
//
| TRERR3Xd3pat of (d3pat)
| TRERR3Xf3arg of (f3arg)
//
| TRERR3Xd3exp of (d3exp)
| TRERR3Xd3ecl of (d3ecl)
//
| TRERR3Xd3exp_tcst of (d3exp)
//
| TRERR3Xd3exp_terr of (d3exp)
//
| TRERR3Xd3exp_tapp of (d3exp)
| TRERR3Xd3exp_timp2f of (d3exp, d3fundecl)
//
typedef
trerr3xlst = List0(trerr3x)
//
(* ****** ****** *)
//
fun//{}
trerr3x_add(trerr3x): void
//
(* ****** ****** *)
//
fun
tread3x_package
  ( p3kg: d3transd ): void
//
(* ****** ****** *)
//
fun//{}
tread3x_d3pat: treader3x(d3pat)
fun//{}
tread3x_d3patlst: treader3x(d3patlst)
//
(* ****** ****** *)
//
fun//{}
tread3x_d3exp: treader3x(d3exp)
fun//{}
tread3x_d3explst: treader3x(d3explst)
fun//{}
tread3x_d3expopt: treader3x(d3expopt)
//
(* ****** ****** *)
//
fun//{}
tread3x_d3gua: treader3x(d3gua)
fun//{}
tread3x_d3gpat: treader3x(d3gpat)
fun//{}
tread3x_d3clau: treader3x(d3clau)
fun//{}
tread3x_d3gualst: treader3x(d3gualst)
fun//{}
tread3x_d3claulst: treader3x(d3claulst)
//
(* ****** ****** *)
//
fun//{}
tread3x_d3ecl: treader3x(d3ecl)
fun//{}
tread3x_d3eclist: treader3x(d3eclist)
//
(* ****** ****** *)
//
fun//{}
tread3x_d3valdecl: treader3x(d3valdecl)
fun//{}
tread3x_d3vardecl: treader3x(d3vardecl)
fun//{}
tread3x_d3fundecl: treader3x(d3fundecl)
//
fun//{}
tread3x_d3valdeclist: treader3x(d3valdeclist)
fun//{}
tread3x_d3vardeclist: treader3x(d3vardeclist)
fun//{}
tread3x_d3fundeclist: treader3x(d3fundeclist)
//
(* ****** ****** *)

(* end of [xats_tread3x.sats] *)
