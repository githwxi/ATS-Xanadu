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

#staload "./../SATS/statyp2.sats"
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
#staload "./../SATS/dynexp4.sats"

(* ****** ****** *)

#staload "./../SATS/trans34.sats"

(* ****** ****** *)
//
datavtype
tr34env =
TR34ENV of
(abststk, dvarstk)
//
(* ****** ****** *)
//
and abststk =
//
| abststk_nil of ()
//
| abststk_let1 of abststk
| abststk_loc1 of abststk
| abststk_loc2 of abststk
//
| abststk_open of
  (d3ecl, s2cst, s2exp, abststk)
| abststk_impl of
  (d3ecl, s2cst, s2exp, abststk)
//
(* ****** ****** *)
//
and dvarstk =
//
| dvarstk_nil of ()
//
| dvarstk_fun0 of dvarstk
//
| dvarstk_let1 of dvarstk
| dvarstk_loc1 of dvarstk
| dvarstk_loc2 of dvarstk
//
| dvarstk_clau of dvarstk
//
| dvarstk_locs of (d2var, dvarstk)
| dvarstk_cons of (d2var, s2exp, dvarstk)
//
(* ****** ****** *)

absimpl
tr34env_vtype = tr34env

(* ****** ****** *)
//
implement
tr34env_make_nil() =
TR34ENV
(abststk_nil(), dvarstk_nil())
//
(* ****** ****** *)
//
implement
tr34env_free_nil
  (env0) = () where
{
//
val+
~TR34ENV(tstk, dstk) = env0
//
val () =
case- tstk of ~abststk_nil() => ()
val () =
case- dstk of ~dvarstk_nil() => ()
//
} (* end of [tr34env_free_nil] *)
//
(* ****** ****** *)
//
local
//
fun
auxtstk
( tstk
: abststk): void =
(
case- tstk of
|
~abststk_nil() => ()
|
~abststk_open
( d3cl
, s2c1
, s2e1
, tstk) => auxtstk(tstk)
) (* end of [auxtstk] *)
//
fun
auxdstk
( dstk
: dvarstk): void =
(
case- dstk of
|
~dvarstk_nil() => ()
|
~dvarstk_locs
( d2v1
, dstk) => auxdstk(dstk)
|
~dvarstk_cons
( d2v1
, s2e1
, dstk) => auxdstk(dstk)
) (* end of [auxdstk] *)
//
in(*in-of-local*)
//
implement
tr34env_free_top
  (env0) =
{
  val () = auxtstk(tstk)
  val () = auxdstk(dstk)
} where {
//
val+
~TR34ENV(tstk, dstk) = env0
//
} (* end of [tr34env_free_top] *)
//
end // end of [local]
//
(* ****** ****** *)
//
implement
tr34env_add_fun0
  (env0) =
(
case+ env0 of
|
@TR34ENV(tstk, dstk) =>
(
  fold@(env0)) where
{
val () =
( dstk := dvarstk_fun0(dstk) )
}
) (* end of [tr34env_add_fun0] *)
//
implement
tr34env_pop_fun0
  (env0) =
(
case+ env0 of
|
@TR34ENV(tstk, dstk) =>
(
  fold@(env0)) where
{
val () = (dstk := auxdstk(dstk))
}
) where
{
fun
auxdstk
( dstk
: dvarstk): dvarstk =
(
case- dstk of
| ~
dvarstk_fun0
( dstk ) => dstk
| ~
dvarstk_locs
(d2v1, dstk) => auxdstk(dstk)
| ~
dvarstk_cons
(d2v1, s2e1, dstk) => auxdstk(dstk)
)
} (* end of [tr34env_pop_fun0] *)
//
(* ****** ****** *)
//
implement
tr34env_add_let1
  (env0) =
(
case+ env0 of
|
@TR34ENV(tstk, dstk) =>
(
  fold@(env0)) where
{
val () =
( dstk := dvarstk_let1(dstk) )
}
) (* end of [tr34env_add_let1] *)
//
implement
tr34env_pop_let1
  (env0) =
(
case+ env0 of
|
@TR34ENV(tstk, dstk) =>
(
  fold@(env0)) where
{
val () = (dstk := auxdstk(dstk))
}
) where
{
fun
auxdstk
( dstk
: dvarstk): dvarstk =
(
case- dstk of
| ~
dvarstk_let1
( dstk ) => dstk
| ~
dvarstk_locs
(d2v1, dstk) => auxdstk(dstk)
| ~
dvarstk_cons
(d2v1, s2e1, dstk) => auxdstk(dstk)
)
} (* end of [tr34env_pop_let1] *)
//
(* ****** ****** *)

local

fun
auxdstk
( stmp:
& stmap >> _
, dstk
: !dvarstk ): void =
(
//
case- dstk of
|
dvarstk_fun0 _ => ((*void*))
|
dvarstk_locs
(d2v1, dstk) => auxdstk(stmp, dstk)
|
dvarstk_cons
(d2v1, s2e2, dstk) =>
let
val
ans =
stmap_insert
( stmp
, d2v1, s2e2) in auxdstk(stmp, dstk)
end // [dvarstk_cons]
//
) (* end of [auxdstk] *)

in(*in-of-local*)

implement
tr34env_stmap_fun0
  ( env0 ) =
  ( stmp ) where
{
//
val+
TR34ENV(_, dstk) = env0
//
var
stmp:
stmap = stmap_nil((*void*))
//
val
((*void*)) = auxdstk(stmp, dstk)
//
} (*where*) // end of [tr34env_stmap_fun0]
  
end // end of [local]

(* ****** ****** *)

local

fun
auxdstk
( d2vs
: dlocs
, dstk
: !dvarstk ): dlocs =
(
//
case- dstk of
|
dvarstk_let1 _ => d2vs
//
|
dvarstk_locs
(d2v1, dstk) => let
val
d2vs =
dlocs_insert
(d2vs, d2v1) in auxdstk(d2vs, dstk)
end // [dvarstk_locs]
//
|
dvarstk_cons
( d2v1
, s2e2, dstk) => auxdstk(d2vs, dstk)
//
) (* end of [auxdstk] *)

in(*in-of-local*)

implement
tr34env_dlocs_let1
  ( env0 ) =
  ( d2vs ) where
{
//
val+
TR34ENV(_, dstk) = env0
//
val
d2vs:
dlocs = dlocs_nil((*void*))
//
val d2vs = auxdstk(d2vs, dstk)
//
} (*where*) // end of [tr34env_dlocs_let1]
  
end // end of [local]

(* ****** ****** *)

local

fun
auxdstk
( stmp:
& stmap >> _
, dstk
: !dvarstk ): void =
(
//
case- dstk of
|
dvarstk_let1 _ => ((*void*))
|
dvarstk_locs
(d2v1, dstk) => auxdstk(stmp, dstk)
|
dvarstk_cons
(d2v1, s2e2, dstk) =>
let
val
ans =
stmap_insert
( stmp
, d2v1, s2e2) in auxdstk(stmp, dstk)
end // [dvarstk_cons]
//
) (* end of [auxdstk] *)

in(*in-of-local*)

implement
tr34env_stmap_let1
  ( env0 ) =
  ( stmp ) where
{
//
val+
TR34ENV(_, dstk) = env0
//
var
stmp:
stmap = stmap_nil((*void*))
//
val
((*void*)) = auxdstk(stmp, dstk)
//
} (*where*) // end of [tr34env_stmap_let1]
  
end // end of [local]

(* ****** ****** *)
//
implement
tr34env_add_denvs_let1
( env0, d2vs, stmp ) =
let
val
kxs0 =
stmap_listize(stmp)
in
let
var
stmp = stmp
val () =
auxlst
(env0, stmp, kxs0) in stmp
end
end where
{
fun
auxlst
( env0:
! tr34env
, stmp
: &stmap >> _
, kxs0
: List0_vt
  (@(d2var, s2exp))): void =
(
case+ kxs0 of
| ~
list_vt_nil() => ()
| ~
list_vt_cons(kx0, kxs1) =>
let
val
d2v0 = kx0.0
in
//
if
dlocs_ismem
(d2vs, d2v0)
then // dloc-var
auxlst
(env0, stmp, kxs1)
else // denv-var
let
val () =
tr34env_add_dvar_sexp
( env0, d2v0, kx0.1 )
val-true =
stmap_remove
(stmp, d2v0) in auxlst(env0,stmp,kxs1)
end // end of [if]
//
end // end of [let]
) (* end of [auxlst] *)
} (*where*) // [tr34env_add_denvs_let1]
//
(* ****** ****** *)

local

fun
auxdstk
( stmp:
& stmap >> _
, dstk
: !dvarstk ): void =
(
//
case- dstk of
|
dvarstk_clau _ => ((*void*))
|
dvarstk_locs
(d2v1, dstk) => auxdstk(stmp, dstk)
|
dvarstk_cons
(d2v1, s2e2, dstk) =>
let
val
ans =
stmap_insert
( stmp
, d2v1, s2e2) in auxdstk(stmp, dstk)
end // [dvarstk_cons]
//
) (* end of [auxdstk] *)

in(*in-of-local*)

implement
tr34env_stmap_clau
  ( env0 ) =
  ( stmp ) where
{
//
val+
TR34ENV(_, dstk) = env0
//
var
stmp:
stmap = stmap_nil((*void*))
//
val
((*void*)) = auxdstk(stmp, dstk)
//
} (*where*) // end of [tr34env_stmap_clau]
  
end // end of [local]

(* ****** ****** *)
//
local
//
fun
dvarstk_find
( dstk:
! dvarstk
, d2v0: d2var): s2exp =
(
case+ dstk of
|
dvarstk_nil() =>
the_s2exp_none0(*void*)
//
|
dvarstk_fun0
( dstk ) =>
dvarstk_find(dstk, d2v0)
|
dvarstk_let1
( dstk ) =>
dvarstk_find(dstk, d2v0)
|
dvarstk_loc1
( dstk ) =>
dvarstk_find(dstk, d2v0)
|
dvarstk_loc2
( dstk ) =>
dvarstk_find(dstk, d2v0)
//
|
dvarstk_clau
( dstk ) =>
dvarstk_find(dstk, d2v0)
//
|
dvarstk_locs
(d2v1, dstk) =>
dvarstk_find(dstk, d2v0)
|
dvarstk_cons
(d2v1, s2e1, dstk) =>
if
(d2v0=d2v1)
then (s2e1)
else dvarstk_find(dstk, d2v0)
//
)
//
in(* in-of-local *)
//
implement
tr34env_d2var_get_sexp
( env0, d2v0 ) =
(
case+ env0 of
|
TR34ENV
(_, dstk) => dvarstk_find(dstk, d2v0)
)
//
end // end of [local]
//
(* ****** ****** *)
//
implement
tr34env_add_dvar
( env0, d2v0 ) =
(
case+ env0 of
|
@TR34ENV
(_, dstk) =>
(
  fold@(env0)) where
{
val () =
dstk := dvarstk_locs(d2v0, dstk)
}
) where
{
//
(*
val () =
println!
("tr34env_add_dvar: d2v0 = ", d2v0)
*)
//
} (*where*) // end of [tr34env_add_dvar]
//
(* ****** ****** *)
//
implement
tr34env_add_dvar_sexp
( env0, d2v0, s2e0 ) =
(
case+ env0 of
|
@TR34ENV
(_, dstk) =>
(
  fold@(env0)) where
{
val () =
dstk := dvarstk_cons(d2v0, s2e0, dstk)
}
) where
{
//
(*
val () =
println!
("tr34env_add_dvar_sexp: d2v0 = ", d2v0)
val () =
println!
("tr34env_add_dvar_sexp: s2e0 = ", s2e0)
*)
//
} (*where*) // end of [tr34env_add_dvar_sexp]
//
(* ****** ****** *)

(* end of [xats_trans34_envmap.dats] *)
