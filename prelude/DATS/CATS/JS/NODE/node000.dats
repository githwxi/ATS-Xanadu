(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
Sun 01 Sep 2024 07:19:48 AM EDT
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
sint_print<> =
XATS2JS_NODE_sint_print
where
{
#extern
fun
XATS2JS_NODE_sint_print(b0: sint): void = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
bool_print<> =
XATS2JS_NODE_bool_print
where
{
#extern
fun
XATS2JS_NODE_bool_print(b0: bool): void = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
char_print<> =
XATS2JS_NODE_char_print
where
{
#extern
fun
XATS2JS_NODE_char_print(b0: char): void = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
dflt_print<> =
XATS2JS_NODE_dflt_print
where
{
#extern
fun
XATS2JS_NODE_dflt_print(f0: dflt): void = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
strn_print<> =
XATS2JS_NODE_strn_print
where
{
#extern
fun
XATS2JS_NODE_strn_print(cs: strn): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_CATS_JS_NODE_node000.dats] *)
