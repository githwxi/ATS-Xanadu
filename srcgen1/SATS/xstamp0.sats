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
// Start Time: October, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt"
(* ****** ****** *)
//
abstype
stamp_type = ptr
//
typedef stamp = stamp_type
typedef stampopt = Option(stamp)
//
(* ****** ****** *)
//
val
the_stamp_null: stamp
//
fun
stamp_iseqz
(x0: stamp):<> bool
overload
iseqz with stamp_iseqz
//
(* ****** ****** *)
//
fun
stamp2uint(stamp):<> uint
overload .uint with stamp2uint
//
(* ****** ****** *)
//
fun
lt_stamp_stamp
(x1: stamp, x2: stamp):<> bool
fun
lte_stamp_stamp
(x1: stamp, x2: stamp):<> bool
//
fun
eq_stamp_stamp
(x1: stamp, x2: stamp):<> bool
fun
neq_stamp_stamp
(x1: stamp, x2: stamp):<> bool
//
fun
cmp_stamp_stamp
(x1: stamp, x2: stamp):<> (int)
//
overload < with lt_stamp_stamp
overload <= with lte_stamp_stamp
//
overload = with eq_stamp_stamp
overload != with neq_stamp_stamp
//
overload cmp with cmp_stamp_stamp
//
(* ****** ****** *)
//
fun print_stamp: print_type(stamp)
fun prerr_stamp: prerr_type(stamp)
fun fprint_stamp: fprint_type(stamp)
//
(* ****** ****** *)

abstype stamper_tbox = ptr
typedef stamper = stamper_tbox

(* ****** ****** *)

fun
stamper_new((*void*)): stamper

(* ****** ****** *)
//
fun
stamper_set
  (obj: stamper, n0: uint): void
//
(* ****** ****** *)

fun
stamper_getinc(obj: stamper): stamp

(* ****** ****** *)

(* end of [xats_xstamp0.sats] *)
