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
(*
** for flat tuples
** for boxed tuples
*)
(* ****** ****** *)
//
// Author: Hongwei Xi
// (Around some time in 2022)
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
(*
// HX-2023-08-06:
// @(...): flat tuple
// #(...): boxd tuple
// $tup(...): boxd tuple
// (Change: $(...) -> #(...))
// Sun Aug  6 19:45:40 EDT 2023
*)
(* ****** ****** *)
//
(*
#vwtpdef
t0up1(a0:vt) = @(a0)
*)
#vwtpdef
t1up1(a0:vt) = $tup(a0)
//
(* ****** ****** *)
#vwtpdef
t0up2
(a0:vt,a1:vt) = @(a0,a1)
#vwtpdef
t1up2
(a0:vt,a1:vt) = $tup(a0,a1)
(* ****** ****** *)
#vwtpdef
t0up3
(a0:vt
,a1:vt,a2:vt) = @(a0,a1,a2)
#vwtpdef
t1up3
(a0:vt
,a1:vt,a2:vt) = $tup(a0,a1,a2)
(* ****** ****** *)
#vwtpdef
t0up4
(a0:vt
,a1:vt
,a2:vt,a3:vt) = @(a0,a1,a2,a3)
#vwtpdef
t1up4
(a0:vt
,a1:vt
,a2:vt,a3:vt) = $tup(a0,a1,a2,a3)
(* ****** ****** *)
#vwtpdef
t0up5
(a0:vt
,a1:vt,a2:vt
,a3:vt,a4:vt) = @(a0,a1,a2,a3,a4)
#vwtpdef
t1up5
(a0:vt
,a1:vt,a2:vt
,a3:vt,a4:vt) = $tup(a0,a1,a2,a3,a4)
(* ****** ****** *)
#vwtpdef
t0up6
(a0:vt,a1:vt
,a2:vt,a3:vt
,a4:vt,a5:vt) = @(a0,a1,a2,a3,a4,a5)
#vwtpdef
t1up6
(a0:vt,a1:vt
,a2:vt,a3:vt
,a4:vt,a5:vt) = $tup(a0,a1,a2,a3,a4,a5)
(* ****** ****** *)
#vwtpdef
t0up7
(a0:vt
,a1:vt,a2:vt
,a3:vt,a4:vt
,a5:vt,a6:vt) = @(a0,a1,a2,a3,a4,a5,a6)
#vwtpdef
t1up7
(a0:vt
,a1:vt,a2:vt
,a3:vt,a4:vt
,a5:vt,a6:vt) = $tup(a0,a1,a2,a3,a4,a5,a6)
(* ****** ****** *)
#vwtpdef
t0up8
(a0:vt,a1:vt
,a2:vt,a3:vt
,a4:vt,a5:vt
,a6:vt,a7:vt) = @(a0,a1,a2,a3,a4,a5,a6,a7)
#vwtpdef
t1up8
(a0:vt,a1:vt
,a2:vt,a3:vt
,a4:vt,a5:vt
,a6:vt,a7:vt) = $tup(a0,a1,a2,a3,a4,a5,a6,a7)
(* ****** ****** *)
#vwtpdef
t0up9
(a0:vt
,a1:vt,a2:vt
,a3:vt,a4:vt
,a5:vt,a6:vt
,a7:vt,a8:vt) = @(a0,a1,a2,a3,a4,a5,a6,a7,a8)
#vwtpdef
t1up9
(a0:vt
,a1:vt,a2:vt
,a3:vt,a4:vt
,a5:vt,a6:vt
,a7:vt,a8:vt) = $tup(a0,a1,a2,a3,a4,a5,a6,a7,a8)
(* ****** ****** *)
#vwtpdef
t0up10
(a0:vt,a1:vt
,a2:vt,a3:vt
,a4:vt,a5:vt
,a6:vt,a7:vt
,a8:vt,a9:vt) = @(a0,a1,a2,a3,a4,a5,a6,a7,a8,a9)
#vwtpdef
t1up10
(a0:vt,a1:vt
,a2:vt,a3:vt
,a4:vt,a5:vt
,a6:vt,a7:vt
,a8:vt,a9:vt) = $tup(a0,a1,a2,a3,a4,a5,a6,a7,a8,a9)
(* ****** ****** *)
fun<>
t0up_print$beg(): void // print("@(") // flat-tupl
fun<>
t1up_print$beg(): void // print("#(") // boxd-tupl
(* ****** ****** *)
fun<>
t0up_print$end(): void // print (")" ) // flat-tupl
fun<>
t1up_print$end(): void // print( ")" ) // boxd-tupl
(* ****** ****** *)
fun<>
t0up_print$sep(): void // print( "," ) // flat-tupl
fun<>
t1up_print$sep(): void // print( "," ) // boxd-tupl
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_tupl000.sats] *)
