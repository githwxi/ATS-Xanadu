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
// Start Time: May, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload "./basics.sats"

(* ****** ****** *)
//
abstbox symbol_tbox = ptr
//
typedef sym_t = symbol_tbox
//
typedef symbol = symbol_tbox
//
typedef
symbolist = List0(symbol)
typedef
symbolopt = Option(symbol)
//
vtypedef
symbolist_vt = List0_vt(symbol)
vtypedef
symbolopt_vt = Option_vt(symbol)
//
(* ****** ****** *)

val symbol_nil : symbol // SYMBOL("")

(* ****** ****** *)
//
val AMP_symbol : symbol // symbol("&")
val BAR_symbol : symbol // symbol("|")
//
(* ****** ****** *)
//
val ADD_symbol : symbol // SYMBOL("+")
val SUB_symbol : symbol // SYMBOL("-")
val MUL_symbol : symbol // SYMBOL("*")
val DIV_symbol : symbol // SYMBOL("/")
//
(* ****** ****** *)
//
val LT_symbol : symbol // SYMBOL("<")
val GT_symbol : symbol // SYMBOL(">")
val LTEQ_symbol : symbol // SYMBOL("<=")
val GTEQ_symbol : symbol // SYMBOL(">=")
//
(* ****** ****** *)
//
val EQ_symbol : symbol // SYMBOL("=")
val EQEQ_symbol : symbol // SYMBOL("==")
val LTGT_symbol : symbol // SYMBOL("<>")
val BANGEQ_symbol : symbol // SYMBOL("!=")
//
(* ****** ****** *)
//
val EQLT_symbol : symbol // SYMBOL("=<")
val EQGT_symbol : symbol // SYMBOL("=>")
//
val MSLT_symbol : symbol // symbol("-<")
val MSGT_symbol : symbol // symbol("->")
//
(* ****** ****** *)

val LPAREN_symbol : symbol // symbol("(")
val RPAREN_symbol : symbol // symbol(")")

val LBRACK_symbol : symbol // symbol("[")
val RBRACK_symbol : symbol // symbol("]")

val LBRACE_symbol : symbol // symbol("{")
val RBRACE_symbol : symbol // symbol("}")

(* ****** ****** *)

val BSLASH_symbol : symbol // symbol("\")

(* ****** ****** *)

val INT_symbol : symbol // int sort
val ADDR_symbol : symbol // addr sort
val BOOL_symbol : symbol // bool sort
val CHAR_symbol : symbol // char sort

val REAL_symbol : symbol // real sort

val FLOAT_symbol : symbol // float sort
val STRING_symbol : symbol // string sort

(* ****** ****** *)
//
val PROP_symbol : symbol // prop sort
val VIEW_symbol : symbol // view sort
//
val TBOX_symbol : symbol // tbox sort
val TFLT_symbol : symbol // tflt sort
val TYPE_symbol : symbol // type sort
//
val VTBOX_symbol : symbol // vtbox sort
val VTFLT_symbol : symbol // vtflt sort
val VTYPE_symbol : symbol // vtype sort
//
(* ****** ****** *)
//
// HX-2018-12-09:
// these are treated as special filepaths
//
val STDIN_fp_symbol : symbol // SYMBOL("__STDIN__")
val STRING_fp_symbol : symbol // SYMBOL("__STRING__")
//
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
//
fun symbol_is_nil : (symbol) -> bool
fun symbol_isnot_nil : (symbol) -> bool
//
fun eq_symbol_symbol: eq_type(symbol)
fun neq_symbol_symbol: neq_type(symbol)
//
fun
compare_symbol_symbol: compare_type(symbol)
//
overload = with eq_symbol_symbol
overload != with neq_symbol_symbol
//
overload iseqz with symbol_is_nil
overload isneqz with symbol_isnot_nil
//
overload compare with compare_symbol_symbol
//
(* ****** ****** *)
//
fun stamp_to_symbol(stamp: uint): symbolopt_vt
//
(* ****** ****** *)

(* end of [xats_symbol.sats] *)
