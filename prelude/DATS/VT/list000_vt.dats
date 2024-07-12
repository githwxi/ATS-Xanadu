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
Mon 08 Jul 2024 05:07:13 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
< x0:t0 >
list_vt_length0 =
gseq_length0<list_vt(x0)><x0>
*)
#impltmp
< x0:vt >
list_vt_length0
  (xs) =
(
  loop(xs, 0(*j0*)))
where
{
fun
loop
{i,j:i0}
(xs:
~list_vt
 (x0, i)
,j0: sint(j)): sint(i+j) =
(
case+ xs of
| ~
list_vt_nil() => j0
| ~
list_vt_cons(x1, xs) =>
(
  free(x1); loop(xs, j0+1)))
}
//
#impltmp
{ x0:vt }
gseq_length0<list_vt(x0)><x0> = list_vt_length0
//
(* ****** ****** *)
//
(*
#impltmp
< x0:t0 >
list_vt_length1 =
gseq_length1<list_vt(x0)><x0>
*)
//
#impltmp
< x0:vt >
list_vt_length1
  (xs) =
(
  loop(xs, 0(*j0*)))
where
{
fun
loop
{i,j:i0}
(xs:
!list_vt
 (x0, i)
,j0: sint(j)): sint(i+j) =
(
case+ xs of
|list_vt_nil() => j0
|list_vt_cons(x1, xs) => loop(xs, j0+1))
}
//
#impltmp
{ x0:vt }
gseq_length1<list_vt(x0)><x0> = list_vt_length1
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
list_vt_forall0
  (xs) = 
(
  loop(xs) ) where
{
fun
loop
(xs: list_vt(x0)): bool =
(
case+ xs of
| ~
list_vt_nil() => ( true )
| ~
list_vt_cons(x1, xs) =>
let
val test =
forall0$test<x0>(x1) in
if test then loop(xs) else false end)
}
//
#impltmp
{ x0:vt }
gseq_forall0<list_vt(x0)><x0> = list_vt_forall0<x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
list_vt_foritm0
  (xs) = 
(
  loop(xs) ) where
{
fun
loop
(xs: list_vt(x0)): void =
(
case+ xs of
| ~
list_vt_nil() => ( (*void*) )
| ~
list_vt_cons(x1, xs) =>
let
val () =
foritm0$work<x0>(x1) in loop(xs) end)
}
//
#impltmp
{ x0:vt }
gseq_foritm0<list_vt(x0)><x0> = list_vt_foritm0<x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_VT_list000_vt.dats] *)
