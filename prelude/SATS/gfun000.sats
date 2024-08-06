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
Fri 26 Jul 2024 09:27:30 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX:
For functions
(fnp, cfp, cfr, etc)
*)
(* ****** ****** *)
(* ****** ****** *)
#typedef
c0fr(r0:vt) = () -<cfr> r0
(* ****** ****** *)
#typedef
c1fr
(a1:t0,r0:vt) = (a1)-<cfr>r0
#typedef
f1np
(a1:t0,r0:vt) = (a1)-<fnp>r0
(* ****** ****** *)
#typedef
c2fr
(a1:t0
,a2:t0,r0:vt) = (a1,a2)-<cfr>r0
#typedef
f2np
(a1:t0
,a2:t0,r0:vt) = (a1,a2)-<fnp>r0
(* ****** ****** *)
#typedef
c3fr
(a1:t0
,a2:t0
,a3:t0,r0:vt) = (a1,a2,a3)-<cfr>r0
#typedef
f3np
(a1:t0
,a2:t0
,a3:t0,r0:vt) = (a1,a2,a3)-<fnp>r0
(* ****** ****** *)
#typedef
c4fr
(a1:t0
,a2:t0
,a3:t0
,a4:t0,r0:vt) = (a1,a2,a3,a4)-<cfr>r0
#typedef
f4np
(a1:t0
,a2:t0
,a3:t0
,a4:t0,r0:vt) = (a1,a2,a3,a4)-<fnp>r0
(* ****** ****** *)
//
fun
<a1:t0>
c1fr_not
( f0
: c1fr(a1,bool)): c1fr(a1,bool)
//
#symload not with c1fr_not of 1000
//
(* ****** ****** *)
//
fun<>
c0fr_repeat_nint
( f0
: c0fr(void), times: nint): void
//
#symload repeat with c0fr_repeat_nint of 1000
//
(* ****** ****** *)
//
fun
<x0:vt>
c0fr_enum$make0_strx_vt
  (xs: strx_vt( x0 )): c0fr( x0 )
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
c1fr_srch$make_gseq(xs): c1fr(x0,bool)
//
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
c1fr_equal_at
( f0
: c1fr(x0, r0)
, x0: x0, r0: r0): bool
//
fun
<x0:t0>
<y0:vt>
c1fr_rand$equal
( f1: c1fr(x0, y0)
, f2: c1fr(x0, y0)): bool // end-fun
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gfun000.sats] *)
