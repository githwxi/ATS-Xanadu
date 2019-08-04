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

local

fun
auxres
( res
: effs2expopt
) : s2exp =
(
case+ res of
| EFFS2EXPnone() =>
  (
    s2exp_none0((*void*))
  )
| EFFS2EXPsome(s2e) => s2e
)

fun
auxarg
( arg
: f2arglst
, res: s2exp): s2exp =
(
case+ arg of
| list_nil() => res
| list_cons(x0, xs) =>
  let
  val
  res = auxarg(xs, res)
  in
  (
  case+
  x0.node() of
  | F2ARGsome_dyn
    (npf, d2ps) => let
      val
      fc2 =
      (
      case+ xs of
      | list_nil() => FC2fun((*void*))
      | list_cons _ => FC2cloref(*void*)
      ) : funclo2 // end-of-val
      val s2es =
      s2explst_of_d2patlst(d2ps)
    in
      s2exp_fun_full
      (fc2, 0(*lin*), npf, s2es, res)
    end
  | F2ARGsome_sta
    (s2vs, s2ps) => s2exp_uni(s2vs, s2ps, res)
  | F2ARGsome_met(s2es) => s2exp_met(s2es, res)
  )
  end
)

in (* in-of-local *)

implement
s2exp_of_f2undecl
  (f2d0) = let
//
val+F2UNDECL(rcd) = f2d0
//
in
//
  case+
  rcd.wtp of
  | None() =>
    let
      val
      res =
      auxres(rcd.res)
    in
      auxarg(rcd.arg, res)
    end
  | Some(s2e) => s2e
//
end // end of [s2exp_of_f2undecl]

end // end of [local]

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

implement
s2exp_of_v2ardecl
  (v2d0) = let
//
val+V2ARDECL(rcd) = v2d0
//
in
  s2exp_none0()
end // end of [s2exp_of_v2ardecl]

(* ****** ****** *)

(* end of [trans23_util0.dats] *)
