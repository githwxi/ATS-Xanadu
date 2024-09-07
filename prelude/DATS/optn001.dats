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
Sat 07 Sep 2024 08:21:15 AM EDT
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
< x0:t0 >
optn_forall
  ( xs ) = 
(
case+ xs of
|optn_nil() => true
|optn_cons(x0) => forall$test<x0>(x0)
)
//
#impltmp
{ x0:t0 }
gseq_forall
<optn(x0)><x0> = optn_forall<x0>(*void*)
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
optn_rforall
  ( xs ) = 
(
case+ xs of
|optn_nil() => true
|optn_cons(x0) => rforall$test<x0>(x0)
)
//
#impltmp
{ x0:t0 }
gseq_rforall
<optn(x0)><x0> = optn_rforall<x0>(*void*)
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
optn_iforall
  ( xs ) = 
(
case+ xs of
|
optn_nil() => true
|
optn_cons(x0) => iforall$test<x0>(0, x0)
)
//
#impltmp
{ x0:t0 }
gseq_iforall
<optn(x0)><x0> = optn_iforall<x0>(*void*)
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
optn_irforall
  ( xs ) = 
(
case+ xs of
|
optn_nil() => true
|
optn_cons(x0) => irforall$test<x0>(0, x0)
)
//
#impltmp
{ x0:t0 }
gseq_irforall
<optn(x0)><x0> = optn_irforall<x0>(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_optn001.dats] *)
