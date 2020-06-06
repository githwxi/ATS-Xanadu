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
// Start Time: September, 2019
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
#staload "./../SATS/label0.sats"
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
//
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp1.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
//
#staload "./../SATS/tread23.sats"
//
(* ****** ****** *)

#staload
_(*TMP*) = "./../DATS/staexp2_print.dats"
#staload
_(*TMP*) = "./../DATS/statyp2_print.dats"
#staload
_(*TMP*) = "./../DATS/dynexp1_print.dats"
#staload
_(*TMP*) = "./../DATS/dynexp2_print.dats"
#staload
_(*TMP*) = "./../DATS/dynexp3_print.dats"

(* ****** ****** *)

local

in(*in-of-local*)

implement
//{}(*tmp*)
tread23_d3exp
  (d3e0) = let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
// (*
val () =
println!
("tread23_d3exp: d3e0 = ", d3e0)
val () =
println!
("tread23_d3exp: t2p0 = ", t2p0)
// *)
//
//
in
end // end of [tread23_d3exp]

end // end of [local]

(* ****** ****** *)

implement
//{}(*tmp*)
tread23_d3explst(d3es) =
(
list_foreach<d3exp>(d3es)
) where
{
implement(env)
list_foreach$fwork<d3exp><env>(d3e, env) = tread23_d3exp(d3e)
} (* end of [tread23_d3explst] *)

(* ****** ****** *)

implement
//{}(*tmp*)
tread23_d3ecl(d3cl) =
let
//
val loc0 = d3cl.loc()
//
(*
val () =
println!
("tread23_d3ecl: d3cl = ", d3cl)
*)
//
in
//
case+
d3cl.node() of
//
| _(* rest-of-d3ecl *) =>
  {
    val () = println!(loc0, ": tread23_d3ecl(", d3cl, ")")
  }
//
end // end of [tread23_d3ecl]

(* ****** ****** *)

(* ****** ****** *)
//
implement
//{}(*tmp*)
tread23_d3eclist(d3cs) =
(
list_foreach<d3ecl>(d3cs)
) where
{
implement(env)
list_foreach$fwork<d3ecl><env>(d3c, env) = tread23_d3ecl(d3c)
} (* end of [tread23_d3eclist] *)
//
(* ****** ****** *)

local

static
fun//{}
the_trerr23lst_get(): trerr23lst
extern
fun//{}
the_trerr23lst_set(trerr23lst): void

implement
//{}(*tmp*)
trerr23_add(xerr) = let
//
val
xerrs = the_trerr23lst_get()
//
in
  the_trerr23lst_set(list_cons(xerr, xerrs))
end // end of [trerr23_add]

in (* in-of-local *)
//
local
//
val
the_trerr23lst =
ref<trerr23lst>(list_nil)
//
in(*in-of-local*)
implement
the_trerr23lst_get() = the_trerr23lst[]
implement
the_trerr23lst_set(xs) = the_trerr23lst[] := xs
end // end of [local]
//
implement
tread23_program(prog) =
let
//
(*
val () =
println!("tread23_program")
*)
//
val () =
tread23_d3eclist(prog)
//
val
xerrs = the_trerr23lst_get()
val
nxerr = list_length<trerr23>(xerrs)
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
tread23_program: \
nxerr = ", nxerr )
//
val () =
if
(nxerr = 1)
then
prerrln!
("\
tread23_program: \
there is one trans23-error!")
val () =
if
(nxerr > 1)
then
prerrln!
("\
tread23_program: \
there are some trans23-errors!")
//
val () =
(
$raise(XATSOPT_TRERR23_EXN(*void*))
) : void
//
} (* end of [then] *)
else
{
//
val () =
prerrln!
("\
tread23_program: \
there are none of trans23-errors!")
//
} (* end of [else] *)
//
end // end of [tread23_program]

end // end of [local]

(* ****** ****** *)

(* end of [xats_tread23_dynexp.dats] *)
