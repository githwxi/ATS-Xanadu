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
val () =
interp0_initize()
//
val
env0 =
intpenv_make_nil()
//
val () =
interp0_irdclist(env0, irdcls)
//
val () = intpenv_free_nil(env0)
//
in
  // nothing
end // end of [interp0_program]

(* ****** ****** *)

implement
interp0_irexp
  (env0, ire0) =
let
//
val () =
println!
("interp0_irexp: ire0 = ", ire0)
//
in
//
case+
ire0.node() of
//
(*
| IR0Eint(tok) =>
| IR0Ebtf(tok) =>
| IR0Estr(tok) =>
*)
//
| _(*rest-of-ir0exp*) => IR0Vnone1(ire0)
//
end // end of [interp0_irexp]

(* ****** ****** *)

implement
interp0_irexplst
  (env0, ires) =
(
case+ ires of
| list_nil() =>
  list_nil()
| list_cons(ire0, ires) =>
  (
    list_cons(irv0, irvs)
  ) where
  {
    val irv0 =
    interp0_irexp(env0, ire0)
    val irvs =
    interp0_irexplst(env0, ires)
  }
) (* end of [interp0_irexplst] *)

(* ****** ****** *)

implement
interp0_irexpopt
  (env0, opt1) =
(
case+ opt1 of
| None() =>
  None(*void*)
| Some(ire1) =>
  Some(interp0_irexp(env0, ire1))
) (* end of [interp0_irexpopt] *)

(* ****** ****** *)

local

fun
aux_valdecl
( env0
: !intpenv
, irdcl: ir0dcl): void =
let
val-
IR0Cvaldecl
( knd
, mopt
, irvds) = irdcl.node()
in
  interp0_ir0valdeclist(env0, irvds)
end // end of [aux_valdecl]

in(*in-of-local*)

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
case+
x0.node() of
//
| IR0Cvaldecl _ =>
  aux_valdecl(env0, x0)
//
| _(* rest-of-ir0dcl *) => ()
//
end // end of [interp0_irdcl]

end // end of [local]

(* ****** ****** *)

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

implement
interp0_ir0valdecl
  (env0, x0) =
let
//
val+
IR0VALDECL(rcd) = x0
//
val pat = rcd.pat
val def = rcd.def
//
val def =
interp0_irexpopt(env0, def)
//
in
  // nothing
end // end of [interp0_ir0valdecl]

(* ****** ****** *)

implement
interp0_ir0valdeclist
  (env0, xs) =
(
case+ xs of
| list_nil() => ()
| list_cons(x0, xs) =>
  (
    interp0_ir0valdeclist(env0, xs)
  ) where
  {
    val () = interp0_ir0valdecl(env0, x0)
  }
) (* end of [interp0_ir0valdeclist] *)

(* ****** ****** *)

(* end of [xint_interp0_dynexp.dats] *)
