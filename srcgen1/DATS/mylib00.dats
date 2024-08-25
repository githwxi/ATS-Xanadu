(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
// Sat 24 Aug 2024 11:51:24 PM EDT
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/mylib00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
implement
{x}(*tmp*)
list_foritm
  ( xs ) = let
//
var env: void = ()
//
in//let
list_foritm_env<x><void>(xs, env)
end//let//end-of-[list_foritm(xs)]
//
(* ****** ****** *)
//
implement
{x}{env}
list_foritm_env
  (xs, env) = let
//
prval() =
lemma_list_param(xs)
//
fun
loop
{n:nat} .<n>.
(
  xs: list(x, n), env: &env
) : void = let
in
//
case+ xs of
|
list_nil() => ()
|
list_cons(x, xs) =>
(
  loop(xs, env)) where
{
val () =
list_foritm$work<x><env>(x, env) }
//
end // end of [loop]
//
in
  loop(xs, env)
end//let//end-of-[list_foritm_env(xs, env)]
//
(* ****** ****** *)
(* ****** ****** *)
//
implement
{x}(*tmp*)
list_vt_foritm
  ( xs ) = let
//
var env: void = ()
//
in//let
list_vt_foritm_env<x><void>(xs, env)
end//let//end-of-[list_vt_foritm(xs)]
//
(* ****** ****** *)
//
implement
{x}{env}
list_vt_foritm_env
  (xs, env) = let
//
prval() =
lemma_list_vt_param(xs)
//
fun loop
  {n:nat} .<n>.
(
  xs:
! list_vt(x, n), env: &env
) : void = let
in
//
case+ xs of
|
list_vt_nil() => ()
| @
list_vt_cons
  (x, xs1) =>
(
loop(xs1, env); fold@(xs)
) where
{
val () =
list_vt_foritm$work<x><env>(x, env) }
//
end // end of [loop]
//
in
  loop(xs, env)
end//let//end-of-[list_vt_foritm_env(xs, env)]
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [xats_mylib00.dats] *)
