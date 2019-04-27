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

#staload "./../SATS/basics.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

#staload "./../SATS/trans23.sats"

(* ****** ****** *)

local

fun
aux_int
( d2e0
: d2exp): d3exp =
(
  d3e0.type1(t2p0)
) where
{
//
val
loc0 = d2e0.loc()
val-
D2Eint(tok) = d2e0.node()
//
val t2p0 =
t2ype_g0int((*void*))
val d3e0 =
d3exp_make_node(loc0, D3Eint(tok))
//
} (* end of [aux_int] *)

in (* in-of-local *)

implement
trans23_dexp
  (d2e0) = let
//
val
loc0 = d2e0.loc()
//
val () =
println!
("trans23_dexp: d2e0 = ", d2e0)
//
in
  d3exp_none1(d2e0)
end // end of [trans23_dexp]

end // end of [local]

(* ****** ****** *)

(* end of [xats_trans23_dynexp.dats] *)
