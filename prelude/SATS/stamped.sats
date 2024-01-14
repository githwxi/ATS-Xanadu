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
// Author: Hongwei Xi
// Sun Jan 14 12:39:16 EST 2024
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#absvwtp
stamped_vwtp(a0:vt,i0) <= x0
#sexpdef stamped = stamped_vwtp
//
(* ****** ****** *)
//
#abstype
stamped_type(a0:t0,i0) <= x0
#sexpdef stamped = stamped_type
//
(* ****** ****** *)
(* ****** ****** *)

datatype
list_t0_ss_x0
(
a0:type+, ss:ints) =
//
|
list_nil_ss
(a0, ints_nil()) of ((*0*))//nil
//
|
{s0:i0}
{ss:ints}
list_cons_ss
(ints_cons(s0, ss)) of
(stamped(a0,s0), list_t0_ss_x0(a0, ss))//cons

(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_stamped.sats] *)
