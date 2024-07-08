(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
** for flat tuples
** for boxed tuples
*)
(* ****** ****** *)
//
// Author: Hongwei Xi
// Mon Aug 14 10:01:30 EDT 2023
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#absvwtp
z2tup_vwtp
(a0:vt,a1:vt) <= (a0,a1)
#absvwtp
x2tup_vwtp
(a0:vt,a1:vt) <= (a0,a1)
#sexpdef z2tup_vt = z2tup_vwtp
#sexpdef x2tup_vt = x2tup_vwtp
(* ****** ****** *)
fun
<a0:vt>
<a1:vt>
z2tup_vt_encode
(x1: a0, x2: a1): z2tup_vt(a0, a1)
fun
<a0:vt>
<a1:vt>
z2tup_vt_decode
(tup: z2tup_vt(a0, a1)): @(a0, a1)
#symload z2tup_vt with z2tup_vt_encode of 1000
#symload put2z_vt with z2tup_vt_decode of 1000
(* ****** ****** *)
fun
<a0:vt>
<a1:vt>
x2tup_vt_encode
(x1: a0, x2: a1): x2tup_vt(a0, a1)
fun
<a0:vt>
<a1:vt>
x2tup_vt_decode
(tup: x2tup_vt(a0, a1)): @(a0, a1)
#symload x2tup_vt with x2tup_vt_encode of 1000
#symload put2x_vt with x2tup_vt_decode of 1000
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_tupl000_vt.sats] *)
