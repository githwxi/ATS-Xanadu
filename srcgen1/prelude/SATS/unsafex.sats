(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
// For casting of all sorts
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: October, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
fcast
detop0{a0:t0}(x0: ?a0): (a0)
fcast
detop1{a0:vt}(x0: ?a0): (a0)
//
(* ****** ****** *)
//
fcast
castxy{ax:t0}{ay:t0}(ax):(ay)
fcast
castyx{ay:t0}{ax:t0}(ax):(ay)
//
fcast
cast01{a0:t0}{a1:t0}(a0):(a1)
fcast
cast10{a1:t0}{a0:t0}(a0):(a1)
//
(* ****** ****** *)
//
fcast
delinear{a0:vt}( a0 ): ( ?!a0 )
fcast
enlinear{a0:vt}(?!a0): (  a0  )
//
(* ****** ****** *)
//
fcast
castxy0
{ax:vt}{ay:vt}(ax):(ay)
fcast
castyx0
{ay:vt}{ax:vt}(ax):(ay)
//
fcast
castlin01{a0:vt}{a1:vt}(a0):(a1)
fcast
castlin10{a1:vt}{a0:vt}(a0):(a1)
//
(* ****** ****** *)
//
(*
Mon Jul  4 17:58:26 EDT 2022
*)
fcast//HX: it is safe!
datacopy{a0:vt}(x0: !a0): (?!a0)
//
(* ****** ****** *)
//
fcast
optn_vt2t1
{a:t0}{b:b0}
(xs: !optn_vt(a, b)): optn(a, b)
fcast
list_vt2t1
{a:t0}{n:i0}
(xs: !list_vt(a, n)): list(a, n)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
p1tr_get(p0: p1tr): (a)
fun
<a:vt>
p1tr_set(p0: p1tr, x0: a): void
fun
<a:vt>
p1tr_ret(p0: p1tr, x0: a): void
//
#symload ptr_get with p1tr_get of 1000
#symload ptr_set with p1tr_set of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
p2tr_get(p0: p2tr(a)): (a)
fun
<a:vt>
p2tr_set(p0: p2tr(a), x0: a): void
fun
<a:vt>
p2tr_ret(p0: p2tr(a), x0: a): void
//
#symload ptr_get with p2tr_get of 1000
#symload ptr_set with p2tr_set of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2020-07-29:
const pointers are read-only
*)
//
fun
<a:vt>
cp1tr_get(cp: cp1tr): a
fun
<a:vt>
cp2tr_get(cp: cp2tr(a)): a
//
#symload cptr_get with cp1tr_get of 1000
#symload cptr_get with cp2tr_get of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
p2tr_set_list_nil
(p0: p2tr(list(a))): void
fun
<a:t0>
p2tr_set_list_cons
(p0: p2tr(list(a)), x0: a): void
//
fun
<a:t0>
p2tr_set_list_vt_nil
(p0: p2tr(list_vt(a))): void
fun
<a:vt>
p2tr_set_list_vt_cons
(p0: p2tr(list_vt(a)), x0: a): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX:
these two are safe!
fun
<a:vt>
a0ref_dtget
(A0: a0ref(a)): ?!a
fun
<a:vt>
a0ref_dtset
(a0ref(a), ?!a): void
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
strn_head$raw(strn): cgtz
fun<>
strn_tail$raw(strn): strn
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
gseq_head$raw(xs): x0
fun
<xs:t0>
<x0:t0>
gseq_tail$raw(xs): xs
//
fun
<xs:t0>
<x0:t0>
gseq_last$raw(xs): x0
//
fun
<xs:t0>
<x0:t0>
gseq_uncons$raw(xs: &xs >> xs): x0
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
list_head$raw(xs: list(a)): (a)
fun
<a:t0>
list_tail$raw(xs: list(a)): list(a)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
strm_head$raw(strm(a)): a
fun
<a:t0>
strm_tail$raw(strm(a)): strm(a)
fun
<a:t0>
strmcon_head$raw(strmcon(a)): a
fun
<a:t0>
strmcon_tail$raw(strmcon(a)): strm(a)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-26:
These should be
used with caution!!!
*)
//
fun
<xs:t0>
<x0:t0>
gasz_get$at$raw
( xs: xs, i0: ni): x0
fun
<xs:t0>
<x0:t0>
gasz_set$at$raw
( xs: xs, i0: ni, x0: x0): void
//
fun
<xs:t0>
<x0:vt>
gasz_cget$at$raw
( xs: xs, i0: ni): x0
fun
<xs:t0>
<x0:vt>
gasz_setf$at$raw
( xs: xs, i0: ni, x0: x0): void
//
fun
<xs:t0>
<x0:vt>
gasz_lget$at$raw
( xs: xs
, i0: ni): (owed(x0) | x0)
fun
<xs:t0>
<x0:vt>
gasz_lset$at$raw
( pf: owed(x0)
| xs: xs, i0: ni, x0: x0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:vt>
<x0:vt>
gasz_get$at$raw1
(xs: !xs, i0: ni): (x0)
fun
<xs:vt>
<x0:vt>
gasz_set$at$raw1
(xs: !xs, i0: ni, x0: x0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
strn_get$at$raw(strn, ni): (cgtz)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_SATS_unsafex.sats] *)
