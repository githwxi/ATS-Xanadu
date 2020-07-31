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
// Start Time: April, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN="prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/basics.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/label0.sats"
#staload "./../SATS/symbol.sats"
//
(* ****** ****** *)

#staload "./../SATS/locinfo.sats"

(* ****** ****** *)
//
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
//
(* ****** ****** *)
//
extern
fun
t2xtv_occurs
(xtv0: t2xtv, t2p1: t2ype): bool
//
implement
t2xtv_occurs
(xtv0, t2p0) =
(auxt2p0(t2p0)) where
{
//
fun
auxt2p0
(t2p0: t2ype): bool = (
//
case+
t2p0.node() of
//
| T2Pbas _ => false
//
| T2Pcst _ => false
| T2Pvar _ => false
//
| T2Pfc2 _ => false
//
| T2Pnone0 _ => false
| T2Pnone1 _ => false
//
| T2Pxtv(xtv1) =>
  if
  (xtv0 = xtv1)
  then true
  else auxt2p0(xtv1.type())
//
| T2Plft(t2p1) => auxt2p0(t2p1)
//
| T2Papp(t2p1, t2ps) =>
  (auxt2p0(t2p1) || auxt2ps(t2ps))
//
| T2Plam(s2vs, t2p1) => auxt2p0(t2p1)
//
| T2Pfun
  (fc2, npf, t2ps, t2p1) =>
  (auxt2p0(t2p1) || auxt2ps(t2ps))
//
| T2Pexi(s2vs, t2p1) => auxt2p0(t2p1)
| T2Puni(s2vs, t2p1) => auxt2p0(t2p1)
//
| T2Ptyext
  (tnm, t2ps) => auxt2ps(t2ps)
//
| T2Ptyrec
  (knd, npf, lt2ps) => auxlt2ps(lt2ps)
//
) (* end of [auxt2p0] *)
and
auxt2ps
(t2ps: t2ypelst): bool =
(
case+ t2ps of
| list_nil() => false
| list_cons(t2p0, t2ps) =>
  if auxt2p0(t2p0) then true else auxt2ps(t2ps)
)
//
and
auxlt2ps
(ltps: labt2ypelst): bool =
(
case+ ltps of
| list_nil() => false
| list_cons(lt2p0, ltps1) =>
  let
  val+SLABELED(lab, t2p0) = lt2p0
  in
  if auxt2p0(t2p0) then true else auxlt2ps(ltps1)
  end
)
//
} (* end of [t2xtv_occurs] *)

(* ****** ****** *)
//
extern
fun{}
unify_eval(t2ype): t2ype
//
(* ****** ****** *)
//
extern
fun{}
unify_t2ype_t2ype
( loc0: loc_t
, t2p1: t2ype, t2p2: t2ype): bool
//
extern
fun{}
unify_t2ypelst_t2ypelst
( loc0: loc_t
, t2ps1: t2ypelst, t2ps2: t2ypelst): bool
//
(*
extern
fun{}
unify_labt2ype_labt2ype
( loc0: loc_t
, lt2p1: labt2ype, lt2p2: labt2ype): bool
extern
fun{}
unify_labt2ypelst_labt2ypelst
( loc0: loc_t
, lt2ps1: labt2ypelst, lt2ps2: labt2ypelst): bool
*)
//
(* ****** ****** *)

implement
{}(*tmp*)
unify_t2ype_t2ype
(loc0, t2p1, t2p2) =
(
  unify(t2p1, t2p2)
) where
{
fun
unify
( t2p1: t2ype
, t2p2: t2ype): bool =
(
let
//
(*
val () =
println!
("unify: loc0 = ", loc0)
*)
val
t2p1 = unify_eval<>(t2p1)
and
t2p2 = unify_eval<>(t2p2)
//
(*
val () =
println!("unify: t2p1 = ", t2p1)
val () =
println!("unify: t2p2 = ", t2p2)
*)
//
in (* in-of-let *)
case+
t2p1.node() of
| T2Pxtv(xtv1) =>
  auxtv1(xtv1, t2p1, t2p2)
| _ (* else *) =>
  (
  case+
  t2p2.node() of
  | T2Pxtv(xtv2) =>
    auxtv2(t2p1, xtv2, t2p2)
  | _ (* else *) => auxtp0(t2p1, t2p2)
  )
end where
{
//
fun
auxtp0
( t2p1: t2ype
, t2p2: t2ype): bool =
(
case+
t2p1.node() of
|
T2Pexi(s2vs, t2p1) =>
(
  auxtp0(t2p1, t2p2)
)
|
T2Puni(s2vs, t2p1) =>
(
  auxtp0(t2p1, t2p2)
) where
{
  val tsub =
  (
  list_map<s2var><t2ype>(s2vs)
  ) where
  {
    implement
    list_map$fopr<s2var><t2ype>(s2v) =
    let
    val s2t = s2v.sort()
    in
    t2ype_new_srt_xtv(s2t, t2xtv_new_srt(loc0, s2t))
    end
  }
  val t2p1 =
  t2ype_subst_svarlst
  (t2p1, s2vs, $UN.list_vt2t(tsub))
  val ((*void*)) = list_vt_free(tsub)
}
//
|
_ (* non-quantifier *) =>
(
case+ t2p2.node() of
| T2Puni(s2vs, t2p2) =>
  (
    auxtp0(t2p1, t2p2)
  )
| T2Pexi(s2vs, t2p2) =>
  (
    auxtp0(t2p1, t2p2)
  ) where
  {
    val tsub =
    (
      list_map<s2var><t2ype>(s2vs)
    ) where
    {
      implement
      list_map$fopr<s2var><t2ype>(s2v) =
      let
      val s2t = s2v.sort()
      in
      t2ype_new_srt_xtv(s2t, t2xtv_new_srt(loc0, s2t))
      end
    }
    val t2p2 =
    t2ype_subst_svarlst
    (t2p2, s2vs, $UN.list_vt2t(tsub))
    val ((*void*)) = list_vt_free(tsub)
  }
| _ (* non-quantifier *) => auxtp1(t2p1, t2p2)
)
//
)
and
auxtp1
( t2p1: t2ype
, t2p2: t2ype): bool =
(
case+
t2p1.node() of
| T2Pbas(nam1) =>
  (
  case+
  t2p2.node() of
  | T2Pbas(nam2) =>
    (nam1 = nam2)
  | _ (* else *) => false
  )
| T2Pcst(s2c1) =>
  (
  case+
  t2p2.node() of
  | T2Pcst(s2c2) =>
    (s2c1 = s2c2)
  | _ (* else *) => false
  )
| T2Pvar(s2v1) =>
  (
  case+
  t2p2.node() of
  | T2Pvar(s2v2) =>
    (s2v1 = s2v2)
  | _ (* else *) => false
  )
| T2Plft(t2p1) =>
  (
  case+
  t2p2.node() of
  | T2Plft(t2p2) =>
    unify(t2p1, t2p2)
  | _ (* non-T2Plft *) => false
  )
| T2Papp(t2f1, arg1) =>
  (
  case+
  t2p2.node() of
  | T2Papp(t2f2, arg2) =>
    let
      val tfun =
      unify(t2f1, t2f2) 
      val targ =
      unifylst(arg1, arg2)
    in
      if tfun then targ else false
    end
  | _ (* non-T2Papp *) => false
  )
//
| T2Pfc2(fc1) =>
  (
  case+
  t2p2.node() of
  | T2Pfc2(fc2) =>
    funclo2_equal(fc1, fc2)
  | _(*non-T2Pfc2*) => false
  )
| T2Pfun
  (tfc1, npf1, arg1, res1) =>
  (
  case+
  t2p2.node() of
  | T2Pfun
    (tfc2, npf2, arg2, res2) =>
    let
      val
      tnpf = (npf1 = npf2)
      val
      tfcr = unify(tfc1, tfc2)
      val
      tres = unify(res1, res2)
      val
      targ = unifylst(arg2, arg1)
    in
      (tnpf && (tfcr && (targ && tres)))
    end
  | _ (* else *) => false
  )
//
| T2Ptyext
  (tnm1, tps1) =>
  (
  case+
  t2p2.node() of
  | T2Ptyext(tnm2, tps2) =>
    if
    (tnm1 = tnm2)
    then
    unifylst(tps1, tps2) else false
  | _ (* non-T2Ptyext *) => false
  )
//
| T2Ptyrec
  (knd1, npf1, lxs1) =>
  (
  case+
  t2p2.node() of
  | T2Ptyrec(knd2, npf2, lxs2) =>
    (
      tknd && (tnpf && tlxs)
    ) where
    {
      val tknd = (knd1=knd2)
      val tnpf = (npf1=npf2)
      val tlxs = labunifylst(lxs1, lxs2)
    }
  | _ (* non-T2Ptyrec *) => false
  )
//
| T2Pnone0() =>
  (
  case+ t2p2.node() of T2Pnone0() => true | _ => false
  )
//
| _ (* else *) => false
)
//
fun
auxtv1
( xtv1: t2xtv
, t2p1: t2ype
, t2p2: t2ype): bool =
(
case+
t2p2.node() of
|
T2Pxtv(xtv2) =>
(
if
(xtv1=xtv2)
then true else let
  val
  s2t1 = xtv1.sort()
  val
  s2t2 = t2p2.sort()
in
  case+ s2t1 of
  |
  S2Tnone0() =>
  (xtv1.type(t2p2); true)
  | _(* non-S2Tnone0 *) =>
  ( case+ s2t2 of
    |
    S2Tnone0() =>
    (xtv2.type(t2p1); true)
    | _(* non-S2Tnone0 *) =>
    (
    if
    (s2t2 <= s2t1)
    then
    (xtv1.type(t2p2); true)
    else
    (xtv2.type(t2p1); true) )
  )
end // end-of-else // end-of-if
)
|
_ (* else *) =>
let
  val occurs =
  t2xtv_occurs(xtv1, t2p2) 
(*
  val ((*void*)) =
  println!
  ("auxtv1: occurs = ", occurs)
*)
in
  if
  occurs
  then false else let
    val () = xtv1.type(t2p2) in true
  end // end-of-else // end-of-if
end
)
//
fun
auxtv2
( t2p1: t2ype
, xtv2: t2xtv
, t2p2: t2ype): bool =
  let
    val occurs =
    t2xtv_occurs(xtv2, t2p1) 
(*
    val ((*void*)) =
    println!
    ("auxtv2: occurs = ", occurs)
*)
  in
    if occurs then false else
    let
      val () = xtv2.type(t2p1) in true
    end
  end
//
} (* end of [where] *)
) (* end of [unify] *)
//
and
unifylst
( tps1: t2ypelst
, tps2: t2ypelst): bool =
(
case+ tps1 of
| list_nil() =>
  (
  case+ tps2 of
  | list_nil() => true
  | list_cons _ => false
  )
| list_cons(t2p1, tps1) =>
  (
  case+ tps2 of
  | list_nil() => false
  | list_cons(t2p2, tps2) =>
    let
      val
      test1 =
      unify(t2p1, t2p2)
      val
      test2 =
      unifylst(tps1, tps2)
    in
      if test1 then test2 else false
    end
  )
) (* end of [unifylst] *)
//
and
labunify
( ltp1: labt2ype
, ltp2: labt2ype): bool =
let
val+SLABELED(l1, t2p1) = ltp1
val+SLABELED(l2, t2p2) = ltp2
in
//
if
(l1 = l2)
then unify(t2p1, t2p2) else false
//
end // end of [labunify]
//
and
labunifylst
( ltps1: labt2ypelst
, ltps2: labt2ypelst): bool =
(
case+ ltps1 of
| list_nil() =>
  (
  case+ ltps2 of
  | list_nil() => true
  | list_cons _ => false
  )
| list_cons(lt2p1, ltps1) =>
  (
  case+ ltps2 of
  | list_nil() => false
  | list_cons(lt2p2, ltps2) =>
    let
      val
      test1 =
      labunify(lt2p1, lt2p2)
      val
      test2 =
      labunifylst(ltps1, ltps2)
    in
      if test1 then test2 else false
    end
  )
) (* end of [labunifylst] *)
//
} (* end of [unify_t2ype_t2ype] *)

(* ****** ****** *)
//
implement
{}(*tmp*)
unify_t2ypelst_t2ypelst
  (loc0, t2ps1, t2ps2) =
(
  unifylst(t2ps1, t2ps2)
) where
{
fun
unifylst
( t2ps1: t2ypelst
, t2ps2: t2ypelst): bool =
(
case+ t2ps1 of
| list_nil() =>
  (
  case+ t2ps2 of
  | list_nil() => true
  | list_cons _ => false
  )
| list_cons(t2p1, t2ps1) =>
  (
  case+ t2ps2 of
  | list_nil() => false
  | list_cons(t2p2, t2ps2) =>
    let
      val
      test1 =
      unify_t2ype_t2ype<>
      ( loc0, t2p1, t2p2 )
      val
      test2 =
      unifylst(t2ps1, t2ps2)
    in
      if test1 then test2 else false
    end
  )
) (* end of [unifylst] *)
} (* end of [unify_t2ypelst_t2ypelst] *)
//
(* ****** ****** *)

(*
implement
{}(*tmp*)
unify_labt2ype_labt2ype
(loc0, lt2p1, lt2p2) =
let
val+TLABELED(l1, t2p1) = lt2p1
val+TLABELED(l2, t2p2) = lt2p2
in
//
if
(l1 = l2)
then
unify_t2ype_t2ype<>(loc0, t2p1, t2p2)
else false // else // end of [if]
//
end // end of [unify_labt2ype_labt2ype]
*)

(* ****** ****** *)

(* end of [xats_statyp2_unify.dats] *)
