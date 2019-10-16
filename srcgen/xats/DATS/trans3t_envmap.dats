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

#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

#staload "./../SATS/trans3t.sats"

(* ****** ****** *)

datavtype implist =
//
| implist_nil of ()
//
| implist_let1 of implist
| implist_loc1 of implist
| implist_loc2 of implist
//
| implist_cons of (d3ecl, implist)
//
(* ****** ****** *)

datavtype implenv =
| IMPLENV of (t2ypelst, implist)

(* ****** ****** *)

fun
implist_add_let1
( xs
: implist): implist = implist_let1(xs)

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
| ~implist_cons(d2cl, xs) => auxlst(xs)
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
| ~implist_loc2
   (xs) => auxlst2(xs, ys)
| ~implist_cons
   (x0, xs) =>
   auxlst1(xs, implist_cons(x0, ys))
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
   (x0, xs) => auxlst2(xs, ys)
)
and
auxlst3
( xs
: implist
, ys
: implist): implist =
(
case- ys of
| ~implist_nil() => xs
| ~implist_cons(y0, ys) =>
   auxlst3(implist_cons(y0, xs), ys)
)
} (* where *) // implenv_pop_loc12
//
(* ****** ****** *)

local

absimpl
implenv_vtype = implenv

in(*in-of-local*)

(* ****** ****** *)

implement
implenv_get_tsub
  (env) = let
//
val+
@IMPLENV(x0, xs) = env
//
in
let
val tsub = x0 in fold@(env); tsub
end
end // end of [implenv_get_tsub]

(* ****** ****** *)

implement
implenv_add_let1
  (env) = let
//
val+
@IMPLENV(x0, xs) = env
val () =
(xs := implist_add_let1(xs))
//
in
  fold@(env)
end // end of [implenv_add_let1]

(* ****** ****** *)

implement
implenv_pop_let1
  (env) = let
//
val+
@IMPLENV(x0, xs) = env
val () =
(xs := implist_pop_let1(xs))
//
in
  fold@(env)
end // end of [implenv_pop_let1]

(* ****** ****** *)

implement
implenv_add_loc1
  (env) = let
//
val+
@IMPLENV(x0, xs) = env
val () =
(xs := implist_add_loc1(xs))
//
in
  fold@(env)
end // end of [implenv_add_loc1]

(* ****** ****** *)

implement
implenv_add_loc2
  (env) = let
//
val+
@IMPLENV(x0, xs) = env
val () =
(xs := implist_add_loc2(xs))
//
in
  fold@(env)
end // end of [implenv_add_loc2]

(* ****** ****** *)

implement
implenv_pop_loc12
  (env) = let
//
val+
@IMPLENV(x0, xs) = env
val () =
(xs := implist_pop_loc12(xs))
//
in
  fold@(env)
end // end of [implenv_pop_loc12]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_trans3t_envmap.dats] *)
