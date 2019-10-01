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
//
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
//
| T2Pfun
  (fc2, _, t2ps, t2p1) =>
  (
    auxt2p0(t2p1, xtvs)
  ) where
  {
    val
    xtvs = auxt2p0(fc2, xtvs)
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
| list_cons(lt2p0, ltps1) =>
  let
    val xtvs =
    auxt2p0(t2p0, xtvs)
  in
    auxlt2ps(ltps1, xtvs)
  end where
  {
    val+TLABELED(l0, t2p0) = lt2p0
  }
)
//
} (* end of [t2ype_get_xtvs] *)

(* ****** ****** *)
//
implement
unify_d2var_t2ype
  (loc0, d2v1, t2p2) =
let
val t2p1 = d2v1.type()
in
unify_t2ype_t2ype(loc0, t2p1, t2p2)
end
implement
unify_d2con_t2ype
  (loc0, d2c1, t2p2) =
let
val t2p1 = d2c1.type()
in
unify_t2ype_t2ype(loc0, t2p1, t2p2)
end
//
implement
unify_d2cst_t2ype
  (loc0, d2c1, t2p2) =
let
val tqas = d2c1.tqas()
val t2p1 = d2c1.type()
val t2p1 =
  t2ype_tq2as_elim(loc0, t2p1, tqas)
in
  unify_t2ype_t2ype(loc0, t2p1, t2p2)
end
//
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
//
implement
match_d2var_t2ype
  (d2v1, t2p2) =
let
  val t2p1 = d2v1.type()
in
  match_t2ype_t2ype(t2p1, t2p2)
end
//
implement
match_d2con_t2ype
  (d2c1, t2p2) =
let
  val t2p1 = d2c1.type()
in
  match_t2ype_t2ype(t2p1, t2p2)
end
//
implement
match_d2cst_t2ype
  (d2c1, t2p2) =
let
//
val
loc0 =
the_location_dummy
val t2p1 = d2c1.type()
val tqas = d2c1.tqas()
//
val t2p1 =
t2ype_tq2as_elim(loc0, t2p1, tqas)
//
in
  match_t2ype_t2ype(t2p1, t2p2)
end // end of [match_d2cst_t2ype]
//
(* ****** ****** *)

implement
match_d2itm_t2ype
  (d2i1, t2p2) =
let
(*
val () =
println!
("match_d2itm_t2ype: d2i1 = ", d2i1)
val () =
println!
("match_d2itm_t2ype: t2p2 = ", t2p2)
*)
//
fun
auxvar
( d2i1
: d2itm): d2itmopt_vt =
let
  val-D2ITMvar(d2v1) =  d2i1
in
if
match(d2v1, t2p2)
then Some_vt(d2i1) else None_vt(*void*)
end // end of [auxvar]
//
fun
auxcon
( d2i1
: d2itm): d2itmopt_vt =
( loop(d2cs) ) where
{
//
val-D2ITMcon(d2cs) =  d2i1
//
fun
loop
( d2cs
: d2conlst): d2itmopt_vt =
(
case+ d2cs of
| list_nil
  ((*void*)) => None_vt()
| list_cons
  (d2c1, d2cs2) =>
  if
  match(d2c1, t2p2)
  then Some_vt(D2ITMcon(d2cs)) else loop(d2cs2)
)
//
} (* end of [auxcon] *)
//
fun
auxcst
( d2i1
: d2itm): d2itmopt_vt =
( loop(d2cs) ) where
{
//
  val-D2ITMcst(d2cs) =  d2i1
//
fun
loop
( d2cs
: d2cstlst): d2itmopt_vt =
(
case+ d2cs of
| list_nil
  ((*void*)) => None_vt()
| list_cons
  (d2c1, d2cs2) =>
  if
  match(d2c1, t2p2)
  then Some_vt(D2ITMcst(d2cs)) else loop(d2cs2)
)
//
} (* end of [auxcst] *)
//
fun
auxsym
( d2i1
: d2itm): d2itmopt_vt =
let
  val-
  D2ITMsym(sym, dpis) = d2i1
in
  match_d2pitmlst_t2ype(dpis, t2p2)
end
//
in
//
case+ d2i1 of
| D2ITMvar _ => auxvar(d2i1)
| D2ITMcon _ => auxcon(d2i1)
| D2ITMcst _ => auxcst(d2i1)
| D2ITMsym _ => auxsym(d2i1)
//
end // end of [match_d2itm_t2ype]

(* ****** ****** *)
//
implement
match_d2conlst_t2ype
  (d2cs, t2p2) =
(
  auxlst(d2cs)
) where
{
fun
auxlst
( d2cs
: d2conlst): d2conopt_vt =
(
case+ d2cs of
| list_nil
  ((*void*)) => None_vt()
| list_cons
  (d2c1, d2cs) =>
  (
    if
    match(d2c1, t2p2)
    then Some_vt(d2c1) else auxlst(d2cs)
  )
)
} (* end of [match_d2conlst_t2ype] *)
//
implement
match_d2cstlst_t2ype
  (d2cs, t2p2) =
(
  auxlst(d2cs)
) where
{
fun
auxlst
( d2cs
: d2cstlst): d2cstopt_vt =
(
case+ d2cs of
| list_nil
  ((*void*)) => None_vt()
| list_cons
  (d2c1, d2cs) =>
  (
    if
    match(d2c1, t2p2)
    then Some_vt(d2c1) else auxlst(d2cs)
  )
)
} (* end of [match_d2cstlst_t2ype] *)
//
(* ****** ****** *)
//
implement
match_d2pconlst_t2ype
  (dpis, t2p2) =
( auxlst1(dpis) ) where
{
//
fun
auxmat
( d2i0
: d2itm
) : d2itmopt_vt =
(
case+ d2i0 of
| D2ITMcon _ => match(d2i0, t2p2)
| _(*non-D2ITMcon*) => None_vt(*void*)
)
//
fun
auxlst1
( dpis
: d2pitmlst): d2itmopt_vt =
(
case+ dpis of 
| list_nil
  ((*void*)) => None_vt()
| list_cons
  (d2pi, dpis) =>
  (
  case+ d2pi of
  | D2PITMnone
    (deid) => auxlst1(dpis)
  | D2PITMsome
    (p0, d2i0) =>
    let
      val opt0 = auxmat(d2i0)
    in
      case+ opt0 of
      | ~None_vt() => auxlst1(dpis)
      | ~Some_vt(d2i0) => auxlst2(dpis, p0, d2i0)
    end // D2PITMsome
  ) (* end of [list_cons] *)
)
and
auxlst2
( dpis
: d2pitmlst
, p0: int
, d2i0: d2itm): d2itmopt_vt =
(
case+ dpis of
| list_nil
  ((*void*)) => Some_vt(d2i0)
| list_cons
  (d2pi, dpis) =>
  (
  case+ d2pi of
  | D2PITMnone
    (deid) =>
    auxlst2(dpis, p0, d2i0)
  | D2PITMsome(p1, d2i1) =>
    if
    p1 <= p0
    then
    (
      auxlst2(dpis, p0, d2i0)
    )
    else let
      val opt1 = auxmat(d2i1)
    in
      case+ opt1 of
      | ~None_vt() => auxlst2(dpis, p0, d2i0)
      | ~Some_vt(d2i1) => auxlst2(dpis, p1, d2i1)
    end // D2PITMsome
  ) (* end of [list_cons] *)
)
} (* end of [match_d2pconlst_t2ype] *)
//
(* ****** ****** *)
//
implement
match_d2pitmlst_t2ype
  (dpis, t2p2) =
( auxlst1(dpis) ) where
{
//
fun
auxmat
( d2i0
: d2itm
) : d2itmopt_vt =
(
  match(d2i0, t2p2)
)
//
fun
auxlst1
( dpis
: d2pitmlst): d2itmopt_vt =
(
case+ dpis of 
| list_nil
  ((*void*)) => None_vt()
| list_cons
  (d2pi, dpis) =>
  (
  case+ d2pi of
  | D2PITMnone
    (deid) => auxlst1(dpis)
  | D2PITMsome
    (p0, d2i0) =>
    let
      val opt0 = auxmat(d2i0)
    in
      case+ opt0 of
      | ~None_vt() => auxlst1(dpis)
      | ~Some_vt(d2i0) => auxlst2(dpis, p0, d2i0)
    end // D2PITMsome
  ) (* end of [list_cons] *)
)
and
auxlst2
( dpis
: d2pitmlst
, p0: int
, d2i0: d2itm): d2itmopt_vt =
(
case+ dpis of
| list_nil
  ((*void*)) => Some_vt(d2i0)
| list_cons
  (d2pi, dpis) =>
  (
  case+ d2pi of
  | D2PITMnone
    (deid) =>
    auxlst2(dpis, p0, d2i0)
  | D2PITMsome(p1, d2i1) =>
    if
    p1 <= p0
    then
    (
      auxlst2(dpis, p0, d2i0)
    )
    else let
      val opt1 = auxmat(d2i1)
    in
      case+ opt1 of
      | ~None_vt() => auxlst2(dpis, p0, d2i0)
      | ~Some_vt(d2i1) => auxlst2(dpis, p1, d2i1)
    end // D2PITMsome
  ) (* end of [list_cons] *)
)
} (* end of [match_d2pitmlst_t2ype] *)
//
(* ****** ****** *)

implement
t2ype_f3arg_elim
(
loc0, tfun, f3as
) =
(
( f3as, tfun ) where
{
  var tfun = tfun
  val f3as = auxf3as_0(f3as, tfun)
}
) where
{
fun
auxf3as_0
( f3as
: f3arglst
, tfun
: &t2ype >> _
)
: f3arglst =
(
case+ f3as of
| list_nil() =>
  list_nil()
| list_cons
  (f3a0, f3as) =>
  (
    list_cons(f3a0, f3as)
  ) where
  {
    val
    f3a0 = auxf3as_1(f3a0, tfun)
    val
    f3as = auxf3as_0(f3as, tfun)
  }
) (* auxf3as_0 *)
and
auxf3as_1
( f3a0
: f3arg
, tfun
: &t2ype >> _): f3arg =
(
case-
f3a0.node() of
(*
| F3ARGnone2 _ => f3a0
| F3ARGnone3 _ => f3a0
| F3ARGsome_met _ => f3a0
*)
| F3ARGsome_sta _ => auxf3as_1s(f3a0, tfun)
| F3ARGsome_dyn _ => auxf3as_1d(f3a0, tfun)
)
//
and
auxf3as_1s
( f3a0
: f3arg
, tfun
: &t2ype >> _): f3arg =
let
//
val-
F3ARGsome_sta
( svs1
, s2ps) = f3a0.node()
//
val
t2p0 = t2ype_hnfize(tfun)
//
in
//
case+
t2p0.node() of
| T2Puni
  (svs2, t2p0) =>
  let
    val t2p0 =
    t2ype_revars(t2p0, svs1, svs2)
  in
    let
      val () = tfun := t2p0 in f3a0
    end
  end
| _(*non-T2Puni*) =>
  (
    f3arg_make_node
    (f3a0.loc(), F3ARGnone3(f3a0))
  )
//
end // end of [let] // end of [auxf3as_1s]
//
and
auxf3as_1d
( f3a0
: f3arg
, tfun
: &t2ype >> _): f3arg =
let
//
val-
F3ARGsome_dyn
( npf1
, d3ps) = f3a0.node()
//
val
loc0 = f3a0.loc()
val
t2p0 = t2ype_hnfize(tfun)
//
in
//
case+
t2p0.node() of
//
| T2Puni
  (s2vs, t2p0) =>
  (
    tfun := t2p0;
    auxf3as_1d(f3a0, tfun)
  ) where
  {
    val t2p0 =
    t2ype_renams(t2p0, s2vs)
  }
| T2Pfun
  (_, _, t2ps, t2p0) =>
  let
    val d3ps =
    trans33_dpatlst_dn(d3ps, t2ps)
  in
    tfun := t2p0;
    f3arg_make_node
    (loc0, F3ARGsome_dyn(npf1, d3ps))
   end
//
| _(*non-T2Puni/fun*) =>
  f3arg_make_node(loc0, F3ARGnone3(f3a0))
//
end // end of [let] // end of [auxf3as_1d]
//
} (* end of [t2ype_f3arg_elim] *)
//
(* ****** ****** *)

(* end of [trans33_util0.dats] *)
