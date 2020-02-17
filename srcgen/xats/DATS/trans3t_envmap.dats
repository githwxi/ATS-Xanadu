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
// Start Time: October, 2018
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

#staload "./../SATS/locinfo.sats"

(* ****** ****** *)

#staload "./../SATS/statyp2.sats"
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

#staload "./../SATS/trans23.sats"
#staload "./../SATS/trans33.sats"
#staload "./../SATS/trans3t.sats"

(* ****** ****** *)

#staload
_(*TMP*) = "./statyp2_util0.dats"

(* ****** ****** *)

implement
fprint_val<t2ype> = fprint_t2ype

(* ****** ****** *)
//
datavtype implist =
//
| implist_nil of ()
//
| implist_let1 of implist
| implist_loc1 of implist
| implist_loc2 of implist
//
| implist_cons of
  (d3ecl, ti3env, implist)
//
(* ****** ****** *)
//
fun
implist_add_let1
( xs
: implist
)
: implist = implist_let1(xs)
//
(* ****** ****** *)
//
fun
implist_pop_let1
( xs
: implist): implist =
( auxlst(xs) ) where
{
fun
auxlst
( xs
: implist): implist =
case- xs of
| ~implist_let1(xs) => xs
| ~implist_cons
   (d3cl, ti3e, xs) => auxlst(xs)
}
//
(* ****** ****** *)
//
fun
implist_add_loc1
( xs
: implist): implist = implist_loc1(xs)
fun
implist_add_loc2
( xs
: implist): implist = implist_loc2(xs)
//
(* ****** ****** *)
//
fun
implist_pop_loc12
( xs
: implist): implist =
(
auxlst1
(xs, implist_nil())
) where
{
fun
auxlst1
( xs
: implist
, ys
: implist): implist =
(
case- xs of
|
~implist_loc2
   (xs) => auxlst2(xs, ys)
|
~implist_cons
   (d3cl, ti3e, xs) =>
 (
   auxlst1
   (xs, implist_cons(d3cl, ti3e, ys))
 )
)
and
auxlst2
( xs
: implist
, ys
: implist): implist =
(
case- xs of
| ~implist_loc1
   (xs) => auxlst3(xs, ys)
| ~implist_cons
   (d3cl, ti3e, xs) => auxlst2(xs, ys)
)
and
auxlst3
( xs
: implist
, ys
: implist): implist =
(
case- ys of
|
~implist_nil() => xs
|
~implist_cons(d3cl, ti3e, ys) =>
 (
   auxlst3
   (implist_cons(d3cl, ti3e, xs), ys)
 )
) (* end of [auxlst3] *)
} (* where *) // implist_pop_loc12
//
(* ****** ****** *)

fun
implist_free
(xs: implist): void =
(
case+ xs of
|
~implist_nil() => ()
|
~implist_let1(xs) => implist_free(xs)
|
~implist_loc1(xs) => implist_free(xs)
|
~implist_loc2(xs) => implist_free(xs)
//
|
~implist_cons(_, _, xs) => implist_free(xs)
//
) (* end of [implist_free] *)

(* ****** ****** *)

fun
implist_find_timp
( xs
: !implist
, d2c0: d2cst
, targ: t2ypelst
)
:
Option_vt
@(d3ecl
, s2varlst, t2ypelst) =
(
let
val () =
list_vt_free(xtvs) in opt0
end
) where
{
//
val
loc0 = the_location_dummy
//
fun
fxtvs
( vs
: t2xtvlst
)
: t2ypelst =
list_vt2t
(
list_map<t2xtv><t2ype>(vs)
) where
{
//
implement
list_map$fopr<t2xtv><t2ype>
  (xtv) = t2ype_eval(xtv.type())
//
}
//
fun
auxrst
( xtvs
: t2xtvlst): void =
(
case+ xtvs of
| list_nil
  ((*void*)) => ()
| list_cons
  (xtv0, xtvs) =>
  ( auxrst(xtvs) ) where
  {
    val () =
    xtv0.type(the_t2ype_none0)
  }
) (* end of [auxrst] *)
//
fun
auxd2c
( d2c0: d2cst
, d3cl: d3ecl): bool =
(
case-
d3cl.node() of
|
D3Cfundecl
( _, _, _, f3ds) =>
(
  auxf3ds(f3ds)
) where
{
fun
auxf3d0
( f3d0
: f3undecl): bool =
let
val+
F3UNDECL(rcd) = f3d0
in
  if (d2c0 = rcd.d2c) then true else false
end
fun
auxf3ds
( f3ds
: f3undeclist): bool =
(
case+ f3ds of
| list_nil() => false
| list_cons(f3d0, f3ds) =>
  if auxf3d0(f3d0) then true else auxf3ds(f3ds)
)
} (* D3Cfundecl *)
|
D3Cimpdecl3
( _, _, _, _
, id2c
, _, _, _, _, _) =>
(
case+ id2c of
|
IMPLD2CST1
(dqid, d2cs) =>
(
  d2c0 = d2c1
) where
{
val-
list_cons(d2c1, _) = d2cs
}
|
IMPLD2CST2
(dqid, d2cs, opt3) =>
(
case+ opt3 of
| None() => false
| Some(d2c1) => (d2c0 = d2c1)
)
)
) (* end of [auxd2c] *)
//
fun
auxlst
( xs: !implist
, xarg: t2xtvlst
)
:
Option_vt
@(d3ecl
, s2varlst, t2ypelst) =
(
case+ xs of
//
|
implist_nil() =>
  None_vt((*void*))
// implist_nil
//
|
implist_let1
  (xs) => auxlst(xs, xarg)
|
implist_loc1
  (xs) => auxlst(xs, xarg)
|
implist_loc2
  (xs) => auxlst(xs, xarg)
//
|
implist_cons
(d3cl, ti3e, xs) =>
let
//
  val
  found =
  auxd2c(d2c0, d3cl)
//
  val () =
  println!
  ("implist_find_timp: d2c0 = ", d2c0)
  val () =
  println!
  ("implist_find_timp: d3cl = ", d3cl)
  val () =
  println!
  ("implist_find_timp: found = ", found)
//
in
//
if
not
(
found // d2c0: found
)
then auxlst(xs, xarg)
else let
  val+
  TI3ENV
  ( s2vs
  , xtvs, t2ps) = ti3e
  val
  test =
  unify3(loc0, targ, t2ps)
//
  val () =
  println!
  ("implist_find_timp: targ = ", targ)
  val () =
  println!
  ("implist_find_timp: t2ps = ", t2ps)
  val () =
  println!
  ("implist_find_timp: test = ", test)
//
in
  if
  test
  then
  let
  val t2ps = fxtvs(xtvs)
  in
    auxrst(xtvs); // reset
    Some_vt@(d3cl, s2vs, t2ps)
  end
  else
  (auxrst(xarg); auxlst(xs, xarg))
end // end of [else]
//
end // end of [implist_cons]
//
) (* end of [auxlst] *)
//
val xtvs = t2ypelst_get_xtvs(targ)
//
val opt0 =
let
val
xtvs = $UN.list_vt2t(xtvs) in auxlst(xs, xtvs)
end // end-of-let // end-of-val
//
} (* end of [implist_find_timp] *)

(* ****** ****** *)

local
//
datavtype implenv =
|
IMPLENV of
(List0_vt(svtplst), implist)
//
where
svtplst = @(s2varlst, t2ypelst)
//
absimpl implenv_vtype = implenv
//
in(*in-of-local*)

(* ****** ****** *)

implement
implenv_get_s2vs
  (env) = let
//
val+
@IMPLENV(us, xs) = env
//
in
let
val-
@list_vt_cons
 (u0, _) = us
val s2vs = u0.0
in
  fold@(us); fold@(env); s2vs
end
end // end of [implenv_get_s2vs]
implement
implenv_get_t2ps
  (env) = let
//
val+
@IMPLENV(us, xs) = env
//
in
let
val-
@list_vt_cons
 (u0, _) = us
val t2ps = u0.1
in
  fold@(us); fold@(env); t2ps
end
end // end of [implenv_get_t2ps]

(* ****** ****** *)

implement
implenv_add_let1
  (env) =
( fold@(env) ) where
{
//
val+
@IMPLENV(us, xs) = env
val () =
(xs := implist_add_let1(xs))
//
} (* end of [implenv_add_let1] *)

(* ****** ****** *)

implement
implenv_pop_let1
  (env) =
( fold@(env) ) where
{
//
val+
@IMPLENV(us, xs) = env
val () =
(xs := implist_pop_let1(xs))
//
} (* end of [implenv_pop_let1] *)

(* ****** ****** *)

implement
implenv_add_loc1
  (env) =
( fold@(env) ) where
{
//
val+
@IMPLENV(us, xs) = env
val () =
(xs := implist_add_loc1(xs))
//
} (* end of [implenv_add_loc1] *)

(* ****** ****** *)

implement
implenv_add_loc2
  (env) =
( fold@(env) ) where
{
//
val+
@IMPLENV(us, xs) = env
val () =
(xs := implist_add_loc2(xs))
//
} (* end of [implenv_add_loc2] *)

(* ****** ****** *)

implement
implenv_pop_loc12
  (env) = let
//
val+
@IMPLENV(us, xs) = env
val () =
(xs := implist_pop_loc12(xs))
//
in
  fold@(env) // nothing
end // end of [implenv_pop_loc12]

(* ****** ****** *)

implement
implenv_add_d3ecl
( env0
, d3cl, ti3e) =
( fold@(env0) ) where
{
//
val+
@IMPLENV(us, xs) = env0
val () =
(xs := implist_cons(d3cl, ti3e, xs))
//
} (* end of [implenv_add_d3ecl] *)

(* ****** ****** *)
//
implement
implenv_make_nil() =
IMPLENV
(list_vt_nil(), implist_nil())
//
(* ****** ****** *)
//
implement
implenv_free_nil(env0) =
let
//
val+
~IMPLENV(us, xs) = env0
//
in
let
val-~list_vt_nil() = us in implist_free(xs)
end
end // end of [implenv_free_nil]
//
(* ****** ****** *)

implement
implenv_pop0_tsub
  (env0) =
(
let
val () =
(us := us1) in fold@(env0)
end
) where
{
//
val+
@IMPLENV(us, xs) = env0
//
val-~list_vt_cons(_, us1) = us
//
} (* end of [implenv_pop0_tsub] *)

implement
implenv_push_tsub
(env0, s2vs, t2ps) =
( fold@(env0) ) where
{
val+
@IMPLENV(us, xs) = env0
val () =
(us :=
 list_vt_cons(@(s2vs, t2ps), us))
//
} (* end of [implenv_push_tsub] *)

(* ****** ****** *)
//
implement
implenv_find_timp
(env0, d2c0, targ) = let
//
val+IMPLENV(us, xs) = env0
//
in
  implist_find_timp(xs, d2c0, targ)
end // end of [implenv_find_timp]
//
(* ****** ****** *)

implement
t2ype_subst_implenv
  (t2p0, env0) =
(
  t2ype_subst(t2p0)
) where
{
//
val+
IMPLENV(us, xs) = env0
val us =
$UN.castvwtp1{List0(svtplst)}(us)
//
implement
t2ype_subst$var<>
  (t2p0, flag) =
(
  auxvtss1(us, flag)
) where
{
val-
T2Pvar(s2v0) = t2p0.node()
//
fnx
auxvtss1
( vtss
: List0(svtplst)
, flag: &int >> int): t2ype =
(
case+ vtss of
|
list_nil
((*void*)) => t2p0
|
list_cons
(vts1, vtss) =>
auxvtss2
(vts1.0, vts1.1, vtss, flag)
)
and
auxvtss2
( s2vs: s2varlst
, t2ps: t2ypelst
, vtss
: List0(svtplst)
, flag: &int >> int): t2ype =
(
case+ s2vs of
|
list_nil
((*void*)) =>
auxvtss1(vtss, flag)
|
list_cons
(s2v1, s2vs) =>
let
  val-
  list_cons
  (t2p1, t2ps) = t2ps
in
  if
  s2v0 = s2v1
  then (flag := flag+1; t2p1)
  else
  auxvtss2(s2vs, t2ps, vtss, flag)
end
) (* end of [auxvtss2] *)
//
} (* end of [t2ype_subst$var] *)
//
} (* end of [t2ype_subst_implenv] *)

(* ****** ****** *)
//
implement
t2ypelst_subst_implenv
  (t2ps, env0) =
list_vt2t
(
list_map<t2ype><t2ype>(t2ps)
) where
{
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
implement
list_map$fopr<t2ype><t2ype>
  (t2p0) =
  (t2p0) where
{
//
  val env0 =
  $UN.castvwtp0{implenv}(env0)
  val t2p0 =
  t2ype_subst_implenv(t2p0, env0)
//
  prval
  ((*void*)) = $UN.cast2void(env0)
//
} (* list_map$fopr<t2ype><t2ype> *)
//
} (* end of [t2ypelst_subst_svarlst] *)
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_trans3t_envmap.dats] *)
