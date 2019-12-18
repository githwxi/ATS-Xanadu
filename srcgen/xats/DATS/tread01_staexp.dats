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
#staload "./../SATS/locinfo.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/lexing.sats"
#staload "./../SATS/staexp1.sats"
//
#staload "./../SATS/tread01.sats"
//
(* ****** ****** *)
//
implement
{}(*tmp*)
tread01_s1exp(s1e0) = ()
//
implement
{}(*tmp*)
tread01_s1expopt(opt0) =
(
case+ opt0 of
| None() => ()
| Some(s1e) => tread01_s1exp<>(s1e)
)
//
implement
{}(*tmp*)
tread01_s1explst(s1es) =
(
list_foreach<s1exp>(s1es)
) where
{
implement(env)
list_foreach$fwork<s1exp><env>(s1e, env) = tread01_s1exp<>(s1e)
} (* end of [tread01_s1explst] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
tread01_s1qua(s1q0) = ()
//
implement
{}(*tmp*)
tread01_s1qualst(s1qs) =
(
list_foreach<s1qua>(s1qs)
) where
{
implement(env)
list_foreach$fwork<s1qua><env>(s1q, env) = tread01_s1qua<>(s1q)
} (* end of [tread01_s1qualst] *)
//
(* ****** ****** *)

(* end of [xats_tread01_staexp.dats] *)
