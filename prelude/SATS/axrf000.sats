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
Sun 11 Aug 2024 12:59:19 PM EDT
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox
a0rf_vt_tx(a:vt)//0-dim
#absvtbx
a0rf_vt_vx(a:vt)//0-dim
//
#typedef
a0rf(a0:vt) = a0rf_vt_tx(a0)
#vwtpdef
a0rf_vt(a0:vt) = a0rf_vt_vx(a0)
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox
a1rf_vt_i0_tx(a:vt,n:i0)
#abstbox
a1rf_vt_i0_vt(a:vt,n:i0)
//
#typedef
a1rf
(a:vt,n:i0) = a1rf_vt_i0_tx(a,n)
#vwtpdef
a1rf_vt
(a:vt,n:i0) = a1rf_vt_i0_vt(a,n)
//
#typedef
a1rf(x0:vt) = [n:i0] a1rf(x0,n)
#vwtpdef
a1rf_vt(x0:vt) = [n:i0] a1rf_vt(x0,n)
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox
a2rf_vt_i0_i0_tx(a:vt,m:i0,n:i0)
#abstbox
a2rf_vt_i0_i0_vt(a:vt,m:i0,n:i0)
//
#typedef
a2rf
(a:vt
,m:i0,n:i0) = a2rf_vt_i0_i0_tx(a,m,n)
#vwtpdef
a2rf_vt
(a:vt
,m:i0,n:i0) = a2rf_vt_i0_i0_vt(a,m,n)
//
#typedef
a2rf(x0:vt) = [m:i0;n:i0] a2rf(x0,m,n)
#vwtpdef
a2rf_vt(x0:vt) = [m:i0;n:i0] a2rf_vt(x0,m,n)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
a0rf_make_1val
  (elem: a): a0rf(a)
//
#symload
a0rf with a0rf_make_1val of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
a0rf_get(A: a0rf(a)): (a)
fun
<a:t0>
a0rf_set(A: a0rf(a), x: a): void
//
#symload [] with a0rf_get of 1000
#symload [] with a0rf_set of 1000
#symload get with a0rf_get of 1000
#symload set with a0rf_set of 1000
//
(* ****** ****** *)
//
fun
<a:vt>
a0rf_cget(A: a0rf(a)): (a)
fun
<a:vt>
a0rf_setf(A: a0rf(a), x: a): void
//
#symload cget with a0rf_cget of 1000
#symload setf with a0rf_setf of 1000
//
(* ****** ****** *)
//
fun
<a:vt>
a0rf_lget
(A:a0rf(a)): (owed(a) | a)
fun
<a:vt>
a0rf_lset
(f:owed(a) | A:a0rf(a), x:a): void
//
#symload lget with a0rf_lget of 1000
#symload lset with a0rf_lset of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
a1rf_make_f1un
 {n:i0|n>0}
( n: sint(n)
, f: nint(n) -> a): a1rf(a, n)
//
#symload a1rf with a1rf_make_f1un of 1000
//
(* ****** ****** *)
//
fun
<a:t0>
a1rf_get$at
{n:nat}
(A:a1rf(a,n), i:nintlt(n)): a
fun
<a:t0>
a1rf_set$at
{n:nat}
(A:a1rf(a,n), i:nintlt(n), x:a): void
//
#symload [] with a1rf_get$at of 1000
#symload [] with a1rf_set$at of 1000
#symload get$at with a1rf_get$at of 1000
#symload set$at with a1rf_set$at of 1000
//
(* ****** ****** *)
//
fun
<a:vt>
a1rf_cget$at
{n:nat}
(A:a1rf(a,n), i:nintlt(n)): a
fun
<a:vt>
a1rf_setf$at
{n:nat}
(A:a1rf(a,n), i:nintlt(n), x:a): void
//
#symload cget$at with a1rf_cget$at of 1000
#symload setf$at with a1rf_setf$at of 1000
//
(* ****** ****** *)
//
fun
<a:vt>
a1rf_lget$at
{n:nat}
( A: a1rf(a,n)
, i: nintlt(n)): (owed(a) | a)
fun
<a:vt>
a1rf_lset$at
{n:nat}
(f: owed(a)
|A: a1rf(a,n), i:nintlt(n), x:a): void
//
#symload lget$at with a1rf_lget$at of 1000
#symload lset$at with a1rf_lset$at of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
a1rf_forall_size
{n:nat}
(A: a1rf(a,n), n: sint(n)): bool
fun
<a:vt>
a1rf_forall_size_f1un
{n:nat}
( A
: a1rf(a,n)
, n: sint(n), test: (!a) -> bool): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
fcast // fun
GSEQ_make_a1rf
{a:t0}
(A:a1rf(a)): GSEQ(a1rf(a), a)
#symload GSEQ with GSEQ_make_a1rf of 1000
fcast // fun
GASZ_make_a1rf
{a:vt}
(A:a1rf(a)): GASZ(a1rf(a), a)
#symload GASZ with GASZ_make_a1rf of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_axrf000.sats] *)
