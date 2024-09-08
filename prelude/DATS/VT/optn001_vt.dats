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
Fri 06 Sep 2024 11:56:52 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
optn_vt_forall0
  ( xs ) = 
(
case+ xs of
| ~
optn_vt_nil() => true
| ~
optn_vt_cons(x0) => forall$test0<x0>(x0)
)
//
#impltmp
{ x0:vt }
gseq_forall0
<optn_vt(x0)><x0> = optn_vt_forall0<x0>(*void*)
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
optn_vt_rforall0
  ( xs ) = 
(
case+ xs of
| ~
optn_vt_nil() => true
| ~
optn_vt_cons(x0) => rforall$test0<x0>(x0)
)
//
#impltmp
{ x0:vt }
gseq_rforall0
<optn_vt(x0)><x0> = optn_vt_rforall0<x0>(*void*)
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
optn_vt_iforall0
  ( xs ) = 
(
case+ xs of
| ~
optn_vt_nil() => true
| ~
optn_vt_cons(x0) => iforall$test0<x0>(0, x0)
)
//
#impltmp
{ x0:vt }
gseq_iforall0
<optn_vt(x0)><x0> = optn_vt_iforall0<x0>(*void*)
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
optn_vt_irforall0
  ( xs ) = 
(
case+ xs of
| ~
optn_vt_nil() => true
| ~
optn_vt_cons(x0) => irforall$test0<x0>(0, x0)
)
//
#impltmp
{ x0:vt }
gseq_irforall0
<optn_vt(x0)><x0> = optn_vt_irforall0<x0>(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_VT_optn001_vt.dats] *)
