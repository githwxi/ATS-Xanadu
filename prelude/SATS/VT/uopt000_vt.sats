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
HX-2026-04-08:
This one is likely no
longer needed as [uopt] can
be implemented as uflat(optn)!
Wed Apr  8 02:51:46 AM EDT 2026
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Wed Apr  8 09:15:52 AM EDT 2026
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#absvwtp
uopt_vt_b0_vt
( a:vt,b:b0 ) <= @(sint, a)
#sexpdef uopt_vt = uopt_vt_b0_vt
//
#vwtpdef
uopt_vt(a:vt) = [b:b0] uopt_vt(a, b)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
uopt_vt_none
((*0*)): uopt_vt(x0, ff)
fun
<x0:vt>
uopt_vt_some
(x0: x0): uopt_vt(x0, tt)
//
fun
<x0:vt>
uopt_vt_unsome0
(xs: uopt_vt(x0, tt)): (x0)
//
fun
<x0:vt>
uopt_vt_nilq1
{b1:b0}
(xs: !uopt_vt(x0, b1)): bool(~b1)
fun
<x0:vt>
uopt_vt_consq1
{b1:b0}
(xs: !uopt_vt(x0, b1)): bool( b1)
//
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_SATS_VT_uopt_vt000.sats] *)
(***********************************************************************)
