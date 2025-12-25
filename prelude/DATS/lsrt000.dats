(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
Author: Hongwei Xi
(*
Thu Dec 25 10:43:54 AM EST 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
lsrt_nil
{a:t0}((*0*)) =
(
UN_lsrt_encd
(list_nil<a>(*0*)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: t0 >
lsrt_make_1val
  (  x0  ) =
(
UN_lsrt_encd(
list_make_1val<a>(x0)))
//
#impltmp
< a: t0 >
lsrt_make_2val
  ( x1, x2 ) =
(
if
g_lte<a>(x1, x2)
then
UN_lsrt_encd(
(list_make_2val<a>(x1, x2)))
else
UN_lsrt_encd(
(list_make_2val<a>(x2, x1))))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_DATS_lsrt000.dats] *)
(***********************************************************************)
