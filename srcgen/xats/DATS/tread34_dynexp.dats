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
//
implement
//{}(*tmp*)
tread34_v4aldecl
  (v3d0) =
{
(*
  val () =
  tread34_d3pat(rcd.pat)
  val () =
  tread34_d3expopt(rcd.def)
  val () =
  tread34_s2expopt(rcd.wth)
*)
} where
{
//
  val+V4ALDECL(rcd) = v3d0
//
} (* end of [tread34_v4aldecl] *)
//
implement
//{}(*tmp*)
tread34_v4aldeclist(v3ds) =
(
list_foreach<v4aldecl>(v3ds)
) where
{
implement(env)
list_foreach$fwork<v4aldecl><env>(v3d, env) = tread34_v4aldecl(v3d)
} (* end of [tread34_v4aldeclist] *)
//
(* ****** ****** *)
//
implement
//{}(*tmp*)
tread34_v4ardecl
  (v3d0) =
{
(*
  val () =
  tread34_d2var(rcd.d2v)
  val () =
  tread34_d3expopt(rcd.ini)
*)
} where
{
  val+V4ARDECL(rcd) = v3d0
}
//
implement
//{}(*tmp*)
tread34_v4ardeclist(v3ds) =
(
list_foreach<v4ardecl>(v3ds)
) where
{
implement(env)
list_foreach$fwork<v4ardecl><env>(v3d, env) = tread34_v4ardecl(v3d)
} (* end of [tread34_v4ardeclist] *)
//
(* ****** ****** *)

(* end of [xats_tread34_dynexp.dats] *)
