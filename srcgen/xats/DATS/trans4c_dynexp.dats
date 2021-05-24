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

#staload "./../SATS/dynexp4.sats"

(* ****** ****** *)

#staload "./../SATS/trans4c.sats"

(* ****** ****** *)

implement
trans4c_envless
  (prog) =
  (cstr) where
{
//
val
env0 =
tr4cenv_make_nil()
//
val () =
trans4c_declist(env0, prog)
//
val
cstr = tr4cenv_free_top(env0)
//
} (* end of [trans4c_envless] *)

(* ****** ****** *)

implement
trans4c_dpat
(env0, d4p0) =
let
val () =
println!
("trans4c_dpat: d4p0 = ", d4p0)
in
//
case+
d4p0.node() of
//
| _ (*rest-of-d4pat*) => ((*void*))
//
end (*let*) // end of [trans4c_dpat]

(* ****** ****** *)
//
implement
trans4c_dpatlst
(env0, d4ps) =
(
case+ d4ps of
|
list_nil() => ()
|
list_cons(d4p0, d4ps) =>
{
  val () =
  trans4c_dpat(env0, d4p0)
  val () =
  trans4c_dpatlst(env0, d4ps)
}
) (* end of [trans4c_dpatlst] *)
//
(* ****** ****** *)

implement
trans4c_dexp
(env0, d4e0) =
let
val () =
println!
("trans4c_dexp: d4e0 = ", d4e0)
in
//
case+
d4e0.node() of
//
| _ (*rest-of-d4exp*) => ((*void*))
//
end (*let*) // end of [trans4c_dexp]

(* ****** ****** *)
//
implement
trans4c_dexplst
(env0, d4es) =
(
case+ d4es of
|
list_nil() => ()
|
list_cons(d4e0, d4es) =>
{
  val () =
  trans4c_dexp(env0, d4e0)
  val () =
  trans4c_dexplst(env0, d4es)
}
) (* end of [trans4c_dexplst] *)
//
(* ****** ****** *)

implement
trans4c_decl
(env0, d4cl) =
let
val () =
println!
("trans4c_decl: d4cl = ", d4cl)
in
//
case+
d4cl.node() of
//
| _ (*rest-of-d4ecl*) => ((*void*))
//
end (*let*) // end of [trans4c_decl]

(* ****** ****** *)

implement
trans4c_declist
(env0, dcls) =
(
case+ dcls of
|
list_nil() => ()
|
list_cons(d4cl, dcls) =>
{
  val () =
  trans4c_decl(env0, d4cl)
  val () =
  trans4c_declist(env0, dcls)
}
) (* end of [trans4c_declist] *)

(* ****** ****** *)

(* end of [xats_trans4c_dynexp.dats] *)
