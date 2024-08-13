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
(*
Sat 10 Aug 2024 09:38:23 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:vt }
gseq_forall0
<t0up(x0,x0)><x0>
  ( tup ) =
let
val b0 =
forall$test0<x0>(tup.0)
in//let
if b0 then
forall$test0<x0>(tup.1) else false
end//let//end-of-[gseq_forall0(...)]
//
(* ****** ****** *)
//
#impltmp
{ x0:vt }
gseq_forall0
<t0up3(x0,x0,x0)><x0>
  ( tup ) =
let
val b0 =
forall$test0<x0>(tup.0)
in//let
if b0 then
forall$test0<x0>(tup.1) else
if b0 then
forall$test0<x0>(tup.2) else false
end//let//end-of-[gseq_forall0(...)]
//
(* ****** ****** *)
//
#impltmp
{ x0:vt }
gseq_forall0
<t0up4(x0,x0,x0,x0)><x0>
  ( tup ) =
let
val b0 =
forall$test0<x0>(tup.0)
in//let
if b0 then
forall$test0<x0>(tup.1) else
if b0 then
forall$test0<x0>(tup.2) else
if b0 then
forall$test0<x0>(tup.3) else false
end//let//end-of-[gseq_forall0(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_VT_tupl001_vt.dats] *)
