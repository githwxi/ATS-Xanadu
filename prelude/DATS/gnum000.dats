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
(*
Author: Hongwei Xi
(*
Fri 12 Jul 2024 07:16:15 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
g_suc(x0) =
g_add<x0>(x0, g_1<x0>())
#impltmp
< x0:t0 >
g_pre(x0) =
g_sub<x0>(x0, g_1<x0>())
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
g_sqr(x0) =
g_mul<x0>(x0, x0)
#impltmp
< x0:t0 >
g_cbe(x0) =
g_mul<x0>(g_sqr<x0>(x0), x0)
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
g_pow(x0, n0) =
(
auxloop
(x0, n0, g_1<x0>())) where
{
fun
auxloop
( x0: x0
, n0: ni, rs: x0): x0 =
if
(n0 <= 0)
then rs else
auxloop(x0*x0, n1, rs) where
{
val n1 = n0 / 2
val rs =
if n0 % 2 = 0 then rs else x0*rs
}
}(*where*)//end-of-[g_pow(x0, n0)]
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
g_ncpy(x0, n0) =
(
if
(n0 <= 0)
then
(
  g_0<x0>() )
else
(
  loop(n0-1, x0))) where
{
//
fun
loop
(i0: nint, r0: x0): (x0) =
(
if
(i0 <= 0)
then r0 else
(
  loop(i0-1, g_add<x0>(x0, r0))))
//
}(*where*)//end-of-[g_ncpy(x0, n0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gnum000.dats] *)
