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
//
#staload "./../SATS/xlabel0.sats"
//
#staload "./../SATS/xerrory.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/locinfo.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/lexing0.sats"
//
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp1.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
#staload "./../SATS/dynexp4.sats"
//
#staload "./../SATS/tread34.sats"
//
(* ****** ****** *)

implement
//{}(*tmp*)
tread34_d4ecl(d4cl) =
let
//
val loc0 = d4cl.loc()
//
(*
val () =
println!
("tread34_d4ecl: d4cl = ", d4cl)
*)
//
in
//
case+
d4cl.node() of
|
_(* rest-of-d4ecl *) =>
{
  val () = println!(loc0, ": tread34_d4ecl(", d4cl, ")")
}
//
end // end of [tread34_d4ecl]

(* ****** ****** *)
//
implement
//{}(*tmp*)
tread34_d4eclist(d4cs) =
(
list_foreach<d4ecl>(d4cs)
) where
{
implement(env)
list_foreach$fwork<d4ecl><env>(d4c, env) = tread34_d4ecl(d4c)
} (* end of [tread34_d4eclist] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread34_d4valdecl
  (v3d0) =
{
(*
  val () =
  tread34_d3pat(rcd.pat)
  val () =
  tread34_d4expopt(rcd.def)
  val () =
  tread34_s2expopt(rcd.wth)
*)
} where
{
//
  val+D4VALDECL(rcd) = v3d0
//
} (* end of [tread34_d4valdecl] *)
//
implement
//{}(*tmp*)
tread34_d4vardecl
  (v3d0) =
{
(*
  val () =
  tread34_d2var(rcd.d2v)
  val () =
  tread34_d4expopt(rcd.ini)
*)
} where
{
  val+D4VARDECL(rcd) = v3d0
}
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread34_d4valdeclist(v3ds) =
(
list_foreach<d4valdecl>(v3ds)
) where
{
implement(env)
list_foreach$fwork<d4valdecl><env>(v3d, env) = tread34_d4valdecl(v3d)
} (* end of [tread34_d4valdeclist] *)
//
implement
//{}(*tmp*)
tread34_d4vardeclist(v3ds) =
(
list_foreach<d4vardecl>(v3ds)
) where
{
implement(env)
list_foreach$fwork<d4vardecl><env>(v3d, env) = tread34_d4vardecl(v3d)
} (* end of [tread34_d4vardeclist] *)
//
(* ****** ****** *)

local

extern
fun//{}
the_trerr34lst_get(): trerr34lst
extern
fun//{}
the_trerr34lst_set(trerr34lst): void

implement
//{}(*tmp*)
trerr34_add(xerr) = let
//
val
xerrs = the_trerr34lst_get()
//
in
the_trerr34lst_set(list_cons(xerr, xerrs))
end // end of [trerr34_add]

in (* in-of-local *)
//
local
//
val
the_trerr34lst =
ref<trerr34lst>(list_nil)
//
in(*in-of-local*)
implement
the_trerr34lst_get() = the_trerr34lst[]
implement
the_trerr34lst_set(xs) = the_trerr34lst[] := xs
end // end of [local]
//
implement
tread34_package
(
  p4kg
) = let
//
(*
val () =
println!
("tread34_package")
*)
//
val
D4TRANSD(rcd) = p4kg
//
val d4cs =
let
val
d4csopt = rcd.transd
in
case+
d4csopt of
| None() =>
  list_nil((*void*))
| Some(d4cs) => d4cs
end : d4eclist // end-of-val
//
val () =
tread34_d4eclist(d4cs)
//
val
xerrs = the_trerr34lst_get()
val
nxerr = list_length<trerr34>(xerrs)
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
("\
tread34_package: \
nxerr = ", nxerr )
//
val () =
if
(nxerr = 1)
then
prerrln!
("\
tread34_package: \
there is one trans34-error!")
val () =
if
(nxerr > 1)
then
prerrln!
("\
tread34_package: \
there are some trans34-errors!")
//
val () =
(
$raise(XATSOPT_TRERR34_EXN(*void*))
) : void
//
} (* end of [then] *)
else
{
//
val () =
prerrln!
("\
tread34_package: \
there are none of trans34-errors!")
//
} (* end of [else] *)
//
end (*let*) // end of [tread34_package]

end // end of [local]

(* ****** ****** *)

(* end of [xats_tread34_dynexp.dats] *)
