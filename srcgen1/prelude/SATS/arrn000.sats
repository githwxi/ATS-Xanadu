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
(*
Author: Hongwei Xi
Start Time: May 28, 2020
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
a0ref_make_1val(a): a0ref(a)
//
(* ****** ****** *)
//
fun
<a:t0>
a0ref_get
(A0: a0ref(a)): ( a )
fun
<a:t0>
a0ref_set
(A0: a0ref(a), x0: a): void
//
(* ****** ****** *)
//
(*
HX: new<->old
*)
//
fun
<a:vt>
a0ref_exch
(A0: a0ref(a), x0: a): ( a )
//
(* ****** ****** *)
//
fun
<a:vt>
a0ref_dtget
(A0: a0ref(a)): (?!a)
fun
<a:vt>
a0ref_dtset
(A0: a0ref(a), x0: ?!a): void
//
(* ****** ****** *)
//
fun
<a:vt> // copy+get
a0ref_cpget
  (A0: a0ref(a)): (a)
fun
<a:vt> // set+free
a0ref_frset
  (A0: a0ref(a), x0: a): void
//
(* ****** ****** *)
//
(*
fun
<a:vt>
g_updt(x0: &a >> _): void
*)
fun
<a:vt>
a0ref_updt(A0: a0ref(a)): void
//
(* ****** ****** *)
//
// HX: 1-dimensional
//
(* ****** ****** *)
//
fun
<a:t0>
a1ref_make_nval
{n:nat}
( asz
: sint(n), ini: a): a1ref(a, n)
//
(* ****** ****** *)
//
fun
<a:t0>
a1ref_make_list
{n:i0}
( xs: list(a, n) ): a1ref(a, n)
//
fun
<a:vt>
a1ref_make0_llist
{n:i0}
(xs: list_vt(a, n)): a1ref(a, n)
//
(* ****** ****** *)

fun
<a:t0>
a1ref_head
{n:i0|n>0}
(A0: a1ref(a, n)): (?!a)
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
a1ref_length(a1ref(a, n)): nint(n)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
a1ref_get$at
{n:i0}
( A0
: a1ref(a, n), i0: nintlt(n)): (a)
fun
<a:t0>
a1ref_set$at
{n:i0}
( A0
: a1ref(a, n)
, i0: nintlt(n), x0: a(*new*)): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
a1ref_exch$at
{n:i0}
( A0:
  a1ref(a, n)
, i0: nintlt(n), x0: a(*new*)): a(*old*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
a1ref_dtget$at
{n:i0}
( A0:
  a1ref(a, n), i0: nintlt(n)): (?!a)
//
fun
<a:vt>
a1ref_dtset$at
{n:i0}
( A0:
  a1ref(a, n), i0: nintlt(n), x: ?!a): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX: [cget$at]: copy+get$at
*)
//
fun
<a:vt>
a1ref_cpget$at
{n:i0}
( A0:
  a1ref(a, n), i0: nintlt(n)): (a)
//
(* ****** ****** *)
//
(*
HX: [frset$at]: free+set$at
*)
//
fun
<a:vt>
a1ref_frset$at
{n:i0}
( A0
: a1ref(a, n)
, i0: nintlt(n), x0 : a(*new*)): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
<a:vt>
g_updt(x0: &a >> _): void
*)
fun
<a:vt>
a1ref_updt$at
{n:i0}
( A0:
  a1ref(a, n), i0: nintlt(n)): void
//
(* ****** ****** *)
//
fun
<a:vt>
a1ref_strmize
{n:i0}
(A0: a1ref(a, n)): strm_vt(a)
//
(* ****** ****** *)
//
fun
<a:vt>
a1ref_listize
{n:i0}
(A0: a1ref(a, n)): list_vt(a, n)
//
(* ****** ****** *)
//
fun
<a:vt>
a1ref_rlistize
{n:i0}
(A0: a1ref(a, n)): list_vt(a, n)
//
(* ****** ****** *)
//
fun
<x0:t0>
a1ref_forall
{n:i0}(A0: a1ref(x0, n)): (bool)
fun
<x0:vt>
a1ref_forall1
{n:i0}(A0: a1ref(x0, n)): (bool)
//
fun
<x0:t0>
a1ref_foritm
{n:i0}(A0: a1ref(x0, n)): (void)
fun
<x0:vt>
a1ref_foritm1
{n:i0}(A0: a1ref(x0, n)): (void)
//
(* ****** ****** *)
//
fun
<x0:t0>
a1ref_rforall
{n:i0}(A0: a1ref(x0, n)): (bool)
fun
<x0:vt>
a1ref_rforall1
{n:i0}(A0: a1ref(x0, n)): (bool)
//
(* ****** ****** *)
//
// HX-2020-05-30:
// symbol overloading for array
//
(* ****** ****** *)
//
#symload [] with a0ref_get of 1000
#symload [] with a0ref_set of 1000
//
#symload get with a0ref_get of 1000
#symload set with a0ref_set of 1000
//
(* ****** ****** *)
//
#symload head with a1ref_head of 1000
#symload tail with a1ref_tail of 1000
//
(* ****** ****** *)
//
#symload [] with a1ref_get$at of 1000
#symload [] with a1ref_set$at of 1000
#symload get$at with a1ref_get$at of 1000
#symload set$at with a1ref_set$at of 1000
//
(* ****** ****** *)
#symload a0ref with a0ref_make_1val of 1000
#symload a1ref with a1ref_make_nval of 1000
(* ****** ****** *)
//
#symload listize with a1ref_listize of 1000
#symload strmize with a1ref_strmize of 1000
//
#symload rlistize with a1ref_rlistize of 1000
//
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_SATS_arrn000.sats] *)
