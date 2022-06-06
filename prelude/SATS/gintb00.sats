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
// For generic bounded integers
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: Jan/Feb, 2021
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#abstype
sint8_type(i: int)
#abstype
uint8_type(i: int)
#sexpdef
sint8 = sint8_type
#sexpdef
uint8 = uint8_type

(* ****** ****** *)
//
#sexpdef ui8lb =  0
#sexpdef si8lb = -128
#sexpdef si8ub = +127
#sexpdef ui8ub = +255
//
(* ****** ****** *)
//
#sexpdef
si8ck(i: int) =
(si8lb <= i && i <= si8ub)
#sexpdef
ui8ck(i: int) =
(ui8lb <= i && i <= ui8ub)
//
(* ****** ****** *)
//
fun<>
gintb_succ_sint8
{ i : int
| si8ck(i+1) }
( x : sint8(i) ) : sint8(i+1)
fun<>
gintb_pred_sint8
{ i : int
| si8ck(i-1) }
( x : sint8(i) ) : sint8(i-1)
//
(* ****** ****** *)

fun<>
gintb_add_sint8_sint8
{ i,j : int
| si8ck(i+j) }
( x : sint8(i)
, y : sint8(j) ) : sint8(i+j)
fun<>
gintb_sub_sint8_sint8
{ i,j : int
| si8ck(i-j) }
( x : sint8(i)
, y : sint8(j) ) : sint8(i-j)
//
fun<>
gintb_mul_sint8_sint8
{ i,j : int
| si8ck(i*j) }
( x : sint8(i)
, y : sint8(j) ) : sint8(i*j)
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gintb00.sats] *)
