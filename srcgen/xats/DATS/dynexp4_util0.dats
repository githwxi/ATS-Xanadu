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
#staload "./../SATS/xstamp0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
#staload "./../SATS/dynexp4.sats"
(* ****** ****** *)

implement
fprint_val<d2var> = fprint_d2var

(* ****** ****** *)

local
//
fun
auxdpat
( d4p0: d4pat
, d2vs: dlocs): dlocs =
(
case+
d4p0.node() of
//
|
D4Pint _ => d2vs
|
D4Pbtf _ => d2vs
|
D4Pchr _ => d2vs
//
|
D4Pany _ => d2vs
|
D4Pvar(d2v0) =>
dlocs_insert(d2vs, d2v0)
//
|
D4Pbang(d4p1) =>
(
  auxdpat(d4p1, d2vs)
)
|
D4Pflat(d4p1) =>
(
  auxdpat(d4p1, d2vs)
)
|
D4Pfree(d4p1) =>
(
  auxdpat(d4p1, d2vs)
)
//
|
D4Pdap1(d4p1) =>
(
  auxdpat(d4p1, d2vs)
)
|
D4Pdapp
(d4f0, npf1, d4ps) =>
(
  auxd4ps(d4ps, d2vs)
) where
{
  val
  d2vs = auxdpat(d4f0, d2vs)
}
//
|
D4Panno
( d4p1
, s1e1, s2e2) =>
(
  auxdpat(d4p1, d2vs)
)
//
| _ (*rest-of-d4pat*) => d2vs
//
)
and
auxd4ps
( d4ps
: d4patlst
, d2vs: dlocs): dlocs =
(
case+ d4ps of
|
list_nil() => d2vs
|
list_cons
(d4p1, d4ps) =>
(
  auxd4ps(d4ps, d2vs)
) where
{
  val d2vs = auxdpat(d4p1, d2vs)
}
) (* end of [auxd4ps] *)
//
fun
auxdgua
( d4g0: d4gua
, d2vs: dlocs): dlocs =
(
case+
d4g0.node() of
|
D4GUAexp
( d4e1 ) => d2vs
|
D4GUAmat
( d4e1
, d4p2) => auxdpat(d4p2, d2vs)
)
and
auxd4gs
( d4gs
: d4gualst
, d2vs: dlocs): dlocs =
(
case+ d4gs of
|
list_nil() => d2vs
|
list_cons
(d4g1, d4gs) =>
(
  auxd4gs(d4gs, d2vs)
) where
{
  val d2vs = auxdgua(d4g1, d2vs)
}
) (* end of [auxd4gs] *)
//
in(*in-of-local*)

implement
d4gpat_get_dlocs
  ( dgpt ) =
(
case+
dgpt.node() of
|
D4GPATpat(d4p0) =>
(
  auxdpat(d4p0, d2vs)
) where
{
  val d2vs = dlocs_nil()
}
|
D4GPATgua(d4p0, d4gs) =>
(
  auxd4gs(d4gs, d2vs)
) where
{
  val
  d2vs = dlocs_nil((*void*))
  val
  d2vs = auxdpat(d4p0, d2vs)
}
) (* end of [tr34env_add_denvs_bran] *)

end // end of [local]

(* ****** ****** *)

implement
stmap2_dvmrg
(map1, map2) =
let
val
kxs1 =
stmap_listize(map1)
val
kxs2 =
stmap_listize(map2)
in
list_vt2t
(
auxlst2
( kxs1
, kxs2, list_vt_nil())
)
end where
{
typedef
kx = (d2var, s2exp)
vtypedef
kxs = List0_vt(kx)
vtypedef
res = List0_vt(dvmrg2)
//
fun
auxlstl
( kxs: kxs
, res: res): res =
(
case+ kxs of
| ~
list_vt_nil() =>
list_vt_reverse(res)
| ~
list_vt_cons(kx0, kxs) =>
let
//
val
(k0, x0) = kx0
//
val mrg =
DVMRG2(k0, Some(x0), None())
//
in
auxlstl
(kxs, list_vt_cons(mrg, res))
end ) (* end of [auxlstl] *)
//
and
auxlstr
( kxs: kxs
, res: res): res =
(
case+ kxs of
| ~
list_vt_nil() =>
list_vt_reverse(res)
| ~
list_vt_cons(kx0, kxs) =>
let
//
val
(k0, x0) = kx0
//
val mrg =
DVMRG2(k0, None(), Some(x0))
//
in
auxlstr
(kxs, list_vt_cons(mrg, res))
end ) (* end of [auxlstr] *)
//
and
auxlst2
( kxs1
: List0_vt(kx)
, kxs2
: List0_vt(kx), res: res): res =
(
case+ kxs1 of
| ~
list_vt_nil
((*void*)) => auxlstr(kxs2, res)
| ~
list_vt_cons
(kx1, kxs1) =>
(
case+ kxs2 of
| ~
list_vt_nil() =>
let
val
(k1, x1) = kx1
val mrg =
DVMRG2(k1, Some(x1), None())
in
auxlstl
(kxs1, list_vt_cons(mrg, res))
end // end of [list_vt_nil]
| ~
list_vt_cons
(kx2, kxs2) =>
let
val
(k1, x1) = kx1
val
(k2, x2) = kx2
val
sgn = cmp_d2var_d2var(k1, k2)
in
//
ifcase
|
(sgn < 0) =>
let
val mrg =
DVMRG2(k1, Some(x1), None())
in
auxlst2r
( k2
, x2
, kxs1
, kxs2, list_vt_cons(mrg, res))
end // end of [let]
|
(sgn > 0) =>
let
val mrg =
DVMRG2(k2, None(), Some(x2))
in
auxlst2l
( k1
, x1
, kxs1
, kxs2, list_vt_cons(mrg, res))
end // end of [let]
|
_(* else *) =>
let
val mrg =
DVMRG2(k1, Some(x1), Some(x2))
in
auxlst2
( kxs1
, kxs2, list_vt_cons(mrg, res))
end // end of [let]
//
end
) (* end of [list_vt_cons] *)
) (*case*) (* end of [auxlst2] *)
//
and
auxlst2l
( k1: d2var
, x1: s2exp
, kxs1
: List0_vt(kx)
, kxs2
: List0_vt(kx), res: res): res =
(
case+ kxs2 of
| ~
list_vt_nil() =>
let
val mrg =
DVMRG2(k1, Some(x1), None())
in
auxlstl
(kxs1, list_vt_cons(mrg, res))
end // end of [list_vt_nil]
| ~
list_vt_cons(kx2, kxs2) =>
let
val
(k2, x2) = kx2
val
sgn = cmp_d2var_d2var(k1, k2)
in
//
ifcase
|
(sgn < 0) =>
let
val mrg =
DVMRG2(k1, Some(x1), None())
in
auxlst2r
( k2
, x2
, kxs1
, kxs2, list_vt_cons(mrg, res))
end // end of [let]
|
(sgn > 0) =>
let
val mrg =
DVMRG2(k2, None(), Some(x2))
in
auxlst2l
( k1
, x1
, kxs1
, kxs2, list_vt_cons(mrg, res))
end // end of [let]
|
_(* else *) => // k1=k2
let
val mrg =
DVMRG2(k1, Some(x1), Some(x2))
in
auxlst2
( kxs1
, kxs2, list_vt_cons(mrg, res))
end // end of [let]
//
end
) (*case*) (* end of [auxlst2l] *)
//
and
auxlst2r
( k2: d2var
, x2: s2exp
, kxs1
: List0_vt(kx)
, kxs2
: List0_vt(kx), res: res): res =
(
case+ kxs1 of
| ~
list_vt_nil() =>
let
val mrg =
DVMRG2(k2, None(), Some(x2))
in
auxlstr
(kxs2, list_vt_cons(mrg, res))
end // end of [list_vt_nil]
| ~
list_vt_cons(kx1, kxs1) =>
let
val
(k1, x1) = kx1
val
sgn = cmp_d2var_d2var(k1, k2)
in
//
ifcase
|
(sgn < 0) =>
let
val mrg =
DVMRG2(k1, Some(x1), None())
in
auxlst2r
( k2
, x2
, kxs1
, kxs2, list_vt_cons(mrg, res))
end // end of [let]
|
(sgn > 0) =>
let
val mrg =
DVMRG2(k2, None(), Some(x2))
in
auxlst2l
( k1
, x1
, kxs1
, kxs2, list_vt_cons(mrg, res))
end // end of [let]
|
_(* else *) => // k1=k2
let
val mrg =
DVMRG2(k1, Some(x1), Some(x2))
in
auxlst2
( kxs1
, kxs2, list_vt_cons(mrg, res))
end // end of [let]
//
end
) (*case*) (* end of [auxlst2r] *)
//
} (*where*) // end of [stmap_dvmrg]

(* ****** ****** *)
//
(*
implement
stmap1l_dvmrg(map1) =
(
stmap_dvmrg(map1, map2)
) where { val map2 = stmap_nil() }
implement
stmap1r_dvmrg(map2) =
(
stmap_dvmrg(map1, map2)
) where { val map1 = stmap_nil() }
*)
//
(* ****** ****** *)

local
//
(* ****** ****** *)
#staload
"./dynexp4_stmap.dats"
(* ****** ****** *)
//
#staload
_(*FMAP*) =
"libats\
/DATS/funmap_avltree.dats"
//
(* ****** ****** *)
//
#staload
LS =
"libats\
/SATS/linset_avltree.sats"
#staload
_(*LS*) =
"libats\
/DATS/linset_avltree.dats"
//
(* ****** ****** *)
//
typedef
elt = d2var
vtypedef
dvset = $LS.set(elt)
//
implement
$LS.compare_elt_elt<elt>
(x1, x2) =
$effmask_all
(compare(x1.stamp(), x2.stamp()))
(* ****** ****** *)
//
fun
stmap_add_d2vs
( map0: stmap
, set1: dvset): dvset =
let
var env1 = set1
in
let
implement
stmap_foreach$fwork<dvset>
(k0, x0, env1) =
ignoret($LS.linset_insert(env1, k0))
in(*in-of-let*)
  stmap_foreach_env<dvset>(map0, env1); env1
end
end // end of [stmap_add_d2vs]
//
fun
dclaulst_get_stdvs
( dcls
: d4claulst): dvset =
let
fun
auxlst
( dcls
: d4claulst
, res: &dvset >> _): void =
(
case+ dcls of
|
list_nil() => ()
|
list_cons(dcl1, dcls) =>
(
case+
dcl1.node() of
|
D4CLAUpat _ =>
(
  auxlst(dcls, res)
)
|
D4CLAUexp(_, _, map) =>
(
  auxlst(dcls, res)) where
{
val () =
res := stmap_add_d2vs(map,res)
}
)
)
in
( auxlst
  (dcls, res); res) where
{
  var
  res: dvset = $LS.linset_nil()
}
end (*let*) // dclaulst_get_stdvs
//
in(*in-of-local*)

implement
dclaulst_dvmrg(dcls) =
(
list_nil((*void*))) where
{
val d2vs =
dclaulst_get_stdvs(dcls)
val d2vs =
$LS.linset_listize(d2vs)
val d2vs = list_vt2t(d2vs)
val ((*void*)) =
println!
("dclaulst_dvmrg: d2vs = ", d2vs)
} (*where*) // end of [dclaulst_dvmrg]

end // end of [local]

(* ****** ****** *)

(* end of [xats_dynexp4_util0.dats] *)
