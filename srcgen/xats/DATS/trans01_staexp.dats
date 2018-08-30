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
// Start Time: August, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload
SYM = "./../SATS/symbol.sats"
#staload
FIX = "./../SATS/fixity.sats"
//
#staload
ENV = "./../SATS/symenv.sats"
//
(* ****** ****** *)

#staload "./../SATS/staexp0.sats"
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/trans01.sats"

(* ****** ****** *)

stadef fxitm = $FIX.fxitm
macdef FXITMatm(x) = $FIX.FXITMatm(,(x))
macdef FXITMopr(x, a) = $FIX.FXITMatm(,(x), ,(a))

(* ****** ****** *)

local

typedef
s1titm = fxitm(sort1)
typedef
s1titmlst = List0(s1titm)

fun
auxitm
(s0t0: sort0): s1titm =
let
//
val
loc0 = s0t0.loc()
val () =
println!
("sort0_trans: auxitm: s0t0 = ", s0t0)
//
in
//
case+
s0t0.node() of
| S0Tid(tid) =>
  FXITMatm(s1t0) where
  {
    val-
    I0DNTsome(tok) = tid.node()
    val s1t0 = sort1_make_node(loc0, S1Tid(tok))
  }
//
end // end of [auxitm]

in (* in-of-local *)

implement
sort0_trans
  (s0t0) = let
//
val
loc0 = s0t0.loc()
//
val () =
println!
("sort0_trans: s0t0 = ", s0t0)
//
in
//
case+
auxitm(s0t0) of
| $FIX.FXITMatm(s1t0) => s1t0
| $FIX.FXITMopr(s1t0, fxty) =>
  sort1_make_node(loc0, S1Txerr())
//
end (* end of [sort0_trans] *)

end // end of [local]

implement
sort0lst_trans
  (s0ts) =
list_vt2t(s1ts) where
{
  val
  s1ts =
  list_map<sort0><sort1>
    (s0ts) where
  {
    implement
    list_map$fopr<sort0><sort1> = sort0_trans
  }
} (* end of [sort0lst_trans] *)

(* ****** ****** *)

implement
s0exp_trans
  (s0e0) = let
//
val () =
println!
("s0exp_trans: s0e0 = ", s0e0)
//
in
  exit_errmsg(1, "s0exp_trans"){s1exp}
end (* end of [s0exp_trans] *)

implement
s0explst_trans
  (s0es) =
list_vt2t(s1es) where
{
  val
  s1es =
  list_map<s0exp><s1exp>
    (s0es) where
  {
    implement
    list_map$fopr<s0exp><s1exp> = s0exp_trans
  }
} (* end of [s0explst_trans] *)

(* ****** ****** *)

(* end of [xats_trans01_staexp.dats] *)
