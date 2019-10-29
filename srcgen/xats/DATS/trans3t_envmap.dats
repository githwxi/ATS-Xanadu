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
#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

#staload "./../SATS/trans23.sats"
#staload "./../SATS/trans33.sats"
#staload "./../SATS/trans3t.sats"

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
datavtype implenv =
| IMPLENV of
  (List0_vt(svtplst), implist)
//
where svtplst = @(s2varlst, t2ypelst)
//
(* ****** ****** *)
//
extern
fun
ti3env_reset(ti3env): void
//
extern
fun
ti3env_get_s2vs(ti3env): s2varlst
extern
fun
ti3env_get_targ(ti3env): t2ypelst
extern
fun
ti3env_get_tsub(ti3env): t2ypelst
//
overload .s2vs with ti3env_get_s2vs
overload .targ with ti3env_get_targ
overload .tsub with ti3env_get_tsub
//
(* ****** ****** *)

implement
ti3env_reset(ti3e) =
let
val+
TI3ENV(_, xtvs, _) = ti3e
in (* in-of-let *)
(
list_foreach<t2xtv>(xtvs)
) where
{
implement
(env)(*tmp*)
list_foreach$fwork<t2xtv><env>
  (xtv, env) = xtv.type(the_t2ype_none0)
}
end // end of [ti3env_reset]

(* ****** ****** *)

implement
ti3env_get_s2vs
( ti3e ) =
( s2vs ) where
{
val+
TI3ENV(s2vs, _, _) = ti3e
} (* end of [ti3env_get_s2vs] *)

implement
ti3env_get_targ
( ti3e ) =
( targ ) where
{
val+
TI3ENV(_, _, targ) = ti3e
} (* end of [ti3env_get_targ] *)

implement
ti3env_get_tsub
( ti3e ) =
let
val+
TI3ENV(_, xtvs, _) = ti3e
in
list_vt2t
(
list_map<t2xtv><t2ype>(xtvs)
) where
{
implement
list_map$fopr<t2xtv><t2ype>(xtv) = xtv.type()
}
end (* end of [ti3env_get_tsub] *)

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
} (* where *) // implenv_pop_loc12
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
implement
list_map$fopr<t2xtv><t2ype>(v0) = v0.type()
}
//
fun
auxrst
(vs: t2xtvlst): void =
(
case+ vs of
| list_nil() => ()
| list_cons(v0, vs) =>
  ( auxrst(vs) ) where
  {
    val () =
    v0.type(the_t2ype_none0)
  }
)
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
| implist_nil() =>
    None_vt((*void*))
//
| implist_let1
    (xs) => auxlst(xs, xarg)
| implist_loc1
    (xs) => auxlst(xs, xarg)
| implist_loc2
    (xs) => auxlst(xs, xarg)
//
| implist_cons
  (d3cl, ti3e, xs) =>
  let
  val+
  TI3ENV
  (s2vs, xtvs, t2ps) = ti3e
  val test = unify(loc0, targ, t2ps)
  in
    if test
    then
    Some_vt
    @(d3cl, s2vs, fxtvs(xtvs))
    else
    ( auxrst(xarg)
    ; auxrst(xtvs); auxlst(xs, xarg)
    )
  end // end of [implist_cons]
)
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

absimpl
implenv_vtype = implenv

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
(env0, d2c0, t2ps) = let
//
val+IMPLENV(us, xs) = env0
//
in
  implist_find_timp(xs, d2c0, t2ps)
end // end of [implenv_find_timp]
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_trans3t_envmap.dats] *)
