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

#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

#staload "./../SATS/intrep0.sats"

(* ****** ****** *)

implement
irerase_dexp
  (d3e0) =
let
//
val loc0 = d3e0.loc()
//
in
//
case+
d3e0.node() of
//
| D3Eint(tok) =>
  ir0exp_make_node
  (loc0, IR0Eint(tok))
| D3Ebtf(tok) =>
  ir0exp_make_node
  (loc0, IR0Ebtf(tok))
| D3Estr(tok) =>
  ir0exp_make_node
  (loc0, IR0Estr(tok))
//
| _(*rest-of-d3exp*) =>
  ir0exp_make_node(loc0, IR0Enone1(d3e0))
//
end // end of [interp0_erase]

(* ****** ****** *)

(* end of [intrep0_erase.dats] *)
