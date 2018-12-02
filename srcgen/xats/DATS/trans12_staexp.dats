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
// Start Time: December, 2018
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
#staload
SYM = "./../SATS/symbol.sats"
#staload
MAP = "./../SATS/symmap.sats"
#staload
ENV = "./../SATS/symenv.sats"
#staload
NMS = "./../SATS/nmspace.sats"
//
(* ****** ****** *)

#staload "./../SATS/staexp1.sats"
#staload "./../SATS/staexp2.sats"

(* ****** ****** *)

#staload "./../SATS/trans12.sats"

(* ****** ****** *)

local

in (* in-of-local *)

implement
trans12_sort
  (s1t0) = let
//
(*
val () =
println!
("trans12_sort: s1t0 = ", s1t0)
*)
//
val loc0 = s1t0.loc()
//
in
//
case-
s1t0.node() of
| S1Tnone() => S2Tnone()
//
end // end of [trans12_sort]

end // end of [local]

(* ****** ****** *)

implement
trans12_sortopt
  (opt) =
(
case+ opt of
| None() => None()
| Some(s1t) => Some(trans12_sort(s1t))
) (* end of [trans12_sortopt] *)

implement
trans12_sortlst
  (s1ts) =
list_vt2t(s2ts) where
{
val
s2ts =
list_map<sort1><sort2>
  (s1ts) where
{
  implement
  list_map$fopr<sort1><sort2> = trans12_sort
}
} (* end of [trans12_sortlst] *)

(* ****** ****** *)

local

in (* in-of-local *)

implement
trans12_sexp
  (s1e0) = let
//
(*
val () =
println!
("trans12_sort: s1e0 = ", s1e0)
*)
//
val loc0 = s1e0.loc()
//
in
//
case-
s1e0.node() of
| S1Enone() => s2exp_none()
//
end // end of [trans12_sexp]

end // end of [local]

(* ****** ****** *)

implement
trans12_sexpopt
  (opt) =
(
case+ opt of
| None() => None()
| Some(s1e) => Some(trans12_sexp(s1e))
) (* end of [trans12_sexpopt] *)

implement
trans12_sexplst
  (s1es) =
list_vt2t(s1es) where
{
val
s1es =
list_map<s1exp><s2exp>
  (s1es) where
{
  implement
  list_map$fopr<s1exp><s2exp> = trans12_sexp
}
} (* end of [trans12_sexplst] *)

(* ****** ****** *)

(* end of [xats_trans12_staexp.dats] *)
