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
Mon 02 Sep 2024 02:43:08 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
optn_nil_
{a:t0}((*0*)): optn(a,ff)
fun
<a:t0>
optn_cons_(x0:(a)): optn(a,tt)
//
(* ****** ****** *)
//
fun<>
optn_nilq
{a:t0}{b:b0}
(xs: optn(a,b)): bool(~b)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
optn_head
(xs: optn(a, tt)): (  a  )
//
#symload head with optn_head of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
optn_make_1val(a): optn(a,tt)
//
#symload
optn with optn_make_1val// of 1000
#symload
optn_1val with optn_make_1val// of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-09-07:
This one can be polymorphic
*)
fun
<a:t0>
optn_length
{b:b0}
(xs:optn(a,b)): sint(b2i(b))
//
#symload length with optn_length of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_optn000.sats] *)
