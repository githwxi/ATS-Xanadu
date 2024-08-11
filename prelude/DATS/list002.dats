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
Sat 10 Aug 2024 07:33:24 PM EDT
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
(*
HX-2024-08-10:
This should probably be
replace later with a more
efficient version
Sat 10 Aug 2024 07:34:46 PM EDT
*)
#impltmp
{ x0:t0 }
g_cmp<list(x0)> =
gseq_cmp<list(x0)><x0>(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
< y0:t0 >
list_z2forall
  ( xs, ys ) =
(
  auxloop(xs, ys)) where
{
fun
auxloop
( xs
: list(x0)
, ys
: list(y0)): bool =
(
case+ xs of
|list_nil() =>
(   true   )
|list_cons(x1, xs) =>
(
case+ ys of
|list_nil() =>
(   true   )
|list_cons(y1, ys) =>
(
if
z2forall$test
<x0><y0>(x1, y1)
then auxloop(xs, ys) else false)))
}(*where*)//end-of-[list_z2forall(xs,ys)]
//
#impltmp
{ x0:t0
, y0:t0 }
gseq_z2forall
<list(x0)><x0>
<list(y0)><y0> = list_z2forall<x0><y0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
< y0:t0 >
list_iz2forall
  ( xs, ys ) =
(
auxloop
(0(*i0*), xs, ys)) where
{
fun
auxloop
( i0: ni
, xs
: list(x0)
, ys
: list(y0)): bool =
(
case+ xs of
|list_nil() =>
(   true   )
|list_cons(x1, xs) =>
(
case+ ys of
|list_nil() =>
(   true   )
|list_cons(y1, ys) =>
(
if
iz2forall$test
<x0><y0>(i0, x1, y1)
then auxloop(i0+1,xs,ys) else false)))
}(*where*)//end-of-[list_iz2forall(xs,ys)]
//
#impltmp
{ x0:t0
, y0:t0 }
gseq_iz2forall
<list(x0)><x0>
<list(y0)><y0> = list_iz2forall<x0><y0>
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_list002.dats] *)
