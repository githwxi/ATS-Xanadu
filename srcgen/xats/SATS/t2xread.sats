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
// Start Time: June, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload "./staexp1.sats"
#staload "./dynexp1.sats"

(* ****** ****** *)

#staload "./staexp2.sats"
#staload "./dynexp2.sats"

(* ****** ****** *)
//
typedef
t2xreader
(a:t@ype) = (a) -> void
//
(* ****** ****** *)

datatype t2xerr =
| T2XERRd2ecl of (d2ecl)

typedef
t2xerrlst = List0(t2xerr)

(* ****** ****** *)
//
fun{}
t2xerr_add(t2xerr): void
//
(* ****** ****** *)
//
fun
t2xread_main(d2eclist): void
//
(* ****** ****** *)
//
fun{}
t2xread_d1exp: t2xreader(d1exp)
fun{}
t2xread_d1explst: t2xreader(d1explst)
//
(* ****** ****** *)
//
fun{}
t2xread_d2ecl: t2xreader(d2ecl)
fun{}
t2xread_d2eclist: t2xreader(d2eclist)
//
(* ****** ****** *)

(* end of [xats_t2xread.sats] *)
