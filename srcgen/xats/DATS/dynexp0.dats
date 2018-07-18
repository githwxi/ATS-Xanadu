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
//
#staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/lexing.sats"
//
#staload "./../SATS/staexp0.sats"
//
#staload "./../SATS/dynexp0.sats"
//
(* ****** ****** *)

local

absimpl
d0exp_tbox = $rec{
  d0exp_loc= loc_t
, d0exp_node= d0exp_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
d0exp_get_loc(x) = x.d0exp_loc
implement
d0exp_get_node(x) = x.d0exp_node

implement
d0exp_make_node
(loc, node) = $rec
{
  d0exp_loc= loc, d0exp_node= node
} (* end of [d0exp_make_node] *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d0ecl_tbox = $rec{
  d0ecl_loc= loc_t
, d0ecl_node= d0ecl_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
d0ecl_get_loc(x) = x.d0ecl_loc
implement
d0ecl_get_node(x) = x.d0ecl_node

implement
d0ecl_make_node
(loc, node) = $rec
{
  d0ecl_loc= loc, d0ecl_node= node
} (* end of [d0ecl_make_node] *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_dynexp0.dats] *)
