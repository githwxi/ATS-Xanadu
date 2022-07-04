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

#staload "./../SATS/xbasics.sats"

(* ****** ****** *)

#staload "./../SATS/xlabel0.sats"
#staload "./../SATS/xsymbol.sats"

(* ****** ****** *)

#staload "./../SATS/locinfo.sats"

(* ****** ****** *)

#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

#staload "./../SATS/trans12.sats"
#staload "./../SATS/trans23.sats"

(* ****** ****** *)

implement
fprint_val<s2var> = fprint_s2var
implement
fprint_val<s2exp> = fprint_s2exp
implement
fprint_val<t2ype> = fprint_t2ype

(* ****** ****** *)

local
#staload
"./statyp2_unify0.dats"
in//local
implement
unify2_t2ype_t2ype
(loc0, t2p1, t2p2) =
let
implement
unify_eval<>
  (t2p0) =
( myeval(t2p0) ) where
{
fun
myeval
(t2p0: t2ype): t2ype =
let
val t2p0 = whnfize(t2p0)
in
case
t2p0.node() of
|
T2Plft
(t2pa) => myeval(t2pa) | _ => t2p0
end // end of [myeval]
}
in
unify_t2ype_t2ype<>(loc0, t2p1, t2p2)
end // end of [unify2_t2ype_t2ype]
end // end of [local]

(* ****** ****** *)
//
(*
implement
unify2_d2con_t2ype
  (loc0, d2c1, t2p2) =
let
val t2p1 = d2c1.type()
in
unify2_t2ype_t2ype(loc0, t2p1, t2p2)
end
*)
//
implement
unify2_d2con_t2ype
  (loc0, d2c1, t2p2) =
let
//
val tqas = d2c1.tqas()
val t2p1 = d2c1.type()
//
in
let
  val
  t2p1 =
  t2ype_tq2as_elim
  ( loc0, t2p1, tqas )
in
unify2_t2ype_t2ype(loc0, t2p1, t2p2)
end
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
//
in
let
  val
  t2p1 =
  t2ype_tq2as_elim
  ( loc0, t2p1, tqas )
in
unify2_t2ype_t2ype(loc0, t2p1, t2p2)
end
end (* end of [unify2_d2var_t2ype] *)
*)
//
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
(*
|
T2Pbas _ => xtvs
|
T2Pcst _ => xtvs
|
T2Pvar _ => xtvs
*)
|
T2Pxtv(xtv) =>
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
|
T2Plft(t2p1) =>
(
  auxt2p0(t2p1, xtvs)
)
|
T2Papp
(t2p1, t2ps) =>
(
  auxt2ps(t2ps, xtvs)
) where
{
  val
  xtvs = auxt2p0(t2p1, xtvs)
}
//
(*
| T2Pfc2 _ => xtvs
*)
//
|
T2Pfun
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
|
T2Plam
(s2vs, t2p1) => auxt2p0(t2p1, xtvs)
//
|
T2Pexi
(s2vs, t2p1) => auxt2p0(t2p1, xtvs)
|
T2Puni
(s2vs, t2p1) => auxt2p0(t2p1, xtvs)
//
|
T2Ptyext
(name, t2ps) => auxt2ps(t2ps, xtvs)
//
|
T2Ptyrec
(_, _, ltps) => auxlt2ps(ltps, xtvs)
//
| _ (*  rest-of-t2ype  *) => ( xtvs )
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
    val+SLABELED(l0, t2p0) = lt2p0
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

implement
match2_t2ype_t2ype
  (t2p1, t2p2) = let
//
(*
HX-2020-06:
[t2p1] is assumed containing no xtvs
*)
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
| ~
list_vt_nil() => ()
| ~
list_vt_cons(x0, xs) =>
let
val () = reset(x0) in auxlst(xs)
end
)
//
in
let
  val () = auxlst(xtvs) in test
end
end // end of [match2_t2ype_t2ype]

(* ****** ****** *)
//
(*
implement
match2_d2con_t2ype
  (d2c1, t2p2) =
let
  val t2p1 = d2c1.type()
in
  match2_t2ype_t2ype(t2p1, t2p2)
end
*)
//
implement
match2_d2con_t2ype
  (d2c1, t2p2) =
let
//
val
loc0 =
the_location_dummy
val t2p1 = d2c1.type()
val tqas = d2c1.tqas()
//
in
let
  val
  t2p1 =
  t2ype_tq2as_elim
  ( loc0, t2p1, tqas )
in
match2_t2ype_t2ype(t2p1, t2p2)
end
end // end of [match2_d2con_t2ype]
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
end // end of [match2_d2var_t2ype]
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
  val
  t2p1 =
  t2ype_tq2as_elim
  ( loc0, t2p1, tqas )
//
//
in
  match2_t2ype_t2ype(t2p1, t2p2)
end
end // end of [match2_d2cst_t2ype]
//
(* ****** ****** *)

implement
match2_d2itm_t2ype
  (d2i1, t2p2) = let
//
(*
val () =
println!
("match2_d2itm_t2ype: d2i1 = ", d2i1)
val () =
println!
("match2_d2itm_t2ype: t2p2 = ", t2p2)
*)
//
in
  case+ d2i1 of
  | D2ITMvar _ => auxvar(d2i1)
  | D2ITMcon _ => auxcon(d2i1)
  | D2ITMcst _ => auxcst(d2i1)
  | D2ITMsym _ => auxsym(d2i1)
end where // match2_d2itm_t2ype
{
//
fun
auxvar
( d2i1
: d2itm): d2itmopt_vt =
let
  val-D2ITMvar(d2v1) = d2i1
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
  then
  Some_vt
  (D2ITMcon(d2cs)) else loop(d2cs2)
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
val-D2ITMcst(d2cs) = d2i1
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
  then
  Some_vt
  (D2ITMcst(d2cs)) else loop(d2cs2)
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
} (* end of [match2_d2itm_t2ype] *)

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
|
list_nil
((*void*)) => None_vt()
|
list_cons
(d2c1, d2cs) =>
(
  if
  match2(d2c1, t2p2)
  then Some_vt(d2c1) else auxlst(d2cs)
) (* list_cons *)
) (* end of [auxlst] *)
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
|
list_nil
((*void*)) => None_vt()
|
list_cons
(d2c1, d2cs) =>
(
  if
  match2(d2c1, t2p2)
  then Some_vt(d2c1) else auxlst(d2cs)
) (* list_cons *)
) (* end of [auxlst] *)
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
|
D2PITMnone
  (deid) => auxlst1(dpis)
|
D2PITMsome
(p0, d2i0) =>
let
  val opt0 = auxmat(d2i0)
in
case+ opt0 of
|
~None_vt() => auxlst1(dpis)
|
~Some_vt(d2i0) => auxlst2(dpis, p0, d2i0)
end // D2PITMsome
) (* list_cons *)
) (* end of [auxlst1] *)
//
and
auxlst2
( dpis
: d2pitmlst
, p0: int
, d2i0: d2itm): d2itmopt_vt =
(
case+ dpis of
|
list_nil
((*void*)) => Some_vt(d2i0)
|
list_cons
(d2pi, dpis) =>
(
case+ d2pi of
|
D2PITMnone
  (deid) =>
(
  auxlst2(dpis, p0, d2i0)
)
|
D2PITMsome(p1, d2i1) =>
if
(p1 <= p0)
then
(
  auxlst2(dpis, p0, d2i0)
)
else let
  val opt1 = auxmat(d2i1)
in
  case+ opt1 of
  |
  ~None_vt() => auxlst2(dpis, p0, d2i0)
  |
  ~Some_vt(d2i1) => auxlst2(dpis, p1, d2i1)
end // D2PITMsome
) (* list_cons *)
) (* end of [auxlst2] *)
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
|
list_nil
((*void*)) => None_vt()
|
list_cons
(d2pi, dpis) =>
(
case+ d2pi of
|
D2PITMnone
  (deid) => auxlst1(dpis)
|
D2PITMsome
(p0, d2i0) =>
let
  val opt0 = auxmat(d2i0)
in
  case+ opt0 of
  |
  ~None_vt() => auxlst1(dpis)
  |
  ~Some_vt(d2i0) => auxlst2(dpis, p0, d2i0)
end // D2PITMsome
) (* list_cons *)
) (* end of [auxlst1] *)
//
and
auxlst2
( dpis
: d2pitmlst
, p0: int
, d2i0: d2itm): d2itmopt_vt =
(
case+ dpis of
|
list_nil
((*void*)) => Some_vt(d2i0)
|
list_cons
(d2pi, dpis) =>
(
case+ d2pi of
|
D2PITMnone
  (deid) =>
  auxlst2(dpis, p0, d2i0)
|
D2PITMsome(p1, d2i1) =>
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
) (* list_cons *)
) (* end of [auxlst2] *)
} (* end of [match2_d2pitmlst_t2ype] *)
//
(* ****** ****** *)

implement
t2ype_tq2as_elim
(loc0, t2p0, tqas) =
(
case+ tqas of
|
list_nil() => t2p0
|
list_cons _ =>
let
val s2vs =
list_vt_nil((*void*))
val tsub =
list_vt_nil((*void*))
in
  auxinst1(tqas, s2vs, tsub)
end
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
//
|
list_nil() =>
( t2p0 ) where
{
val
s2vs = list_vt_reverse(s2vs)
val
tsub = list_vt_reverse(tsub)
val
t2p0 =
(
t2ype_subst_svarlst(t2p0, s2vs, tsub)
) where
{
  val s2vs = $UN.list_vt2t(s2vs)
  val tsub = $UN.list_vt2t(tsub)
}
val ((*void*)) = list_vt_free(s2vs)
val ((*void*)) = list_vt_free(tsub)
} (* list_nil *)
//
|
list_cons(tqa0, tqas) =>
(
  auxinst2(tqa0.s2vs(), tqas, s2vs, tsub)
) (* list_cons *)
//
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
|
list_nil() =>
(
  auxinst1(tqas, svs2, tsub)
)
|
list_cons(s2v1, svs1) =>
let
  val
  t2px =
  t2ype_new_loc_var(loc0, s2v1)
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
//
implement
t2ype_tq2as_elim2
(loc0, t2p0, tqas) =
(
case+ tqas of
|
list_nil() =>
(TI3ARGnone(), t2p0)
|
list_cons _ =>
let
val
s2vs =
list_vt_nil((*void*)) 
val
tsub =
list_vt_nil((*void*)) 
val
(t2ps, t2p0) =
auxinst1(tqas, s2vs, tsub)
in
  (TI3ARGsome(t2ps), t2p0)
end
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
, tsub: t2ypelst_vt
) : (t2ypelst, t2ype) =
(
case+ tqas of
|
list_nil() =>
(tsub, t2p0) where
{
  val
  s2vs = list_vt_reverse(s2vs)
  val
  tsub =
  list_vt2t(list_vt_reverse(tsub))
  val
  t2p0 =
  (
  t2ype_subst_svarlst(t2p0, s2vs, tsub)
  ) where
  {
    val s2vs = $UN.list_vt2t(s2vs)
  }
  val ((*void*)) = list_vt_free(s2vs)
} (* list_nil *)
|
list_cons(tqa0, tqas) =>
(
  auxinst2(tqa0.s2vs(), tqas, s2vs, tsub)
) (* list_cons *)
) (* end of [auxinst1] *)
and
auxinst2
( svs1
: s2varlst
, tqas
: tq2arglst
, svs2: s2varlst_vt
, tsub: t2ypelst_vt
) : (t2ypelst, t2ype) =
(
case+ svs1 of
|
list_nil() =>
(
  auxinst1(tqas, svs2, tsub)
)
|
list_cons(s2v1, svs1) =>
let
  val
  t2px =
  t2ype_new_loc_var(loc0, s2v1)
  val
  svs2 = list_vt_cons(s2v1, svs2)
  val
  tsub = list_vt_cons(t2px, tsub)
in
  auxinst2(svs1, tqas, svs2, tsub)
end
) (* end of [auxinst2] *)
} (* end of [t2ype_tq2as_elim2] *)
//
(* ****** ****** *)

implement
d3pat_dntp
(d3p1, t2p2) = let
//
val loc0 = d3p1.loc()
val t2p1 = d3p1.type()
//
(*
val () =
println!
("d3pat_dntp: d3p1 = ", d3p1)
val () =
println!
("d3pat_dntp: t2p1 = ", t2p1)
val () =
println!
("d3pat_dntp: t2p2 = ", t2p2)
*)
//
val
test = unify2(loc0, t2p1, t2p2)
//
(*
val () =
println!("d3pat_dntp: test = ", test)
*)
//
in
//
if
test
then
d3p1 else d3pat_tcast(d3p1, t2p2)
//
end (*let*) // end of [d3pat_dntp]

(* ****** ****** *)
implement
d3pat_dap0_up
( loc0, d3f0 ) =
let
val npf2 = ~1
val d3ps = list_nil()
in
d3pat_dapp_up(loc0, d3f0, npf2, d3ps)
end (*let*) // end of [d3pat_dap0_up]
(* ****** ****** *)
implement
d3pat_dap1_up
( loc0, d3f0 ) =
let
val tres = t2ype_new(loc0)
in
d3pat_make_node(loc0, tres, D3Pdap1(d3f0))
end (*let*) // end of [d3pat_dap1_up]
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
// HX: d2con.type()
val tfun = // is FC2fun!
(
  t2ype_fun0
  (loc0, npf0, targ, tres)
)
//
val d3f0 = d3pat_dntp(d3f0, tfun)
//
in(*in-of-let*)
//
d3pat_make_node
(loc0, tres, D3Pdapp(d3f0, npf0, d3ps))
//
end (*let*) // end of [d3pat_dapp_up]

(* ****** ****** *)

implement
d3pat_trcd1_up
( loc0
, knd1, npf2, d3ps) = let
//
val
tknd =
(
ifcase
| knd1 = 0 => TYRECflt0(*void*) // @(...)
| knd1 = 1 => TYRECbox1(*void*) // $(...)
| knd1 = 2 => TYRECbox1(*void*) // $tup(...)
| knd1 = 3 => TYRECbox0(*void*) // $tup_t(...)
| knd1 = 4 => TYRECbox1(*void*) // $tup_vt(...)
| _(*else*) => TYRECbox1(*void*) // HX: deadcode
) : tyrec // end of [val]
//
val
ltps =
(
  auxlst(d3ps, 0(*i0*))
) where
{
fun
auxlst
( d3ps
: d3patlst
, i0: int): labt2ypelst =
(
case+ d3ps of
| list_nil() =>
  list_nil((*void*))
| list_cons(d3p0, d3ps) =>
  let
    val l0 =
    label_make_int(i0)
    val lt2p0 =
    SLABELED(l0, d3p0.type())
  in
    list_cons(lt2p0, auxlst(d3ps, i0+1))
  end // end of [list_cons]
)
} (* end of [val] *)
//
val s2t0 =
(
case+ tknd of
| 
TYRECbox0() => the_sort2_tbox
| 
TYRECbox1() => the_sort2_vtbx
|
_(* else *) => the_sort2_none
) : sort2 // end of [val(s2t0)]
//
val t2p0 =
  t2ype_tyrec(s2t0, tknd, npf2, ltps)
//
in
  d3pat_make_node
  (loc0, t2p0, D3Ptrcd1(knd1, npf2, d3ps))
end (*let*) // end of [d3pat_trcd1_up]

(* ****** ****** *)

implement
d23pat_sapp_up
( loc0
, d3f0, s2es ) = let
//
(*
val () =
println!
("d23exp_sapp_up: d3f0 = ", d3f0)
val () =
println!
("d23exp_sapp_up: s2es = ", s2es)
*)
//
fun
auxmain
( t2p0
: t2ype): d3pat = let
//
val t2p0 = whnfize(t2p0)
//
in
//
case+
t2p0.node() of
| T2Puni(s2vs, t2p1) =>
  let
//
  val
  tsub = auxtsub(s2vs, s2es)
//
  val
  t2p1 =
  (
  t2ype_subst_svarlst
  ( t2p1, s2vs, tsub(*t2ypelst*) )
  ) where
  {
    val tsub = $UN.list_vt2t(tsub)
  }
  val ((*void*)) = list_vt_free(tsub)
//
  in
    d3pat_make_node
    (loc0, t2p1, D3Psap1(d3f0, s2es))
  end
| _(*non-T2Puni*) =>
  (
    d3pat_make_node
    (loc0, t2p0, D3Psap0(d3f0, s2es))
  )
//
end where
{
//
fun
auxtest
( s2es
: s2explst): bool =
(
case+ s2es of
|
list_nil() => false
|
list_cons(s2e0, s2es) =>
let
  val s2t0 = s2e0.sort()
in
  if
  sort2_is_impred(s2t0)
  then true else auxtest(s2es)
end
) (* end of [auxtest] *)
//
fun
auxtsub
( s2vs
: s2varlst
, s2es
: s2explst)
: List0_vt(t2ype) =
(
case+ s2vs of
|
list_nil
((*void*)) =>
(
  list_vt_nil()
)
|
list_cons
(s2v0, s2vs) =>
(
case+ s2es of
|
list_nil() =>
(*
let
val
t2p0 = the_t2ype_none0
in
  list_vt_cons
  (t2p0, auxtsub(s2vs, s2es))
end
*)
let
val
t2p0 =
t2ype_new_loc_var(loc0, s2v0)
in
  list_vt_cons
  (t2p0, auxtsub(s2vs, s2es))
end
|
list_cons
(s2e0, s2es1) =>
(
case+
s2e0.node() of
|
S2Eany(k0) =>
let
val
t2p0 =
t2ype_new_loc_var(loc0, s2v0)
in
  if
  (k0 >= 2)
  then
  list_vt_cons
  (t2p0, auxtsub(s2vs, s2es))
  else
  list_vt_cons
  (t2p0, auxtsub(s2vs, s2es1))
end
|
_(*non-S2Eany*) =>
let
  val t2p0 = s2exp_erase(s2e0)
in
  list_vt_cons
  ( t2p0, auxtsub(s2vs, s2es) )
end
)
)
) (* end of [auxtsub] *)
//
} // where // end of [auxmain]
//
in
let
val
t2p0 = d3f0.type() in auxmain(t2p0)
end
end (*let*) // end of [d23pat_sapp_up]

(* ****** ****** *)
//
fun
d23exp_make_node
( loc0: loc_t
, t2p0: t2ype
, d3en: d3exp_node) =
d3exp_make_node(loc0, t2p0, d3en)
//
(* ****** ****** *)

(*
implement
d23exp_anno
(d3e0, t2p0) =
let
val
loc0 = d3e0.loc()
val
d3e0 =
d23exp_dntp(d3e0, t2p0)
in
d23exp_make_node
(loc0, t2p0, D3Edntp(d3e0, t2p0))
end // end of [d23exp_anno]
*)

(* ****** ****** *)

implement
d23exp_dntp
(d3e0, t2p1) = let
//
val t2p0 = d3e0.type()
//
(*
val () =
println!
("d23exp_dntp: d3e0 = ", d3e0)
val () =
println!
("d23exp_dntp: t2p0 = ", t2p0)
val () =
println!
("d23exp_dntp: t2p1 = ", t2p1)
*)
//
val
test =
unify2(d3e0.loc(), t2p0, t2p1)
//
in
//
if
test
then d3e0 else d3exp_tcast(d3e0, t2p1)
//
end (*let*) // end of [d23exp_dntp]

(* ****** ****** *)

implement
d23explst_dntp
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
|
list_nil() =>
list_nil()
|
list_cons(t2p1, t2ps) =>
let
  val d3e0 =
  d3exp_none0_1(loc0, t2p1)
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
|
list_nil() =>
list_nil()
|
list_cons(d3e0, d3es) =>
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
|
list_nil() => auxt2ps(t2ps)
|
list_cons _ =>
(
case+ t2ps of
|
list_nil() => auxd3es(d3es)
|
list_cons _ =>
let
  val+
  list_cons
  (d3e0, d3es) = d3es
  val+
  list_cons
  (t2p1, t2ps) = t2ps
in
let
  val
  d3e0 =
  d23exp_dntp(d3e0, t2p1)
in
  list_cons(d3e0, auxd3es(d3es))
end
end
)
//
end (* end of [d23explst_dntp] *)

(* ****** ****** *)

implement
d23exp_sapp_up
( loc0
, d3f0, s2es ) = let
//
(*
val () =
println!
("d23exp_sapp_up: d3f0 = ", d3f0)
val () =
println!
("d23exp_sapp_up: s2es = ", s2es)
*)
//
fun
auxmain
( t2p0
: t2ype): d3exp = let
//
val t2p0 = whnfize(t2p0)
//
in(*in-of-let*)
//
case+
t2p0.node() of
| T2Puni(s2vs, t2p1) =>
  let
//
  val
  tsub = auxtsub(s2vs, s2es)
//
  val
  t2p1 =
  (
  t2ype_subst_svarlst
  ( t2p1, s2vs, tsub(*t2ypelst*) )
  ) where
  {
    val tsub = $UN.list_vt2t(tsub)
  }
  val ((*void*)) = list_vt_free(tsub)
//
  in
    d23exp_make_node
    (loc0, t2p1, D3Esap1(d3f0, s2es))
  end
//
| T2Pexi(s2vs, t2p1) => auxmain(t2p1)
//
| _(*non-T2Puni*) =>
  (
    d23exp_make_node
    (loc0, t2p0, D3Esap0(d3f0, s2es))
  ) (* d23exp_make_node *)
//
end where
{
//
(*
fun
auxs2es
( s2vs
: s2varlst
, s2es
: s2explst): s2explst =
(
case s2vs of
|
list_nil() =>
(
case+ s2es of
|
list_nil() =>
list_nil()
|
list_cons(s2e1, s2es) =>
let
val s2e1 =
s2exp_none2(loc0, s2e1)
in
list_cons
(s2e1, auxs2es(s2vs, s2es))
end
)
|
list_cons(s2v0, s2vs) =>
(
case+ s2es of
|
list_nil() =>
list_sing(s2e1) where
{
val k0 = 2 (*many*)
val s2e1 = s2exp_any(k0)
}
|
list_cons(s2e1, s2es) =>
let
val
s2t0 = s2v0.sort()
val
s2e1 =
s2exp_sqcast(loc0, s2e1, s2t0)
in
list_cons(s2e1, auxs2es(s2vs, s2es))
end // end of [list_cons]
)
) (* end of [auxs2es] *)
*)
//
fun
auxtest
( s2es
: s2explst): bool =
(
case+ s2es of
|
list_nil() => false
|
list_cons(s2e0, s2es) =>
let
  val s2t0 = s2e0.sort()
in
  if
  sort2_is_impred(s2t0)
  then true else auxtest(s2es)
end
) (* end of [auxtest] *)
//
fun
auxtsub
( s2vs
: s2varlst
, s2es
: s2explst)
: List0_vt(t2ype) =
(
case+ s2vs of
|
list_nil
((*void*)) =>
(
  list_vt_nil()
)
|
list_cons
(s2v0, s2vs) =>
(
case+ s2es of
|
list_nil
((*void*)) =>
(*
let
val
t2p0 = the_t2ype_none0
in
  list_vt_cons
  (t2p0, auxtsub(s2vs, s2es))
end
*)
let
val
t2p0 =
t2ype_new_loc_var(loc0, s2v0)
in
  list_vt_cons
  (t2p0, auxtsub(s2vs, s2es))
end
|
list_cons
(s2e0, s2es1) =>
(
  case+
  s2e0.node() of
  |
  S2Eany(k0) =>
  let
  val
  t2p0 =
  t2ype_new_loc_var(loc0, s2v0)
  in
    if
    (k0 >= 2)
    then
    list_vt_cons
    (t2p0, auxtsub(s2vs, s2es))
    else
    list_vt_cons
    (t2p0, auxtsub(s2vs, s2es1))
  end
  |
  _(*non-S2Eany*) =>
  let
    val t2p0 = s2exp_erase(s2e0)
  in
    list_vt_cons(t2p0, auxtsub(s2vs, s2es))
  end
)
)
) (* end of [auxtsub] *)
//
} // where // end of [auxmain]
//
in
  auxmain(d3f0.type((*void*)))
end (* end of [d23exp_sapp_up] *)

(* ****** ****** *)

implement
d23exp_tapp_up
( loc0
, d2f0, s2es ) =
let
val
opt = auxtfhd(d2f0)
in
//
case+ opt of
//
| ~
TFHDnone() =>
(
d23exp_make_node
( loc0
, t2p0, D3Etapp(d2f0, s2es))
) where
{
  val
  t2p0 = t2ype_new(d2f0.loc())
}
//
| ~
TFHDdcon
( d2c0 ) => auxtcon(loc0, d2f0, d2c0)
| ~
TFHDdcst
( d2c0 ) => auxtcst(loc0, d2f0, d2c0)
//
end where
{
//
datavtype
tfhdopt =
| TFHDnone of ()
| TFHDdcon of d2con
| TFHDdcst of d2cst
//
fun
auxtfhd
( d2f0
: d2exp
)
: tfhdopt =
(
case+
d2f0.node() of
//
| D2Econ1
  (d2c0) => TFHDdcon(d2c0)
| D2Ecst1
  (d2c0) => TFHDdcst(d2c0)
//
| D2Etapp
  (d2f0, _) => auxtfhd(d2f0)
//
| _ (*else*) => TFHDnone(*void*)
//
)
//
fun
auxtcon
( loc0: loc_t
, d2f0: d2exp
, d2c0: d2con): d3exp =
let
//
val
ti2a =
ti2arg_make(loc0, s2es)
val
ti2s =
auxtarg
(d2f0, list_sing(ti2a))
//
val tqas = d2c0.tqas()
val sess = list_vt_sing(s2es)
val sess = auxd2f0(d2f0, sess)
//
val tsub = list_vt_nil()
val tsub =
auxtqas(loc0, tqas, sess, tsub)
val tsub =
list_vt2t(list_vt_reverse(tsub))
//
val s2vs = d2con_get_s2vs(d2c0)
val t2p0 =
let
  val t2p0 = d2c0.type()
in
t2ype_subst_svarlst(t2p0, s2vs, tsub)
end
//
in
d23exp_make_node
( loc0
, t2p0
, D3Etcon(d2c0, TI3ARGsome(tsub), ti2s))
end
//
and
auxtcst
( loc0: loc_t
, d2f0: d2exp
, d2c0: d2cst): d3exp =
let
//
val
ti2a =
ti2arg_make(loc0, s2es)
val
ti2s =
auxtarg
(d2f0, list_sing(ti2a))
//
val tqas = d2c0.tqas()
val sess = list_vt_sing(s2es)
val sess = auxd2f0(d2f0, sess)
//
val tsub = list_vt_nil()
val tsub =
auxtqas(loc0, tqas, sess, tsub)
val tsub =
list_vt2t(list_vt_reverse(tsub))
//
val s2vs = d2cst_get_s2vs(d2c0)
val t2p0 =
let
  val t2p0 = d2c0.type()
in
t2ype_subst_svarlst(t2p0, s2vs, tsub)
end
//
in
d23exp_make_node
( loc0
, t2p0
, D3Etcst(d2c0, TI3ARGsome(tsub), ti2s))
end
//
and
auxtarg
( d2f0
: d2exp
, ti2s
: ti2arglst
)
: ti2arglst =
(
case+
d2f0.node() of
| D2Etapp
  (d2f0, s2es) =>
  (
    auxtarg(d2f0, t2is)
  ) where
  {
  val ti2a =
  ti2arg_make(d2f0.loc(), s2es)
  val t2is = list_cons(ti2a, ti2s)
  }
| _ (* non-D2Etapp *) => ti2s
)
//
and
auxd2f0
( d2f0
: d2exp
, sess
: List0_vt(s2explst)
)
: List0_vt(s2explst) =
(
case+
d2f0.node() of
|
D2Etapp
(d2f0, s2es) =>
(
  auxd2f0(d2f0, sess)
) where
{
  val sess =
  list_vt_cons(s2es, sess)
}
| _(*non-D2Etapp*) => sess
)
//
and
auxtq2a
( loc0
: loc_t
, tq2a
: tq2arg
, s2es
: s2explst
, tsub
: t2ypelst_vt
)
: t2ypelst_vt =
(
auxs2vs(loc0, tq2a.s2vs(), s2es, tsub)
)
and
auxs2vs
( loc0
: loc_t
, s2vs
: s2varlst
, s2es
: s2explst
, tsub
: t2ypelst_vt
)
: t2ypelst_vt =
(
case+ s2vs of
|
list_nil() => tsub
|
list_cons
(s2v0, s2vs) =>
(
case+ s2es of
|
list_nil() =>
let
val
t2p0 =
t2ype_new_loc_var(loc0, s2v0)
val
tsub = list_vt_cons(t2p0, tsub)
in
  auxs2vs(loc0, s2vs, s2es, tsub)
end
|
list_cons(s2e0, s2es1) =>
( case+
  s2e0.node() of
  | S2Eany(k0) =>
    let
      val
      t2p0 =
      t2ype_new_loc_var(loc0, s2v0)
      val
      tsub = list_vt_cons(t2p0, tsub)
    in
      if
      (k0 >= 2)
      then
      auxs2vs(loc0, s2vs, s2es, tsub)
      else
      auxs2vs(loc0, s2vs, s2es1, tsub)
    end
  | _(*non-S2Eany*) =>
    let
      val t2p0 =
      s2exp_erase(s2e0)
      val tsub =
      list_vt_cons(t2p0, tsub)
    in
      auxs2vs(loc0, s2vs, s2es1, tsub)
    end
) (* list_cons *)
//
) (* list_cons *)
) (* end of [auxs2vs] *)
//
and
auxtqas
( loc0
: loc_t
, tqas
: tq2arglst
, sess
: List0_vt
  (s2explst)
, tsub
: t2ypelst_vt
)
: t2ypelst_vt =
(
case+ tqas of
|
list_nil
((*void*)) =>
let
val () =
list_vt_free(sess) in tsub
end
|
list_cons
(tq2a, tqas) =>
(
case+ sess of
| ~
list_vt_nil() =>
let
  val s2es = list_nil()
  val sess = list_vt_nil()
  val tsub =
  auxtq2a(loc0, tq2a, s2es, tsub)
in
  auxtqas(loc0, tqas, sess, tsub)
end
| ~
list_vt_cons(s2es, sess) =>
let
  val tsub =
  auxtq2a(loc0, tq2a, s2es, tsub)
in
  auxtqas(loc0, tqas, sess, tsub)
end
)
) (* end of [auxtqas] *)
//
} (* end of [d23exp_tapp_up] *)
//
(* ****** ****** *)

implement
d23exp_dapp_up
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
// HX: FC2cloref is
val tfun = // the default
(
  t2ype_fun0
  (loc0, npf0, targ, tres)
)
//
val d3f0 = d23exp_dntp(d3f0, tfun)
//
in
//
d23exp_make_node
(loc0, tres, D3Edapp(d3f0, npf0, d3es))
//
end // end of [d23exp_dapp_up]

(* ****** ****** *)

implement
d23exp_proj_up
(loc0, d3e1, lab2) =
let
val t2p1 = d3e1.type()
val opt2 =
t2ype_projize(t2p1, lab2)
in
//
case+ opt2 of
|
~None_vt() =>
let
  val t2p2 = t2ype_new(loc0)
in
  d23exp_make_node
  (loc0, t2p2, D3Elcast(d3e1, lab2))
end
|
~Some_vt(it2p2) =>
let
  val (i0, t2p2) = it2p2
in
  d23exp_make_node
  (loc0, t2p2, D3Eproj(d3e1, lab2, i0))
end
//
end // end of [d23exp_proj_up]

(* ****** ****** *)
//
implement
d23exp_seqn_up
(loc0, d3es, d3e2) =
d23exp_make_node
(loc0, d3e2.type(), D3Eseqn(d3es, d3e2))
//
(* ****** ****** *)

implement
d23exp_trcd1_up
( loc0
, knd1, npf2, d3es) = let
//
val
tknd =
(
ifcase
| knd1 = 0 => TYRECflt0(*void*) // @(...)
| knd1 = 1 => TYRECbox1(*void*) // $(...)
| knd1 = 2 => TYRECbox1(*void*) // $tup(...)
| knd1 = 3 => TYRECbox0(*void*) // $tup_t(...)
| knd1 = 4 => TYRECbox1(*void*) // $tup_vt(...)
| _(*else*) => TYRECbox1(*void*) // HX: deadcode
) : tyrec // end of [val]
//
val
ltps =
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
|
list_nil() =>
list_nil((*void*))
|
list_cons(d3e0, d3es) =>
let
val l0 =
label_make_int(i0)
val lt2p0 =
SLABELED(l0, d3e0.type())
in
list_cons(lt2p0, auxlst(d3es, i0+1))
end // end of [list_cons]
)
} (* end of [val] *)
//
val s2t0 =
(
case+ tknd of
| 
TYRECbox0() => the_sort2_tbox
| 
TYRECbox1() => the_sort2_vtbx
|
_(* else *) => the_sort2_none
) : sort2 // end of [val(s2t0)]
//
val t2p0 =
  t2ype_tyrec(s2t0, tknd, npf2, ltps)
//
in
  d23exp_make_node
  (loc0, t2p0, D3Etrcd1(knd1, npf2, d3es))
end (* end of [d23exp_trcd1_up] *)

(* ****** ****** *)

implement
d23exp_assgn_up
( loc0
, d3e1, d3e2) =
let
val t2p0 =
  the_t2ype_void
val t2p1 =
  d3e1.type((*void*))
val d3e2 =
  d23exp_dntp(d3e2, t2p1)
in
  d23exp_make_node
  (loc0, t2p0, D3Eassgn(d3e1, d3e2))
end // end of [d23exp_assgn_up]

(* ****** ****** *)
//
implement
d23exp_brack_up
(loc0, dpis, d3es) =
let
  val t2p0 = t2ype_new(loc0)
in
d23exp_make_node
(loc0, t2p0, D3Ebrack(dpis, d3es))
end // end of [d23exp_brack_up]
//
implement
d23exp_dtsel_up
( loc0
, lab0, dpis, npf2, arg3) =
let
  val t2p0 = t2ype_new(loc0)
in
d23exp_make_node
(loc0, t2p0, D3Edtsel(lab0, dpis, npf2, arg3))
end // end of [d23exp_dtsel_up]
//
(* ****** ****** *)
//
implement
d23exp_if0_up
( loc0
, d3e1, d3e2, opt3) =
let
//
val tres =
(
case+ opt3 of
|
None _ =>
the_t2ype_void
|
Some _ =>
t2ype_new(loc0)): t2ype
//
val d3e2 =
d23exp_dntp(d3e2, tres)
//
val opt3 =
(
case+ opt3 of
|
None() => None()
|
Some(d3e3) =>
Some(d23exp_dntp(d3e3, tres))
) : d3expopt // end of [val]
//
in(*in-of-let*)
d23exp_make_node
( loc0
, tres, D3Eif0(d3e1, d3e2, opt3))
end // end of [d23exp_if0_up]

implement
d23exp_if1_up
( loc0
, d3e1
, d3e2, opt3, tinv) =
let
//
val tbtf =
the_t2ype_bool
val d3e1 =
d23exp_dntp(d3e1, tbtf)
//
val tres =
(
case+ opt3 of
|
None _ =>
the_t2ype_void
|
Some _ =>
t2ype_new(loc0)): t2ype
//
val d3e2 =
d23exp_dntp(d3e2, tres)
//
val opt3 =
(
case+ opt3 of
|
None() => None()
|
Some(d3e3) =>
Some(d23exp_dntp(d3e3, tres))
) : d3expopt // end of [val]
//
in(*in-of-let*)
d23exp_make_node
( loc0
, tres
, D3Eif1(d3e1, d3e2, opt3, tinv))
end // end of [d23exp_if1_up]
//
(* ****** ****** *)

implement
d23exp_let_up
(
  loc0, d3cs, d3e2
) = let
//
val
t2p0 = d3e2.type((*void*))
//
in
//
d23exp_make_node
  (loc0, t2p0, D3Elet(d3cs, d3e2))
//
end // end of [d23exp_let_up]

(* ****** ****** *)

implement
d23exp_where_up
(loc0, d3e1, d3cs) =
let
val t2p1 = d3e1.type()
in
//
d23exp_make_node
  (loc0, t2p1, D3Ewhere(d3e1, d3cs))
//
end // end of [d23exp_where_up]

(* ****** ****** *)

implement
d23exp_lam_up
( loc0
, knd0
, f3as
, res0, arrw, body) =
let
//
val
tfun = let
val
tfc2 =
(
  auxtfc2(arrw)
) where
{
fun
auxtfc2
( arrw
: f1unarrow
) : t2ype =
(
case arrw of
|
F1UNARROWdflt
  () =>
(
t2ype_new(loc0)
)
|
F1UNARROWlist
  (s1es) =>
(
  t2ype_fc2(fc2)
) where
{
  val lin =
  s1explst_get_lin(s1es)
  val fc2 =
  s1explst_get_fc2(s1es)
//
  val fc2 =
  (
  if
  lin = 0
  then fc2 else funclo2_linize(fc2)
  ) : funclo2 // end-of-val
}
) (* end of [auxtfc2] *)
}
fun
auxf3as
( f3as
: f3arglst
, tres
: t2ype
, flag: int): t2ype =
(
case+ f3as of
|
list_nil() => tres
|
list_cons(x0, xs) =>
(
case-
x0.node() of
| F3ARGsome_dyn
  (npf, d3ps) =>
  let
  val tfc2 =
  ( if
    flag = 0
    then tfc2
    else
    t2ype_fc2(FC2cloref)
  ) : t2ype // end-of-val
  val t2ps =
  d3patlst_get_type(d3ps)
  val tres =
  auxf3as(xs, tres, flag+1)
  in
    t2ype_fun1(tfc2, npf, t2ps, tres)
  end
| F3ARGsome_sta
  (s2vs, s2ps) =>
  let
  val
  s2vs =
  s2varlst_epred(s2vs)
  val
  tres =
  auxf3as
  (xs, tres, flag) in t2ype_uni(s2vs, tres)
  end
| F3ARGsome_met(s2es) => auxf3as(xs, tres, flag)
)
) (* end of [auxf3as] *)
in
  auxf3as(f3as, body.type(), 0)
end // end-of-val
//
(*
val () =
println!("d23exp_lam_up: f3as = ", f3as)
val () =
println!("d23exp_lam_up: tfun = ", body)
val () =
println!("d23exp_lam_up: f3as = ", f3as)
*)
//
in
d23exp_make_node
(loc0, tfun, D3Elam(knd0, f3as, res0, arrw, body))
end // end of [d23exp_lam_up]

(* ****** ****** *)

implement
d23exp_fix_up
( loc0
, knd0
, d2v0
, f3as
, res0, arrw, body) =
let
val tfun = d2v0.type()
in
d23exp_make_node
(loc0, tfun, D3Efix(knd0, d2v0, f3as, res0, arrw, body))
end // end of [d23exp_fix_up]

(* ****** ****** *)

implement
join_tq2as_tias
(  tqas, tias  ) = let
//
fun
auxlst
(tqas: tq2arglst): ti2arglst =
list_vt2t
(
list_map<tq2arg><ti2arg>(tqas)
) where
{
implement
list_map$fopr<tq2arg><ti2arg>
  (tqa) =
let
val s2es =
list_map<s2var><s2exp>(tqa.s2vs())
in
  ti2arg_make(tqa.loc(), list_vt2t(s2es))
end where
{
implement
list_map$fopr<s2var><s2exp>(v) = s2exp_var(v)
}
} (* where *)
//
in
case+ tqas of
|
list_nil() => tias
|
list_cons(_, _) =>
(
case+ tias of
| list_nil _ => auxlst(tqas)
(*
| list_cons _ => list_append(tias, auxlst(tqas))
*)
// HX-2020-06-13:
// Is this looking more "natural"?
// Or should this be entirely excluded?
| list_cons _ => list_append(auxlst(tqas), tias)
)
end // end of [join_tq2as_tias]

(* ****** ****** *)

implement
d2cst_ti2as_dnst
(  d2c0, tias  ) = let
//
fun
auxck0
( loc0
: loc_t
, s2e0
: s2exp
, s2v0
: s2var): s2exp =
let
val s2t0 = s2v0.sort()
in
s2exp_tqacast(loc0, s2e0, s2t0)
end // end of [auxck0]
//
and
auxcks
( loc0
: loc_t
, s2es
: s2explst
, s2vs
: s2varlst): s2explst =
(
case+ s2vs of
|
list_nil() => s2es
|
list_cons(s2v0, s2vs) =>
(
case+ s2es of
|
list_nil() =>
list_nil()
|
list_cons
(s2e0, s2es) =>
let
val s2e0 =
auxck0(loc0, s2e0, s2v0)
in
list_cons
(s2e0, auxcks(loc0, s2es, s2vs))
end
)
) (* end of [auxcks] *)
//
fun
auxone
( x0: ti2arg
, y0: tq2arg): ti2arg =
let
val
loc0 = x0.loc()
val
s2es =
auxcks
( loc0
, x0.s2es(), y0.s2vs())
in
  ti2arg_make(loc0, s2es)
end
//
and
auxlst
( xs
: ti2arglst
, ys
: tq2arglst): ti2arglst =
(
case+ ys of
|
list_nil
((*void*)) => xs
|
list_cons
( y0, ys ) =>
(
case+ xs of
|
list_nil
((*void*)) => list_nil()
|
list_cons
( x0, xs ) =>
list_cons
(auxone(x0, y0), auxlst(xs, ys))
)
)
//
in
  auxlst(tias, d2c0.tqas((*void*)))
end // end of [d2cst_ti2as_dnst]

(* ****** ****** *)

implement
d2cst_ti2as_ti3a
(loc0, d2c0, tias) =
(
(*
HX:
[tias] is ignored
for non-temp [d2c0]
*)
let
val
tqas = d2c0.tqas()
in
case+ tqas of
// non-temp
| list_nil _ =>
  TI3ARGnone(*void*)
// template
| list_cons _ =>
  auxtias_0(d2c0, tias)
end
) where
{
//
fun
auxtias_0
( d2c0
: d2cst
, tias
: ti2arglst): ti3arg =
let
(*
val () =
println!
("auxtias_0: d2c0 = ", d2c0)
val () =
println!
("auxtias_0: tias = ", tias)
*)
in
let
  val tqas = d2c0.tqas()
  val t2ps = list_vt_nil()
in
  auxtias_1(tqas, tias, t2ps)
end
end
//
and
auxtias_1
( tqas
: tq2arglst
, tias
: ti2arglst
, t2ps
: List0_vt(t2ype)): ti3arg =
let
(*
val () =
println!
("auxtias_1: tqas = ", tqas)
*)
in
case+ tqas of
|
list_nil() =>
(
  TI3ARGsome(t2ps)
) where
{
val
t2ps =
list_vt2t
(list_vt_reverse(t2ps))
}
|
list_cons
(tq2a, tqas) =>
let
  val
  s2vs = tq2a.s2vs()
in
//
case+ tias of
|
list_nil() =>
let
  val
  s2es = list_nil()
  val
  t2ps =
  auxtias_2(s2vs, s2es, t2ps)
in
  auxtias_1(tqas, tias, t2ps)
end
|
list_cons
(ti20, tias) =>
let
  val
  s2es = ti20.s2es()
  val
  t2ps =
  auxtias_2(s2vs, s2es, t2ps)
in
  auxtias_1(tqas, tias, t2ps)
end
//
end // end of [list_cons]
end // end of [auxtias_1]
//
and
auxtias_2
( s2vs
: s2varlst 
, s2es
: s2explst
, t2ps
: List0_vt(t2ype)
)
: List0_vt(t2ype) =
(
case+ s2vs of
|
list_nil
((*void*)) => t2ps
|
list_cons
(s2v0, s2vs) =>
(
case+ s2es of
|
list_nil() =>
let
val
t2p0 =
t2ype_new_loc_var(loc0, s2v0)
val
t2ps = list_vt_cons(t2p0, t2ps)
in
  auxtias_2( s2vs, s2es, t2ps )
end
|
list_cons
(s2e0, s2es1) =>
(
case+
s2e0.node() of
|
S2Eany(k0) =>
let
  val
  t2p0 =
  t2ype_new_loc_var(loc0, s2v0)
  val
  t2ps = list_vt_cons(t2p0, t2ps)
in
  if
  (k0 >= 2)
    then
    auxtias_2(s2vs, s2es, t2ps)
    else
    auxtias_2(s2vs, s2es1, t2ps)
  // end of [if]
end
| _(*non-S2Eany*) =>
  let
  val
  t2p0 = s2exp_erase(s2e0)
  val
  t2ps = list_vt_cons(t2p0, t2ps)
  in
    auxtias_2( s2vs, s2es1, t2ps )
  end
) (* list_cons *)
) (* end of [list_cons] *)
) (* end of [auxtias_2] *)
//
} (* end of [d2cst_ti2as_ti3a] *)

(* ****** ****** *)

implement
t2ype_f2arg_elim
(
loc0, tfun, f2as
) =
(
( f3as, tfun ) where
{
  var tfun = tfun
  val f3as = auxf2as_0(f2as, tfun)
}
) where
{
fun
auxf2as_0
( f2as
: f2arglst
, tfun
: &t2ype >> _
)
: f3arglst =
(
case+ f2as of
| list_nil() =>
  list_nil()
| list_cons
  (f2a0, f2as) =>
  (
    list_cons(f3a0, f3as)
  ) where
  {
    val
    f3a0 = auxf2as_1(f2a0, tfun)
    val
    f3as = auxf2as_0(f2as, tfun)
  }
) (* auxf2as_0 *)
and
auxf2as_1
( f2a0
: f2arg
, tfun
: &t2ype >> _): f3arg =
(
let
//
(*
val () =
println!("auxf2as_1: f2a0 = ", f2a0)
val () =
println!("auxf2as_1: tfun = ", tfun)
*)
//
in
case-
f2a0.node() of
(*
| F2ARGnone _ => ...
*)
| F2ARGsome_met _ => auxf2as_1m(f2a0, tfun)
| F2ARGsome_sta _ => auxf2as_1s(f2a0, tfun)
| F2ARGsome_dyn _ => auxf2as_1d(f2a0, tfun)
end
)
//
and
auxf2as_1m
( f2a0
: f2arg
, tfun
: &t2ype >> _): f3arg =
let
//
val-
F2ARGsome_met
( s2es ) = f2a0.node()
//
in
  f3arg_make_node
  (f2a0.loc(), F3ARGsome_met(s2es))
end
and
auxf2as_1s
( f2a0
: f2arg
, tfun
: &t2ype >> _): f3arg =
let
//
val-
F2ARGsome_sta
( svs1
, s2ps ) = f2a0.node()
//
val
loc0 = f2a0.loc()
val
t2p0 = t2ype_whnfize(tfun)
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
(svs2, t2p1) =>
let
val tsub =
auxtsub(svs2, svs1)
val t2p1 =
(
t2ype_revars
  (t2p1, svs2, tsub)
// t2ype_revars
) where
{
val
tsub = $UN.list_vt2t(tsub)
} (* where *) // end-of-val
val () = list_vt_free(tsub)
in
let
  val () =
  (tfun := t2p1)
in
  f3arg_make_node
  ( loc0
  , F3ARGsome_sta(svs1, s2ps))
end
end // end of [T2Puni]
|
_(*non-T2Puni*) =>
let
  val () =
  (tfun := t2p0)
in
  f3arg_make_node
  (  loc0, F3ARGnone2(f2a0)  )
end
) (* end of [then] *)
else
let
  val () =
  (tfun := t2p0)
in
  f3arg_make_node
  (loc0, F3ARGsome_sta(svs1, s2ps))
end // let // end of [else]
//
end where
{
fun
auxtest
( s2vs
: s2varlst): bool =
(
case+ s2vs of
|
list_nil() => false
|
list_cons(s2v0, s2vs) =>
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
|
list_nil _ =>
list_vt_nil()
|
list_cons(x0, xs1) =>
(
case+ ys0 of
|
list_nil() =>
list_vt_cons
(x0, auxtsub(xs1, list_nil()))
|
list_cons(y0, ys1) =>
let
  val st = y0.sort()
in
  if
  sort2_is_impred(st)
  then
  list_vt_cons
  (y0, auxtsub(xs1, ys1)) else auxtsub(xs0, ys1)
end // end-of-let
)
) (* end of [auxtsub] *)
} // end of [let] // end of [auxf2as_1s]
//
and
auxf2as_1d
( f2a0
: f2arg
, tfun
: &t2ype >> _): f3arg =
let
//
val-
F2ARGsome_dyn
( npf1
, d2ps) = f2a0.node()
//
val
loc0 = f2a0.loc()
val
t2p0 = t2ype_whnfize(tfun)
//
in
//
case+
t2p0.node() of
//
|
T2Puni
(s2vs, t2p1) =>
(
  tfun := t2p1;
  auxf2as_1d(f2a0, tfun)
) where
{
  val t2p1 =
  t2ype_gnvars(t2p1, s2vs)
}
|
T2Pfun
(_, _, t2ps, t2p1) =>
let
  val d3ps =
  trans23_dpatlst_dntp(d2ps, t2ps)
in
  tfun := t2p1;
  f3arg_make_node
  (loc0, F3ARGsome_dyn(npf1, d3ps))
 end
//
|
_(*non-T2Puni/fun*) =>
f3arg_make_node(loc0, F3ARGnone2(f2a0))
//
end (*let*) // end of [auxf2as_1d]
//
} (*where*) // end of [t2ype_f3arg_elim]
//
(* ****** ****** *)

(* end of [xats_trans23_util0.dats] *)
