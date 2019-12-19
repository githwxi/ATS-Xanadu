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
treader01
(a:t@ype) = (a) -> void
//
(* ****** ****** *)

datatype
trerr01 =
| TRERR01d1ecl of (d1ecl)

typedef
trerr01lst = List0(trerr01)

(* ****** ****** *)
//
fun{}
trerr01_add(trerr01): void
//
(* ****** ****** *)
//
fun
tread01_main(d1eclist): void
//
(* ****** ****** *)
//
fun{}
tread01_s1exp: treader01(s1exp)
fun{}
tread01_s1expopt: treader01(s1expopt)
fun{}
tread01_s1explst: treader01(s1explst)
//
(* ****** ****** *)
//
fun{}
tread01_s1qua: treader01(s1qua)
fun{}
tread01_s1qualst: treader01(s1qualst)
//
(* ****** ****** *)
//
fun{}
tread01_d1pat: treader01(d1pat)
fun{}
tread01_d1patlst: treader01(d1patlst)
//
(* ****** ****** *)
//
fun{}
tread01_d1exp: treader01(d1exp)
fun{}
tread01_d1expopt: treader01(d1expopt)
fun{}
tread01_d1explst: treader01(d1explst)
//
(* ****** ****** *)
//
fun{}
tread01_d1ecl: treader01(d1ecl)
fun{}
tread01_d1eclist: treader01(d1eclist)
//
(* ****** ****** *)
//
fun{}
tread01_wths1expopt: treader01(wths1expopt)
//
(* ****** ****** *)

fun{}
tread01_f1arg: treader01(f1arg)
fun{}
tread01_f1arglst: treader01(f1arglst)

(* ****** ****** *)

fun{}
tread01_f1undecl: treader01(f1undecl)
fun{}
tread01_f1undeclist: treader01(f1undeclist)

(* ****** ****** *)

(* end of [xats_tread01.sats] *)
