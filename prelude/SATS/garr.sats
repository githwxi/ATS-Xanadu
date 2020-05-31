(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
// For functional lists
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: May 28, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

abstbox
a0ref_vt_x0(a:vt)
absvtbox
a0ptr_vt_vx(a:vt)
typedef
a0ref(a:vt) = a0ref_vt_x0(a)
vtypedef
a0ptr(a:vt) = a0ptr_vt_vx(a)

(* ****** ****** *)
//
abstbox
a1ref_vt_i0_x0(a:vt, n:int)
absvtbox
a1ptr_vt_i0_vx(a:vt, n:int)
typedef
a1ref(a:vt,n:int) = a1ref_vt_i0_x0(a,n)
vtypedef
a1ptr(a:vt,n:int) = a1ptr_vt_i0_vx(a,n)
//
(* ****** ****** *)

fcast
a0ptr2ref
{a:vt}
(A0: a0ptr(a)): a0ref(a)
fcast
a1ptr2ref
{a:vt}{n:i0}
(A0: a1ptr(a, n)): a1ref(a, n)

(* ****** ****** *)
//
fun
<a:vt>
a0ref_get(A0: a0ref(a)): a
fun
<a:vt>
a0ref_set(A0: a0ref(a), x0: a): void
//
fun
<a:vt>
a0ptr_get(A0: a0ptr(a)): a
fun
<a:vt>
a0ptr_set(A0: a0ptr(a), x0: a): void
//
(* ****** ****** *)
//
fun
<a:vt>
a0ref_make(x0: a): a0ref(a)
//
fun
<a:vt>
a0ptr_make(x0: a): a0ptr(a)
fun
<a:vt>
a0ptr_free(A0: a0ptr(a)): void
//
(* ****** ****** *)
//
// HX: 1-dimensional
//
(* ****** ****** *)

fun
<a:vt>
<n:int>
a1ref_length(a1ref(a, n)): int(n)
fun
<a:vt>
<n:int>
a1ptr_length(!a1ptr(a, n)): int(n)

(* ****** ****** *)
//
fun
<a:vt>
a1ref_get_at
{n:int}
(A0: a1ref(a, n), i0: nintlt(n)): a
fun
<a:vt>
a1ref_set_at
{n:int}
( A0:
  a1ref(a, n), i0: nintlt(n), x0: a): void
//
(* ****** ****** *)
//
fun
<a:vt>
a1ptr_get_at
{n:int}
(A0: !a1ptr(a, n), i0: nintlt(n)): a
fun
<a:vt>
a1ptr_set_at
{n:int}
( A0:
! a1ptr(a, n), i0: nintlt(n), x0: a): void
//
(* ****** ****** *)

fun
<a:vt>
a1ref_streamize
{n:int}
(A0: a1ref(a, n)): stream_vt(a)

(* ****** ****** *)
//
fun
<x0:t0>
a1ref_forall
{n:int}(A0: a1ref(x0, n)): bool
fun
<x0:vt>
a1ref_forall1
{n:int}(A0: a1ref(x0, n)): bool
//
fun
<x0:t0>
a1ref_foreach
{n:int}(A0: a1ref(x0, n)): void
fun
<x0:vt>
a1ref_foreach1
{n:int}(A0: a1ref(x0, n)): void
//
(* ****** ****** *)
//
// HX-2020-05-30:
// symbol overloading for garr
//
(* ****** ****** *)
//
#symload
get with a0ref_get of 1000
#symload
set with a0ref_set of 1000
//
#symload
get with a0ptr_get of 1000
#symload
set with a0ptr_set of 1000
//
(* ****** ****** *)

#symload
length with a1ref_length of 1000
#symload
length with a1ptr_length of 1000

(* ****** ****** *)
//
#symload sub with a1ref_get_at of 1000
#symload sub with a1ref_set_at of 1000
//
#symload sub with a1ptr_get_at of 1000
#symload sub with a1ptr_set_at of 1000
//
(* ****** ****** *)

(* end of [garr.sats] *)
