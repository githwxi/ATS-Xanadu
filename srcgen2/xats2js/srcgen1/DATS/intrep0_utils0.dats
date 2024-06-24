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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
//
Thu 06 Jun 2024 10:21:31 AM EDT
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
(* ****** ****** *)
#staload
"./../../../SATS/xstamp0.sats"
#staload
"./../../../SATS/xsymbol.sats"
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/intrep0.sats"
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with i0pat_get_lctn
#symload node with i0pat_get_node
(* ****** ****** *)
(* ****** ****** *)

#implfun
i0pat_allq
(  i0p0  ) =
(
case+
i0p0.node() of
|I0Pvar _ => true
|I0Pany _ => true
//
|I0Pint _ => false
|I0Pbtf _ => false
|I0Pchr _ => false
|I0Pflt _ => false
|I0Pstr _ => false
//
|
I0Ptup0
( i0ps ) => f0_i0ps(i0ps)
|
I0Ptup1
(tknd, i0ps) => f0_i0ps(i0ps)
|
I0Prcd2
(tknd, lips) => f0_lips(lips)
| _(*otherwise*) => (  false  ))
where
{
fun
f0_i0ps
(i0ps: i0patlst): bool =
(
case+ i0ps of
|
list_nil() => true
|
list_cons(i0p1, i0ps) =>
if // if
i0pat_allq(i0p1)
then f0_i0ps(i0ps) else false)
//
fun
f0_lips
(lips: l0i0plst): bool =
(
case+ lips of
|
list_nil() => true
|
list_cons(lip1, lips) =>
let
val+
I0LAB(l0, i0p1) = lip1
in//let
if // if
i0pat_allq(i0p1)
then f0_lips(lips) else false end)
//
}(*where*)//end-of-[ i0pat_allq(i0p0) ]
//
(* ****** ****** *)

(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_intrep0_utils0.dats] *)
(***********************************************************************)
