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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Wed Dec 31 12:25:51 PM EST 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-05:
Mon Jan  5 03:06:12 PM EST 2026
*)
//
#typedef
gasq$seg_def
(  xs: t0  ) = (xs, nint, nint)
#abstype
gasq$seg_t0_t0
(  xs: t0  ) <= gasq$seg_def(xs)
//
#typedef
gasq$seg(xs: t0) = gasq$seg_t0_t0(xs)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
gasq$seg_decd
(xsii: gasq$seg(xs)): @(xs, ni, ni)
fun
<xs:t0>
gasq$seg_encd
(xs: xs, lb: ni, ub: ni): gasq$seg(xs)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_almanac_SATS_pre2026.sats] *)
(***********************************************************************)
