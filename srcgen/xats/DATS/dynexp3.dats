(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: April, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload
SYM = "./../SATS/symbol.sats"
#staload
LOC = "./../SATS/locinfo.sats"
//
  typedef sym_t = $SYM.sym_t
  typedef loc_t = $LOC.loc_t
//
(* ****** ****** *)

#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

local

absimpl
d3exp_tbox = $rec
{ d3exp_loc= loc_t
, d3exp_node= d3exp_node
, d3exp_type= t2ype_tbox
} (* end of [absimpl] *)

in (* in-of-local *)
//
implement
d3exp_get_loc
  (d3e) = d3e.d3exp_loc
implement
d3exp_get_node
  (d3e) = d3e.d3exp_node
//
implement
d3exp_make_node
  (loc0, node) = $rec
{ d3exp_loc= loc0
, d3exp_node= node
, d3exp_type= t2ype_none(loc0)
} (* d3exp_make_node *)
//
end // end of [local]

(* ****** ****** *)
//
implement
d3exp_none1(d2e0) =
(
d3exp_make_node
(loc0, D3Enone1(d2e0))
) where
{
  val loc0 = d2e0.loc((*void*))
}
//
(* ****** ****** *)

(* end of [dynexp3.dats] *)
