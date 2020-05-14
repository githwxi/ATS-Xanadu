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
// Start Time: October, 2019
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

#staload "./../SATS/basics.sats"

(* ****** ****** *)

#staload "./../SATS/locinfo.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

#staload "./../SATS/trans3x.sats"

(* ****** ****** *)

implement
fprint_val<s2var> = fprint_s2var
implement
fprint_val<t2ype> = fprint_t2ype

(* ****** ****** *)
//
implement
trans3x_program
  (prog) =
(
  trans3x_declist(prog)
)
//
(* ****** ****** *)
//
implement
trans3x_dexp
  (d3e0) = let
//
val loc0 = d3e0.loc()
//
in(*in-of-let*)
//
case+
d3e0.node() of
| _(*rest-of-d3exp*) => d3e0 // yet-to-be-handled
//
end // end of [trans3x_dexp]
//
(* ****** ****** *)

implement
trans3x_dexpopt
  (opt) =
(
case+ opt of
| None() => None()
| Some(d3e) => Some(trans3x_dexp(d3e))
) (* end of [trans3x_dexpopt] *)

implement
trans3x_dexplst
  (d3es) =
list_vt2t(d3es) where
{
val
d3es =
list_map<d3exp><d3exp>
  (d3es) where
{
implement
list_map$fopr<d3exp><d3exp>(d3e) = trans3x_dexp(d3e)
}
} (* end of [trans3x_dexplst] *)

(* ****** ****** *)
//
//
implement
trans3x_decl
  (d3cl) = let
//
val loc0 = d3cl.loc()
//
in(* in-of-let *)
//
case+
d3cl.node() of
| _(*rest-of-d3ecl*) => d3cl // yet-to-be-handled
//
end // end of [trans3x_decl]
//
(* ****** ****** *)
//
implement
trans3x_declist
  (dcls) =
list_vt2t(dcls) where
{
val
dcls =
list_map<d3ecl><d3ecl>
  (dcls) where
{
implement
list_map$fopr<d3ecl><d3ecl>(dcl) = trans3x_decl(dcl)
}
} (* end of [trans3x_declist] *)
//
(* ****** ****** *)

(* end of [xats_trans3x_dynexp.dats] *)
