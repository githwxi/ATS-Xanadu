(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2021 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: January, 2021
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.libxatsopt"
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
#staload "./dynexp4.sats"
//
(* ****** ****** *)
//
typedef
treader34
(a:t@ype) = (a) -> void
//
(* ****** ****** *)
//
datatype trerr34 =
//
| TRERR34d4pat of (d4pat)
| TRERR34d4exp of (d4exp)
//
typedef
trerr34lst = List0(trerr34)
//
(* ****** ****** *)
//
fun//{}
trerr34_add(trerr34): void
//
(* ****** ****** *)
//
fun
tread34_package
  ( p4kg: d4transd ): void
//
(* ****** ****** *)
//
fun//{}
tread34_d4pat: treader34(d4pat)
fun//{}
tread34_d4patlst: treader34(d4patlst)
//
(* ****** ****** *)
//
fun//{}
tread34_d4exp: treader34(d4exp)
fun//{}
tread34_d4explst: treader34(d4explst)
fun//{}
tread34_d4expopt: treader34(d4expopt)
//
(* ****** ****** *)
//
fun//{}
tread34_d4ecl: treader34(d4ecl)
fun//{}
tread34_d4eclist: treader34(d4eclist)
//
(* ****** ****** *)
//
fun//{}
tread34_d4valdecl: treader34(d4valdecl)
fun//{}
tread34_d4vardecl: treader34(d4vardecl)
fun//{}
tread34_d4fundecl: treader34(d4fundecl)
//
(* ****** ****** *)
//
fun//{}
tread34_d4valdeclist: treader34(d4valdeclist)
fun//{}
tread34_d4vardeclist: treader34(d4vardeclist)
fun//{}
tread34_d4fundeclist: treader34(d4fundeclist)
//
(* ****** ****** *)

(* end of [xats_tread34.sats] *)
