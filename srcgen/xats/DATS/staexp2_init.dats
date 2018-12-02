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
// Start Time: December, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

#staload
SYM = "./../SATS/symbol.sats"

(* ****** ****** *)
//
#staload "./../SATS/staexp2.sats"
//
(* ****** ****** *)

local
//
val
s2tb_int = T2BASpre($SYM.symbol_INT)
val
s2tb_addr = T2BASpre($SYM.symbol_ADDR)
val
s2tb_bool = T2BASpre($SYM.symbol_BOOL)
//
val
s2tb_real = T2BASpre($SYM.symbol_REAL)
//
val
s2tb_float = T2BASpre($SYM.symbol_FLOAT)
val
s2tb_string = T2BASpre($SYM.symbol_STRING)
//
in // in of [local]
//
implement sort2_int = S2Tbas(s2tb_int)
implement sort2_addr = S2Tbas(s2tb_addr)
implement sort2_bool = S2Tbas(s2tb_bool)
//
implement sort2_real = S2Tbas(s2tb_real)
//
implement sort2_float = S2Tbas(s2tb_float)
implement sort2_string = S2Tbas(s2tb_string)
//
end // end of [local]

(* ****** ****** *)

(* end of [xats_staexp2_init.dats] *)
