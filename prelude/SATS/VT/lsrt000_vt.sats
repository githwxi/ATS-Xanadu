(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
Thu Dec 25 10:09:49 AM EST 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-25:
For sorted linear lists
*)
//
abstbox
lsrt_vt_i0_vx
( a:vt,n:i0 ) == list_vt(a)
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
lsrt_vt_nil
{a:t0}((*0*)): lsrt_vt(a,0)
//
(* ****** ****** *)
//
fun<>
lsrt_vt_nilq1
{a:t0}{n:i0}
(xs: !lsrt_vt(a,n)): bool(n=0)
fun<>
lsrt_vt_consq1
{a:t0}{n:i0}
(xs: !lsrt_vt(a,n)): bool(n>0)
//
#symload
nilq with lsrt_vt_nilq1 of 1000
consq with lsrt_vt_consq1 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_SATS_VT_lsrt000_vt.sats] *)
(***********************************************************************)
