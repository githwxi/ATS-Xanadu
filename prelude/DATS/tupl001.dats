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
Wed 07 Aug 2024 02:30:05 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gseq_forall
<t0up(x0,x0)><x0>
  ( tup ) =
let
val b0 =
forall$test<x0>(tup.0)
in//let
if b0 then
forall$test<x0>(tup.1) else false
end//let//end-of-[gseq_forall(...)]
//
#impltmp
{ x0:t0 }
gseq_forall
<t1up(x0,x0)><x0>
  ( tup ) =
let
val b0 =
forall$test<x0>(tup.0)
in//let
if b0 then
forall$test<x0>(tup.1) else false
end//let//end-of-[gseq_forall(...)]
//
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gseq_rforall
<t0up(x0,x0)><x0>
  ( tup ) =
let
val b0 =
rforall$test<x0>(tup.1)
in//let
if b0 then
rforall$test<x0>(tup.0) else false
end//let//end-of-[gseq_rforall(...)]
//
#impltmp
{ x0:t0 }
gseq_rforall
<t1up(x0,x0)><x0>
  ( tup ) =
let
val b0 =
rforall$test<x0>(tup.1)
in//let
if b0 then
rforall$test<x0>(tup.0) else false
end//let//end-of-[gseq_rforall(...)]
//
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gseq_iforall
<t0up(x0,x0)><x0>
  ( tup ) =
let
val b0 =
iforall$test<x0>(0, tup.0)
in//let
if b0 then
iforall$test<x0>(1, tup.1) else false
end//let//end-of-[gseq_iforall(...)]
//
#impltmp
{ x0:t0 }
gseq_iforall
<t1up(x0,x0)><x0>
  ( tup ) =
let
val b0 =
iforall$test<x0>(0, tup.0)
in//let
if b0 then
iforall$test<x0>(1, tup.1) else false
end//let//end-of-[gseq_iforall(...)]
//
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gseq_irforall
<t0up(x0,x0)><x0>
  ( tup ) =
let
val b0 =
irforall$test<x0>(1, tup.1)
in//let
if b0 then
irforall$test<x0>(0, tup.0) else false
end//let//end-of-[gseq_iforall(...)]
//
#impltmp
{ x0:t0 }
gseq_irforall
<t1up(x0,x0)><x0>
  ( tup ) =
let
val b0 =
irforall$test<x0>(1, tup.1)
in//let
if b0 then
irforall$test<x0>(0, tup.0) else false
end//let//end-of-[gseq_irforall(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-17:
Sat 17 Aug 2024 02:55:13 PM EDT
*)
//
#impltmp
{ x0:t0 }
gseq_forall
<t0up(x0,x0,x0)><x0>
  ( tup ) =
(
if not
(forall$test<x0>(tup.0))
then false else
if not
(forall$test<x0>(tup.1))
then false
else forall$test<x0>(tup.2))//forall
#impltmp
{ x0:t0 }
gseq_exists
<t0up(x0,x0,x0)><x0>
  ( tup ) =
(
if
exists$test<x0>(tup.0)
then true
else if // more
exists$test<x0>(tup.1) 
then true // more
else exists$test<x0>(tup.2))//exists
//
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gseq_forall
<t1up(x0,x0,x0)><x0>
  ( tup ) =
(
if not(
forall$test<x0>(tup.0))
then false else
if not(
forall$test<x0>(tup.1))
then false
else forall$test<x0>(tup.2))//forall
#impltmp
{ x0:t0 }
gseq_exists
<t1up(x0,x0,x0)><x0>
  ( tup ) =
(
if
exists$test<x0>(tup.0)
then true
else if // more
exists$test<x0>(tup.1) 
then true // more
else exists$test<x0>(tup.2))//exists
//
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gseq_rforall
<t0up(x0,x0,x0)><x0>
  ( tup ) =
(
if not(
rforall$test<x0>(tup.2))
then false else
if not(
rforall$test<x0>(tup.1))
then false
else rforall$test<x0>(tup.0))//rforall
#impltmp
{ x0:t0 }
gseq_rexists
<t0up(x0,x0,x0)><x0>
  ( tup ) =
(
if
rexists$test<x0>(tup.2)
then true
else if // more
rexists$test<x0>(tup.1) 
then true // more
else rexists$test<x0>(tup.0))//rexists
//
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gseq_rforall
<t1up(x0,x0,x0)><x0>
  ( tup ) =
(
if not(
rforall$test<x0>(tup.2))
then false else
if not(
rforall$test<x0>(tup.1))
then false
else rforall$test<x0>(tup.0))//rforall
#impltmp
{ x0:t0 }
gseq_rexists
<t1up(x0,x0,x0)><x0>
  ( tup ) =
(
if
rexists$test<x0>(tup.2)
then true
else if // more
rexists$test<x0>(tup.1) 
then true // more
else rexists$test<x0>(tup.0))//rexists
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_tupl001.dats] *)
