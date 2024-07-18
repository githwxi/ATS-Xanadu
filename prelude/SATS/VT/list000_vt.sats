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
//
(*
Author: Hongwei Xi
(*
Mon 08 Jul 2024 04:08:25 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
list_vt_nil_
{a:vt}(): list_vt(a,0)
fun
<a:vt>
list_vt_cons_
{n:i0}
(
x0: (a),
xs: list_vt(a,n)): list_vt(a,n+1)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
list_vt_make_1val
(x1: a): list_vt(a,1)
fun
<a:vt>
list_vt_make_2val
(x1: a, x2: a): list_vt(a,2)
fun
<a:vt>
list_vt_make_3val
(x1: a
,x2: a, x3: a): list_vt(a,3)
//
(* ****** ****** *)
//
#symload
llist_sing with list_vt_make_1val
#symload
llist_pair with list_vt_make_2val
#symload
llist_triple with list_vt_make_3val
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
list_vt_length0
{n0:i0}
(xs: ~list_vt(x0,n0)): sint(n0)
//
fun
<x0:vt>
list_vt_length1
{n0:i0}
(xs: !list_vt(x0,n0)): sint(n0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
list_vt_make0_lstrm
(xs: strm_vt(x0)): list_vt(x0)
fun
<x0:vt>
list_vt_make0_lstrq
{n0:i0}
(xs: strq_vt(x0, n0)): list_vt(x0, n0)
//
#symload
llist_make0 with list_vt_make0_lstrm
#symload
llist_make0 with list_vt_make0_lstrq
//
(* ****** ****** *)
(* ****** ****** *)
//
//
fun
<x0:vt>
list_vt_append00
{n1,n2:i0}
( xs: ~list_vt(x0,n1)
, ys: ~list_vt(x0,n2)): list_vt(x0,n1+n2)
//
fun
<x0:vt>
list_vt_append10
{n1,n2:i0}
( xs: !list_vt(x0,n1)
, ys: ~list_vt(x0,n2)): list_vt(x0,n1+n2)
//
(* ****** ****** *)
//
fun
<x0:vt>
list_vt_reverse0
{n0:i0}
(xs: ~list_vt(x0,n0)): list_vt(x0,n0)
//
fun
<x0:vt>
list_vt_reverse1
{n0:i0}
(xs: !list_vt(x0,n0)): list_vt(x0,n0)
//
(* ****** ****** *)
//
fun
<x0:vt>
list_vt_rappend00
{n1,n2:i0}
( xs: ~list_vt(x0,n1)
, ys: ~list_vt(x0,n2)): list_vt(x0,n1+n2)
//
fun
<x0:vt>
list_vt_rappend10
{n1,n2:i0}
( xs: !list_vt(x0,n1)
, ys: ~list_vt(x0,n2)): list_vt(x0,n1+n2)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_VT_list000_vt.sats] *)
