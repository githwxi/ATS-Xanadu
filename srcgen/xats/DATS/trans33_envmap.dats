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
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

#staload "./../SATS/trans33.sats"

(* ****** ****** *)
//
datavtype
abstenv =
ABSTENV of abstlst
//
and
abstlst =
//
| abstlst_nil of ()
//
| abstlst_let1 of abstlst
| abstlst_loc1 of abstlst
| abstlst_loc2 of abstlst
//
| abstlst_open of
  (d3ecl, s2cst, t2ype, abstlst)
| abstlst_impl of
  (d3ecl, s2cst, t2ype, abstlst)
//
(* ****** ****** *)

local

absimpl
abstenv_vtype = abstenv

in(*in-of-local*)

(* ****** ****** *)

implement
abstenv_add_let1
  (env) =
( fold@(env) ) where
{
//
val+
@ABSTENV(xs) = env
val () =
(xs := abstlst_let1(xs))
//
} (* end of [abstenv_add_let1] *)

(* ****** ****** *)

implement
abstenv_add_loc1
  (env) =
( fold@(env) ) where
{
//
val+
@ABSTENV(xs) = env
val () =
(xs := abstlst_loc1(xs))
//
} (* end of [abstenv_add_loc1] *)

implement
abstenv_add_loc2
  (env) =
( fold@(env) ) where
{
//
val+
@ABSTENV(xs) = env
val () =
(xs := abstlst_loc2(xs))
//
} (* end of [abstenv_add_loc2] *)

(* ****** ****** *)

implement
abstenv_pop_let1
  (env) =
( fold@(env) ) where
{
//
val+
@ABSTENV(xs) = env
val () =
(xs := abstlst_pop_let1(xs))
//
} where
{
//
fun
abstlst_pop_let1
(xs: abstlst): abstlst =
(
case- xs of
| ~abstlst_let1(xs) => xs
| ~abstlst_open
   (_, _, _, xs) => abstlst_pop_let1(xs)
| ~abstlst_impl
   (_, _, _, xs) => abstlst_pop_let1(xs)
) (* end of [abstlst_pop_let1] *)
//
} (* end of [abstenv_pop_let1] *)

(* ****** ****** *)

implement
abstenv_pop_loc12
  (env) = let
//
val+
@ABSTENV(xs) = env
val () =
(xs := abstlst_pop_loc12(xs))
//
in
  fold@(env) // nothing
end where
{
fun
abstlst_pop_loc12
(xs: abstlst): abstlst =
(
auxlst1(xs, abstlst_nil())
)
and
auxlst1
( xs
: abstlst
, ys
: abstlst): abstlst =
(
case- xs of
|
~abstlst_loc2
   (xs) => auxlst2(xs, ys)
|
~abstlst_open
   (d3cl, s2c0, t2p1, xs) =>
 (
   auxlst1
   ( xs
   , abstlst_open(d3cl, s2c0, t2p1, ys))
 )
|
~abstlst_impl
   (d3cl, s2c0, t2p1, xs) =>
 (
   auxlst1
   ( xs
   , abstlst_impl(d3cl, s2c0, t2p1, ys))
 )
)
and
auxlst2
( xs
: abstlst
, ys
: abstlst): abstlst =
(
case- xs of
|
~abstlst_loc1
 (xs) => auxlst3(xs, ys)
|
~abstlst_open
 (d3cl, _, _, xs) => auxlst2(xs, ys)
|
~abstlst_impl
 (d3cl, _, _, xs) => auxlst2(xs, ys)
)
and
auxlst3
( xs
: abstlst
, ys
: abstlst): abstlst =
(
case- ys of
|
~abstlst_nil() => xs
|
~abstlst_open
 (d3cl, s2c0, t2p1, ys) =>
 (
   auxlst3(xs, ys) where
   {
   val xs =
   abstlst_open(d3cl, s2c0, t2p1, xs)
   }
 )
|
~abstlst_impl
 (d3cl, s2c0, t2p1, ys) =>
 (
   auxlst3(xs, ys) where
   {
   val xs =
   abstlst_impl(d3cl, s2c0, t2p1, xs)
   }
 )
) (* end of [auxlst3] *)
//
} (* end of [implenv_pop_loc12] *)

(* ****** ****** *)
//
implement
abstenv_make_nil
  ((*void*)) =
(
ABSTENV(abstlst_nil())
)
//
(* ****** ****** *)
//
implement
abstenv_free_top
  (env0) =
let
val-
~ABSTENV(lst0) = env0
in
  abstlst_free_all(lst0)
end where
{
fun
abstlst_free_all
  (xs: abstlst): void =
(
case- xs of
|
~abstlst_nil() => ()
|
~abstlst_open
 (_, _, _, xs) => abstlst_free_all(xs)
|
~abstlst_impl
 (_, _, _, xs) => abstlst_free_all(xs)
)
} (* end of [abstlst_free_all] *)
//
(* ****** ****** *)

implement
abstenv_push_open
( env0, d3cl ) =
let
val+
@ABSTENV(xs) = env0
//
val () =
(
case+ opt0 of
|
None() => ()
|
Some(s2c0) =>
let
val
def0 =
s2cst_get_abst(s2c0)
in
case+ def0 of
|
ABSTDF2eqeq(_, t2p0) =>
(
  xs :=
  abstlst_open
  (d3cl, s2c0, t2p0, xs)
)
| _ (*non-ABSTDF2eqeq *) => ()
end
) (* end of [val] *)
//
in
  fold@(env0) // nothing
end where
{
//
val () =
println!
(
"abstenv_push_open: d3cl = ", d3cl
)
//
val-
D3Cabsopen(tok, is2c) = d3cl.node()
val-
IMPLS2CST2(sqid, s2cs, opt0) = is2c
} (* end of [abstenv_push_open] *)

(* ****** ****** *)

implement
abstenv_push_impl
( env0, d3cl ) =
let
val+
@ABSTENV(xs) = env0
//
val () =
(
case+ opt0 of
|
None() => ()
|
Some(s2c0) =>
let
val
t2p0 =
s2exp_erase(def0)
in
  xs :=
  abstlst_impl
  (d3cl, s2c0, t2p0, xs)
end
) (* end of [val] *)
//
in
  fold@(env0) // nothing
end where
{
//
val () =
println!
("abstenv_push_impl: d3cl = ", d3cl)
//
val-
D3Cabsimpl
(tok, is2c, def0) = d3cl.node()
//
val-
IMPLS2CST2(sqid, s2cs, opt0) = is2c
} (* end of [abstenv_push_impl] *)

(* ****** ****** *)

implement
abstenv_find
(env0, s2c0) =
let
//
(*
val () =
println!
("abstenv_find: s2c0 = ", s2c0)
*)
//
val+
@ABSTENV(xs) = env0
val opt0 =
abstlst_find(xs, s2c0)
in
let
prval () = fold@(env0) in opt0 end
end where
{
fun
abstlst_find
( xs:
! abstlst
, s2c0: s2cst
)
: Option_vt(t2ype) =
let
val () =
println!
("abstlst_find: s2c0 = ", s2c0)
in
case+ xs of
//
|
abstlst_nil() => None_vt((*void*))
//
|
abstlst_let1(xs) => abstlst_find(xs, s2c0)
|
abstlst_loc1(xs) => abstlst_find(xs, s2c0)
|
abstlst_loc2(xs) => abstlst_find(xs, s2c0)
//
|
abstlst_open
(d3cl, s2c1, t2p1, xs) =>
let
  val () =
  println!("abstlst_find: s2c1 = ", s2c1)
in
  if
  (s2c0 = s2c1)
  then Some_vt(t2p1) else abstlst_find(xs, s2c0)
end
|
abstlst_impl
(d3cl, s2c1, t2p1, xs) =>
let
  val () =
  println!("abstlst_find: s2c1 = ", s2c1)
in
  if
  (s2c0 = s2c1)
  then Some_vt(t2p1) else abstlst_find(xs, s2c0)
end
end (* abstlst_find] *)
} (* end of [abstenv_find] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_trans33_envmap.dats] *)
