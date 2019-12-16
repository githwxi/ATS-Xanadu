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
// Start Time: November, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"./../HATS/libxatsopt.hats"
//
(* ****** ****** *)

#staload "./../SATS/intrep0.sats"

(* ****** ****** *)

local

absimpl
ir0pat_tbox = $rec
{ ir0pat_loc= loc_t
, ir0pat_node= ir0pat_node
} (* end of [absimpl] *)

in(*in-of-local*)
//
implement
ir0pat_get_loc
  (x0) = x0.ir0pat_loc
implement
ir0pat_get_node
  (x0) = x0.ir0pat_node
//  
implement
ir0pat_make_node
(loc0, node) = $rec
{
ir0pat_loc= loc0, ir0pat_node= node
} (* ir0pat_make_node *)
//
end // end of [local]

(* ****** ****** *)

local

absimpl
ir0exp_tbox = $rec
{ ir0exp_loc= loc_t
, ir0exp_node= ir0exp_node
} (* end of [absimpl] *)

in(*in-of-local*)
//
implement
ir0exp_get_loc
  (x0) = x0.ir0exp_loc
implement
ir0exp_get_node
  (x0) = x0.ir0exp_node
//  
implement
ir0exp_make_node
(loc0, node) = $rec
{
ir0exp_loc= loc0, ir0exp_node= node
} (* ir0exp_make_node *)
//
end // end of [local]

(* ****** ****** *)

local

absimpl
ir0gua_tbox = $rec
{ ir0gua_loc= loc_t
, ir0gua_node= ir0gua_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
ir0gua_get_loc(x0) = x0.ir0gua_loc
implement
ir0gua_get_node(x0) = x0.ir0gua_node

implement
ir0gua_make_node
  (loc0, node) = $rec
{
  ir0gua_loc= loc0, ir0gua_node= node
} (* ir0gua_make_node *)

end // end of [local]

(* ****** ****** *)

local

absimpl
ir0clau_tbox = $rec
{ ir0clau_loc= loc_t
, ir0clau_node= ir0clau_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
ir0clau_get_loc(x0) = x0.ir0clau_loc
implement
ir0clau_get_node(x0) = x0.ir0clau_node

implement
ir0clau_make_node
  (loc0, node) = $rec
{
  ir0clau_loc= loc0, ir0clau_node= node
} (* ir0clau_make_node *)

end // end of [local]

(* ****** ****** *)

local

absimpl
ir0gpat_tbox = $rec
{ ir0gpat_loc= loc_t
, ir0gpat_node= ir0gpat_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
ir0gpat_get_loc(x0) = x0.ir0gpat_loc
implement
ir0gpat_get_node(x0) = x0.ir0gpat_node

implement
ir0gpat_make_node
  (loc0, node) = $rec
{
  ir0gpat_loc= loc0, ir0gpat_node= node
} (* ir0gpat_make_node *)

end // end of [local]

(* ****** ****** *)

local

absimpl
ir0dcl_tbox = $rec
{ ir0dcl_loc= loc_t
, ir0dcl_node= ir0dcl_node
} (* end of [absimpl] *)

in(*in-of-local*)
//
implement
ir0dcl_get_loc
  (x0) = x0.ir0dcl_loc
implement
ir0dcl_get_node
  (x0) = x0.ir0dcl_node
//  
implement
ir0dcl_make_node
(loc0, node) = $rec
{
ir0dcl_loc= loc0, ir0dcl_node= node
} (* ir0dcl_make_node *)
//
end // end of [local]

(* ****** ****** *)

(* end of [intrep0.dats] *)
