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
// Start Time: July, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload
SYM = "./symbol.sats"

(* ****** ****** *)
//
abstbox label_tbox
//
typedef label = label_tbox
//
typedef symbol = $SYM.symbol
//
(* ****** ****** *)
//
fun
print_label : print_type(label)
fun
prerr_label : prerr_type(label)
fun
fprint_label : fprint_type(label)
//
overload print with print_label
overload prerr with prerr_label
overload fprint with fprint_label
//
(* ****** ****** *)
//
val label_nil : label
//
fun label_make_int(i0: int): label
fun label_make_sym(i0: symbol): label
fun label_make_name(s0: string): label
//
(* ****** ****** *)

(* end of [xats_label0.sats] *)
