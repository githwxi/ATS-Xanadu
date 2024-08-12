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
Sun 11 Aug 2024 03:44:27 PM EDT
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gseq_forall
<a0rf(x0)><x0>
 (   arf   ) =
forall$test<x0>(a0rf_get<x0>(arf))
#impltmp
{ x0:t0 }
gseq_rforall
<a0rf(x0)><x0>
 (   arf   ) =
rforall$test<x0>(a0rf_get<x0>(arf))
#impltmp
{ x0:t0 }
gseq_iforall
<a0rf(x0)><x0>
 (   arf   ) =
iforall$test<x0>(0, a0rf_get<x0>(arf))
#impltmp
{ x0:t0 }
gseq_irforall
<a0rf(x0)><x0>
 (   arf   ) =
irforall$test<x0>(0, a0rf_get<x0>(arf))
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_axsz001.dats] *)
