(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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

#staload "./../SATS/trans3x.sats"

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
datavtype
tr3xenv =
TR3XENV of tr3xlst
//
and
tr3xlst =
//
| tr3xlst_nil of ()
//
| tr3xlst_lam0 of tr3xlst
| tr3xlst_fix0 of (d2var, tr3xlst)
//
| tr3xlst_let1 of tr3xlst
(*
| tr3xlst_loc1 of tr3xlst
| tr3xlst_loc2 of tr3xlst
*)
//
| tr3xlst_dpat of (d3pat, tr3xlst)
| tr3xlst_farg of (f3arg, tr3xlst)
//
(* ****** ****** *)

local

absimpl
tr3xenv_vtype = tr3xenv

in(*in-of-local*)

(* ****** ****** *)

implement
tr3xenv_add_let1
  (env) =
( fold@(env) ) where
{
//
val+
@TR3XENV(xs) = env
val () =
(xs := tr3xlst_let1(xs))
//
} (* end of [tr3xenv_add_let1] *)

(* ****** ****** *)

implement
tr3xenv_add_loc1
  (env) =
( fold@(env) ) where
{
//
val+
@TR3XENV(xs) = env
(*
val () =
(xs := tr3xlst_loc1(xs))
*)
//
} (* end of [tr3xenv_add_loc1] *)

(* ****** ****** *)

implement
tr3xenv_add_loc2
  (env) =
( fold@(env) ) where
{
//
val+
@TR3XENV(xs) = env
(*
val () =
(xs := tr3xlst_loc2(xs))
*)
//
} (* end of [tr3xenv_add_loc2] *)

(* ****** ****** *)

implement
tr3xenv_pop_let1
  (env) =
( fold@(env) ) where
{
//
val+
@TR3XENV(xs) = env
val () = (xs := auxlst(xs))
//
} where
{
//
fun
auxlst
(xs: tr3xlst): tr3xlst =
(
case- xs of
|
~tr3xlst_let1(xs) => xs
|
~tr3xlst_dpat(_, xs) => auxlst(xs)
) (* end of [auxlst] *)
//
} (* end of [tr3xenv_pop_let1] *)

(* ****** ****** *)

implement
tr3xenv_pop_loc12
  (env) =
( fold@(env) ) where
{
//
val+
@TR3XENV(xs) = env
val () = (xs := auxlst(xs))
//
} where
{
fun
auxlst(xs: tr3xlst): tr3xlst = xs
} (* end of [tr3xenv_pop_loc12] *)

(* ****** ****** *)
//
implement
tr3xenv_make_nil
  ((*void*)) =
(
  TR3XENV(tr3xlst_nil())
)
//
(* ****** ****** *)

implement
tr3xenv_add_dpat
  (env, d3p) =
( fold@(env) ) where
{
//
val+
@TR3XENV(xs) = env
val () =
(xs := tr3xlst_dpat(d3p, xs))
//
} (* end of [tr3xenv_add_dpat] *)

(* ****** ****** *)
//
implement
tr3xenv_free_top
  (env0) =
(
  auxlst(lst0)
) where
{
//
val-
~TR3XENV(lst0) = env0
//
fun
auxlst
(xs: tr3xlst): void =
(
case- xs of
|
~tr3xlst_nil() => ()
|
~tr3xlst_dpat(_, xs) => auxlst(xs)
|
~tr3xlst_farg(_, xs) => auxlst(xs)
)
//
} (* end of [tr3xlst_free_all] *)
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_trans3x_envmap.dats] *)
