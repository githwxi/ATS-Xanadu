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
Sun Apr 12 12:57:41 PM EDT 2026
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX:
flats of 1-dimensional
*)
//
#abstype // array
a1at_t0_i0_t0(a:t0,n:i0)
#absvwtp // array
a1at_vt_i0_vt(a:vt,n:i0)
//
#typedef
a1at(a:vt,n:i0) = a1at_vt_i0_t0(a,n)
#vwtpdef
a1at_vt(a:vt,n:i0) = a1at_vt_i0_vt(a,n)
//
#typedef
a1at(x0:t0) = [ln:i0] a1at(x0,ln)
#vwtpdef
a1at_vt(x0:vt) = [ln:i0] a1at_vt(x0,ln)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_SATS_axat000.sats] *)
(***********************************************************************)
