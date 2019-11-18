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
// Start Time: November, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
// HX-2019-11-10:
// level-1 interpreter for syncheck!
//
(* ****** ****** *)
//
#include
"share\
/atspre_staload.hats"
#staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#include
"./../HATS/libxatsopt.hats"
//
(* ****** ****** *)

#staload "./../SATS/interp0.sats"

(* ****** ****** *)

implement
interp0_program
  (irdcls) =
let
//
val
env0 =
intpenv_make_nil()
//
val () =
interp0_irdclist
  (env0, irdcls)
//
val () =
intpenv_free_nil(env0)
//
in
  // nothing
end // end of [interp0_program]

(* ****** ****** *)

implement
interp0_irdcl
  (env0, x0) =
let
// (*
val () =
println!
("interp0_irdcl: x0 = ", x0)
// *)
in
case+ x0 of
| _ (* rest-of-ir0dcl *) => ()
end // end of [interp0_irdcl]

implement
interp0_irdclist
  (env0, xs) =
(
case+ xs of
| list_nil() => ()
| list_cons(x0, xs) =>
  (
    interp0_irdclist(env0, xs)
  ) where
  {
    val () = interp0_irdcl(env0, x0)
  }
) (* end of [interp0_irdclist] *)

(* ****** ****** *)

(* end of [xint_interp0_dynexp.dats] *)
