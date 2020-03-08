(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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

#staload "./staexp1.sats"
#staload "./dynexp1.sats"

(* ****** ****** *)

#staload "./staexp2.sats"
#staload "./statyp2.sats"
#staload "./dynexp2.sats"
#staload "./dynexp3.sats"

(* ****** ****** *)
//
typedef
treader3t
(a:t@ype) = (a) -> void
//
(* ****** ****** *)
//
datatype trerr3t =
//
| TRERR3Td3pat of (d3pat)
| TRERR3Td3exp of (d3exp)
//
| TRERR3Tf3arg of (f3arg)
| TRERR3Td3ecl of (d3ecl)
//
typedef
trerr3tlst = List0(trerr3t)
//
(* ****** ****** *)
//
fun//{}
trerr3t_add(trerr3t): void
//
(* ****** ****** *)
//
fun
tread3t_main(d3eclist): void
//
(* ****** ****** *)

(* end of [xats_tread3t.sats] *)
