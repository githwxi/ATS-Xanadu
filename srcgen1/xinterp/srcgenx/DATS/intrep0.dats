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
"./../HATS/libxinterp.hats"
//
typedef loc_t = $LOC.location
//
(* ****** ****** *)

#staload "./../SATS/intrep0.sats"

(* ****** ****** *)

local

absimpl
irpat_tbox = $rec
{ irpat_loc= loc_t
, irpat_node= irpat_node
} (* end of [absimpl] *)

in(*in-of-local*)
//
implement
irpat_get_loc
  (x0) = x0.irpat_loc
implement
irpat_get_node
  (x0) = x0.irpat_node
//  
implement
irpat_make_node
(loc0, node) = $rec
{
irpat_loc= loc0, irpat_node= node
} (* irpat_make_node *)
//
end // end of [local]

(* ****** ****** *)

local

absimpl
irexp_tbox = $rec
{ irexp_loc= loc_t
, irexp_node= irexp_node
} (* end of [absimpl] *)

in(*in-of-local*)
//
implement
irexp_get_loc
  (x0) = x0.irexp_loc
implement
irexp_get_node
  (x0) = x0.irexp_node
//  
implement
irexp_make_node
(loc0, node) = $rec
{
irexp_loc= loc0, irexp_node= node
} (* irexp_make_node *)
//
end // end of [local]

(* ****** ****** *)

local

absimpl
irgua_tbox = $rec
{ irgua_loc= loc_t
, irgua_node= irgua_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
irgua_get_loc(x0) = x0.irgua_loc
implement
irgua_get_node(x0) = x0.irgua_node

implement
irgua_make_node
  (loc0, node) = $rec
{
  irgua_loc= loc0, irgua_node= node
} (* irgua_make_node *)

end // end of [local]

(* ****** ****** *)

local

absimpl
irclau_tbox = $rec
{ irclau_loc= loc_t
, irclau_node= irclau_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
irclau_get_loc(x0) = x0.irclau_loc
implement
irclau_get_node(x0) = x0.irclau_node

implement
irclau_make_node
  (loc0, node) = $rec
{
  irclau_loc= loc0, irclau_node= node
} (* irclau_make_node *)

end // end of [local]

(* ****** ****** *)

local

absimpl
irgpat_tbox = $rec
{ irgpat_loc= loc_t
, irgpat_node= irgpat_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
irgpat_get_loc(x0) = x0.irgpat_loc
implement
irgpat_get_node(x0) = x0.irgpat_node

implement
irgpat_make_node
  (loc0, node) = $rec
{
  irgpat_loc= loc0, irgpat_node= node
} (* irgpat_make_node *)

end // end of [local]

(* ****** ****** *)

local

absimpl
irdcl_tbox = $rec
{ irdcl_loc= loc_t
, irdcl_node= irdcl_node
} (* end of [absimpl] *)

in(*in-of-local*)
//
implement
irdcl_get_loc
  (x0) = x0.irdcl_loc
implement
irdcl_get_node
  (x0) = x0.irdcl_node
//  
implement
irdcl_make_node
(loc0, node) = $rec
{
irdcl_loc= loc0, irdcl_node= node
} (* irdcl_make_node *)
//
end // end of [local]

(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_xinterp_srcgen1_intrep0.dats] *)
