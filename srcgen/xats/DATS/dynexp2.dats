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
// Start Time: October, 2018
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
//
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
//
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
//
(* ****** ****** *)

local

val
stamper = $STM.stamper_new()

in (* in-of-local *)

implement
d2con_stamp_new() = $STM.stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)

local

val
stamper = $STM.stamper_new()

in (* in-of-local *)

implement
d2cst_stamp_new() = $STM.stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)

local

val
stamper = $STM.stamper_new()

in (* in-of-local *)

implement
d2var_stamp_new() = $STM.stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)

local

absimpl
d2con_tbox = $rec{
//
  d2con_sym= sym_t // name
, d2con_stamp= stamp // unicity
//
} (* end of [d2con_tbox] *)

in (* in-of-local *)

implement
d2con_get_sym(x0) = x0.d2con_sym

end // end of [local]

(* ****** ****** *)

local

absimpl
d2cst_tbox = $rec{
//
  d2cst_sym= sym_t // name
, d2cst_stamp= stamp // unicity
//
} (* end of [d2cst_tbox] *)

in (* in-of-local *)

implement
d2cst_get_sym(x0) = x0.d2cst_sym

end // end of [local]

(* ****** ****** *)

local

absimpl
d2var_tbox = $rec{
//
  d2var_sym= sym_t // name
, d2var_stamp= stamp // unicity
//
} (* end of [d2var_tbox] *)

in (* in-of-local *)

implement
d2var_get_sym(x0) = x0.d2var_sym

end // end of [local]

(* ****** ****** *)

local

absimpl
d2ecl_tbox = $rec{
  d2ecl_loc= loc_t
, d2ecl_node= d2ecl_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)

implement
d2ecl_get_loc(x0) = x0.d2ecl_loc
implement
d2ecl_get_node(x0) = x0.d2ecl_node

(* ****** ****** *)

implement
d2ecl_none0
(loc0) =
d2ecl_make_node
(
  loc0, D2Cnone0()
)
implement
d2ecl_none1
(d0c0) =
d2ecl_make_node
(
loc0, D2Cnone1(d0c0)
) where
{
  val loc0 = d0c0.loc()
}
//
implement
d2ecl_make_node
(loc, node) = $rec
{
  d2ecl_loc= loc, d2ecl_node= node
} (* end of [d2ecl_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_dynexp2.dats] *)
