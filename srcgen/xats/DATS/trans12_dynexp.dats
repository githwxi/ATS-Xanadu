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

#staload "./../SATS/lexing.sats"

(* ****** ****** *)

#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"

(* ****** ****** *)

#staload "./../SATS/trans12.sats"

(* ****** ****** *)

local

in (* in-of-local *)

implement
trans12_dexp
  (d1e0) = let
//
val
loc0 = d1e0.loc()
//
val () =
println!
("trans12_dexp: d1e0 = ", d1e0)
//
in (* in-of-let *)
//
case-
d1e0.node() of
| _(*rest-of-D1EXP*) =>
  exit_errmsg
  (1, "trans12_dexp: yet-to-be-implemented!")
//
end // end of [trans12_dexp]

end // end of [local]

(* ****** ****** *)

implement
trans12_dexpopt
  (opt) =
(
case+ opt of
| None() => None()
| Some(d1e) => Some(trans12_dexp(d1e))
) (* end of [trans12_dexpopt] *)

implement
trans12_dexplst
  (d1es) =
list_vt2t(d1es) where
{
val
d1es =
list_map<d1exp><d2exp>
  (d1es) where
{
  implement
  list_map$fopr<d1exp><d2exp> = trans12_dexp
}
} (* end of [trans12_dexplst] *)

(* ****** ****** *)

local

fun
aux_sortdef
( d1c0
: d1ecl): d2ecl = let
//
val loc0 = d1c0.loc()
//
val-
D1Csortdef
(knd, tid, def0) =
d1c0.node((*void*))
//
val sym = sortid_sym(tid)
//
in
//
case-
def0.node() of
| S1RTDEFsort(s1t) =>
  let
    val
    s2t =
    trans12_sort(s1t)
    val
    s2t = S2TXTsrt(s2t)
    val () =
    the_sortenv_add(sym, s2t)
  in
    d2ecl_make_node(loc0, D2Csortdef(d1c0))
  end
//
end // end of [aux_sortdef]

in (* in-of-local *)

implement
trans12_decl
  (d1c0) = let
//
val
loc0 = d1c0.loc()
//
val () =
println!
("trans12_decl: d1c0 = ", d1c0)
//
in (* in-of-let *)
//
case-
d1c0.node() of
//
| D1Csortdef _ => aux_sortdef(d1c0)
//
| _(*rest-of-D1ECL*) =>
  exit_errmsg
  (1, "trans12_decl: yet-to-be-implemented!")
//
end // end of [trans12_decl]

end // end of [local]

(* ****** ****** *)

implement
trans12_declist
  (d1cs) =
list_vt2t(d1cs) where
{
val
d1cs =
list_map<d1ecl><d2ecl>
  (d1cs) where
{
  implement
  list_map$fopr<d1ecl><d2ecl> = trans12_decl
}
} (* end of [trans12_declist] *)

(* ****** ****** *)

(* end of [xats_trans12_dynecl.dats] *)
