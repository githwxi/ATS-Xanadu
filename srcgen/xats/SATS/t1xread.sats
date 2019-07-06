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
//
typedef
t1xreader
(a:t@ype) = (a) -> void
//
(* ****** ****** *)

datatype t1xerr =
| T1XERRd1ecl of (d1ecl)

typedef
t1xerrlst = List0(t1xerr)

(* ****** ****** *)
//
fun{}
t1xerr_add(t1xerr): void
//
(* ****** ****** *)
//
fun
t1xread_main(d1eclist): void
//
(* ****** ****** *)
//
fun{}
t1xread_d1exp: t1xreader(d1exp)
fun{}
t1xread_d1explst: t1xreader(d1explst)
//
(* ****** ****** *)
//
fun{}
t1xread_d1ecl: t1xreader(d1ecl)
fun{}
t1xread_d1eclist: t1xreader(d1eclist)
//
(* ****** ****** *)

(* end of [xats_t1xread.sats] *)
