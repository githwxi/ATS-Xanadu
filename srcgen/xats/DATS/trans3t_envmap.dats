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

#define
LOC0 the_location_dummy

(* ****** ****** *)

implement
fprint_val<t2ype> = fprint_t2ype

(* ****** ****** *)
//
local
fun
fxtvs_eval
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
  (xtv) =
(
let
val t2p = xtv.type()
in
  case+
  t2p.node() of
  | T2Pnone0() => t2ype_xtv(xtv)
  | _(*solved*) => t2ype_eval(t2p)
end
)
//
} (* fxtvs_eval *)
fun
fxtvs_redo
( vs
: t2xtvlst
)
: t2xtvlst =
list_vt2t
(
list_map<t2xtv><t2xtv>(vs)
) where
{
//
implement
list_map$fopr<t2xtv><t2xtv>
  (xtv) =
let
  val xtv2 = t2xtv_new(LOC0)
  val t2p2 = t2ype_xtv(xtv2)
in
let
val () = xtv.type(t2p2) in xtv2
end
end
//
} (* fxtvs_redo *)
in
fun
ti3env_redo
( d3cl
: d3ecl
, ti3e
: ti3env
, targ
: t2ypelst
)
: t2ypelst =
(
  fxtvs_eval(xtvs)
) where
{
val+
TI3ENV
(s2vs, xtvs, t2ps) = ti3e
//
val xtvs = fxtvs_redo(xtvs)
//
val t2ps =
(
list_map<t2ype><t2ype>(t2ps)
) where
{
implement
list_map$fopr<t2ype><t2ype>(x) = t2ype_evalrec(x)
}
//
val-true =
unify3
(LOC0, targ, $UN.list_vt2t(t2ps))
//
val ((*void*)) = list_vt_free(t2ps)
//
} (* end of [ti3env_redo] *) end // end of [local]

(* ****** ****** *)

local
//
fun
auxrst // reset
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
    xtv0.type(the_t2ype_none0(*void*))
  }
) (* end of [auxrst] *)

fun
auximps
( d2c0
: d2cst
, imps
: implist
, targ
: t2ypelst)
: Option_vt
  @(d3ecl
  , s2varlst, t2ypelst) =
let
//
fun
auxlst
( xs: implist
, xarg: t2xtvlst
)
:
Option_vt
@(d3ecl
, s2varlst, t2ypelst) =
(
case+ xs of
|
implist_nil() =>
  None_vt(*void*)
|
implist_cons
(d3cl, ti3e, xs) =>
let
//
(*
val () =
println!
("staload_find_timp: d3cl = ", d3cl)
*)
//
val+
TI3ENV
( s2vs
, xtvs, t2ps) = ti3e
val
test =
unify3(LOC0, targ, t2ps)
//
(*
val () =
println!
("staload_find_timp: targ = ", targ)
val () =
println!
("staload_find_timp: t2ps = ", t2ps)
val () =
println!
("staload_find_timp: test = ", test)
*)
//
in
  if
  test
  then
  let
//
  val () = auxrst(xarg)
  val tsub =
  ti3env_redo(d3cl, ti3e, targ)
//
(*
  val
  ((*void*)) =
  println!
  ("staload_find_timp: tsub = ", tsub)
*)
//
  in
    auxrst(xtvs); // reset
    Some_vt@(d3cl, s2vs, tsub)
  end
  else
  ( auxrst(xtvs); // reset
    auxrst(xarg); auxlst(xs, xarg)
  ) (* end of [else] *) // end-of-if
end // end of [auxlst]
)
//
(*
val () =
println!
("staload_find_timp: d2c0 = ", d2c0)
*)
//
in
(
let
val () = list_vt_free(xarg) in opt0
end
) where
{
  val xarg = t2ypelst_get_xtvs(targ)
  val opt0 = auxlst(imps, $UN.list_vt2t(xarg))
}
//
end // end of [auximps]

in (* in-of-local *)

implement
staload_find_timp
( d3cl
, d2c0, targ) = let
//
val-
D3Cstaload
( tok, src
, knd, fopt
, flag, mopt) = d3cl.node()
//
in
//
case+ mopt of
|
None() =>
None_vt()
|
Some(menv) => let
  val
  hopt =
  fmodenv_get_t3imptbl(menv)
in
case- hopt of
| Some(htbl) =>
  (
    auximps(d2c0, imps, targ)
  ) where
  {
    val imps =
    t3imptbl_find_implist(htbl, d2c0)
  }
end // end of [Some]
//
end // end of [staload_find_timp]

end // end of [local]

(* ****** ****** *)
//
datavtype
impllst =
//
| impllst_nil of ()
//
| impllst_let1 of impllst
| impllst_loc1 of impllst
| impllst_loc2 of impllst
//
| impllst_cons1 of (d3ecl, impllst)
| impllst_cons2 of (d3ecl, ti3env, impllst)
//
(* ****** ****** *)
//
fun
impllst_add_let1
( xs
: impllst
)
: impllst = impllst_let1(xs)
//
(* ****** ****** *)
//
fun
impllst_pop_let1
( xs
: impllst): impllst =
( auxlst(xs) ) where
{
fun
auxlst
( xs
: impllst): impllst =
case- xs of
| ~impllst_let1(xs) => xs
| ~impllst_cons1(d3cl, xs) => auxlst(xs)
| ~impllst_cons2(d3cl, ti3e, xs) => auxlst(xs)
}
//
(* ****** ****** *)
//
fun
impllst_add_loc1
( xs
: impllst): impllst = impllst_loc1(xs)
fun
impllst_add_loc2
( xs
: impllst): impllst = impllst_loc2(xs)
//
(* ****** ****** *)
//
fun
impllst_pop_loc12
( xs
: impllst): impllst =
(
auxlst1
(xs, impllst_nil())
) where
{
fun
auxlst1
( xs
: impllst
, ys
: impllst): impllst =
(
case- xs of
|
~impllst_loc2
   (xs) => auxlst2(xs, ys)
|
~impllst_cons1
   (d3cl, xs) =>
 (
   auxlst1
   (xs, impllst_cons1(d3cl, ys))
 )
|
~impllst_cons2
   (d3cl, ti3e, xs) =>
 (
   auxlst1
   (xs, impllst_cons2(d3cl, ti3e, ys))
 )
)
and
auxlst2
( xs
: impllst
, ys
: impllst): impllst =
(
case- xs of
|
~impllst_loc1
 (xs) => auxlst3(xs, ys)
|
~impllst_cons1
 (d3cl, xs) => auxlst2(xs, ys)
|
~impllst_cons2
 (d3cl, ti3e, xs) => auxlst2(xs, ys)
)
and
auxlst3
( xs
: impllst
, ys
: impllst): impllst =
(
case- ys of
|
~impllst_nil() => xs
|
~impllst_cons1(d3cl, ys) =>
 (
   auxlst3
   (impllst_cons1(d3cl, xs), ys)
 )
|
~impllst_cons2(d3cl, ti3e, ys) =>
 (
   auxlst3
   (impllst_cons2(d3cl, ti3e, xs), ys)
 )
) (* end of [auxlst3] *)
} (* where *) // impllst_pop_loc12
//
(* ****** ****** *)

fun
impllst_free
(xs: impllst): void =
(
case+ xs of
|
~impllst_nil() => ()
|
~impllst_let1(xs) => impllst_free(xs)
|
~impllst_loc1(xs) => impllst_free(xs)
|
~impllst_loc2(xs) => impllst_free(xs)
//
|
~impllst_cons1(_, xs) => impllst_free(xs)
|
~impllst_cons2(_, _, xs) => impllst_free(xs)
//
) (* end of [impllst_free] *)

(* ****** ****** *)

fun
impllst_find_timp
( xs
: !impllst
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
list_vt_free(xarg) in opt0
end
) where
{
//
fun
auxrst // reset
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
    xtv0.type(the_t2ype_none0(*void*))
  }
) (* end of [auxrst] *)
//
fun
auxfnd
( d3cl: d3ecl
, d2c0: d2cst): bool =
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
) (* end of [auxfnd] *)
//
fun
auxlst
( xs: !impllst
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
impllst_nil() =>
  None_vt((*void*))
// impllst_nil
//
|
impllst_let1
  (xs) => auxlst(xs, xarg)
|
impllst_loc1
  (xs) => auxlst(xs, xarg)
|
impllst_loc2
  (xs) => auxlst(xs, xarg)
//
|
impllst_cons1
  (d3cl, xs) =>
let
//
val
ans =
staload_find_timp(d3cl, d2c0, targ)
//
in
case+ ans of
|
 Some_vt _ => ans
|
~None_vt((*~found*)) => auxlst(xs, xarg) 
end
//
|
impllst_cons2
  (d3cl, ti3e, xs) =>
let
//
val
fnd = auxfnd(d3cl, d2c0)
(*
val () =
println!
("impllst_find_timp: fnd = ", fnd)
*)
//
(*
val () =
println!
("impllst_find_timp: d3cl = ", d3cl)
val () =
println!
("impllst_find_timp: d2c0 = ", d2c0)
val () =
println!
("impllst_find_timp: targ = ", targ)
*)
//
in
//
if
(
~fnd // d2c0: ~found
)
then auxlst(xs, xarg)
else let
val+
TI3ENV
( s2vs
, xtvs, t2ps) = ti3e
val
test =
unify3(LOC0, targ, t2ps)
//
(*
val () =
println!
("impllst_find_timp: t2ps = ", t2ps)
val () =
println!
("impllst_find_timp: test = ", test)
*)
//
in
  if
  test
  then
  let
//
  val () = auxrst(xarg)
  val tsub =
  ti3env_redo(d3cl, ti3e, targ)
(*
  val
  ((*void*)) =
  println!
  ("impllst_find_timp: tsub = ", tsub)
*)
  in
    auxrst(xtvs); // reset
    Some_vt@(d3cl, s2vs, tsub)
  end
  else
  ( auxrst(xtvs); // reset
    auxrst(xarg); auxlst(xs, xarg)
  ) (* end of [else] *) // end-of-if
end // end of [else]
//
end // end of [impllst_cons]
//
) (* end of [auxlst] *)
//
val xarg = t2ypelst_get_xtvs(targ)
//
val opt0 =
let
val
xarg = $UN.list_vt2t(xarg) in auxlst(xs, xarg)
end // end-of-let // end-of-val
//
} (* end of [impllst_find_timp] *)

(* ****** ****** *)

local
//
datavtype implenv =
|
IMPLENV of
(List0_vt(svtplst), impllst)
//
where
svtplst=(s2varlst, t2ypelst)
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
(xs := impllst_add_let1(xs))
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
(xs := impllst_pop_let1(xs))
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
(xs := impllst_add_loc1(xs))
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
(xs := impllst_add_loc2(xs))
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
(xs := impllst_pop_loc12(xs))
//
in
  fold@(env) // nothing
end // end of [implenv_pop_loc12]

(* ****** ****** *)

implement
implenv_add_staload
(env0, d3cl) =
( fold@(env0) ) where
{
//
val+
@IMPLENV(us, xs) = env0
val () =
(xs := impllst_cons1(d3cl, xs))
//
} (* end of [implenv_add_impdecl3] *)

implement
implenv_add_impdecl3
( env0
, d3cl, ti3e) =
( fold@(env0) ) where
{
//
val+
@IMPLENV(us, xs) = env0
val () =
(xs := impllst_cons2(d3cl, ti3e, xs))
//
} (* end of [implenv_add_impdecl3] *)

(* ****** ****** *)
//
implement
implenv_make_nil() =
IMPLENV
(list_vt_nil(), impllst_nil())
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
val-~list_vt_nil() = us in impllst_free(xs)
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
  impllst_find_timp(xs, d2c0, targ)
end // end of [implenv_find_timp]
//
(* ****** ****** *)

implement
t2ype_subst_implenv
  (t2p0, env0) =
(
  t2ype_subst<>(t2p0)
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
