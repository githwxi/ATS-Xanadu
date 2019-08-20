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
#staload "./../SATS/basics.sats"
//
val
s2tb_int = T2BASpre($SYM.INT_symbol)
val
s2tb_addr = T2BASpre($SYM.ADDR_symbol)
val
s2tb_bool = T2BASpre($SYM.BOOL_symbol)
val
s2tb_char = T2BASpre($SYM.CHAR_symbol)
//
val
s2tb_real = T2BASpre($SYM.REAL_symbol)
//
val
s2tb_float = T2BASpre($SYM.FLOAT_symbol)
val
s2tb_string = T2BASpre($SYM.STRING_symbol)
//
val
s2tb_prop =
  T2BASimp(PROPSORT, $SYM.PROP_symbol)
val
s2tb_view =
  T2BASimp(VIEWSORT, $SYM.VIEW_symbol)
//
val
s2tb_tbox =
  T2BASimp(TBOXSORT, $SYM.TBOX_symbol)
val
s2tb_tflt =
  T2BASimp(TFLTSORT, $SYM.TFLT_symbol)
val
s2tb_type =
  T2BASimp(TYPESORT, $SYM.TYPE_symbol)
//
val
s2tb_vtbox =
  T2BASimp(VTBOXSORT, $SYM.VTBOX_symbol)
val
s2tb_vtflt =
  T2BASimp(VTFLTSORT, $SYM.VTFLT_symbol)
val
s2tb_vtype =
  T2BASimp(VTYPESORT, $SYM.VTYPE_symbol)
//
in // in of [local]
//
implement
the_sort2_int = S2Tbas(s2tb_int)
implement
the_sort2_addr = S2Tbas(s2tb_addr)
implement
the_sort2_bool = S2Tbas(s2tb_bool)
implement
the_sort2_char = S2Tbas(s2tb_char)
//
implement
the_sort2_real = S2Tbas(s2tb_real)
//
implement
the_sort2_float = S2Tbas(s2tb_float)
implement
the_sort2_string = S2Tbas(s2tb_string)
//
implement
the_sort2_prop = S2Tbas(s2tb_prop)
implement
the_sort2_view = S2Tbas(s2tb_view)
//
implement
the_sort2_tbox = S2Tbas(s2tb_tbox)
implement
the_sort2_type = S2Tbas(s2tb_type)
implement
the_sort2_vtbox = S2Tbas(s2tb_vtbox)
implement
the_sort2_vtype = S2Tbas(s2tb_vtype)
//
implement
the_sort2_none = S2Tnone0((*void*))
//
end // end of [local]

(* ****** ****** *)

(* end of [xats_staexp2_init0.dats] *)
