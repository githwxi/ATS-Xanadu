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

(* ****** ****** *)

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
| T2Pnone0 _ => false
| T2Pnone1 _ => false
//
| T2Pxtv(xtv1) =>
  if
  (xtv0 = xtv1)
  then true
  else auxt2p0(xtv1.type())
//
| T2Papp(t2p1, t2ps) =>
  if
  auxt2p0(t2p1)
  then true else auxt2ps(t2ps)
//
| T2Plam(s2vs, t2p1) => auxt2p0(t2p1)
//
| T2Pfun
  (fcr, npf, t2ps, t2p1) =>
  if
  auxt2p0(t2p1)
  then true else auxt2ps(t2ps)
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
  val+TLABELED(lab, t2p0) = lt2p0
  in
  if auxt2p0(t2p0) then true else auxlt2ps(ltps1)
  end
)
//
} (* end of [t2xtv_occurs] *)

(* ****** ****** *)

implement
t2ype_tq2as_elim
(loc0, t2p0, tqas) =
(
auxinst1
( tqas
, list_vt_nil((*void*))
, list_vt_nil((*void*)) )
) where
{
//
vtypedef
t2ypelst_vt = List0_vt(t2ype)
//
fnx
auxinst1
( tqas
: tq2arglst
, s2vs: s2varlst_vt
, tsub: t2ypelst_vt): t2ype =
(
case+ tqas of
| list_nil() =>
  ( t2p0 ) where
  {
  val
  s2vs = list_vt_reverse(s2vs)
  val
  tsub = list_vt_reverse(tsub)
  val
  t2p0 =
  (
  t2ype_substs(t2p0, s2vs, tsub)
  ) where
  {
    val s2vs = $UN.list_vt2t(s2vs)
    val tsub = $UN.list_vt2t(tsub)
  }
  val ((*void*)) = list_vt_free(s2vs)
  val ((*void*)) = list_vt_free(tsub)
  }
| list_cons(tqa0, tqas) =>
  (
    auxinst2(tqa0.s2vs(), tqas, s2vs, tsub)
  )
) (* end of [auxinst1] *)
and
auxinst2
( svs1
: s2varlst
, tqas
: tq2arglst
, svs2: s2varlst_vt
, tsub: t2ypelst_vt): t2ype =
(
case+ svs1 of
| list_nil() =>
  (
    auxinst1(tqas, svs2, tsub)
  )
| list_cons(s2v1, svs1) =>
  let
    val
    s2t1 = s2v1.sort()
    val
    xtv1 = t2xtv_new(loc0)
    val
    t2px =
    t2ype_srt_xtv(s2t1, xtv1)
    val
    svs2 = list_vt_cons(s2v1, svs2)
    val
    tsub = list_vt_cons(t2px, tsub)
  in
    auxinst2(svs1, tqas, svs2, tsub)
  end
) (* end of [auxinst2] *)
} (* end of [t2ype_tq2as_elim] *)
//
(* ****** ****** *)

implement
unify_t2ype_t2ype
(loc0, t2p1, t2p2) =
(
let
//
val
t2p1 = hnfize(t2p1)
and
t2p2 = hnfize(t2p2)
//
val () =
println!("unify: loc0 = ", loc0)
val () =
println!("unify: t2p1 = ", t2p1)
val () =
println!("unify: t2p2 = ", t2p2)
//
in (* in-of-let *)
case+
t2p1.node() of
| T2Pxtv(xtv1) =>
  auxtv1(xtv1, t2p2)
| _ (* else *) =>
  (
  case+
  t2p2.node() of
  | T2Pxtv(xtv2) =>
    auxtv2(t2p1, xtv2)
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
| T2Pexi(s2vs, t2p1) =>
  (
    auxtp0(t2p1, t2p2)
  )
| T2Puni(s2vs, t2p1) =>
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
      t2ype_srt_xtv(s2v.sort(), t2xtv_new(loc0))
    }
    val t2p1 =
    t2ype_substs
    (t2p1, s2vs, $UN.list_vt2t(tsub))
    val ((*void*)) = list_vt_free(tsub)
  }
//
| _ (* non-quantifier *) =>
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
        t2ype_srt_xtv(s2v.sort(), t2xtv_new(loc0))
      }
      val t2p2 =
      t2ype_substs
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
| T2Papp(t2f1, arg1) =>
  (
  case+
  t2p2.node() of
  | T2Papp(t2f2, arg2) =>
    let
      val tfun =
      unify(loc0, t2f1, t2f2) 
      val targ =
      unify(loc0, arg1, arg2)
    in
      if tfun then targ else false
    end
  | _ (* non-T2Papp *) => false
  )
| T2Pfun
  (fcr1, npf1, arg1, res1) =>
  (
  case+
  t2p2.node() of
  | T2Pfun
    (fcr2, npf2, arg2, res2) =>
    let
      val
      tfcr = true
      val
      tnpf = (npf1 = npf2)
      val
      targ = unify(loc0, arg2, arg1)
      val
      tres = unify(loc0, res1, res2)
    in
      (tfcr && (tnpf && (targ && tres)))
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
    unify(loc0, tps1, tps2) else false
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
      val tknd = (knd1 = knd2)
      val tnpf = (npf1 = npf2)
      val tlxs = unify(loc0, lxs1, lxs2)
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
, t2p2: t2ype): bool =
(
case+
t2p2.node() of
| T2Pxtv(xtv2) => true where
  {
    val () =
    if xtv1 = xtv2
      then () else xtv1.type(t2p2)
    // end of [if]
  }
| _ (* else *) =>
  let
    val occurs =
    t2xtv_occurs(xtv1, t2p2) 
    val ((*void*)) =
    println!
    ("auxtv1: occurs = ", occurs)
  in
    if occurs then false else
    let
      val () = xtv1.type(t2p2) in true
    end
  end
)
//
fun
auxtv2
( t2p1: t2ype
, xtv2: t2xtv): bool =
  let
    val occurs =
    t2xtv_occurs(xtv2, t2p1) 
    val ((*void*)) =
    println!
    ("auxtv2: occurs = ", occurs)
  in
    if occurs then false else
    let
      val () = xtv2.type(t2p1) in true
    end
  end
//
} (* end of [where] *)
) (* end of [unify_t2ype_t2ype] *)

(* ****** ****** *)

implement
unify_t2ypelst_t2ypelst
  (loc0, t2ps1, t2ps2) =
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
      unify(loc0, t2p1, t2p2)
      val
      test2 =
      unify(loc0, t2ps1, t2ps2)
    in
      if test1 then test2 else false
    end
  )
) (* end of [unify_t2ypelst_t2ypelst] *)

(* ****** ****** *)

implement
unify_labt2ype_labt2ype
(loc0, lt2p1, lt2p2) =
let
val+TLABELED(l1, t2p1) = lt2p1
val+TLABELED(l2, t2p2) = lt2p2
in
//
if
(l1 = l2)
then unify(loc0, t2p1, t2p2) else false
//
end // end of [unify_labt2ype_labt2ype]

(* ****** ****** *)

implement
unify_labt2ypelst_labt2ypelst
(loc0, ltps1, ltps2) =
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
      unify(loc0, lt2p1, lt2p2)
      val
      test2 =
      unify(loc0, ltps1, ltps2)
    in
      if test1 then test2 else false
    end
  )
) (* end of [unify_labt2ypelst_labt2ypelst] *)

(* ****** ****** *)

implement
d3pat_dn
(d3p0, t2p0) = let
//
val () =
println!
("d3pat_dn: d3p0 = ", d3p0)
val () =
println!
("d3pat_dn: t2p0 = ", t2p0)
//
val loc0 = d3p0.loc()
val test =
unify(loc0, d3p0.type(), t2p0)
//
val () =
println!
("d3pat_dn: test = ", test)
//
in
//
if test then d3p0 else d3pat_cast(d3p0, t2p0)
//
end // end of [d3pat_dn]

(* ****** ****** *)

implement
d3pat_dapp_up
( loc0
, d3f0, npf0, d3ps) =
let
//
val
targ =
d3patlst_get_type(d3ps)
//
val tres = t2ype_new(loc0)
//
val tfun =
t2ype_fun0(npf0, targ, tres)
//
val d3f0 = d3pat_dn(d3f0, tfun)
//
in
//
d3pat_make_node
(loc0, tres, D3Pdapp(d3f0, npf0, d3ps))
//
end // end of [d3pat_dapp_up]

(* ****** ****** *)

implement
d3exp_dn
(d3e0, t2p0) = let
//
val
test =
unify
(d3e0.loc(), d3e0.type(), t2p0)
//
in
//
if
test
then d3e0 else d3exp_cast(d3e0, t2p0)
//
end // end of [d3exp_dn]

(* ****** ****** *)

implement
d3explst_dn
(loc0, d3es, t2ps) = let
//
fun
auxt2ps
( t2ps
: t2ypelst
)
: d3explst =
(
case+ t2ps of
| list_nil() =>
  list_nil()
| list_cons(t2p0, t2ps) =>
  let
    val d3e0 =
    d3exp_none0_1(loc0, t2p0)
  in
    list_cons(d3e0, auxt2ps(t2ps))
  end
)
fun
auxd3es
( d3es
: d3explst
)
: d3explst =
(
case+ d3es of
| list_nil() =>
  list_nil()
| list_cons(d3e0, d3es) =>
  let
    val d3e0 =
    d3exp_none2_0(d3e0)
  in
    list_cons(d3e0, auxd3es(d3es))
  end
)
//
in (* in-of-let *)
//
case+ d3es of
| list_nil() => auxt2ps(t2ps)
| list_cons _ =>
  (
  case+ t2ps of
  | list_nil() => auxd3es(d3es)
  | list_cons _ =>
    let
      val+
      list_cons
      (d3e0, d3es) = d3es
      val+
      list_cons
      (t2p0, t2ps) = t2ps
      val
      d3e0 = d3exp_dn(d3e0, t2p0)
    in
      list_cons(d3e0, auxd3es(d3es))
    end
  )
//
end (* end of [d3explst_dn] *)

(* ****** ****** *)

implement
d3exp_sapp_up
( loc0
, d3f0, s2es ) = let
//
fun
auxmain
( t2p0
: t2ype): d3exp = let
//
val t2p0 = hnfize(t2p0)
//
in
case+
t2p0.node() of
| T2Puni
  (s2vs, t2p1) =>
  let
  val t2p1 =
  t2ype_substs
  (t2p1, s2vs, auxtsub(s2vs, s2es))
  in
    d3exp_make_node
    (loc0, t2p1, D3Esap1(d3f0, s2es))
  end
//
| T2Pexi(s2vs, t2p1) => auxmain(t2p1)
//
| _(*non-T2Puni*) =>
  (
    d3exp_make_node
    (loc0, t2p0, D3Esap0(d3f0, s2es))
  )
end // end of [auxmain]
//
and
auxtsub
( s2vs
: s2varlst
, s2es
: s2explst): t2ypelst =
(
case+ s2vs of
| list_nil
  ((*void*)) => list_nil()
| list_cons
  (s2v1, s2vs) =>
  let
    val t2p1 =
    (
    case+ s2es of
    | list_nil
      () => the_t2ype_none0(*void*)
    | list_cons
      (s2e1, _) => s2exp_erase(s2e1)
    ) : t2ype // end of [val]
    val s2es =
    (
    case+ s2es of
    | list_nil() => list_nil() | list_cons(_, s2es) => s2es
    ) : s2explst // end of [val]
  in
     list_cons(t2p1, auxtsub(s2vs, s2es))
  end
)
//
in
  auxmain(d3f0.type((*void*)))
end (* end of [d3exp_sapp_up] *)

(* ****** ****** *)
//
implement
d3exp_tapp_up
( loc0
, d2f0, s2es ) =
(
d3exp_make_node
(loc0, t2p0, D3Etap1(d2f0, s2es))
) where
{
  val t2p0 = t2ype_new(d2f0.loc())
}
//
(* ****** ****** *)

implement
d3exp_dapp_up
( loc0
, d3f0, npf0, d3es) =
let
//
val
targ =
d3explst_get_type(d3es)
//
val tres = t2ype_new(loc0)
//
val tfun =
t2ype_fun0(npf0, targ, tres)
//
val d3f0 = d3exp_dn(d3f0, tfun)
//
in
//
d3exp_make_node
(loc0, tres, D3Edapp(d3f0, npf0, d3es))
//
end // end of [d3exp_dapp_up]

(* ****** ****** *)
//
implement
d3exp_seqn_up
(loc0, d3es, d3e2) =
d3exp_make_node
(loc0, d3e2.type(), D3Eseqn(d3es, d3e2))
//
(* ****** ****** *)

implement
d3exp_tuple_up
( loc0
, knd1, npf2, d3es) = let
//
val tknd =
(
ifcase
| knd1 = 0 => TYRECflt0(*void*)
| _(*else*) => TYRECbox0(*void*)
) : tyrec // end of [val]
//
val ltps =
(
  auxlst(d3es, 0(*i0*))
) where
{
fun
auxlst
( d3es
: d3explst
, i0: int): labt2ypelst =
(
case+ d3es of
| list_nil() =>
  list_nil((*void*))
| list_cons(d3e0, d3es) =>
  let
    val l0 =
    label_make_int(i0)
    val lt2p0 =
    TLABELED(l0, d3e0.type())
  in
    list_cons(lt2p0, auxlst(d3es, i0+1))
  end // end of [list_cons]
)
} (* end of [val] *)
//
val s2t0 =
  the_sort2_none
val t2p0 =
t2ype_make_node
  (s2t0, T2Ptyrec(tknd, npf2, ltps))
//
in
  d3exp_make_node
  (loc0, t2p0, D3Etuple(knd1, npf2, d3es))
end (* end of [d3exp_tuple_up] *)

(* ****** ****** *)

implement
d3exp_dtsel_up
( loc0
, lab, dpis, arg3) =
let
  val t2p0 = t2ype_new(loc0)
in
  d3exp_make_node
  (loc0, t2p0, D3Edtsel(lab, dpis, arg3))
end // end of [d3exp_dtsel_up]

(* ****** ****** *)

implement
d3exp_if0_up
( loc0
, d3e1, d3e2, opt3) =
let
//
val d3e1 =
d3exp_dn
(d3e1, the_t2ype_bool)
val tres =
(
case+ opt3 of
| None _ => the_t2ype_void
| Some _ => t2ype_new(loc0)
) : t2ype // end of [val]
//
val d3e2 =
d3exp_dn(d3e2, tres)
val opt3 =
(
case+ opt3 of
| None() => None()
| Some(d3e3) =>
  Some(d3exp_dn(d3e3, tres))
) : d3expopt // end of [val]
//
in
  d3exp_make_node
  (loc0, tres, D3Eif0(d3e1, d3e2, opt3))
end // end of [d3exp_if0_up]

(* ****** ****** *)

implement
d3exp_let_up
(
  loc0, d3cs, d3e2
) = let
//
val
t2p0 = d3e2.type((*void*))
//
in
d3exp_make_node(loc0, t2p0, D3Elet(d3cs, d3e2))
end // end of [d3exp_let_up]

(* ****** ****** *)

implement
d3exp_where_up
(loc0, d3e1, d3cs) =
let
val t2p1 = d3e1.type()
in
d3exp_make_node(loc0, t2p1, D3Ewhere(d3e1, d3cs))
end // end of [d3exp_where_up]

(* ****** ****** *)

(* end of [trans23_util0.dats] *)
