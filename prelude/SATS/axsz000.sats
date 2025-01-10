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
Sun 11 Aug 2024 12:59:19 PM EDT
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox
a1sz_vt_i0_tx(a:vt,n:i0)
#absvtbx
a1sz_vt_i0_vx(a:vt,n:i0)
//
#typedef
a1sz
(a:vt,n:i0) = a1sz_vt_i0_tx(a,n)
#vwtpdef
a1sz_vt
(a:vt,n:i0) = a1sz_vt_i0_vx(a,n)
//
#typedef
a1sz(x0:vt) = [n:i0] a1sz(x0,n)
#vwtpdef
a1sz_vt(x0:vt) = [n:i0] a1sz_vt(x0,n)
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox
a2sz_vt_i0_i0_tx(a:vt,m:i0,n:i0)
#abstbox
a2sz_vt_i0_i0_vx(a:vt,m:i0,n:i0)
//
#typedef
a2sz
(a:vt
,m:i0,n:i0) = a2sz_vt_i0_i0_tx(a,m,n)
#vwtpdef
a2sz_vt
(a:vt
,m:i0,n:i0) = a2sz_vt_i0_i0_vx(a,m,n)
//
#typedef
a2sz(x0:vt) = [m:i0;n:i0] a2sz(x0,m,n)
#vwtpdef
a2sz_vt(x0:vt) = [m:i0;n:i0] a2sz_vt(x0,m,n)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
a1sz_make_none
 {n:i0}
(n0: nint(n)): a1sz(?a, n)
//
(* ****** ****** *)
//
fun
<a:t0>
a1sz_make_list
 {n:i0}
(xs: list(a, n)): a1sz(a, n)
//
#symload
a1sz with a1sz_make_list//of 1000
//
(* ****** ****** *)
//
fun
<a:t0>
a1sz_make_ncpy
 {n:i0|n>0}
(n: sint(n), x:a): a1sz(a, n)
//
fun
<a:vt>
a1sz_make_nfun
 {n:i0|n>0}
( n: sint(n)
, f: nint(n) -> a): a1sz(a, n)
//
#symload
a1sz with a1sz_make_ncpy//of 1000
#symload
a1sz with a1sz_make_nfun//of 1000
#symload
arrsz with a1sz_make_ncpy//of 1000
#symload
arrsz with a1sz_make_nfun//of 1000
//
(* ****** ****** *)
//
fun
<a:vt>
a1sz_make_lstrm
 {n:i0}
(xs: strm_vt(a)): a1sz(a)
fun
<a:vt>
a1sz_make_lstrq
 {n:i0}
(xs:strq_vt(a, n)): a1sz(a, n)
//
#symload
a1sz with a1sz_make_lstrm//of 1000
#symload
a1sz with a1sz_make_lstrq//of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
a1sz_length
{n:i0}
(asz: a1sz(a, n)): sint(n)
#symload length with a1sz_length of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
a1sz_get$at
{n:i0}
(a1sz(a, n), nint(n)): ( a )
fun
<a:vt>
a1sz_set$at
{n:i0}
(a1sz(a, n), nint(n), a): void
//
#symload [] with a1sz_get$at of 1000
#symload [] with a1sz_set$at of 1000
#symload get$at with a1sz_get$at of 1000
#symload set$at with a1sz_set$at of 1000
//
(* ****** ****** *)
//
fun
<a:vt>
a1sz_cget$at
{n:nat}
(A:a1sz(a,n), i:nintlt(n)): (a)
fun
<a:vt>
a1sz_setf$at
{n:nat}
(A:a1sz(a,n), i:nintlt(n), x:a): void
//
#symload cget$at with a1sz_cget$at of 1000
#symload setf$at with a1sz_setf$at of 1000
//
(* ****** ****** *)
//
fun
<a:vt>
a1sz_lget$at
{n:nat}
( A: a1sz(a,n)
, i: nintlt(n)): (owed(a) | a)
fun
<a:vt>
a1sz_lset$at
{n:nat}
(f: owed(a)
|A: a1sz(a,n), i:nintlt(n), x:a): void
//
#symload lget$at with a1sz_lget$at of 1000
#symload lset$at with a1sz_lset$at of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
a2sz_d1size
{m:i0;n:i0}(a2sz(a, m, n)): sint(m)
#symload d1size with a2sz_d1size of 1000
#symload rowlen with a2sz_d1size of 1000
//
fun
<a:vt>
a2sz_d2size
{m:i0;n:i0}(a2sz(a, m, n)): sint(n)
#symload d2size with a2sz_d2size of 1000
#symload collen with a2sz_d2size of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fcast // fun
GSEQ_make_a1sz
{a:t0}
(A:a1sz(a)): GSEQ(a1sz(a), a)
#symload GSEQ with GSEQ_make_a1sz of 1000
fcast // fun
GASZ_make_a1sz
{a:vt}
(A:a1sz(a)): GASZ(a1sz(a), a)
#symload GASZ with GASZ_make_a1sz of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-18:
Sun 18 Aug 2024 09:19:36 AM EDT
*)
fun
<x0:vt>
a1sz_rvrsref(A: a1sz(x0)): void
#symload rvrsref with a1sz_rvrsref of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
a1sz_sortref(A: a1sz(x0)): void
#symload sortref with a1sz_sortref of 1000
fun
<x0:vt>
a1sz_qsortref(A: a1sz(x0)): void
#symload qsortref with a1sz_qsortref of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_axsz000.sats] *)
