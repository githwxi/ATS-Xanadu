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

#staload "./../SATS/label0.sats"
#staload "./../SATS/symbol.sats"

(* ****** ****** *)

#staload "./../SATS/locinfo.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

#staload "./../SATS/trans23.sats"
#staload "./../SATS/trans33.sats"

(* ****** ****** *)

extern
fun
t2ype_get_xtvs
(t2p0: t2ype): List0_vt(t2xtv)

implement
t2ype_get_xtvs
  (t2p0) =
(
auxt2p0
(t2p0, list_vt_nil())
) where
{
fun
auxt2p0
( t2p0: t2ype
, xtvs
: List0_vt(t2xtv)
)
: List0_vt(t2xtv) =
(
case+
t2p0.node() of
//
| T2Pxtv(xtv) =>
  let
    val t2p1 = xtv.type()
  in
  case+
  t2p1.node() of
  | T2Pnone0() =>
    list_vt_cons(xtv, xtvs)
  | _ => auxt2p0(t2p1, xtvs)
  end
//
| T2Papp
  (t2p1, t2ps) =>
  (
    auxt2ps(t2ps, xtvs)
  ) where
  {
    val
    xtvs = auxt2p0(t2p1, xtvs)
  }
| T2Pfun
  (_, _, t2ps, t2p1) =>
  (
    auxt2p0(t2p1, xtvs)
  ) where
  {
    val
    xtvs = auxt2ps(t2ps, xtvs)
  }
//
| T2Plam
  (s2vs, t2p1) => auxt2p0(t2p1, xtvs)
//
| T2Pexi
  (s2vs, t2p1) => auxt2p0(t2p1, xtvs)
| T2Puni
  (s2vs, t2p1) => auxt2p0(t2p1, xtvs)
//
| T2Ptyext
  (name, t2ps) => auxt2ps(t2ps, xtvs)
//
| T2Ptyrec
  (_, _, ltps) => auxlt2ps(ltps, xtvs)
//
| _ (* rest-of-t2ype *) => xtvs
//
)
and
auxt2ps
( t2ps
: t2ypelst
, xtvs
: List0_vt(t2xtv)
)
: List0_vt(t2xtv) =
(
case+ t2ps of 
| list_nil
  ((*void*)) => xtvs
| list_cons
  (t2p0, t2ps) =>
  (
    auxt2ps(t2ps, xtvs)
  ) where
  {
    val
    xtvs = auxt2p0(t2p0, xtvs)
  }
)
and
auxlt2ps
( ltps
: labt2ypelst
, xtvs
: List0_vt(t2xtv)
)
: List0_vt(t2xtv) =
(
case+ ltps of
| list_nil() => xtvs
| list_cons(lt2p, ltps) =>
  let
    val xtvs =
    auxt2p0(t2p0, xtvs)
  in
    auxlt2ps(ltps, xtvs)
  end where
  {
    val+TLABELED(l0, t2p0) = lt2p
  }
)
} (* end of [t2ype_get_xtvs] *)

(* ****** ****** *)

implement
match_t2ype_t2ype
  (t2p1, t2p2) = let
//
val
loc0 = the_location_dummy
//
val
xtvs = t2ype_get_xtvs(t2p2)
val
test = unify(loc0, t2p1, t2p2)
//
fun
reset
(xtv0: t2xtv): void =
(xtv0.type(the_t2ype_none0))
fun
auxlst
( xtvs
: List_vt(t2xtv)): void =
(
case+ xtvs of
|
~list_vt_nil() => ()
|
~list_vt_cons(x0, xs) =>
 let
 val () = reset(x0) in auxlst(xs)
 end
)
//
in
let val () = auxlst(xtvs) in test end
end // end of [match_t2ype_t2ype]

(* ****** ****** *)

(* end of [trans33_util0.dats] *)
