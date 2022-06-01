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
#staload
_(*TMP*) =
"./../DATS/statyp2_utils0.dats"
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

#define
LOC0 the_location_dummy

(* ****** ****** *)

implement
fprint_val<t2ype> = fprint_t2ype

(* ****** ****** *)
//
datavtype
tr3xenv =
TR3XENV of tr3xstk
//
and
tr3xstk =
//
| tr3xstk_nil of ()
//
//
| tr3xstk_let1 of tr3xstk
(*
| tr3xstk_loc1 of tr3xstk
| tr3xstk_loc2 of tr3xstk
*)
//
| tr3xstk_dvar of (d2var, tr3xstk)
| tr3xstk_dpat of (d3pat, tr3xstk)
//
| tr3xstk_fix1 of (d2var, tr3xstk)
//
| tr3xstk_lams of (f3arglst, tr3xstk)
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
//
val () =
(
case+ xs of
|
tr3xstk_nil() => ()
| _(* non-nil *) =>
   (xs := tr3xstk_let1(xs))
)
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
(
case+ xs of
|
tr3xstk_nil() => ()
| _(* non-nil *) =>
   (xs := tr3xstk_loc1(xs))
)
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
(
case+ xs of
|
tr3xstk_nil() => ()
| _(* non-nil *) =>
   (xs := tr3xstk_loc2(xs))
)
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
//
val () =
(
case+ xs of
|
tr3xstk_nil() => ()
| _(* non-nil *) =>
   (xs := auxstk(xs))
)
//
} where
{
//
fun
auxstk
(xs: tr3xstk): tr3xstk =
(
case- xs of
|
~tr3xstk_let1(xs) => xs
|
~tr3xstk_dvar(_, xs) => auxstk(xs)
|
~tr3xstk_dpat(_, xs) => auxstk(xs)
) (* end of [auxstk] *)
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
val () = (xs := auxstk(xs))
//
} where
{
fun // HX-2020-05-26: 
auxstk // it does nothing!
(xs: tr3xstk): tr3xstk = xs
} (* end of [tr3xenv_pop_loc12] *)

(* ****** ****** *)

implement
tr3xenv_add_dvar
  (env, d2v) =
( fold@(env) ) where
{
//
val+
@TR3XENV(xs) = env
//
val () =
(
case+ xs of
|
tr3xstk_nil() => ()
| _ (* else *) =>
  (xs := tr3xstk_dvar(d2v, xs))
)
//
} (* end of [tr3xenv_add_dvar] *)

(* ****** ****** *)

implement
tr3xenv_add_dpat
  (env, d3p) =
( fold@(env) ) where
{
//
val+
@TR3XENV(xs) = env
//
val () =
(
case+ xs of
|
tr3xstk_nil() => ()
| _ (* else *) =>
  (xs := tr3xstk_dpat(d3p, xs))
)
//
} (* end of [tr3xenv_add_dpat] *)

(* ****** ****** *)

implement
tr3xenv_add_fix1
  (env, d2f0) =
( fold@(env) ) where
{
//
val+
@TR3XENV(xs) = env
//
val () =
(xs := tr3xstk_fix1(d2f0, xs))
//
} (* end of [tr3xenv_add_fix1] *)

implement
tr3xenv_add_lams
  (env, f3as) =
( fold@(env) ) where
{
//
val+
@TR3XENV(xs) = env
//
val
f3as =
list_vt2t
(list_reverse(f3as))
val () =
(xs := tr3xstk_lams(f3as, xs))
//
} (* end of [tr3xenv_add_lams] *)

(* ****** ****** *)

implement
tr3xenv_pop_fix1
  (env) =
( fold@(env) ) where
{
//
val+
@TR3XENV(xs) = env
//
val () = (xs := auxstk(xs))
//
} where
{
//
fun
auxstk
(xs: tr3xstk): tr3xstk =
(
case- xs of
| ~tr3xstk_fix1(_, xs) => xs
) (* end of [auxstk] *)
//
} (* end of [tr3xenv_pop_fix1] *)

implement
tr3xenv_pop_lams
  (env) =
( fold@(env) ) where
{
//
val+
@TR3XENV(xs) = env
//
val () = (xs := auxstk(xs))
//
} where
{
//
fun
auxstk
(xs: tr3xstk): tr3xstk =
(
case- xs of
|
~tr3xstk_lams(_, xs) => xs
|
~tr3xstk_let1(xs) => auxstk(xs)
|
~tr3xstk_dvar(_, xs) => auxstk(xs)
|
~tr3xstk_dpat(_, xs) => auxstk(xs)
) (* end of [auxstk] *)
//
} (* end of [tr3xenv_pop_lams] *)

(* ****** ****** *)
//
implement
tr3xenv_make_nil
  ((*void*)) =
(
  TR3XENV(tr3xstk_nil())
)
//
(* ****** ****** *)
//
implement
tr3xenv_free_nil
  (env0) =
(
  auxstk(stk0)
) where
{
//
val-
~TR3XENV(stk0) = env0
//
fun
auxstk
(xs: tr3xstk): void =
(
case- xs of ~tr3xstk_nil() => ()
)
//
} (* end of [tr3xstk_free_top] *)
//
(* ****** ****** *)
//
implement
tr3xenv_nilq
  (env0) =
(
not(tr3xenv_consq(env0))
)
//
implement
tr3xenv_consq
  (env0) =
(
  auxstk(stk0)
) where
{
//
val-
TR3XENV(stk0) = env0
//
fun
auxstk
(xs: !tr3xstk): bool =
(
case+ xs of
|
tr3xstk_nil() => false
|
_ (* end-of-tr3xstk *) => true
)
//
} (* end of [tr3xstk_nilq] *)
//
(* ****** ****** *)

implement
tr3xenv_dvar_kind
  (env0, d2v0) =
let
//
fun
auxstk0
(xs: !tr3xstk): int =
(
case+ xs of
|
tr3xstk_let1
  (xs) => auxstk0(xs)
//
|
tr3xstk_dvar(d2v1, xs) =>
( if
  test
  then VLOC else auxstk0(xs)
) where
{ val test = (d2v0 = d2v1) }
|
tr3xstk_dpat(d3p1, xs) =>
( if
  test
  then VLOC else auxstk0(xs)
) where
{ val
  test =
  d3pat_memq_dvar(d3p1, d2v0)
}
|
tr3xstk_lams
( f3as, xs ) =>
(
  aux0(f3as, xs)
) where
{
fun
aux0
( f3as
: f3arglst
, xs: !tr3xstk): int =
(
case+ f3as of
|
list_nil
() => auxstk0(xs)
|
list_cons
(f3a0, f3as) =>
(
case+
f3a0.node() of
|
F3ARGsome_dyn
( npf, d3ps ) =>
( if
  test
  then VLOC else aux1(f3as, xs)
) where
{
  val test =
  d3patlst_memq_dvar(d3ps, d2v0)
}
//
| _(* else *) => aux0(f3as, xs)
//
)
)
and
aux1
( f3as
: f3arglst
, xs: !tr3xstk): int =
( if
  test
  then VENV else auxstk1(xs)
) where
{
  val
  test =
  f3arglst_memq_dvar(f3as, d2v0)
}
} (* end of [tr3xstk_lams] *)
//
| _ (* for non-locals *) => VTOP
) (* end of [auxstk0] *) 
//
and
auxstk1
(xs: !tr3xstk): int =
(
case+ xs of
|
tr3xstk_let1
  (xs) => auxstk1(xs)
|
tr3xstk_dvar(d2v1, xs) =>
( if
  test
  then VENV else auxstk1(xs)
) where
{ val test = (d2v0 = d2v1) }
|
tr3xstk_dpat(d3p1, xs) =>
( if
  test
  then VENV else auxstk1(xs)
) where
{ val
  test =
  d3pat_memq_dvar(d3p1, d2v0)
}
//
|
tr3xstk_fix1(d2f0, xs) =>
( if
  (d2f0 = d2v0)
  then VFIX else auxstk1(xs)
)
|
tr3xstk_lams(f3as, xs) =>
( if
  test
  then VENV else auxstk1(xs)
) where
{ val
  test =
  f3arglst_memq_dvar(f3as, d2v0)
}
//
| _ (* for top-levels *) => (VTOP)
//
)
//
in
let
val-
TR3XENV(stk0) = env0 in auxstk0(stk0)
end
end (* end of [tr3xenv_dvar_kind] *)
//
(* ****** ****** *)

end (*local*) // end of [local]

(* ****** ****** *)

(* end of [xats_trans3x_envmap.dats] *)
