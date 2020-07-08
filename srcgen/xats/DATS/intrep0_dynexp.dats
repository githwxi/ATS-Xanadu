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
// Author: Hongwei Xi
// Start Time: June, 2020
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
#staload "./../SATS/stamp0.sats"
#staload "./../SATS/symbol.sats"
#staload "./../SATS/locinfo.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
//
(* ****** ****** *)

local

typedef
hdvar_struct = @{
//
  hdvar_loc= loc_t // loc
, hdvar_sym= sym_t // name
, hdvar_type= h0typ // type
, hdvar_stamp= stamp // unicity
//
} (* end of [hdvar_tbox] *)

in(* in-of-local *)

absimpl
hdvar_tbox = ref(hdvar_struct)

end // end of [local]

(* ****** ****** *)

local
//
absimpl
h0exp_tbox = $rec
{ h0exp_loc= loc_t
, h0exp_type= h0typ
, h0exp_node= h0exp_node
} (* end of [absimpl] *)
//
in (* in-of-local *)
//
implement
h0exp_get_loc
  (h0e) = h0e.h0exp_loc
//
implement
h0exp_get_type
  (h0e) = h0e.h0exp_type
//
implement
h0exp_get_node
  (h0e) = h0e.h0exp_node
//
implement
h0exp_make_node
(
loc0, h0t0, node
) = $rec
{ h0exp_loc= loc0
, h0exp_type= h0t0, h0exp_node= node
} (* h0exp_make_node *)
//
end // end of [local]

(* ****** ****** *)

local
//
absimpl
h0dcl_tbox = $rec
{ h0dcl_loc= loc_t
, h0dcl_node= h0dcl_node
} (* end of [absimpl] *)
//
in (* in-of-local *)
//
implement
h0dcl_get_loc
(dcl) = dcl.h0dcl_loc
implement
h0dcl_get_node
(dcl) = dcl.h0dcl_node
//
implement
h0dcl_make_node
(loc0, node) = $rec
{ h0dcl_loc= loc0, h0dcl_node= node
} (* h0dcl_make_node *)
//
end // end of [local]

(* ****** ****** *)

(* end of [xats_intrep0_h0typ.dats] *)
