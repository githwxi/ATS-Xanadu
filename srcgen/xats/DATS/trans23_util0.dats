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
// Start Time: August, 2019
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

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"

(* ****** ****** *)

#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

#staload "./../SATS/trans23.sats"

(* ****** ****** *)
//
implement
s2exp_of_d2pat
  (d2p0) =
(
case+
d2p0.node() of
| D2Panno(d2p1, s2e2) => s2e2
| _ (* else *) => s2exp_none0()
)
//
implement
t2ype_of_d2pat
  (d2p0) =
(
s2exp_erase(s2exp_of_d2pat(d2p0))
)
//
implement
s2explst_of_d2patlst
  (d2ps) =
list_vt2t(d2ps) where
{
val
d2ps =
list_map<d2pat><s2exp>
  (d2ps) where
{
implement
list_map$fopr<d2pat><s2exp> = s2exp_of_d2pat
}
} (* end of [s2explst_of_d2patlst] *)
//
implement
t2ypelst_of_d2patlst
  (d2ps) =
list_vt2t(d2ps) where
{
val
d2ps =
list_map<d2pat><t2ype>
  (d2ps) where
{
implement
list_map$fopr<d2pat><t2ype> = t2ype_of_d2pat
}
} (* end of [t2ypelst_of_d2patlst] *)
//
(* ****** ****** *)

implement
s2exp_of_f2undecl
  (f2d0) = let
//
val+F2UNDECL(rcd) = f2d0
//
in
  s2exp_none0()
end // end of [s2exp_of_f2undecl]

(* ****** ****** *)

implement
s2exp_of_v2aldecl
  (v2d0) = let
//
val+V2ALDECL(rcd) = v2d0
//
in
  s2exp_none0()
end // end of [s2exp_of_v2aldecl]

(* ****** ****** *)

(* end of [trans23_util0.dats] *)
