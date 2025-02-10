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
(* ****** ****** *)
//
(*
For pure arrays in C
*)
//
(*
Author: Hongwei Xi
Start Time: May 28, 2020
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
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
fcast
a2ptr2ref
{a:vt}{m,n:i0}
(a2ptr(a, m, n)): a2ref(a, m, n)
//
(* ****** ****** *)
//
// HX-2020-12-05:
// This one needs to be
// given a native implementation
//
fun
<a:vt>
a0ptr_alloc
((*void*)): a0ptr(?a)
(* ****** ****** *)
//
(*
HX-2022-06-13:
free = clear+mfree
*)
fun
<a:vt>
a0ptr_free
(A0: a0ptr(a)): void
//
fun
<a:vt>
a0ptr_mfree0
(A0: a0ptr(?a)): void
//
fun
<a:vt>
a0ptr_clear1
{n:nat}
( A0:
! a0ptr(a) >> a0ptr(?a)
) : void//end-of-function
//
(* ****** ****** *)
//
fun
<a:vt>
a0ptr_make0_1val(a): a0ptr(a)
//
#symload
a0ptr with a0ptr_make0_1val of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
a0ptr_get1(!a0ptr(a)): (a)
fun
<a:t0>
a0ptr_set1
(!a0ptr(a)>>a0ptr(a), x0: a): void
//
fun
<a:vt>
a0ptr_exch1
(A0: !a0ptr(a), x0: a(*new*)): a(*old*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
a0ptr_vtget1
(!a0ptr(a) >> a0ptr(?a)): (a)
fun
<a:vt>
a0ptr_vtset1
(!a0ptr(?a)>>a0ptr(a), x0: a): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
a0ptr_dtget1
(A0: !a0ptr(a)): ?!a(*HX: data only*)
fun
<a:vt>
a0ptr_dtset1
( A0:
! a0ptr(a)>>a0ptr(a), x: (?!a)): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX: [cpget]: copy+get
HX: [frset]: free+set
*)
//
fun
<a:vt>
a0ptr_cpget1
(A0: !a0ptr(a)): (a) //copy+get
fun
<a:vt>
a0ptr_frset1
(A0: !a0ptr(a), x0: a): void//free+set
//
(* ****** ****** *)
//
(*
fun
<a:vt>
g_updt(x0: &a >> _): void
fun
<a:vt>
a0ptr_updt!(A0: !a0ptr(a)): void
*)
//
(* ****** ****** *)
//
fun<>
a0ptr_print$beg(): void
fun<>
a0ptr_print$end(): void
//
fun
<a:vt>
a0ptr_print0(A0: ~a0ptr(a)): void
fun
<a:vt>
a0ptr_print1(A0: !a0ptr(a)): void
//
(* ****** ****** *)
//
// HX: 1-dimensional
//
(* ****** ****** *)
//
// HX-2020-12-05
// This one needs to be
// given a native implementation
//
fun
<a:vt>
a1ptr_alloc
{n:nat}
(asz: sint(n)): a1ptr(?a, n)
(* ****** ****** *)
//
(*
HX-2022-06-13:
free = clear+mfree
*)
fun
<a:vt>
a1ptr_free
{n:nat}
( A0:
~ a1ptr(a,n), sz: sint(n)
) : void // end-of-function
//
fun
<a:vt>
a1ptr_mfree0
{n:nat}(A0: a1ptr(?a, n)): void
//
fun
<a:vt>
a1ptr_clear1
{n:nat}
( A0:
! a1ptr(a,n) >> a1ptr(?a,n), n0: sint(n)
) : void // end-of-function
//
(* ****** ****** *)
//
fun
<a:t0>
a1ptr_make_nval
{n:nat}
(asz: sint(n), x0: a): a1ptr(a, n)
//
#symload a1ptr with a1ptr_make_nval of 1000
//
(* ****** ****** *)
//
fun
<a:t0>
a1ptr_make_list
{n:i0}(xs: list(a,n)): a1ptr(a, n)
//
#symload a1ptr with a1ptr_make_list of 1000
//
fun
<a:vt>
a1ptr_make0_llist
{n:i0}(xs: list_vt(a,n)): a1ptr(a, n)
//
#symload a1ptr with a1ptr_make0_llist of 1000
//
(* ****** ****** *)
//
fun
<a:t0>
a1ptr_make_listn
{n:i0}
(xs: list(a,n), sint(n)): a1ptr(a, n)
//
#symload a1ptr with a1ptr_make_listn of 1000
//
fun
<a:vt>
a1ptr_make0_llistn
{n:i0}
(xs: list_vt(a,n), sint(n)): a1ptr(a, n)
//
#symload a1ptr with a1ptr_make0_llistn of 1000
//
(* ****** ****** *)
//
(*
HX-2022-06-13:
For each a1ptr-value, its
length is obtained contextually
*)
fun
<a:vt>
<n:i0>
a1ptr_length0
( A0: ~a1ptr(a, n) ): nint( n )
fun
<a:vt>
<n:i0>
a1ptr_length1
( A0: !a1ptr(a, n) ): nint( n )
//
(* ****** ****** *)
//
fun
<a:t0>
a1ptr_get$at1
{n:i0}
( A0:
! a1ptr(a, n), i0: nintlt(n)): a
//
fun
<a:t0>
a1ptr_set$at1
{n:i0}
( A0:
! a1ptr(a, n)
, i0: nintlt(n), x0: a(*new*)): void
//
fun
<a:vt>
a1ptr_exch$at1
{n:i0}
( A0:
! a1ptr(a, n)
, i0: nintlt(n), x0: a(*new*)): a(*old*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
a1ptr_dtget$at1
{n:i0}
( A0:
! a1ptr(a, n), i0: nintlt(n)): (?!a)
//
fun
<a:vt>
a1ptr_dtset$at1
{n:i0}
( A0:
! a1ptr(a, n), i0: nintlt(n), x0: ?!a): void
//
(* ****** ****** *)
//
(*
HX: [cpget$at]: copy+(get$at)
HX: [frset$at]: (set$at)+free
*)
//
fun
<a:vt>
a1ptr_cpget$at1
{n:i0}
( A0:
! a1ptr(a, n), i0: nintlt(n)): a
//
fun
<a:vt>
a1ptr_frset$at1
{n:i0}
( A0:
! a1ptr(a, n), i0: nintlt(n), x0 : a): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<a:vt>
g_updt(x0: &a >> _): void
fun
<a:vt>
a1ptr_updt$at1
{n:i0}
(A0: !a1ptr(a, n), i0: nintlt(n)): void
*)
//
(* ****** ****** *)
//
fun<>
a1ptr_print$beg(): void
fun<>
a1ptr_print$end(): void
fun<>
a1ptr_print$sep(): void
//
fun
<a:vt>
a1ptr_print0
{n:i0}
( A0: 
~ a1ptr(a, n), sz: sint(n)): void
fun
<a:vt>
a1ptr_print1
{n:i0}
( A0:
! a1ptr(a, n), sz: sint(n)): void
//
(* ****** ****** *)
//
fun
<a:vt>
a1ptr_strmize0
{n:i0}
( A0:
~ a1ptr(a,n), sz: sint(n)): strm_vt(a)
fun
<a:vt>
a1ptr_rstrmize0
{n:i0}
( A0:
~ a1ptr(a,n), sz: sint(n)): strm_vt(a)
//
(* ****** ****** *)
//
fun
<a:vt>
a1ptr_listize0
{n:i0}
( A0:
~ a1ptr(a,n), sz: sint(n)): list_vt(a,n)
fun
<a:vt>
a1ptr_rlistize0
{n:i0}
( A0:
~ a1ptr(a,n), sz: sint(n)): list_vt(a,n)
//
(* ****** ****** *)
//
// HX-2020-05-30:
// symbol overloading for array
//
(* ****** ****** *)
//
#symload [] with a0ptr_get1 of 1000
#symload [] with a0ptr_set1 of 1000
#symload get1 with a0ptr_get1 of 1000
#symload set1 with a0ptr_set1 of 1000
//
(* ****** ****** *)
//
#symload [] with a1ptr_get$at1 of 1000
#symload [] with a1ptr_set$at1 of 1000
#symload get$at1 with a1ptr_get$at1 of 1000
#symload set$at1 with a1ptr_set$at1 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_arrn000_vt.sats] *)
