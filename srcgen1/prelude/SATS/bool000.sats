(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
// For booleans
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: March, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
(*
#typedef strn = string
*)
(* ****** ****** *)
val
the_bool_true:bool(tt)
val
the_bool_false:bool(ff)
(* ****** ****** *)
//
fun<>
bool_neg
{b:bool}
(x0: bool(b)): bool(~b)
//
(* ****** ****** *)
//
fun<>
bool_add
{b1,b2:bool}
(x1: bool(b1)
,y2: bool(b2)): bool(b1+b2)
fun<>
bool_mul
{b1,b2:bool}
(x1: bool(b1)
,y2: bool(b2)): bool(b1*b2)
//
(* ****** ****** *)
fun<>
bool2sint
{b:bool}
(x0: bool(b)): sint(b2i(b))
(* ****** ****** *)
//
fun<>
bool_print(btf: bool): void
//
fun<>
bool_parse(rep: strn): bool
//
(* ****** ****** *)
//
(*
HX: torep for parsing
*)
fun<>
bool_torep(btf: bool): strn
(*
HX: tostr for debugging
*)
fun<>
bool_tostr(btf: bool): strn
//
(* ****** ****** *)
//
fun
<a:t0>
bool_ifval
{b:b0}
(b: bool(b), x: a, y: a): (a)
//
(* ****** ****** *)
//
// HX-2020-05-30:
// symbol overloading for bool
//
(* ****** ****** *)
//
#symload
~ with bool_neg of 1000
#symload
neg with bool_neg of 1000
#symload
not with bool_neg of 1000
//
(* ****** ****** *)
//
#symload + with bool_add of 1000
#symload * with bool_mul of 1000
//
(* ****** ****** *)

#symload sint with bool2sint of 1000

(* ****** ****** *)
//
(*
#symload print with bool_print of 1000
*)
//
(* ****** ****** *)
#symload ifval with bool_ifval of 1000
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_bool000.sats] *)
