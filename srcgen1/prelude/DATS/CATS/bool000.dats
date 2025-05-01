(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
Tue Apr 29 10:16:13 PM EDT 2025
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
bool_neg = XATS000_bool_neg
where{
#extern
fun
XATS000_bool_neg
{b0:bool}
(b0: bool(b0)) : bool(~b0) = $extnam()
}(*where*) // end-of-[impltmp(bool_neg]
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
bool_add = XATS000_bool_add
where
{
#extern
fun
XATS000_bool_add
{b1,b2:bool}
( b1: bool(b1)
, b2: bool(b2)): bool(b1+b2) = $extnam()
}(*where*) // end-of-[ impltmp(bool_add) ]
//
#impltmp
<(*tmp*)>
bool_mul = XATS000_bool_mul
where{
#extern
fun
XATS000_bool_mul
{b1,b2:bool}
( b1: bool(b1)
, b2: bool(b2)): bool(b1*b2) = $extnam()
}(*where*) // end-of-[ impltmp(bool_mul) ]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_bool000.dats] *)
(***********************************************************************)
