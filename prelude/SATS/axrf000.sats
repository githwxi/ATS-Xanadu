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
// For booleans
//
(* ****** ****** *)
//
(*
Author: Hongwei Xi
Sun 11 Aug 2024 12:59:19 PM EDT
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox
a0rf_vt_tx(a:vt) // 0-dim
#absvtbx
a0rf_vt_vx(a:vt) // 0-dim
//
#typedef
a0rf(a0:vt) = a0rf_vt_tx(a0)
//
#vwtpdef
a0pt(a0:vt) = a0rf_vt_vx(a0)
#vwtpdef
a0rf_vt(a0:vt) = a0rf_vt_vx(a0)
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox
a1rf_vt_i0_tx(a:vt,n:i0)//1-dim
#abstbox
a1rf_vt_i0_vt(a:vt,n:i0)//1-dim
//
#typedef
a1rf(a:vt, n:i0) = a1rf_vt_i0_tx(a,n)
//
#vwtpdef
a1pt(a:vt,n:i0) = a1rf_vt_i0_vt(a,n)
#vwtpdef
a1rf_vt(a:vt,n:i0) = a1rf_vt_i0_vt(a,n)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_axrf000.sats] *)
