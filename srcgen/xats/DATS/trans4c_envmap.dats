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
// Start Time: May 22nd, 2021
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

#staload "./../SATS/cstrnt1.sats"
#staload "./../SATS/trans4c.sats"

(* ****** ****** *)
//
datavtype
tr4cenv =
TR4cENV of c1itmstk
//
and c1itmstk =
//
| c1itmstk_nil of ()
//
| c1itmstk_if0 of (c1itmstk)
| c1itmstk_cas0 of (c1itmstk)
//
| c1itmstk_bloc of (c1itmstk)
//
| c1itmstk_fun0 of (c1itmstk)
//
| c1itmstk_cons of (c1itm, c1itmstk)
//
(* ****** ****** *)

absimpl
tr4cenv_vtype = tr4cenv

(* ****** ****** *)
//
implement
tr4cenv_make_nil
  ((*void*)) =
(
  TR4cENV(c1itmstk_nil((*void*)))
)
//
(* ****** ****** *)
//
implement
tr4cenv_free_top
  (env0) =
(
let
val
c1is = list_vt_nil()
val+
~TR4cENV(stk0) = env0
in
list_vt2t(auxmain(stk0, c1is))
end
) where
{
fun
auxmain
( stk0
: c1itmstk
, c1is
: c1itmlst_vt): c1itmlst_vt =
(
case- stk0 of
| ~
c1itmstk_nil
((*void*)) =>
list_vt_reverse(c1is)
| ~
c1itmstk_cons
(c1i1, stk1) =>
auxmain
(stk1, list_vt_cons(c1i1, c1is))
)
} (*where*) // [tr4cenv_free_top]
//
(* ****** ****** *)

implement
tr4cenv_add_if0
  (env0) = let
//
val+
@TR4cENV(stk0) = env0
//
in
stk0 :=
c1itmstk_if0(stk0); fold@(env0)
end // end of [tr4cenv_add_if0]

(* ****** ****** *)

implement
tr4cenv_add_cas0
  (env0) = let
//
val+
@TR4cENV(stk0) = env0
//
in
stk0 :=
c1itmstk_cas0(stk0); fold@(env0)
end // end of [tr4cenv_add_cas0]

(* ****** ****** *)

implement
tr4cenv_add_bloc
  (env0) = let
//
val+
@TR4cENV(stk0) = env0
//
in
stk0 :=
c1itmstk_bloc(stk0); fold@(env0)
end // end of [tr4cenv_add_bloc]

(* ****** ****** *)

implement
tr4cenv_add_fun0
  (env0) = let
//
val+
@TR4cENV(stk0) = env0
//
in
stk0 :=
c1itmstk_fun0(stk0); fold@(env0)
end // end of [tr4cenv_add_fun0]

(* ****** ****** *)
//
implement
tr4cenv_add_svar
  (env0, s2v0) =
(
tr4cenv_add_citm(env0, C1Isvar(s2v0))
)
implement
tr4cenv_add_chyp
  (env0, chyp) =
(
tr4cenv_add_citm(env0, C1Ichyp(chyp))
)
implement
tr4cenv_add_cstr
  (env0, cstr) =
(
tr4cenv_add_citm(env0, C1Icstr(cstr))
)
//
(* ****** ****** *)
//
implement
tr4cenv_add_citm
  (env0, citm) = let
//
val+
@TR4cENV(stk0) = env0
//
val () =
println!
("tr4cenv_add_citm: citm = ", citm)
//
in
stk0 :=
c1itmstk_cons(citm, stk0); fold@(env0)
end // end of [tr4cenv_add_citm]
//
(* ****** ****** *)

implement
tr4cenv_pop_if0
  (env0) = let
//
val+
@TR4cENV(stk0) = env0
//
val
( stk1
, c1is) =
auxmain(stk0, list_nil())
//
in
stk0 := stk1; fold@(env0); c1is
end where
{
fun
auxmain
( stk1: c1itmstk
, c1is: c1itmlst)
: (c1itmstk, c1itmlst) =
(
case- stk1 of
| ~
c1itmstk_if0
(stk1) => (stk1, c1is)
| ~
c1itmstk_cons(c1i1, stk1) =>
auxmain(stk1, list_cons(c1i1, c1is))
)
} (*where*) // end of [tr4cenv_pop_if0]

(* ****** ****** *)

implement
tr4cenv_pop_cas0
  (env0) = let
//
val+
@TR4cENV(stk0) = env0
//
val
( stk1
, c1is) =
auxmain(stk0, list_nil())
//
in
stk0 := stk1; fold@(env0); c1is
end where
{
fun
auxmain
( stk1: c1itmstk
, c1is: c1itmlst)
: (c1itmstk, c1itmlst) =
(
case- stk1 of
| ~
c1itmstk_cas0
(stk1) => (stk1, c1is)
| ~
c1itmstk_cons(c1i1, stk1) =>
auxmain(stk1, list_cons(c1i1, c1is))
)
} (*where*) // end of [tr4cenv_pop_cas0]

(* ****** ****** *)

implement
tr4cenv_pop_bloc
  (env0) = let
//
val+
@TR4cENV(stk0) = env0
//
val
( stk1
, c1is) =
auxmain(stk0, list_nil())
//
in
stk0 := stk1; fold@(env0); c1is
end where
{
fun
auxmain
( stk1: c1itmstk
, c1is: c1itmlst)
: (c1itmstk, c1itmlst) =
(
case- stk1 of
| ~
c1itmstk_bloc
(stk1) => (stk1, c1is)
| ~
c1itmstk_cons(c1i1, stk1) =>
auxmain(stk1, list_cons(c1i1, c1is))
)
} (*where*) // end of [tr4cenv_pop_bloc]

(* ****** ****** *)

implement
tr4cenv_pop_fun0
  (env0) = let
//
val+
@TR4cENV(stk0) = env0
//
val
( stk1
, c1is) =
auxmain(stk0, list_nil())
//
in
stk0 := stk1; fold@(env0); c1is
end where
{
fun
auxmain
( stk1: c1itmstk
, c1is: c1itmlst)
: (c1itmstk, c1itmlst) =
(
case- stk1 of
| ~
c1itmstk_fun0
(stk1) => (stk1, c1is)
| ~
c1itmstk_cons(c1i1, stk1) =>
auxmain(stk1, list_cons(c1i1, c1is))
)
} (*where*) // end of [tr4cenv_pop_fun0]

(* ****** ****** *)

(* end of [xats_trans4c_envmap.dats] *)
