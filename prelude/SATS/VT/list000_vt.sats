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
list_vt_head0
{n:i0|n>0}
(xs: ~list_vt(a,n)): (a)
fun
<a:vt>
list_vt_head1
{n:i0|n>0}
(xs: !list_vt(a,n)): (a)
fun
<a:vt>
list_vt_tail0
{n:i0|n>0}
(xs: ~list_vt(a,n)): list_vt(a,n-1)
fun
<a:vt>
list_vt_tail1
{n:i0|n>0}
(xs: !list_vt(a,n)): list_vt(a,n-1)
//
#symload head0 with list_vt_head0 of 1000
#symload head1 with list_vt_head1 of 1000
#symload tail0 with list_vt_tail0 of 1000
#symload tail1 with list_vt_tail1 of 1000
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
list_vt_sing with list_vt_make_1val
#symload
list_vt_pair with list_vt_make_2val
//
#symload
list_vt_1val with list_vt_make_1val
#symload
list_vt_2val with list_vt_make_2val
#symload
list_vt_3val with list_vt_make_3val
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
list_vt_make_nfun
{n:nat}
(n0: sint(n)
,f0: nintlt(n)->(a)): list_vt(a, n)
//
#symload
list_vt with list_vt_make_nfun
#symload
list_vt_nfun with list_vt_make_nfun
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
#symload
length0 with list_vt_length0 of 1000
#symload
length1 with list_vt_length1 of 1000
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
(xs: strq_vt(x0,n0)): list_vt(x0,n0)
//
#symload
list_vt_make0 with list_vt_make0_lstrm
#symload
list_vt_make0 with list_vt_make0_lstrq
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
list_vt_copy
 {n0:i0}
( xs
: !list_vt(x0,n0)): list_vt(x0,n0)
//
#symload copy with list_vt_copy of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
list_vt_append0
{n1,n2:i0}
( xs
: ~list_vt(x0,n1)
, ys
: ~list_vt(x0,n2)): list_vt(x0,n1+n2)
fun
<x0:vt>
list_vt_append00
{n1,n2:i0}
( xs
: ~list_vt(x0,n1)
, ys
: ~list_vt(x0,n2)): list_vt(x0,n1+n2)
//
fun
<x0:vt>
list_vt_append10
{n1,n2:i0}
( xs
: !list_vt(x0,n1)
, ys
: ~list_vt(x0,n2)): list_vt(x0,n1+n2)
//
(* ****** ****** *)
//
#symload
append0 with list_vt_append0 of 1000
#symload
append00 with list_vt_append00 of 1000
#symload
append10 with list_vt_append10 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
list_vt_reverse0
{n0:i0}
(xs: ~list_vt(x0,n0)): list_vt(x0,n0)
fun
<x0:vt>
list_vt_reverse1
{n0:i0}
(xs: !list_vt(x0,n0)): list_vt(x0,n0)
//
#symload
reverse0 with list_vt_reverse0 of 1000
#symload
reverse1 with list_vt_reverse1 of 1000
//
(* ****** ****** *)
//
fun
<x0:vt>
list_vt_rappend0
{n1,n2:i0}
( xs
: ~list_vt(x0,n1)
, ys
: ~list_vt(x0,n2)): list_vt(x0,n1+n2)
fun
<x0:vt>
list_vt_rappend00
{n1,n2:i0}
( xs
: ~list_vt(x0,n1)
, ys
: ~list_vt(x0,n2)): list_vt(x0,n1+n2)
fun
<x0:vt>
list_vt_rappend10
{n1,n2:i0}
( xs
: !list_vt(x0,n1)
, ys
: ~list_vt(x0,n2)): list_vt(x0,n1+n2)
//
#symload
rappend0 with list_vt_rappend0 of 1000
#symload
rappend00 with list_vt_rappend00 of 1000
#symload
rappend10 with list_vt_rappend10 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fcast // fun
GLSEQ_make0_list_vt
{a:vt}
(xs: list_vt(a)): GLSEQ(list_vt(a), a)
#symload GLSEQ with GLSEQ_make0_list_vt of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_VT_list000_vt.sats] *)
