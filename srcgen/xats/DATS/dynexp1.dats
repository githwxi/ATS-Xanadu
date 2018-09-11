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
#staload "./../SATS/dynexp0.sats"
//
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
//
(* ****** ****** *)

local

absimpl
q1arg_tbox = $rec{
  q1arg_loc= loc_t
, q1arg_node= q1arg_node
}

in (* in-of-local *)

(* ****** ****** *)

implement
q1arg_get_loc(x) = x.q1arg_loc
implement
q1arg_get_node(x) = x.q1arg_node

(* ****** ****** *)

implement
q1arg_make_node
(loc, node) = $rec
{
  q1arg_loc= loc, q1arg_node= node
} (* end of [q1arg_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
tq1arg_tbox = $rec{
  tq1arg_loc= loc_t
, tq1arg_node= tq1arg_node
}

in (* in-of-local *)

(* ****** ****** *)

implement
tq1arg_get_loc(x) = x.tq1arg_loc
implement
tq1arg_get_node(x) = x.tq1arg_node

(* ****** ****** *)

implement
tq1arg_make_node
(loc, node) = $rec
{
  tq1arg_loc= loc, tq1arg_node= node
} (* end of [tq1arg_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
a1typ_tbox = $rec{
  a1typ_loc= loc_t
, a1typ_node= a1typ_node
}

in (* in-of-local *)

(* ****** ****** *)

implement
a1typ_get_loc(x) = x.a1typ_loc
implement
a1typ_get_node(x) = x.a1typ_node

(* ****** ****** *)

implement
a1typ_make_node
(loc, node) = $rec
{
  a1typ_loc= loc, a1typ_node= node
} (* end of [a1typ_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d1arg_tbox = $rec{
  d1arg_loc= loc_t
, d1arg_node= d1arg_node
}

in (* in-of-local *)

(* ****** ****** *)

implement
d1arg_get_loc(x) = x.d1arg_loc
implement
d1arg_get_node(x) = x.d1arg_node

(* ****** ****** *)

implement
d1arg_make_node
(loc, node) = $rec
{
  d1arg_loc= loc, d1arg_node= node
} (* end of [d1arg_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d1exp_tbox = $rec{
  d1exp_loc= loc_t
, d1exp_node= d1exp_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)

implement
d1exp_get_loc(x) = x.d1exp_loc
implement
d1exp_get_node(x) = x.d1exp_node

(* ****** ****** *)

implement
d1exp_make_node
(loc, node) = $rec
{
  d1exp_loc= loc, d1exp_node= node
} (* end of [d1exp_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d1ecl_tbox = $rec{
  d1ecl_loc= loc_t
, d1ecl_node= d1ecl_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)

implement
d1ecl_get_loc(x) = x.d1ecl_loc
implement
d1ecl_get_node(x) = x.d1ecl_node

(* ****** ****** *)

implement
d1ecl_none
(d0c) =
d1ecl_make_node
( loc
, D1Cnone(d0c)
) where
{
  val loc = d0c.loc()
}
//
implement
d1ecl_make_node
(loc, node) = $rec
{
  d1ecl_loc= loc, d1ecl_node= node
} (* end of [d1ecl_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_dynexp1.dats] *)
