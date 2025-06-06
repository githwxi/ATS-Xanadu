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
#vwtpdef
atup2(x0:vt) = @(x0,x0)
#vwtpdef
atup3(x0:vt) = @(x0,x0,x0)
#vwtpdef
atup4(x0:vt) = @(x0,x0,x0,x0)
#vwtpdef
atup5(x0:vt) = @(x0,x0,x0,x0,x0)
#vwtpdef
atup6(x0:vt) = @(x0,x0,x0,x0,x0,x0)
#vwtpdef
atup7(x0:vt) = @(x0,x0,x0,x0,x0,x0,x0)
#vwtpdef
atup8(x0:vt) = @(x0,x0,x0,x0,x0,x0,x0,x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:vt }
gseq_forall0
<atup2(x0)><x0>
  ( tup ) =
let
val b0 =
forall$test0<x0>(tup.0)
in//let
if ~b0
then false
else forall$test0<x0>(tup.1)
end//let//end-of-[gseq_forall0<atup2(x0)><x0>(...)]
//
(* ****** ****** *)
//
#impltmp
{ x0:vt }
gseq_forall0
<atup3(x0)><x0>
  ( tup ) =
let
val b0 =
forall$test0<x0>(tup.0)
in//let
if ~b0
then false else
if ~(forall$test0<x0>(tup.1))
then false else forall$test0<x0>(tup.2)
end//let//end-of-[gseq_forall0<atup3(x0)><x0>(...)]
//
(* ****** ****** *)
//
#impltmp
{ x0:vt }
gseq_forall0
<atup4(x0)><x0>
  ( tup ) =
let
val b0 =
forall$test0<x0>(tup.0)
in//let
if ~b0
then false else
if ~(forall$test0<x0>(tup.1))
then false else
if ~(forall$test0<x0>(tup.2))
then false else forall$test0<x0>(tup.3)
end//let//end-of-[gseq_forall0<atup4(x0)><x0>(...)]
//
(* ****** ****** *)
//
#impltmp
{ x0:vt }
gseq_forall0
<atup5(x0)><x0>
  ( tup ) =
let
val b0 =
forall$test0<x0>(tup.0)
in//let
if ~b0
then false else
if ~(forall$test0<x0>(tup.1))
then false else
if ~(forall$test0<x0>(tup.2))
then false else
if ~(forall$test0<x0>(tup.3))
then false else forall$test0<x0>(tup.4)
end//let//end-of-[gseq_forall0<atup5(x0)><x0>(...)]
//
(* ****** ****** *)
//
#impltmp
{ x0:vt }
gseq_forall0
<atup6(x0)><x0>
  ( tup ) =
let
val b0 =
forall$test0<x0>(tup.0)
in//let
if ~b0
then false else
if ~(forall$test0<x0>(tup.1))
then false else
if ~(forall$test0<x0>(tup.2))
then false else
if ~(forall$test0<x0>(tup.3))
then false else
if ~(forall$test0<x0>(tup.4))
then false else forall$test0<x0>(tup.5)
end//let//end-of-[gseq_forall0<atup6(x0)><x0>(...)]
//
(* ****** ****** *)
//
#impltmp
{ x0:vt }
gseq_forall0
<atup7(x0)><x0>
  ( tup ) =
let
val b0 =
forall$test0<x0>(tup.0)
in//let
if ~b0
then false else
if ~(forall$test0<x0>(tup.1))
then false else
if ~(forall$test0<x0>(tup.2))
then false else
if ~(forall$test0<x0>(tup.3))
then false else
if ~(forall$test0<x0>(tup.4))
then false else
if ~(forall$test0<x0>(tup.5))
then false else forall$test0<x0>(tup.6)
end//let//end-of-[gseq_forall0<atup7(x0)><x0>(...)]
//
(* ****** ****** *)
//
#impltmp
{ x0:vt }
gseq_forall0
<atup8(x0)><x0>
  ( tup ) =
let
val b0 =
forall$test0<x0>(tup.0)
in//let
if ~b0
then false else
if ~(forall$test0<x0>(tup.1))
then false else
if ~(forall$test0<x0>(tup.2))
then false else
if ~(forall$test0<x0>(tup.3))
then false else
if ~(forall$test0<x0>(tup.4))
then false else
if ~(forall$test0<x0>(tup.5))
then false else
if ~(forall$test0<x0>(tup.6))
then false else forall$test0<x0>(tup.7)
end//let//end-of-[gseq_forall0<atup8(x0)><x0>(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_DATS_VT_tupl001_vt.dats] *)
(***********************************************************************)
