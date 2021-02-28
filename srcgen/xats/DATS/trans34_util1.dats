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
// Start Time: January, 2021
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
#staload "./../SATS/staexp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp4.sats"
(* ****** ****** *)
#staload "./../SATS/trans34.sats"
(* ****** ****** *)

implement
trans34_d4exp_deuni
  (d4e0) =
(
let
val
s2e0 = d4e0.sexp()
in
  auxd4e0(d4e0, s2e0)
end
) where
{
//
val
loc0 = d4e0.loc()
val
t2p0 = d4e0.type()
//
fun
auxs2vs
( s2vs
: s2varlst): s2explst =
(
case+
s2vs of
|
list_nil() =>
list_nil()
|
list_cons
(s2v1, s2vs) =>
let
val
s2t1 = s2v1.sort()
val
xtv1 =
s2xtv_new(loc0, s2t1)
val
s2e1 = s2exp_xtv(xtv1)
in
  list_cons(s2e1, auxs2vs(s2vs))
end
)
//
fun
auxd4e0
( d4e0: d4exp
, s2e0: s2exp): d4exp =
let
//
val
s2e0 = s2exp_whnfize(s2e0)
//
in
case+
s2e0.node() of
|
S2Euni
( s2vs
, s2ps, s2e1) =>
let
//
val
tsub = auxs2vs(s2vs)
//
val s2e1 = 
s2exp_subst_svarlst
(s2e1, s2vs, tsub)
val s2ps =
s2explst_subst_svarlst
(s2ps, s2vs, tsub)
//
val
d4e1 =
d4exp_make_node
( loc0, s2e1, t2p0
, D4Esapx(d4e0, tsub, s2ps))
//
in
  auxd4e0(d4e1, s2e1)
end
| _ (* rest-of-s2exp *) => d4e0
end
//
} (*where*) // end of [trans34_d4exp_deuni]

(* ****** ****** *)

(* end of [xats_trans34_util1.dats] *)
