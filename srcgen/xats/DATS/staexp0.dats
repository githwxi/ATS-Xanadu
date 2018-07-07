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
// Start Time: June, 2018
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
"./../SATS/location.sats"
//
#staload "./../SATS/lexing.sats"
#staload "./../SATS/staexp0.sats"
//
(* ****** ****** *)

local

absimpl
i0nt_tbox = $rec{
  i0nt_loc= loc_t
, i0nt_node= i0nt_node
} (* end of [absimpl] *)
absimpl
i0dnt_tbox = $rec{
  i0dnt_loc= loc_t
, i0dnt_node= i0dnt_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)

fun
i0nt_make
(
loc0: loc_t
,
node: i0nt_node
) : i0nt = $rec{
  i0nt_loc= loc0, i0nt_node= node
} (* end of [i0nt_make] *)

fun
i0dnt_make
(
loc0: loc_t
,
node: i0dnt_node
) : i0dnt = $rec{
  i0dnt_loc= loc0, i0dnt_node= node
} (* end of [i0dnt_make] *)

(* ****** ****** *)

implement
i0nt_get_loc(x) = x.i0nt_loc
implement
i0nt_get_node(x) = x.i0nt_node

implement
i0dnt_get_loc(x) = x.i0dnt_loc
implement
i0dnt_get_node(x) = x.i0dnt_node

(* ****** ****** *)

implement
i0nt_some(tok) =
i0nt_make(tok.loc(), I0NTsome(tok))
implement
i0nt_none(tok) =
i0nt_make(tok.loc(), I0NTnone(tok))

(* ****** ****** *)

implement
i0dnt_some(tok) =
i0dnt_make(tok.loc(), I0DNTsome(tok))
implement
i0dnt_none(tok) =
i0dnt_make(tok.loc(), I0DNTnone(tok))

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
sort0_tbox = $rec{
  sort0_loc= loc_t
, sort0_node= sort0_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
sort0_get_loc(x) = x.sort0_loc
implement
sort0_get_node(x) = x.sort0_node

implement
sort0_make_node
(loc, node) = $rec
{
  sort0_loc= loc, sort0_node= node
} (* end of [sort0_make_node] *)

end // end of [local]

(* ****** ****** *)

local

absimpl
s0exp_tbox = $rec{
  s0exp_loc= loc_t
, s0exp_node= s0exp_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
s0exp_get_loc(x) = x.s0exp_loc
implement
s0exp_get_node(x) = x.s0exp_node

implement
s0exp_make_node
(loc, node) = $rec
{
  s0exp_loc= loc, s0exp_node= node
} (* end of [s0exp_make_node] *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_staexp0.dats] *)
