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
Mon 08 Jul 2024 12:09:13 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
strm_vt_nil
{a:vt}(): strm_vt(a)
fun<>
strq_vt_nil
{a:vt}(): strq_vt(a,0)
//
fun
<a:vt>
strm_vt_cons
(
x0: (a),
xs: strm_vt(a)): strm_vt(a)
fun
<a:vt>
strx_vt_cons
(
x0: (a),
xs: strx_vt(a)): strx_vt(a)
fun
<a:vt>
strq_vt_cons
{n:i0}
(
x0: (a),
xs: strq_vt(a,n)): strq_vt(a,n+1)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_free
(xs: strm_vt(x0)): ( void )
fun
<x0:vt>
strm_vt_eval
(xs: strm_vt(x0)): strmcon_vt(x0)
//
#symload free with strm_vt_free of 1000
#symload eval with strm_vt_eval of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_head0
(xs: strm_vt(x0)): (x0)
fun
<x0:vt>
strm_vt_tail0
(xs: strm_vt(x0)): strm_vt(x0)
//
#symload head0 with strm_vt_head0
#symload tail0 with strm_vt_tail0
//
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_head$opt0
(xs: strm_vt(x0)): optn_vt(x0)
fun
<x0:vt>
strm_vt_tail$opt0
(xs: strm_vt(x0)): optn_vt(strm_vt(x0))
//
#symload head$opt0 with strm_vt_head$opt0
#symload tail$opt0 with strm_vt_tail$opt0
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_length0
(xs: strm_vt(x0)): (nint)
fun
<x0:vt>
strq_vt_length0
{n0:i0}
(xs: strq_vt(x0,n0)): sint(n0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_concat0
( xss
: ~strm_vt
 ( strm_vt(x0) )): strm_vt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_append0
( xs: strm_vt(x0)
, ys: strm_vt(x0)): strm_vt(x0)
fun
<x0:vt>
strm_vt_append00
( xs: strm_vt(x0)
, ys: strm_vt(x0)): strm_vt(x0)
//
fun
<x0:vt>
strq_vt_append00
{n1,n2:i0}
( xs: strq_vt(x0,n1)
, ys: strq_vt(x0,n2)): strq_vt(x0,n1+n2)
//
(* ****** ****** *)
//
#symload append00 with strm_vt_append00
#symload append00 with strq_vt_append00
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_prepend00
( xs: strm_vt(x0)
, ys: strm_vt(x0)): strm_vt(x0)
fun
<x0:vt>
strq_vt_prepend00
{n1,n2:i0}
( xs: strq_vt(x0,n1)
, ys: strq_vt(x0,n2)): strq_vt(x0,n1+n2)
//
#symload prepend00 with strm_vt_prepend00
#symload prepend00 with strq_vt_prepend00
//
(* ****** ****** *)
//
fun
<x0:vt>
strm_vt_prepend0__llist0
( xs: strm_vt(x0)
, ys: list_vt(x0)): strm_vt(x0)
fun
<x0:vt>
strm_vt_prepend0__lstrq0
( xs: strm_vt(x0)
, ys: strq_vt(x0)): strm_vt(x0)
//
(* ****** ****** *)
//
fun
<x0:vt>
strq_vt_prepend0__llist0
{n1,n2:i0}
( xs: strq_vt(x0,n1)
, ys: list_vt(x0,n2)): strq_vt(x0,n1+n2)
//
(* ****** ****** *)
//
#symload prepend00 with strm_vt_prepend0__llist0
#symload prepend00 with strm_vt_prepend0__lstrq0
#symload prepend00 with strq_vt_prepend0__llist0
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-24:
Wed 24 Jul 2024 08:52:25 PM EDT
*)
//
fun
<x0:vt>
<ys:vt>
g_make0_lstrm(xs: strm_vt(x0)): (ys)
fun
<x0:vt>
<ys:vt>
g_make0_lstrq(xs: strq_vt(x0)): (ys)
//
(* ****** ****** *)
//
fun
<x0:t0>
list_make0_lstrm
(xs: strm_vt(x0)): list(x0)
fun
<x0:t0>
list_make0_lstrq
{n0:i0}
(xs: strq_vt(x0, n0)): list(x0, n0)
//
#symload list with list_make0_lstrm of 1000
#symload list with list_make0_lstrq of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_VT_strn000_vt.sats] *)
