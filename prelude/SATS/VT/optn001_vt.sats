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
Fri 06 Sep 2024 11:55:56 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
optn_vt_forall0
(xs: ~optn_vt(x0)): bool
//
fun
<x0:vt>
optn_vt_rforall0
(xs: ~optn_vt(x0)): bool
//
fun
<x0:vt>
optn_vt_iforall0
(xs: ~optn_vt(x0)): bool
//
fun
<x0:vt>
optn_vt_irforall0
(xs: ~optn_vt(x0)): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
//
(*
HX-2024-09-14:
Sat 14 Sep 2024 03:34:58 PM EDT
*)
//
fun
<x0:vt>
<y0:vt>
optn_vt_map0
{ln:b0}
(xs: ~optn_vt(x0, ln)): optn_vt(y0, ln)
fun
<x0:vt>
<y0:vt>
optn_vt_map1
{ln:b0}
(xs: !optn_vt(x0, ln)): optn_vt(y0, ln)
//
#symload map0 with optn_vt_map0 of 1000
#symload map1 with optn_vt_map1 of 1000
//
fun
<x0:vt>
<y0:vt>
optn_vt_map0$f1un
{ln:b0}
(xs:
~optn_vt(x0, ln)
,fopr: (  ~x0  ) -> y0): optn_vt(y0, ln)
fun
<x0:vt>
<y0:vt>
optn_vt_map1$f1un
{ln:b0}
(xs:
!optn_vt(x0, ln)
,fopr: (  !x0  ) -> y0): optn_vt(y0, ln)
//
#symload map0$fun with optn_vt_map0$f1un of 1000
#symload map1$fun with optn_vt_map1$f1un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_SATS_VT_optn001_vt.sats] *)
(***********************************************************************)
