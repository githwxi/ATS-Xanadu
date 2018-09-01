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

#staload
LOC = "./../SATS/location.sats"
overload + with $LOC.location_combine

(* ****** ****** *)

#staload "./../SATS/staexp0.sats"
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/trans01.sats"

(* ****** ****** *)

stadef fxitm = $FIX.fxitm
macdef FXITMatm(x) = $FIX.FXITMatm(,(x))
macdef FXITMopr(x, a) = $FIX.FXITMopr(,(x), ,(a))

(* ****** ****** *)

typedef
s1titm = fxitm(sort1)
typedef
s1titmlst = List0(s1titm)

typedef
s1eitm = fxitm(s1exp)
typedef
s1eitmlst = List0(s1eitm)

(* ****** ****** *)

fun
fxitmlst_resolve_sort1
( loc0: loc_t
, itms: s1titmlst): sort1 =
(
$FIX.fxitmlst_resolve<sort1>(loc0, itms)
) where
{
//
implement
$FIX.fxitm_infix<sort1>
(
x0, f1, x2
) = let
  val loc =
  x0.loc() + x2.loc()
in
FXITMatm
(
sort1_make_node
( loc
, S1Tapps(f1, list_pair(x0, x2))
)
)
end // end of [$FIX.fxitm_infix]
//
implement
$FIX.fxitm_prefix<sort1>
  (f0, x1) = let
  val loc =
  f0.loc() + x1.loc()
in
FXITMatm
(
  sort1_make_node
  (loc, S1Tapps(f0, list_sing(x1)))
)
end // end of [$FIX.fxitm_prefix]
//
implement
$FIX.fxitm_postfix<sort1>
  (x0, f1) = let
  val loc =
  x0.loc() + f1.loc()
in
FXITMatm
(
  sort1_make_node
  (loc, S1Tapps(f1, list_sing(x0)))
)
end // end of [$FIX.fxitm_postfix]
//
implement
$FIX.fxitm_get_loc<sort1>
  (itm) =
(
case+ itm of
| $FIX.FXITMatm(x0) => x0.loc()
| $FIX.FXITMopr(x0, _) => x0.loc()
) (* end of [$FIX.fxitm_get_loc] *)
//
implement
$FIX.fxopr_make_app<sort1>
  (itm) = let
//
val loc =
$FIX.fxitm_get_loc<sort1>(itm)
//
val s1t =
sort1_make_node(loc, S1Tapp(*void*))
//
in
  $FIX.FXITMopr(s1t, $FIX.app_fixty)
end // end of [$FIX.fxopr_make_app]
//
} // end of [fxitmlst_resolve_sort1]

(* ****** ****** *)

fun
fxitmlst_resolve_s1exp
( loc0: loc_t
, itms: s1eitmlst): s1exp =
(
$FIX.fxitmlst_resolve<s1exp>(loc0, itms)
) where
{
//
implement
$FIX.fxitm_infix<s1exp>
(
x0, f1, x2
) = let
  val loc =
  x0.loc() + x2.loc()
in
FXITMatm
(
s1exp_make_node
( loc
, S1Eapps(f1, list_pair(x0, x2))
)
)
end // end of [fxitm_infix]
//
implement
$FIX.fxitm_prefix<s1exp>
  (f0, x1) = let
  val loc =
  f0.loc() + x1.loc()
in
FXITMatm
(
  s1exp_make_node
  (loc, S1Eapps(f0, list_sing(x1)))
)
end // end of [fxitm_prefix]
//
implement
$FIX.fxitm_postfix<s1exp>
  (x0, f1) = let
  val loc =
  x0.loc() + f1.loc()
in
FXITMatm
(
  s1exp_make_node
  (loc, S1Eapps(f1, list_sing(x0)))
)
end // end of [fxitm_postfix]
//
implement
$FIX.fxitm_get_loc<s1exp>
  (itm) =
(
case+ itm of
| $FIX.FXITMatm(x0) => x0.loc()
| $FIX.FXITMopr(x0, _) => x0.loc()
) (* end of [$FIX.fxitm_get_loc] *)
//
implement
$FIX.fxopr_make_app<s1exp>
  (itm) = let
//
val loc =
$FIX.fxitm_get_loc<s1exp>(itm)
//
val s1e =
s1exp_make_node(loc, S1Eapp(*void*))
//
in
  $FIX.FXITMopr(s1e, $FIX.app_fixty)
end // end of [$FIX.fxopr_make_app]
//
} // end of [fxitmlst_resolve_s1exp]

(* ****** ****** *)

local

fun
auxitm
( s0t0
: sort0)
: s1titm = let
//
val
loc0 = s0t0.loc()
//
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
    val s1t0 =
    sort1_make_node(loc0, S1Tid(tok))
  }
| S0Tapps(s0ts) =>
  FXITMatm(s1t0) where
  {
    val s1t0 =
    fxitmlst_resolve_sort1(loc0, auxitmlst(s0ts))
  }
//
| S0Tlist
  (_, s0ts, _) =>
  FXITMatm(s1t0) where
  {
    val s1ts = sort0lst_trans(s0ts)
    val s1t0 = sort1_make_node(loc0, S1Tlist(s1ts))
  }
//
| S0Tqual
  (tok, s0t) =>
  FXITMatm(s1t0) where
  {
    val s1t = sort0_trans(s0t)
    val s1t0 =
    sort1_make_node(loc0, S1Tqual(tok, s1t))
  }
//
| S0Tnone(tok) =>
  FXITMatm(s1t0) where
  {
    val s1t0 =
      sort1_make_node(loc0, S1Txerr((*void*)))
    // end of [val]
  }
//
end // end of [auxitm]

and
auxitmlst
( xs
: sort0lst)
: s1titmlst =
list_vt2t(ys) where
{
  val ys =
  list_map<sort0><s1titm>
    (xs) where
  {
    implement
    list_map$fopr<sort0><s1titm>(x) = auxitm(x)
  }
} (* end of [auxitmlst] *)

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
