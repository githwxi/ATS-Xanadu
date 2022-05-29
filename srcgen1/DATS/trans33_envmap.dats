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
// Start Time: September, 2019
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
ABSTENV of abststk
//
and
abststk =
//
| abststk_nil of ()
//
| abststk_let1 of abststk
| abststk_loc1 of abststk
| abststk_loc2 of abststk
//
| abststk_open of
  (d3ecl, s2cst, t2ype, abststk)
| abststk_impl of
  (d3ecl, s2cst, t2ype, abststk)
//
(* ****** ****** *)

local

(* ****** ****** *)

absimpl
abstenv_vtype = abstenv

(* ****** ****** *)

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
(xs := abststk_let1(xs))
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
(xs := abststk_loc1(xs))
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
(xs := abststk_loc2(xs))
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
//
val () =
(xs := auxstk(xs))
//
} where
{
//
fun
auxstk
(xs: abststk): abststk =
(
case- xs of
//
| ~abststk_let1(xs) => xs
//
| ~abststk_open
   (_, _, _, xs) => auxstk(xs)
| ~abststk_impl
   (_, _, _, xs) => auxstk(xs)
//
) (* end of [abststk_pop_let1] *)
//
} (* end of [abstenv_pop_let1] *)

(* ****** ****** *)

implement
abstenv_pop_loc12
  (env) = let
//
val+
@ABSTENV(xs) = env
//
val () =
(xs := auxstk0(xs))
//
in
  fold@(env) // nothing
end where
{
fun
auxstk0
(xs: abststk): abststk =
(
auxstk1(xs, abststk_nil())
)
and
auxstk1
( xs
: abststk
, ys
: abststk): abststk =
(
case- xs of
|
~abststk_loc2
   (xs) => auxstk2(xs, ys)
|
~abststk_open
   (d3cl, s2c0, t2p1, xs) =>
 (
   auxstk1
   ( xs
   , abststk_open
     (d3cl, s2c0, t2p1, ys))
 )
|
~abststk_impl
   (d3cl, s2c0, t2p1, xs) =>
 (
   auxstk1
   ( xs
   , abststk_impl
     (d3cl, s2c0, t2p1, ys))
 )
)
and
auxstk2
( xs
: abststk
, ys
: abststk): abststk =
(
case- xs of
|
~abststk_loc1
 (xs) => auxstk3(xs, ys)
|
~abststk_open
 (d3cl, _, _, xs) => auxstk2(xs, ys)
|
~abststk_impl
 (d3cl, _, _, xs) => auxstk2(xs, ys)
)
and
auxstk3
( xs
: abststk
, ys
: abststk): abststk =
(
case- ys of
|
~abststk_nil() => xs
|
~abststk_open
 (d3cl, s2c0, t2p1, ys) =>
 (
   auxstk3(xs, ys) where
   {
   val xs =
   abststk_open(d3cl, s2c0, t2p1, xs)
   }
 )
|
~abststk_impl
 (d3cl, s2c0, t2p1, ys) =>
 (
   auxstk3(xs, ys) where
   {
   val xs =
   abststk_impl(d3cl, s2c0, t2p1, xs)
   }
 )
) (* end of [auxstk3] *)
//
} (* end of [implenv_pop_loc12] *)

(* ****** ****** *)
//
implement
abstenv_make_nil
  ((*void*)) =
(
  ABSTENV(abststk_nil())
)
//
(* ****** ****** *)
//
implement
abstenv_free_top
  (env0) =
(
  auxstk(stk0)
) where
{
//
val-
~ABSTENV(stk0) = env0
//
fun
auxstk
(xs: abststk): void =
(
case- xs of
|
~abststk_nil() => ()
|
~abststk_open
 (_, _, _, xs) => auxstk(xs)
|
~abststk_impl
 (_, _, _, xs) => auxstk(xs)
)
} (* end of [abststk_free_all] *)
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
  abststk_open
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
(*
val () =
println!(
"abstenv_push_open: d3cl = ", d3cl
) (* end-of-val *)
*)
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
  abststk_impl
  (d3cl, s2c0, t2p0, xs)
end
) (* end of [val] *)
//
in
  fold@(env0) // nothing
end where
{
//
(*
val () =
println!
(
"abstenv_push_impl: d3cl = ", d3cl
) (* end-of-val *)
*)
//
val-
D3Cabsimpl
( tok
, is2c, def0) = d3cl.node((*void*))
//
val-
IMPLS2CST2(sqid, s2cs, opt0) = is2c
//
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
abststk_find(xs, s2c0)
in
let
prval () = fold@(env0) in opt0 end
end where
{
fun
abststk_find
( xs:
! abststk
, s2c0: s2cst
)
: Option_vt(t2ype) =
let
(*
val () =
println!
("abststk_find: s2c0 = ", s2c0)
*)
in
case+ xs of
//
|
abststk_nil() => None_vt((*void*))
//
|
abststk_let1(xs) => abststk_find(xs, s2c0)
|
abststk_loc1(xs) => abststk_find(xs, s2c0)
|
abststk_loc2(xs) => abststk_find(xs, s2c0)
//
|
abststk_open
(d3cl, s2c1, t2p1, xs) =>
let
(*
  val () =
  println!("abststk_find: s2c1 = ", s2c1)
*)
in
  if
  (s2c0 = s2c1)
  then Some_vt(t2p1) else abststk_find(xs, s2c0)
end
|
abststk_impl
(d3cl, s2c1, t2p1, xs) =>
let
(*
  val () =
  println!("abststk_find: s2c1 = ", s2c1)
*)
in
  if
  (s2c0 = s2c1)
  then Some_vt(t2p1) else abststk_find(xs, s2c0)
end
end (* abststk_find] *)
} (* end of [abstenv_find] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_trans33_envmap.dats] *)
