(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2021 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: March, 2021
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
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
//
#staload "./../SATS/cstrnt0.sats"
//
(* ****** ****** *)

local

datatype
c0str =
C0STR of
( loc_t
, c0str_node
, ref(c0strlstopt))

absimpl
c0str_tbox = c0str

in (* in-of-local *)

(* ****** ****** *)
//
implement
c0str_get_loc(x0) =
(
case x0 of
| C0STR(loc0, _, _) => loc0)
implement
c0str_get_node(x0) =
(
case x0 of
| C0STR(_, node, _) => node)
//
(* ****** ****** *)
//
implement
c0str_make_node
(loc0, node) =
C0STR
(loc0, node, store) where
{
  val
  store = ref(None{c0strlst}())
} (*$rec*) // end of [c0str_make_node]
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_cstrnt0.dats] *)
