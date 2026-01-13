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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
Sun 11 Aug 2024 07:19:56 PM EDT
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
a1sz_vt_get$at
{n:i0}
(!a1sz_vt(a, n), nint(n)): ( a )
fun
<a:t0>
a1sz_vt_set$at
{n:i0}
(!a1sz_vt(a, n), nint(n), a): void
//
#symload [] with a1sz_vt_get$at of 1000
#symload [] with a1sz_vt_set$at of 1000
#symload get$at with a1sz_vt_get$at of 1000
#symload set$at with a1sz_vt_set$at of 1000
//
(* ****** ****** *)
//
fun
<a:vt>
a1sz_vt_cget$at
{n:nat}
(!a1sz_vt(a,n), nintlt(n)): (a)
fun
<a:vt>
a1sz_vt_setf$at
{n:nat}
(!a1sz_vt(a,n), nintlt(n), x:a): void
//
#symload cget$at with a1sz_vt_cget$at of 1000
#symload setf$at with a1sz_vt_setf$at of 1000
//
(* ****** ****** *)
//
fun
<a:vt>
a1sz_vt_lget$at
{n:nat}
( A:
! a1sz_vt(a,n)
, i: nintlt(n)): (owed(a) | a)
fun
<a:vt>
a1sz_vt_lset$at
{n:nat}
( f: owed(a)
| A:
! a1sz_vt(a,n), i: nintlt(n), x: a): void
//
#symload lget$at with a1sz_vt_lget$at of 1000
#symload lset$at with a1sz_vt_lset$at of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fcast // fun
GLSEQ_make_a1sz_vt
{a:vt}
(A:a1sz_vt(a)): GLSEQ(a1sz_vt(a), a)
#symload GLSEQ with GLSEQ_make_a1sz_vt of 1000
fcast // fun
GLASQ_make_a1sz_vt
{a:vt}
(A:a1sz_vt(a)): GLASQ(a1sz_vt(a), a)
#symload GLASQ with GLASQ_make_a1sz_vt of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_SATS_VT_axsz000_vt.sats] *)
(***********************************************************************)
