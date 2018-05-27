(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
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
// Start Time: May, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
abstbox symbol_tbox // boxed
//
typedef symbol = symbol_tbox
typedef symbolist = List0(symbol)
typedef symbolopt = Option(symbol)
//
(* ****** ****** *)

val symbol_nil : symbol // SYMBOL("")

(* ****** ****** *)
//
val symbol_ADD : symbol // SYMBOL("+")
val symbol_SUB : symbol // SYMBOL("-")
val symbol_MUL : symbol // SYMBOL("*")
val symbol_DIV : symbol // SYMBOL("/")
//
(* ****** ****** *)
//
val symbol_LT : symbol // SYMBOL("<")
val symbol_GT : symbol // SYMBOL(">")
val symbol_LTEQ : symbol // SYMBOL("<=")
val symbol_GTEQ : symbol // SYMBOL(">=")
//
(* ****** ****** *)
//
val symbol_EQ : symbol // SYMBOL("=")
val symbol_EQEQ : symbol // SYMBOL("==")
val symbol_LTGT : symbol // SYMBOL("<>")
val symbol_BANGEQ : symbol // SYMBOL("!=")
//
(* ****** ****** *)

val symbol__STDIN__ : symbol // SYMBOL("__STDIN__")
val symbol__STRING__ : symbol // SYMBOL("__STRING__")

(* ****** ****** *)
//
fun
symbol_make(name: string): symbol
//
(* ****** ****** *)
//
fun
symbol_get_name(symbol):<> string
fun
symbol_get_stamp(x: symbol):<> uint
//
overload .name with symbol_get_name
overload .stamp with symbol_get_stamp
//
(* ****** ****** *)
//
fun
print_symbol : (symbol) -> void
fun
prerr_symbol : (symbol) -> void
fun
fprint_symbol : (FILEref, symbol) -> void
//
overload print with print_symbol
overload prerr with prerr_symbol
overload fprint with fprint_symbol
//
(* ****** ****** *)

(* end of [xats_symbol.sats] *)
