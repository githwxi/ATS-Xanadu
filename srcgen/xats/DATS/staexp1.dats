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
// Start Time: August, 2018
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
#staload
"./../SATS/label0.sats"
#staload
"./../SATS/location.sats"
//
#staload "./../SATS/lexing.sats"
#staload "./../SATS/staexp1.sats"
//
(* ****** ****** *)

local

absimpl
sort1_tbox = $rec{
  sort1_loc= loc_t
, sort1_node= sort1_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
sort1_get_loc(x) = x.sort1_loc
implement
sort1_get_node(x) = x.sort1_node

implement
sort1_make_node
(loc, node) = $rec
{
  sort1_loc= loc, sort1_node= node
} (* end of [sort1_make_node] *)

end // end of [local]

(* ****** ****** *)

local

absimpl
s1exp_tbox = $rec{
  s1exp_loc= loc_t
, s1exp_node= s1exp_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
s1exp_get_loc(x) = x.s1exp_loc
implement
s1exp_get_node(x) = x.s1exp_node

implement
s1exp_make_node
(loc, node) = $rec
{
  s1exp_loc= loc, s1exp_node= node
} (* end of [s1exp_make_node] *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_staexp1.dats] *)
