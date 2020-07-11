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
// For pure arrays in C
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: May 28, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
// HX-2020-06-10:
// Note that array_vt is included
//
(* ****** ****** *)

abstbox
a0ref_vt_x0(a:vt)
absvtbx
a0ptr_vt_vx(a:vt)
typedef
a0ref(a:vt) = a0ref_vt_x0(a)
vwtpdef
a0ptr(a:vt) = a0ptr_vt_vx(a)

(* ****** ****** *)
//
abstbox
a1ref_vt_i0_x0(a:vt, n:i0)
absvtbx
a1ptr_vt_i0_vx(a:vt, n:i0)
//
typedef
a1ref(
a:vt,n:i0) = a1ref_vt_i0_x0(a,n)
vwtpdef
a1ptr(
a:vt,n:i0) = a1ptr_vt_i0_vx(a,n)
//
(* ****** ****** *)
//
typedef
a1refsz(a:vt) = [n:i0] a1ref(a, n)
vwtpdef
a1ptrsz(a:vt) = [n:i0] a1ptr(a, n)
//
(* ****** ****** *)
//
fcast
a0ptr2ref
{a:vt}
(a0ptr(a)): a0ref(a)
fcast
a1ptr2ref
{a:vt}{n:i0}
(a1ptr(a, n)): a1ref(a, n)
//
(* ****** ****** *)
//
fun
<a:vt>
a0ptr_alloc
((*void*)): a0ptr(?a)
fun
<a:vt>
a0ptr_clear
(!a0ptr(a) >> a0ptr(~a)): void
//
(* ****** ****** *)
//
fun
<a:vt>
a0ref_make(x0: a): a0ref(a)
fun
<a:vt>
a0ptr_make(x0: a): a0ptr(a)
//
fun
<a:vt>
a0ptr_free(A0: a0ptr(a)): void
//
(* ****** ****** *)
//
fun
<a:vt>
a0ref_get(A0: a0ref(a)): ~a
fun
<a:vt>
a0ref_set(A0: a0ref(a), x0: a): void
//
fun
<a:vt>
a0ptr_get
(!a0ptr(a) >> a0ptr(~a)): a
fun
<a:vt>
a0ptr_set
(!a0ptr(?a) >> a0ptr(a), x0: a): void
//
(* ****** ****** *)
//
fun<>
a0ref_print$beg(): void
fun<>
a0ref_print$end(): void
fun<>
a0ptr_print$beg(): void
fun<>
a0ptr_print$end(): void
//
fun
<a:vt>
a0ref_print(A0: a0ref(a)): void
fun
<a:vt>
a0ptr_print( !a0ptr(a) ): void
//
(* ****** ****** *)
//
// HX: 1-dimensional
//
(* ****** ****** *)
//
fun
<a:vt>
a1ptr_alloc
{n:nat}
(asz: int(n)): a1ptr(?a, n)
fun
<a:vt>
a1ptr_clear
{n:nat}
( A0:
! a1ptr(a, n) >> a1ptr(~a, n)): void
//
(* ****** ****** *)
//
fun
<a:vt>
a1ref_make_nval
{n:nat}
( asz
: int(n), ini: a): a1ref(a, n)
//
fun
<a:vt>
a1ptr_make_nval
{n:nat}
( asz
: int(n), ini: a): a1ptr(a, n)
//
(* ****** ****** *)
//
fun
<a:t0>
a1ref_make_list
{n:i0}
( xs: list(a, n) ): a1ref(a, n)
fun
<a:t0>
a1ptr_make_list
{n:i0}
( xs: list(a, n) ): a1ptr(a, n)
//
fun
<a:vt>
a1ref_make_list_vt
{n:i0}
(xs: list_vt(a, n)): a1ref(a, n)
fun
<a:vt>
a1ptr_make_list_vt
{n:i0}
(xs: list_vt(a, n)): a1ptr(a, n)
//
(* ****** ****** *)

fun
<a:vt>
a1ref_head
{n:i0|n>0}
(A0: a1ref(a, n)): ~a
fun
<a:vt>
a1ref_tail
{n:i0|n>0}
(A0: a1ref(a, n)): a1ref(a, n-1)

(* ****** ****** *)
//
fun
<a:vt>
<n:i0>
a1ref_length(a1ref(a, n)): int(n)
fun
<a:vt>
<n:i0>
a1ptr_length(!a1ptr(a, n)): int(n)
//
(* ****** ****** *)
//
fun
<a:vt>
a1ref_get_at
{n:i0}
( A0
: a1ref(a, n), i0: nintlt(n)): ~a
fun
<a:vt>
a1ptr_get_at
{n:i0}
( A0:
! a1ptr(a, n), i0: nintlt(n)): ~a
//
fun
<a:vt>
a1ref_set_at
{n:i0}
( A0:
  a1ref(a, n)
, i0: nintlt(n), x0: a(*new*)): void
fun
<a:vt>
a1ptr_set_at
{n:i0}
( A0:
! a1ptr(a, n)
, i0: nintlt(n), x0: a(*new*)): void
fun
<a:vt>
a1ptr_set_at_raw
{n:i0}
( A0:
! a1ptr(?a, n)
, i0: nintlt(n), x0: a(*ini*)): void
//
fun
<a:vt>
a1ref_exch_at
{n:i0}
( A0:
  a1ref(a, n)
, i0: nintlt(n), x0: a(*new*)): a(*old*)
fun
<a:vt>
a1ptr_exch_at
{n:i0}
( A0:
! a1ptr(a, n)
, i0: nintlt(n), x0: a(*new*)): a(*old*)
//
(* ****** ****** *)
//
fun<>
a1ref_print$beg(): void
fun<>
a1ref_print$end(): void
fun<>
a1ref_print$sep(): void
fun<>
a1ptr_print$beg(): void
fun<>
a1ptr_print$end(): void
fun<>
a1ptr_print$sep(): void
//
fun
<a:vt>
a1ref_print(A0: a1ref(a)): void
fun
<a:vt>
a1ptr_print(A0: !a1ptr(a)): void
//
(* ****** ****** *)

fun
<a:t0>
a1ref_listize
{n:i0}
(A0: a1ref(a, n)): list_vt(a,n)
fun
<a:vt>
a1ref_listize0
{n:i0}
(A0: a1ref(a, n)): list_vt(a,n)

(* ****** ****** *)

fun
<a:t0>
a1ref_rlistize
{n:i0}
(A0: a1ref(a, n)): list_vt(a,n)
fun
<a:vt>
a1ref_rlistize0
{n:i0}
(A0: a1ref(a, n)): list_vt(a,n)

(* ****** ****** *)
//
fun
<a:vt>
a1ref_streamize
{n:i0}
(A0: a1ref(a, n)): stream_vt(a)
fun
<a:vt>
a1ptr_streamize
{n:i0}
(A0: a1ptr(a, n)): stream_vt(a)
//
(* ****** ****** *)
//
fun
<x0:t0>
a1ref_forall
{n:i0}(A0: a1ref(x0, n)): bool
fun
<x0:vt>
a1ref_forall0
{n:i0}(A0: a1ref(x0, n)): bool
//
fun
<x0:t0>
a1ref_foreach
{n:i0}(A0: a1ref(x0, n)): void
fun
<x0:vt>
a1ref_foreach0
{n:i0}(A0: a1ref(x0, n)): void
//
(* ****** ****** *)
//
fun
<x0:t0>
a1ref_rforall
{n:i0}(A0: a1ref(x0, n)): bool
fun
<x0:vt>
a1ref_rforall0
{n:i0}(A0: a1ref(x0, n)): bool
//
(* ****** ****** *)
//
// HX-2020-05-30:
// symbol overloading for array
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
#symload
a0ref with a0ref_make of 1000
#symload
a0ptr with a0ptr_make of 1000
//
(* ****** ****** *)

#symload
print with a0ref_print of 1000
#symload
print with a0ptr_print of 1000

(* ****** ****** *)

#symload
head with a1ref_head of 1000
#symload
tail with a1ref_tail of 1000

(* ****** ****** *)
(*
#symload
length with a1ref_length of 1000
#symload
length with a1ptr_length of 1000
*)
(* ****** ****** *)
//
#symload
[] with a1ref_get_at of 1000
#symload
[] with a1ref_set_at of 1000
#symload
get_at with a1ref_get_at of 1000
#symload
set_at with a1ref_set_at of 1000
//
(* ****** ****** *)
//
#symload
[] with a1ptr_get_at of 1000
#symload
[] with a1ptr_set_at of 1000
#symload
get_at with a1ptr_get_at of 1000
#symload
set_at with a1ptr_set_at of 1000
//
(* ****** ****** *)
#symload
a1ref with a1ref_make_nval of 1000
#symload
a1ptr with a1ptr_make_nval of 1000
(* ****** ****** *)
#symload
listize with a1ref_listize of 1000
#symload
listize0 with a1ref_listize0 of 1000
(* ****** ****** *)
#symload
rlistize with a1ref_rlistize of 1000
#symload
rlistize0 with a1ref_rlistize0 of 1000
(* ****** ****** *)

(* end of [array.sats] *)
