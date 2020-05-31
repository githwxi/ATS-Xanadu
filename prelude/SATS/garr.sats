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
arref_t0_i0_x0(a:vt, n:int)
absvtbox
array_vt_i0_vx(a:vt, n:int)

(* ****** ****** *)

typedef
arref(a:vt,n:int) = arref_t0_i0_x0(a,n)
vtypedef
array(a:vt,n:int) = array_vt_i0_vx(a,n)

(* ****** ****** *)

fcast
array2ref
{a:vt}{n:i0}
(A0: array(a, n)): arref(a, n)

(* ****** ****** *)

fun
<a:vt>
<n:int>
arref_length(arref(a, n)): int(n)
fun
<a:vt>
<n:int>
array_length(!array(a, n)): int(n)

(* ****** ****** *)
//
fun
<a:vt>
arref_get_at
{n:int}
(A0: arref(a, n), i0: nintlt(n)): a
fun
<a:vt>
arref_set_at
{n:int}
( A0:
  arref(a, n), i0: nintlt(n), x0: a): void
//
(* ****** ****** *)
//
fun
<a:vt>
array_get_at
{n:int}
(A0: !array(a, n), i0: nintlt(n)): a
fun
<a:vt>
array_set_at
{n:int}
( A0:
! array(a, n), i0: nintlt(n), x0: a): void
//
(* ****** ****** *)

fun
<a:vt>
arref_streamize
{n:int}
(A0: arref(a, n)): stream_vt(a)

(* ****** ****** *)
//
fun
<x0:t0>
arref_forall
{n:int}(A0: arref(x0, n)): bool
fun
<x0:vt>
arref_forall1
{n:int}(A0: arref(x0, n)): bool
//
fun
<x0:t0>
arref_foreach
{n:int}(A0: arref(x0, n)): void
fun
<x0:vt>
arref_foreach1
{n:int}(A0: arref(x0, n)): void
//
(* ****** ****** *)
//
// HX-2020-05-30:
// symbol overloading for garr
//
(* ****** ****** *)

#symload
length with arref_length of 1000

(* ****** ****** *)
//
#symload sub with arref_get_at of 1000
#symload sub with arref_set_at of 1000
//
#symload sub with array_get_at of 1000
#symload sub with array_set_at of 1000
//
(* ****** ****** *)

(* end of [garr.sats] *)
