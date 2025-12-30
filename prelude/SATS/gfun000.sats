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
Tue 06 Aug 2024 05:59:04 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX:
For functions
(fnp,cfp,cfr,etc)
Note that 'fun' is
meant to be generic;
it is to be resolved
*after* type-checking!
*)
(* ****** ****** *)
(* ****** ****** *)
#typedef
f0un(r0:vt) = () -> r0
(* ****** ****** *)
#typedef
f1un
(a1:t0,r0:vt) = (a1)->r0
(* ****** ****** *)
#typedef
f2un
(a1:t0
,a2:t0,r0:vt) = (a1,a2)->r0
(* ****** ****** *)
#typedef
f3un
(a1:t0
,a2:t0
,a3:t0,r0:vt) = (a1,a2,a3)->r0
(* ****** ****** *)
#typedef
f4un
(a1:t0
,a2:t0
,a3:t0
,a4:t0,r0:vt) = (a1,a2,a3,a4)->r0
(* ****** ****** *)
#typedef
f5un
(a1:t0
,a2:t0
,a3:t0
,a4:t0
,a5:t0,r0:vt) = (a1,a2,a3,a4,a5)->r0
(* ****** ****** *)
#typedef
f6un
(a1:t0
,a2:t0
,a3:t0
,a4:t0
,a5:t0
,a6:t0,r0:vt) = (a1,a2,a3,a4,a5,a6)->r0
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a1:t0>
f1un_not
( f0
: f1un(a1,bool)): f1un(a1,bool)
//
#symload not with f1un_not of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
f0un_repeat$nint
( f0
: f0un(void), ni: nint): void
fun<>
nint_repeat$f0un
(times: nint, f0: f0un(void)): void
//
#symload repeat with f0un_repeat$nint
#symload repeat with nint_repeat$f0un
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
f0un_enum$make_strx_vt
  (xs: strx_vt(x0)): f0un( x0 )
fun
<x0:vt>
f0un_enum$make_strm_vt
  (xs: strm_vt(x0)): f0un(optn_vt(x0))
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
f1un_srch$make_gseq(xs): f1un(x0, bool)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX: for run-time testing
Sun Aug 13 21:10:14 EDT 2023
*)
//
(*
HX: f0(x0) = r0?
*)
fun
<x0:t0>
<r0:vt>
f1un_equal$at
(f0: f1un(x0, r0), x0: x0, r0: r0): bool
//
fun
<x0:t0>
<y0:vt>
f1un_rand$equal
(f1: f1un(x0, y0), f2: f1un(x0, y0)): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<r0:vt>
f0un_trace
(
f00:
f0un(r0), msg: strn): f0un(r0)
fun
<a1:t0>
<r0:vt>
f1un_trace
(
f00:
f1un(a1,r0), msg: strn): f1un(a1,r0)
fun
<a1:t0>
<a2:t0>
<r0:vt>
f2un_trace
(
f00:
f2un(a1,a2,r0), msg: strn): f2un(a1,a2,r0)
fun
<a1:t0>
<a2:t0>
<a3:t0>
<r0:vt>
f3un_trace
(
f00:
f3un(a1,a2,a3,r0), msg: strn): f3un(a1,a2,a3,r0)
//
(* ****** ****** *)
//
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<r0:vt>
f4un_trace
(
f00:
f4un(a1,a2,a3,a4,r0), msg: strn): f4un(a1,a2,a3,a4,r0)
//
(* ****** ****** *)
//
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
<r0:vt>
f5un_trace
(
f00:
f5un(a1,a2,a3,a4,a5,r0), msg: strn): f5un(a1,a2,a3,a4,a5,r0)
//
(* ****** ****** *)
//
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
<a6:t0>
<r0:vt>
f6un_trace
(
f00:
f6un(a1,a2,a3,a4,a5,a6,r0), msg: strn): f6un(a1,a2,a3,a4,a5,a6,r0)
//
(* ****** ****** *)
//
#symload trace with f0un_trace of 1000
#symload trace with f1un_trace of 1000
#symload trace with f2un_trace of 1000
#symload trace with f3un_trace of 1000
#symload trace with f4un_trace of 1000
#symload trace with f5un_trace of 1000
#symload trace with f6un_trace of 1000
//
#symload f_trace with f0un_trace of 1000
#symload f_trace with f1un_trace of 1000
#symload f_trace with f2un_trace of 1000
#symload f_trace with f3un_trace of 1000
#symload f_trace with f4un_trace of 1000
#symload f_trace with f5un_trace of 1000
#symload f_trace with f6un_trace of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-05-29:
Thu May 29 05:22:09 PM EDT 2025
*)
//
fun
<x0:t0>
<y0:t0>
f1un_map$list
(f00: (x0) -> y0): list(x0) -> list(y0)
fun
<x0:vt>
<y0:vt>
f1un_map0$llist
(f00: (~x0) -> y0): list_vt(x0) -> list_vt(y0)
fun
<x0:vt>
<y0:vt>
f1un_map1$llist
(f00: (!x0) -> y0): (!list_vt(x0)) -> list_vt(y0)
//
(* ****** ****** *)
//
#symload f_map$list with f1un_map$list of 1000
#symload f_map0$llist with f1un_map0$llist of 1000
#symload f_map1$llist with f1un_map1$llist of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
f1un_map$optn
( f00
: (x0) -> y0): optn(x0) -> optn(y0)
fun
<x0:vt>
<y0:vt>
f1un_map0$loptn
( f00
: (~x0) -> y0): optn_vt(x0) -> optn_vt(y0)
fun
<x0:vt>
<y0:vt>
f1un_map1$loptn
( f00
: (!x0) -> y0): (!optn_vt(x0)) -> optn_vt(y0)
//
(* ****** ****** *)
//
#symload f_map$optn with f1un_map$optn of 1000
#symload f_map0$loptn with f1un_map0$loptn of 1000
#symload f_map1$loptn with f1un_map1$loptn of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-06-01:
Sun Jun  1 05:25:29 PM EDT 2025
*)
//
fun
<x0:t0>
<y0:t0>
<e1:vt>
f1un_map$e1nv$list
(f00
:(x0, !e1)->(y0)): (list(x0), !e1)->list(y0)
fun
<x0:vt>
<y0:vt>
<e1:vt>
f1un_map$e1nv0$llist
(f00
:(~x0, !e1)->(y0)): (~list_vt(x0), !e1)->list_vt(y0)
fun
<x0:vt>
<y0:vt>
<e1:vt>
f1un_map$e1nv1$llist
(f00
:(!x0, !e1)->(y0)): (!list_vt(x0), !e1)->list_vt(y0)
//
(* ****** ****** *)
//
#symload f_map$list with f1un_map$e1nv$list of 1000
#symload f_map0$llist with f1un_map$e1nv0$llist of 1000
#symload f_map1$llist with f1un_map$e1nv1$llist of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
<e1:vt>
f1un_map$e1nv$optn
(f00
:(x0, !e1)->(y0)): (optn(x0), !e1)->optn(y0)
fun
<x0:vt>
<y0:vt>
<e1:vt>
f1un_map$e1nv0$loptn
(f00
:(~x0, !e1)->(y0)): (~optn_vt(x0), !e1)->optn_vt(y0)
fun
<x0:vt>
<y0:vt>
<e1:vt>
f1un_map$e1nv1$loptn
(f00
:(!x0, !e1)->(y0)): (!optn_vt(x0), !e1)->optn_vt(y0)
//
(* ****** ****** *)
//
#symload f_map$optn with f1un_map$e1nv$optn of 1000
#symload f_map0$loptn with f1un_map$e1nv0$loptn of 1000
#symload f_map1$loptn with f1un_map$e1nv1$loptn of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_SATS_gfun000.sats] *)
(***********************************************************************)
