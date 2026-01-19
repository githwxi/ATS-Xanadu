(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
Sat Jan 10 04:18:42 PM EST 2026
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2026-01-10:
Sat Jan 10 04:33:21 PM EST 2026
What do I think about the
lens implementation in Haskell?
It is certainly VERY interesting.
It may actually be too interesting.
It is too distractively interesting
if I may say so. And this distraction
belies certain limitation of Haskell
in support of type-based meta-programming.
*)
(* ****** ****** *)
(* ****** ****** *)
//
datatype
glens$2comp
( nam1: t0
, nam2: t0
, arg1: vt) = glens$2comp of ()
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<name:t0>
<arg0:vt>
<arg1:t0>
glens_get
(arg0: !arg0): arg1
fun
<name:t0>
<arg0:vt>
<arg1:t0>
glens_fset
(arg0: !arg0, arg1: arg1): arg0
//
(* ****** ****** *)
//
fun
<name:t0>
<arg0:vt>
<arg1:vt>
glens_cget(arg0: !arg0): arg1
fun
<name:t0>
<arg0:vt>
<arg1:vt>
glens_setf
(arg0: !arg0, arg1: arg1): void
//
(* ****** ****** *)
//
fun
<name:t0>
<arg0:vt>
<arg1:t0>
glens_lget
(arg0: !arg0): (owed(arg1) | arg1)
fun
<name:t0>
<arg0:vt>
<arg1:vt>
glens_lset(
pf01: owed(arg1) | !arg0, arg1): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_SATS_glens00.sats] *)
(***********************************************************************)
