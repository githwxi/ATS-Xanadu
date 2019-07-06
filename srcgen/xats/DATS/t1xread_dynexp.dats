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
// Start Time: September, 2018
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
//
#staload "./../SATS/xerrory.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/locinfo.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/lexing.sats"
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
//
#staload "./../SATS/t1xread.sats"
//
(* ****** ****** *)
//
implement
{}(*tmp*)
t1xread_d1explst
  (d1es) =
(
list_foreach<d1exp>(d1es)
) where
{
implement(env)
list_foreach$fwork<d1exp><env>(d1e, env) = t1xread_d1exp<>(d1e)
} (* end of [t1xread_d1explst] *)
//
(* ****** ****** *)

implement
{}(*tmp*)
t1xread_d1ecl
  (d1c0) = let
//
val loc0 = d1c0.loc()
//
(*
val () =
println!
("t1xread_d1ecl: d1c0 = ", d1c0)
*)
//
in
//
case+
d1c0.node() of
//
| _(* rest-of-d1ecl *) =>
  (
    prerrln!("t1xread_d1ecl: d1c0 = ", d1c0)
  )
//
end // end of [t1xread_d1ecl]

(* ****** ****** *)
//
implement
{}(*tmp*)
t1xread_d1eclist
  (d1cs) =
(
list_foreach<d1ecl>(d1cs)
) where
{
implement(env)
list_foreach$fwork<d1ecl><env>(d1c, env) = t1xread_d1ecl<>(d1c)
} (* end of [t1xread_d1ecllst] *)
//
(* ****** ****** *)

local

extern
fun{}
the_t1xerrlst_get(): t1xerrlst
extern
fun{}
the_t1xerrlst_set(t1xerrlst): void

implement
{}(*tmp*)
t1xerr_add(xerr) = let
//
val
xerrs = the_t1xerrlst_get()
//
in
  the_t1xerrlst_set(list_cons(xerr, xerrs))
end // end of [t1xerr_add]

in (* in-of-local *)

implement
t1xread_main(d1cs) = let
//
local
//
val
the_t1xerrlst =
ref<t1xerrlst>(list_nil)
//
in(*in-of-local*)
val () =
$tempenver(the_t1xerrlst)
implement
the_t1xerrlst_get<>() = the_t1xerrlst[]
implement
the_t1xerrlst_set<>(xs) = the_t1xerrlst[] := xs
end // end of [local]
//
val () =
t1xread_d1eclist<>(d1cs)
val
xerrs = the_t1xerrlst_get()
val
nxerr = list_length<t1xerr>(xerrs)
//
in
//
if
(nxerr > 0)
then
{
//
val () =
prerrln!
("t1xread_main: nxerr = ", nxerr)
//
val () =
if
(nxerr = 1)
then
prerrln!
("t1xread_main: there is one t1xerr!")
val () =
if
(nxerr > 1)
then
prerrln!
("t1xread_main: there are some t1xerrs!")
//
val () =
(
$raise(XATSOPT_T1XERR_EXN(*void*))
) : void
//
} (* end of [then] *)
else
{
//
val () =
prerrln!
("t1xread_main: there are no t1xerrs!")
//
} (* end of [else] *)
//
end // end of [t1xread_main]

end // end of [local]

(* ****** ****** *)

(* end of [xats_t1xread_dynexp.dats] *)
