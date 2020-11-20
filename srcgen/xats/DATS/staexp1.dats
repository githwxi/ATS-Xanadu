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
// Start Time: August, 2018
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
#staload "./../SATS/xlabel0.sats"
#staload "./../SATS/locinfo.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/lexing0.sats"
//
#staload "./../SATS/staexp1.sats"
//
(* ****** ****** *)

local

absimpl
g1exp_tbox = $rec{
  g1exp_loc= loc_t
, g1exp_node= g1exp_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)
//
implement
g1exp_get_loc
  (x0) = x0.g1exp_loc
implement
g1exp_get_node
  (x0) = x0.g1exp_node
//
(* ****** ****** *)

implement
g1exp_none
(loc) =
g1exp_make_node(loc, G1Enone0())
implement
g1exp_make_node
(loc, node) = $rec
{
  g1exp_loc= loc, g1exp_node= node
} (* end of [g1exp_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
g1marg_tbox = $rec{
  g1marg_loc= loc_t
, g1marg_node= g1marg_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)
//
implement
g1marg_get_loc
  (x0) = x0.g1marg_loc
implement
g1marg_get_node
  (x0) = x0.g1marg_node
//
(* ****** ****** *)

implement
g1marg_make_node
(loc, node) = $rec
{
  g1marg_loc= loc, g1marg_node= node
} (* end of [g1marg_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
sort1_tbox = $rec{
  sort1_loc= loc_t
, sort1_node= sort1_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)
//
implement
sort1_get_loc
  (x0) = x0.sort1_loc
implement
sort1_get_node
  (x0) = x0.sort1_node
//
(* ****** ****** *)

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

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
s1rtcon_tbox = $rec{
  s1rtcon_loc= loc_t
, s1rtcon_node= s1rtcon_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)
//
implement
s1rtcon_get_loc
  (x0) = x0.s1rtcon_loc
implement
s1rtcon_get_node
  (x0) = x0.s1rtcon_node
//
(* ****** ****** *)

implement
s1rtcon_make_node
(loc, node) = $rec
{
  s1rtcon_loc= loc, s1rtcon_node= node
} (* end of [s1rtcon_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d1tsort_tbox = $rec{
  d1tsort_loc= loc_t
, d1tsort_node= d1tsort_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)
//
implement
d1tsort_get_loc
  (x0) = x0.d1tsort_loc
implement
d1tsort_get_node
  (x0) = x0.d1tsort_node
//
(* ****** ****** *)

implement
d1tsort_make_node
(loc, node) = $rec
{
  d1tsort_loc= loc, d1tsort_node= node
} (* end of [d1tsort_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
s1rtdef_tbox = $rec{
  s1rtdef_loc= loc_t
, s1rtdef_node= s1rtdef_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)
//
implement
s1rtdef_get_loc
  (x0) = x0.s1rtdef_loc
implement
s1rtdef_get_node
  (x0) = x0.s1rtdef_node
//
(* ****** ****** *)

implement
s1rtdef_make_node
(loc, node) = $rec
{
  s1rtdef_loc= loc, s1rtdef_node= node
} (* end of [s1rtdef_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
s1arg_tbox = $rec{
  s1arg_loc= loc_t
, s1arg_node= s1arg_node
}

in (* in-of-local *)

(* ****** ****** *)
//
implement
s1arg_get_loc
  (x0) = x0.s1arg_loc
implement
s1arg_get_node
  (x0) = x0.s1arg_node
//
(* ****** ****** *)

implement
s1arg_make_node
(loc, node) = $rec
{
  s1arg_loc= loc, s1arg_node= node
} (* end of [s1arg_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
s1marg_tbox = $rec{
  s1marg_loc= loc_t
, s1marg_node= s1marg_node
}

in (* in-of-local *)

(* ****** ****** *)
//
implement
s1marg_get_loc
  (x0) = x0.s1marg_loc
implement
s1marg_get_node
  (x0) = x0.s1marg_node
//
(* ****** ****** *)

implement
s1marg_make_node
(loc, node) = $rec
{
  s1marg_loc= loc, s1marg_node= node
} (* end of [s1marg_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
t1arg_tbox = $rec{
  t1arg_loc= loc_t
, t1arg_node= t1arg_node
}

in (* in-of-local *)

(* ****** ****** *)
//
implement
t1arg_get_loc
  (x0) = x0.t1arg_loc
implement
t1arg_get_node
  (x0) = x0.t1arg_node
//
(* ****** ****** *)

implement
t1arg_make_node
(loc, node) = $rec
{
  t1arg_loc= loc, t1arg_node= node
} (* end of [t1arg_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
t1marg_tbox = $rec{
  t1marg_loc= loc_t
, t1marg_node= t1marg_node
}

in (* in-of-local *)

(* ****** ****** *)
//
implement
t1marg_get_loc
  (x0) = x0.t1marg_loc
implement
t1marg_get_node
  (x0) = x0.t1marg_node
//
(* ****** ****** *)

implement
t1marg_make_node
(loc, node) = $rec
{
  t1marg_loc= loc, t1marg_node= node
} (* end of [t1marg_make_node] *)

(* ****** ****** *)

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
//
implement
s1qua_get_loc
  (x0) = x0.s1qua_loc
implement
s1qua_get_node
  (x0) = x0.s1qua_node
//
(* ****** ****** *)

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
s1uni_tbox = $rec{
  s1uni_loc= loc_t
, s1uni_node= s1uni_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)
//
implement
s1uni_get_loc
  (x0) = x0.s1uni_loc
implement
s1uni_get_node
  (x0) = x0.s1uni_node
//
(* ****** ****** *)

implement
s1uni_make_node
(loc, node) = $rec
{
  s1uni_loc= loc, s1uni_node= node
} (* end of [s1uni_make_node] *)

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

(* ****** ****** *)
//
implement
s1exp_get_loc
  (x0) = x0.s1exp_loc
implement
s1exp_get_node
  (x0) = x0.s1exp_node
//
implement
s1exp_none
(loc) =
s1exp_make_node(loc, S1Enone(loc))
implement
s1exp_make_node
(loc, node) = $rec
{
  s1exp_loc= loc, s1exp_node= node
} (* end of [s1exp_make_node] *)
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d1atcon_tbox = $rec{
  d1atcon_loc= loc_t
, d1atcon_node= d1atcon_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)
//
implement
d1atcon_get_loc
  (x0) = x0.d1atcon_loc
implement
d1atcon_get_node
  (x0) = x0.d1atcon_node
//
(* ****** ****** *)

implement
d1atcon_make_node
(loc, node) = $rec
{
  d1atcon_loc= loc, d1atcon_node= node
} (* end of [d1atcon_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d1atype_tbox = $rec{
  d1atype_loc= loc_t
, d1atype_node= d1atype_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)
//
implement
d1atype_get_loc
  (x0) = x0.d1atype_loc
implement
d1atype_get_node
  (x0) = x0.d1atype_node
//
(* ****** ****** *)

implement
d1atype_make_node
(loc, node) = $rec
{
  d1atype_loc= loc, d1atype_node= node
} (* end of [d1atype_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_staexp1.dats] *)
