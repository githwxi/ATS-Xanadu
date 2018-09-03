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
sort1_none
(loc) =
sort1_make_node(loc, S1Tnone())
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
s1rtdef_tbox = $rec{
  s1rtdef_loc= loc_t
, s1rtdef_node= s1rtdef_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
s1rtdef_get_loc(x) = x.s1rtdef_loc
implement
s1rtdef_get_node(x) = x.s1rtdef_node

implement
s1rtdef_make_node
(loc, node) = $rec
{
  s1rtdef_loc= loc, s1rtdef_node= node
} (* end of [s1rtdef_make_node] *)

end // end of [local]

(* ****** ****** *)

local

absimpl
s1arg_tbox = $rec{
  s1arg_loc= loc_t
, s1arg_node= s1arg_node
}

in (* in-of-local *)

implement
s1arg_get_loc(x) = x.s1arg_loc
implement
s1arg_get_node(x) = x.s1arg_node

implement
s1arg_make_node
(loc, node) = $rec
{
  s1arg_loc= loc, s1arg_node= node
} (* end of [s1arg_make_node] *)

end // end of [local]

(* ****** ****** *)

local

absimpl
s1marg_tbox = $rec{
  s1marg_loc= loc_t
, s1marg_node= s1marg_node
}

in (* in-of-local *)

implement
s1marg_get_loc(x) = x.s1marg_loc
implement
s1marg_get_node(x) = x.s1marg_node

implement
s1marg_make_node
(loc, node) = $rec
{
  s1marg_loc= loc, s1marg_node= node
} (* end of [s1marg_make_node] *)

end // end of [local]

(* ****** ****** *)

local

absimpl
t1arg_tbox = $rec{
  t1arg_loc= loc_t
, t1arg_node= t1arg_node
}

in (* in-of-local *)

implement
t1arg_get_loc(x) = x.t1arg_loc
implement
t1arg_get_node(x) = x.t1arg_node

implement
t1arg_make_node
(loc, node) = $rec
{
  t1arg_loc= loc, t1arg_node= node
} (* end of [t1arg_make_node] *)

end // end of [local]

(* ****** ****** *)

local

absimpl
t1marg_tbox = $rec{
  t1marg_loc= loc_t
, t1marg_node= t1marg_node
}

in (* in-of-local *)

implement
t1marg_get_loc(x) = x.t1marg_loc
implement
t1marg_get_node(x) = x.t1marg_node

implement
t1marg_make_node
(loc, node) = $rec
{
  t1marg_loc= loc, t1marg_node= node
} (* end of [t1marg_make_node] *)

end // end of [local]

(* ****** ****** *)

local

absimpl
s1qua_tbox = $rec{
  s1qua_loc= loc_t
, s1qua_node= s1qua_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)

implement
s1qua_get_loc(x) = x.s1qua_loc
implement
s1qua_get_node(x) = x.s1qua_node

implement
s1qua_make_node
(loc, node) = $rec
{
  s1qua_loc= loc, s1qua_node= node
} (* end of [s1qua_make_node] *)

(* ****** ****** *)

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
s1exp_none
(loc) =
s1exp_make_node(loc, S1Enone())
implement
s1exp_make_node
(loc, node) = $rec
{
  s1exp_loc= loc, s1exp_node= node
} (* end of [s1exp_make_node] *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_staexp1.dats] *)
