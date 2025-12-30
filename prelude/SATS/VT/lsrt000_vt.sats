(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
Thu Dec 25 10:09:49 AM EST 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-25:
For sorted linear lists
*)
//
abstbox
lsrt_vt_i0_vx
( a:vt,n:i0 ) == list_vt(a)
(* ****** ****** *)
(* ****** ****** *)
//
fcast
lsrt_vt_decd
{a:vt}
(lsrt_vt(a,n)): list_vt(a,n)
//
fcast
UN_lsrt_vt_encd
{a:vt}
(list_vt(a,n)): lsrt_vt(a,n)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
lsrt_vt_nil
{a:vt}((*nil*)): lsrt_vt(a,0)
//
(* ****** ****** *)
//
fun<>
lsrt_vt_nilq1
{a:vt}{n:i0}
(xs: !lsrt_vt(a,n)): bool(n=0)
fun<>
lsrt_vt_consq1
{a:vt}{n:i0}
(xs: !lsrt_vt(a,n)): bool(n>0)
//
#symload
nilq1 with lsrt_vt_nilq1 of 1000
consq1 with lsrt_vt_consq1 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
lsrt_vt_head0
{n:i0|n>0}
(xs: ~lsrt_vt(a,n)): (  a  )
fun
<a:vt>
lsrt_vt_head1
{n:i0|n>0}
(xs: !lsrt_vt(a,n)): (  a  )
fun
<a:vt>
lsrt_vt_tail0
{n:i0|n>0}
(xs:
~lsrt_vt(a,n)): lsrt_vt(a,n-1)
fun
<a:vt>
lsrt_vt_tail1
{n:i0|n>0}
(xs:
!lsrt_vt(a,n)): lsrt_vt(a,n-1)
//
#symload
head0 with lsrt_vt_head0 of 1000
#symload
head1 with lsrt_vt_head1 of 1000
#symload
tail0 with lsrt_vt_tail0 of 1000
#symload
tail1 with lsrt_vt_tail1 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
lsrt_vt_make_1val
(x1: a): lsrt_vt(a,1)
fun
<a:vt>
lsrt_vt_make_2val
(x1: a, x2: a): lsrt_vt(a,2)
fun
<a:vt>
lsrt_vt_make_3val
(x1: a
,x2: a, x3: a): lsrt_vt(a,3)
//
(* ****** ****** *)
//
#symload
lsrt_vt_sing
with lsrt_vt_make_1val//of 1000
#symload
lsrt_vt_pair
with lsrt_vt_make_2val//of 1000
//
#symload
lsrt_vt_1val
with lsrt_vt_make_1val//of 1000
#symload
lsrt_vt_2val
with lsrt_vt_make_2val//of 1000
#symload
lsrt_vt_3val
with lsrt_vt_make_3val//of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
lsrt_vt_length0
{n:i0}
(xs: ~lsrt_vt(a, n)): sint(n)
fun
<a:vt>
lsrt_vt_length1
{n:i0}
(xs: !lsrt_vt(a, n)): sint(n)
//
#symload
length0 with lsrt_vt_length0 of 1000
#symload
length1 with lsrt_vt_length1 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_SATS_VT_lsrt000_vt.sats] *)
(***********************************************************************)
