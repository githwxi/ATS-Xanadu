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

local
#staload
"./statyp2_unify.dats"
in
implement
unify3_t2ype_t2ype
(loc0, t2p1, t2p2) =
let
implement
unify_eval<>(t2p0) = hnfize(t2p0)
in
unify_t2ype_t2ype<>(loc0, t2p1, t2p2)
end // end of [unify3_t2ype_t2ype]
end // end of [local]

local
#staload
"./statyp2_unify.dats"
in
implement
unify3_t2ypelst_t2ypelst
  (loc0, tps1, tps2) =
let
implement
unify_eval<>(t2p0) = hnfize(t2p0)
in
unify_t2ypelst_t2ypelst<>(loc0, tps1, tps2)
end // end of [unify3_t2ypelst_t2ypelst]
end // end of [local]

(* ****** ****** *)

local
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
in (* in-of-local *)
//
implement
t2ype_get_xtvs(t2p0) =
(
auxt2p0(t2p0, list_vt_nil(*void*))
)
implement
t2ypelst_get_xtvs(t2ps) =
(
auxt2ps(t2ps, list_vt_nil(*void*))
)
//
end (* end of [local] *)

(* ****** ****** *)
//
implement
unify2_d2con_t2ype
  (loc0, d2c1, t2p2) =
let
val t2p1 = d2c1.type()
in
unify2_t2ype_t2ype(loc0, t2p1, t2p2)
end
//
(* ****** ****** *)
//
(*
implement
unify2_d2var_t2ype
  (loc0, d2v1, t2p2) =
let
val t2p1 = d2v1.type()
in
unify2_t2ype_t2ype(loc0, t2p1, t2p2)
end
*)
//
(*
implement
unify2_d2cst_t2ype
  (loc0, d2c1, t2p2) =
let
//
val tqas = d2c1.tqas()
val t2p1 = d2c1.type()
val t2p1 =
  t2ype_tq2as_elim(loc0, t2p1, tqas)
//
in
  unify2_t2ype_t2ype(loc0, t2p1, t2p2)
end
*)
//
(* ****** ****** *)

implement
match2_t2ype_t2ype
  (t2p1, t2p2) = let
//
val
loc0 =
the_location_dummy
//
val
xtvs =
t2ype_get_xtvs(t2p2)
val
test =
unify2(loc0, t2p1, t2p2)
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
end // end of [match2_t2ype_t2ype]

(* ****** ****** *)
//
implement
match2_d2con_t2ype
  (d2c1, t2p2) =
let
  val t2p1 = d2c1.type()
in
  match2_t2ype_t2ype(t2p1, t2p2)
end
//
(* ****** ****** *)
//
implement
match2_d2var_t2ype
  (d2v1, t2p2) =
let
  val t2p1 = d2v1.type()
in
  match2_t2ype_t2ype(t2p1, t2p2)
end
//
(* ****** ****** *)
//
(*
implement
tplft_elim
  (t2p0) =
(
let
  var flag: int = 0
in
  auxfun0(flag, t2p0)
end
) where
{
fun
auxfun0
( flag: &int
, t2p0: t2ype): t2ype =
(
case+
t2p0.node() of
| 
T2Pfun
( fc2, npf
, t2ps, t2p1) =>
let
//
val
fini = flag
//
val
t2ps = auxt2ps(flag, t2ps)
val
t2p1 = auxfun0(flag, t2p1)
//
in
if
flag=fini
then t2p0
else
let
  val s2t0 = t2p0.sort()
in
t2ype_make_node
( s2t0
, T2Pfun
  (fc2, npf, t2ps, t2p1))
end
end // end of [T2Pfun]
//
| _ (* non-T2Pfun *) => t2p0
//
) (* end of [auxfun0] *)
//
and
auxt2pa
( flag: &int
, t2pa: t2ype): t2ype =
(
case+
t2pa.node() of
|
T2Plft(t2pb) =>
( flag := flag + 1; t2pb)
|
_ (* non-T2Pflt *) => t2pa
)
and
auxt2ps
( flag: &int
, t2ps0: t2ypelst): t2ypelst =
(
case+ t2ps0 of
| list_nil
  ((*void*)) => list_nil()
| list_cons
  (t2pa, t2ps1) =>
  let
  val fint = flag
  val t2pa = auxt2pa(flag, t2pa)
  val t2ps1 = auxt2ps(flag, t2ps1)
  in
    if
    flag = fint
    then t2ps0 else list_cons(t2pa, t2ps1)
  end
)
} (* where *) // end of [tplft_elim]
*)
//
(* ****** ****** *)

implement
match2_d2cst_t2ype
  (d2c1, t2p2) =
let
//
val
loc0 =
the_location_dummy
val t2p1 = d2c1.type()
val tqas = d2c1.tqas()
//
val
t2p1 =
t2ype_tq2as_elim(loc0, t2p1, tqas)
//
in
let
//
(*
//HX-2019-12-08:
//The [call-by-ref]
//marker is not used
//for resolving overloading:
val t2p1 = tplft_elim(t2p1)
val t2p2 = tplft_elim(t2p2)
*)
//
(*
val () =
println!
("match2_d2cst_t2ype: t2p1 = ", t2p1)
val () =
println!
("match2_d2cst_t2ype: t2p2 = ", t2p2)
*)
//
in
  match2_t2ype_t2ype(t2p1, t2p2)
end
end // end of [match2_d2cst_t2ype]
//
(* ****** ****** *)

implement
match2_d2itm_t2ype
  (d2i1, t2p2) =
let
(*
val () =
println!
("match2_d2itm_t2ype: d2i1 = ", d2i1)
val () =
println!
("match2_d2itm_t2ype: t2p2 = ", t2p2)
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
match2(d2v1, t2p2)
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
  match2(d2c1, t2p2)
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
  match2(d2c1, t2p2)
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
  match2_d2pitmlst_t2ype(dpis, t2p2)
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
end // end of [match2_d2itm_t2ype]

(* ****** ****** *)
//
implement
match2_d2conlst_t2ype
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
    match2(d2c1, t2p2)
    then Some_vt(d2c1) else auxlst(d2cs)
  )
)
} (* end of [match2_d2conlst_t2ype] *)
//
implement
match2_d2cstlst_t2ype
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
    match2(d2c1, t2p2)
    then Some_vt(d2c1) else auxlst(d2cs)
  )
)
} (* end of [match2_d2cstlst_t2ype] *)
//
(* ****** ****** *)
//
implement
match2_d2pconlst_t2ype
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
| D2ITMcon _ => match2(d2i0, t2p2)
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
} (* end of [match2_d2pconlst_t2ype] *)
//
(* ****** ****** *)
//
implement
match2_d2pitmlst_t2ype
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
  match2(d2i0, t2p2)
) where
{
(*
val () =
println!("auxmat: d2i0 = ", d2i0)
val () =
println!("auxmat: t2p0 = ", t2p2)
*)
}
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
} (* end of [match2_d2pitmlst_t2ype] *)
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
if
auxtest(svs1)
then
(
case+
t2p0.node() of
|
T2Puni
(svs2, t2p0) =>
let
val tsub =
auxtsub(svs2, svs1)
val t2p0 =
(
t2ype_revars
  (t2p0, svs2, tsub)
// t2ype_revars
) where
{
val
tsub = $UN.list_vt2t(tsub)
} (* where *) // end-of-val
val () = list_vt_free(tsub)
in
  let
    val () = tfun := t2p0 in f3a0
  end
end
|
_(*non-T2Puni*) =>
(
  let
  val () = tfun := t2p0
  in
    f3arg_make_node
    (f3a0.loc(), F3ARGnone3(f3a0))
  end
)
) (* end of [then] *)
else
(
  let
    val () = tfun := t2p0 in f3a0
  end
) (* end of [else] *)
//
end where
{
fun
auxtest
( s2vs
: s2varlst): bool =
(
case+ s2vs of
| list_nil() => false
| list_cons(s2v0, s2vs) =>
  let
  val s2t0 = s2v0.sort()
  in
    if
    sort2_is_impred(s2t0)
    then true else auxtest(s2vs)
  end
)
fun
auxtsub
( xs0: s2varlst
, ys0: s2varlst
) : List0_vt(s2var) =
(
case+ xs0 of
| list_nil _ =>
  list_vt_nil()
| list_cons(x0, xs1) =>
  (
  case+ ys0 of
  | list_nil() =>
    list_vt_cons(x0, auxtsub(xs1, list_nil()))
  | list_cons(y0, ys1) =>
    let
    val st = y0.sort()
    in
    if
    sort2_is_impred(st)
    then list_vt_cons(y0, auxtsub(xs1, ys1)) else auxtsub(xs0, ys1)
    end
  )
) (* end of [auxtsub] *)
} // end of [let] // end of [auxf3as_1s]
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
//
fun
d33exp_make_node
( loc0: loc_t
, t2p0: t2ype
, d3en: d3exp_node) =
let
val t2p0 = hnfize(t2p0)
val d3e0 =
d3exp_make_node(loc0, t2p0, d3en)
in
case+ t2p0.node() of
|
T2Plft(t2p1) =>
d3exp_make_node
(loc0, t2p1, D3Eflat(d3e0)) | _ => d3e0
end // end of [d33exp_make_node]
//
(* ****** ****** *)

implement
d33exp_dn
(d3e0, t2p0) = let
//
val
test =
unify3
(d3e0.loc(), d3e0.type(), t2p0)
//
in
//
if
test
then d3e0 else d3exp_tcast(d3e0, t2p0)
//
end // end of [d33exp_dn]

(* ****** ****** *)

implement
d33explst_dn
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
      d3e0 = d33exp_dn(d3e0, t2p0)
    in
      list_cons(d3e0, auxd3es(d3es))
    end
  )
//
end (* end of [d33explst_dn] *)

(* ****** ****** *)

local
//
fun
auxcbrf
( tfun
: t2ype
, d3es
: d3explst): d3explst =
let
val tfun = hnfize(tfun)
in
case+
tfun.node() of
|
T2Puni
(s2vs, tfun) => auxcbrf(tfun, d3es)
|
T2Pexi
(s2vs, tfun) => auxcbrf(tfun, d3es)
|
T2Pfun
( fc2, npf
, targ, tres) =>
let
var
flag:int = 0 in auxtarg(flag,targ,d3es)
end
| _ (*non-T2Pfun*) => d3es(*call-by-val*)
end // end of [auxlft]
and
auxtarg
( flag
: &int
, t2ps
: t2ypelst
, d3es
: d3explst): d3explst =
(
case+ t2ps of
|
list_nil() => d3es
|
list_cons
(t2p1, t2ps) =>
(
case+ d3es of
|
list_nil() => list_nil()
|
list_cons
(d3e1, d3es2) =>
let
val
fini = flag
val
t2p1 = hnfize(t2p1)
val
d3e1 =
(
case+
t2p1.node() of
| T2Plft _ =>
  let
  val () =
  (flag := flag+1)
  in d3exp_talf(d3e1) end
| _ (* non-T2Plft *) => d3e1
) : d3exp // end-of-val
val
d3es2 =
auxtarg(flag, t2ps, d3es2)
in
if
(flag = fini)
then d3es else list_cons(d3e1, d3es2)
end // end of [let]
) (* end-of-case(d3es)*)
) (* end-of-case(t2ps)*) // fun(auxarg)
//
in(*in-of-local*)

implement
d33exp_dapp_up
( loc0
, d3f0, npf0, d3es) =
let
//
val
d3es =
auxcbrf
(d3f0.type(), d3es)
//
val
targ =
d3explst_get_type(d3es)
//
val tres = t2ype_new(loc0)
//
// HX: FC2cloref is
val tfun = // the default
(
  t2ype_fun0
  (loc0, npf0, targ, tres)
)
//
val d3f0 = d33exp_dn(d3f0, tfun)
//
in
//
d33exp_make_node
(loc0, tres, D3Edapp(d3f0, npf0, d3es))
//
end // end of [d33exp_dapp_up]

end // end of [local]

(* ****** ****** *)

local

fun
tyrec_kind
(t2p1: t2ype): int =
(
case+
t2p1.node() of
|
T2Ptyrec
(tknd, _, _) =>
(
case+ tknd of
| TYRECbox0() => 1
| TYRECbox1() => 1
//
| TYRECflt0() => 0
(*
| TYRECflt1(_) => 0
*)
| TYRECflt2(_) => 0
)
| _ (*non-T2Ptyrec*) => 1(*boxed*)
) (* end of [tyrec_kind] *)

in(*in-of-local*)

implement
d33exp_proj_up
( loc0
, d3e1, lab2) =
let
//
val t2p1 =
d3e1.type()
val t2p1 =
hnfize(t2p1)
//
val knd1 =
tyrec_kind(t2p1)
val opt2 =
t2ype_projize(t2p1, lab2)
//
// (*
val () =
println!
("d33exp_proj_up: d3e1 = ", d3e1)
val () =
println!
("d33exp_proj_up: t2p1 = ", t2p1)
val () =
println!
("d33exp_proj_up: knd1 = ", knd1)
val () =
println!
("d33exp_proj_up: lab2 = ", lab2)
// *)
//
in
//
case+ opt2 of
|
~None_vt() =>
(
if
t2ype_isdat(t2p1)
then
(
let
  val t2p2 = t2ype_new(loc0)
in
  d33exp_make_node
  (loc0, t2p2, D3Epcon(d3e1, lab2))
end
)
else
let
  val t2p2 = t2ype_new(loc0)
in
  d33exp_make_node
  (loc0, t2p2, D3Elcast(d3e1, lab2))
end
)
|
~Some_vt(it2p2) =>
let
  val (i0, t2p2) = it2p2
in
//
if
(knd1 > 0)
then
(
// HX: boxed
  d33exp_make_node
  (loc0, t2p2, D3Eproj(d3e1, lab2, i0))
)
else
(
// HX: unboxed
case+
d3e1.node() of
//
| D3Eflat(d3el) =>
  let
    val tprj = t2ype_lft(t2p2)
  in
    d33exp_make_node
    (loc0, tprj, D3Eproj(d3el, lab2, i0))
  end
//
// HX: deref
| D3Eeval(1, d3el) =>
  let
    val tprj = t2ype_lft(t2p2)
  in
    d33exp_make_node
    (loc0, tprj, D3Eproj(d3el, lab2, i0))
  end
//
| _ (* non-D3Eflat *) => 
  (
    d33exp_make_node
    (loc0, t2p2, D3Eproj(d3e1, lab2, i0))
  )
) (* end of [else] *)
//
end
//
end (* d33exp_proj_up *) end // end of [local]

(* ****** ****** *)

implement
d33exp_assgn_up
( loc0
, d3e1, d3e2) =
let
//
val
t2p0 =
the_t2ype_void
val
t2p2 = 
d3e2.type((*void*))
val
d3e1 =
d33exp_dn(d3e1, t2p2)
//
in
let
  val
  d3e1 = d3exp_talf(d3e1)
in
  d33exp_make_node
  (loc0, t2p0, D3Eassgn(d3e1, d3e2))
end
end // end of [d33exp_assgn_up]

(* ****** ****** *)

(* end of [trans33_util0.dats] *)
