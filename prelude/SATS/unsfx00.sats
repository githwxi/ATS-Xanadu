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
(*
Mon 08 Jul 2024 02:15:16 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
// For casting of all sorts
//
(* ****** ****** *)
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
castxy1
{ax:vt}
{ay:vt}(!ax):(owed(ay) | ay)
fcast
castyx1
{ay:vt}
{ax:vt}(!ax):(owed(ay) | ay)
//
(*
fcast
castlinxy{ax:vt}{ay:vt}(ax):(ay)
fcast
castlinyx{ay:vt}{ax:vt}(ax):(ay)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
Mon Jul  4 17:58:26 EDT 2022
*)
fcast//HX: it is safe!
datacopy{a0:vt}(x0: !a0): (?!a0)
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
#symload ptr_ret with p1tr_ret of 1000
//
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
#symload ptr_ret with p2tr_ret of 1000
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
cp1tr_get(cp: cp1tr): (a)
fun
<a:vt>
cp2tr_get(cp: cp2tr(a)): (a)
//
#symload cptr_get with cp1tr_get of 1000
#symload cptr_get with cp2tr_get of 1000
//
(* ****** ****** *)
//
fun
<a:t0>
p2tr_set_list_nil
(p2tr(?list(a))): void
fun
<a:t0>
p2tr_set_list_cons
(p0:p2tr(list(a)), x0: a): void
//
(*
fun
<a:t0>
p2tr_set_list_vt_nil
(p2tr(?list_vt(a))): void
fun
<a:t0>
p2tr_set_list_vt_cons
(p0:p2tr(list_vt(a)), x0: a): void
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX:
[i0] is assumed to be
less than the length of [xs]
*)
fun
<xs:t0>
<x0:t0>
gseq_get$at$raw
  (xs: xs, i0: ni): (x0)
//
fun
<xs:t0>
<x0:t0>
gseq_fset$at$raw
(xs: xs,i0: ni,x0: x0): (xs)
//
(* ****** ****** *)
//
(*
HX: |xs| > 0 is assumed
*)
fun
<xs:t0>
<x0:t0>
gseq_head$raw(xs): (x0)
fun
<xs:t0>
<x0:t0>
gseq_tail$raw(xs): (xs)
//
fun
<xs:t0>
<x0:t0>
gseq_uncons$raw(xs): @(x0, xs)
fun
<xs:t0>
<x0:t0>
gseq_unsnoc$raw(xs): @(xs, x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-26:
These should be
used with caution!!!
*)
fun
<xs:t0>
<x0:t0>
gasz_get$at$raw
(xs: xs, i0: ni): (x0)
fun
<xs:t0>
<x0:t0>
gasz_set$at$raw
(xs: xs, i0: ni, x0: x0): void
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
(xs: xs
,i0: ni): (owed(x0) | x0)
fun
<xs:t0>
<x0:vt>
gasz_lset$at$raw
(pf: owed(x0)
|xs: xs, i0: ni, x0: x0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
strn_head$raw
( cs: strn ): cgtz
fun<>
strn_tail$raw
( cs: strn ): strn
//
fun<>
strn_get$at$raw
(cs:strn, i0:nint): cgtz
fun<>
strn_fset$at$raw
(cs:strn, i0:nint, c0:cgtz): strn
//
#symload
get$at$raw with strn_get$at$raw of 1000
#symload
fset$at$raw with strn_fset$at$raw of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
// HX-2024-07-30: it should not be loaded
#include "./VT/unsfx00_vt.sats" // elsewhere!
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_unsfx00.sats] *)
