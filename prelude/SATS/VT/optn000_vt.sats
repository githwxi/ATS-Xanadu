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
// For linear options
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: September, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
(*
HX:
these are functions
instead of constructors
*)
//
fun<>
optn_vt_nil_
{a:vt}(): optn_vt(a, ff)
fun
<a:vt>
optn_vt_cons_
( x0 : a ): optn_vt(a, tt)
//
(* ****** ****** *)
//
fun
<a:vt>
optn_vt_sing(x:a): optn_vt(a,1)
//
(* ****** ****** *)
//
fun
<a:vt>
optn_vt_free(~optn_vt(a)): void
//
(* ****** ****** *)
//
fun
<a:vt>
optn_vt_copy
{n:b0}
(xs: !optn_vt(a,n)): optn_vt(a,n)
fun
<a:vt>
optn_vt_rcopy
{n:b0}
(xs: !optn_vt(a,n)): optn_vt(a,n)
//
(* ****** ****** *)
//
fun<>
optn_vt_nilq1
{a:vt}{n:b0}
(xs: !optn_vt(a, n)): bool(n=ff)
fun<>
optn_vt_consq1
{a:vt}{n:b0}
(xs: !optn_vt(a, n)): bool(n=tt)
//
(* ****** ****** *)
//
fun
<a:vt>
optn_vt_length0
{n:b0}
(xs: ~optn_vt(a,n)): sint(b2i(n))
fun
<a:vt>
optn_vt_length1
{n:b0}
(xs: !optn_vt(a,n)): sint(b2i(n))
//
(* ****** ****** *)
//
fun
<x0:vt>
optn_vt_listize0
{n:b0}
(
xs: ~optn_vt(x0,n)): list_vt(x0,b2i(n))
fun
<x0:vt>
optn_vt_rlistize0
{n:b0}
(
xs: ~optn_vt(x0,n)): list_vt(x0,b2i(n))
//
(* ****** ****** *)
//
fun
<x0:vt>
optn_vt_strmize0
(xs: ~optn_vt( x0 )): strm_vt(   x0   )
fun
<x0:vt>
optn_vt_rstrmize0
(xs: ~optn_vt( x0 )): strm_vt(   x0   )
//
(* ****** ****** *)
//
fun
<x0:vt>
optn_vt_forall0(xs: ~optn_vt(x0)): bool
fun
<x0:vt>
optn_vt_forall1(xs: !optn_vt(x0)): bool
//
(* ****** ****** *)
//
fun
<x0:vt>
optn_vt_foreach0(xs: ~optn_vt(x0)): void
fun
<x0:vt>
optn_vt_foreach1(xs: !optn_vt(x0)): void
//
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
optn_vt_map0
{n:b0}(xs: ~optn_vt(x0,n)): optn_vt(y0,n)
fun
<x0:vt>
<y0:vt>
optn_vt_maprev0
{n:b0}(xs: ~optn_vt(x0,n)): optn_vt(y0,n)
//
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
optn_vt_map1
{n:b0}(xs: !optn_vt(x0,n)): optn_vt(y0,n)
fun
<x0:vt>
<y0:vt>
optn_vt_maprev1
{n:b0}(xs: !optn_vt(x0,n)): optn_vt(y0,n)
//
(* ****** ****** *)
//
// HX-2020-05-30:
// symbol overloading for optn_vt
//
(* ****** ****** *)
//
#symload
none_vt with optn_vt_nil
#symload
some_vt with optn_vt_cons
//
(* ****** ****** *)
//
(*
#symload
nilq with optn_vt_nilq1 of 1000
#symload
consq with optn_vt_consq1 of 1000
*)
#symload
nilq1 with optn_vt_nilq1 of 1000
#symload
consq1 with optn_vt_consq1 of 1000
//
(* ****** ****** *)
//
(*
#symload
length with optn_vt_length1 of 1000
*)
#symload
length0 with optn_vt_length0 of 1000
#symload
length1 with optn_vt_length1 of 1000
//
(* ****** ****** *)
//
#symload
listize0 with optn_vt_listize0 of 1000
#symload
listize0 with optn_vt_strmize0 of 1000
//
(* ****** ****** *)
//
#symload
rstrmize0 with optn_vt_rlistize0 of 1000
#symload
rlistize0 with optn_vt_rlistize0 of 1000
//
(* ****** ****** *)
//
(*
#symload map with optn_vt_map0 of 1000
*)
#symload map0 with optn_vt_map0 of 1000
#symload map1 with optn_vt_map1 of 1000
//
(* ****** ****** *)
//
(*
#symload maprev with optn_vt_maprev0 of 1000
*)
#symload maprev0 with optn_vt_maprev0 of 1000
#symload maprev1 with optn_vt_maprev1 of 1000
//
(* ****** ****** *)
//
(*
#symload forall with optn_vt_forall0 of 1000
*)
#symload forall0 with optn_vt_forall0 of 1000
#symload forall1 with optn_vt_forall1 of 1000
//
(* ****** ****** *)
//
(*
#symload foreach with optn_vt_foreach0 of 1000
*)
#symload foreach0 with optn_vt_foreach0 of 1000
#symload foreach1 with optn_vt_foreach1 of 1000
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_optn000_vt.sats] *)
