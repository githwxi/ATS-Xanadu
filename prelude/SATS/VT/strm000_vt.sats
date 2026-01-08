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
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
strm_vt_sing
( x0: (a) ): strm_vt(a)
fun
<a:vt>
strq_vt_sing
( x0: (a) ): strq_vt(a, 1)
//
fun
<x0:vt>
strmcon_vt_sing
(x0: x0): strmcon_vt(x0)
fun
<x0:vt>
strqcon_vt_sing
(x0: x0): strqcon_vt(x0, 1)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
strm_vt_cons
(
x0: (a),
xs: strm_vt(a)): strm_vt(a)
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
<a:vt>
strm_vt_free
(~strm_vt(a)): ( void )
fun
<a:vt>
strq_vt_free
(~strq_vt(a)): ( void )
//
fun
<a:vt>
strm_vt_eval
(~strm_vt(a)): strmcon_vt(a)
fun
<a:vt>
strq_vt_eval
(~strm_vt(a)): strqcon_vt(a)
//
#symload
free with strm_vt_free of 1000
#symload
free with strq_vt_free of 1000
#symload
eval with strm_vt_eval of 1000
#symload
eval with strq_vt_eval of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-08:
Thu Jan  8 12:13:02 PM EST 2026
*)
//
fun
<a:vt>
strm_vt_make(): strm_vt(a)
fun<>
strm_vt_make'len((*0*)): nint
(*
g_make<strm_vt(a)>=strm_vt_make<a>
*)
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
#symload
head0 with strm_vt_head0 of 1000
#symload
tail0 with strm_vt_tail0 of 1000
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
#symload
head$opt0 with strm_vt_head$opt0 of 1000
#symload
tail$opt0 with strm_vt_tail$opt0 of 1000
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
#symload
length0 with strm_vt_length0 of 1000
#symload
length0 with strq_vt_length0 of 1000
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
#symload
append00 with strm_vt_append00 of 1000
#symload
append00 with strq_vt_append00 of 1000
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
, ys: strq_vt(x0,n2)): strq_vt(x0,n2+n1)
//
#symload
prepend00 with strm_vt_prepend00 of 1000
#symload
prepend00 with strq_vt_prepend00 of 1000
//
(* ****** ****** *)
//
(*
(*
HX-2026-01-08:
This is the new naming style
Thu Jan  8 09:48:03 AM EST 2026
*)
fun
<x0:vt>
strm_vt_llist0$prepend0
( xs: strm_vt(x0)
, ys: list_vt(x0)): strm_vt(x0)
fun
<x0:vt>
strm_vt_lstrq0$prepend0
( xs: strm_vt(x0)
, ys: strq_vt(x0)): strm_vt(x0)
*)
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
(*
#symload
prepend00 with strm_vt_llist0$prepend0
#symload
prepend00 with strm_vt_lstrq0$prepend0
*)
#symload
prepend00 with strm_vt_prepend0__llist0
#symload
prepend00 with strm_vt_prepend0__lstrq0
//
(* ****** ****** *)
//
(*
(*
HX-2026-01-08:
This is the new naming style
Thu Jan  8 09:48:03 AM EST 2026
*)
fun
<x0:vt>
strq_vt_llist0$prepend0
{n1,n2:i0}
( xs
: strq_vt(x0,n1)
, ys
: list_vt(x0,n2)): strq_vt(x0,n2+n1)
#symload
prepend00 with strq_vt_llist0$prepend0
*)
fun
<x0:vt>
strq_vt_prepend0__llist0
{n1,n2:i0}
(
xs: strq_vt(x0,n1),
ys: list_vt(x0,n2)): strq_vt(x0,n2+n1)
#symload
prepend00 with strq_vt_prepend0__llist0
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
g_make_lstrq(strq_vt(x0)): (ys)
fun
<x0:vt>
<ys:vt>
g_make_lstrm(strm_vt(x0)): (ys)
//
(*
fun
<x0:vt>
<ys:vt>
<y0:vt>
gseq_make_lstrm(strm_vt(x0)): (ys)
fun
<x0:vt>
<ys:vt>
<y0:vt>
gseq_make_lstrq(strq_vt(x0)): (ys)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-13:
concat0 -> lstrm$concat0
Sat Dec 13 11:42:48 PM EST 2025
*)
//
fun
<x0:vt>
strm_vt_lstrm$concat0
( xss
: ~strm_vt(strm_vt(x0))): strm_vt(x0)
//
#symload
concat0 with strm_vt_lstrm$concat0 of 1000
#symload
lstrm$concat0 with strm_vt_lstrm$concat0 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-15:
These one are in
[prelude/list000.sats]!
Mon Dec 15 04:42:34 PM EST 2025
fun
<x0:t0>
list_make_lstrm
(xs: strm_vt(x0)): list(x0)
fun
<x0:t0>
list_make_lstrq
{ln:i0}
(xs: strq_vt(x0, ln)): list(x0, ln)
//
#symload list with list_make_lstrm of 1000
#symload list with list_make_lstrq of 1000
*)
//
(*
HX-2025-12-15:
These ones are in
[prelude/list000_vt.sats]!
Mon Dec 15 04:42:34 PM EST 2025
fun
<x0:vt>
list_vt_make_lstrm
(xs: strm_vt(x0)): list_vt(x0)
fun
<x0:vt>
list_vt_make_lstrq
{ln:i0}
(xs: strq_vt(x0, ln)): list_vt(x0, ln)
//
#symload list_vt with list_vt_make_lstrm of 1000
#symload list_vt with list_vt_make_lstrq of 1000
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
Sun Dec 21 07:15:47 PM EST 2025
*)
fun<>
strm_vt_beg(): strn
fun<>
strm_vt_end(): strn
fun<>
strm_vt_sep(): strn
fun<>
strm_vt_rst(): strn
//
fun
<x0:vt>
strm_vt_print0(xs: strm_vt(x0)): void
//
fun
<x0:vt>
strm_vt_all$print0(xs: strm_vt(x0)): void
//
fun<>
strm_vt_print$len(): sint
fun<>
strm_vt_print'len(): sint
fun
<x0:vt>
strm_vt_len$print0(xs: strm_vt(x0), ln: sint): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-26:
Fri Dec 26 05:13:01 PM EST 2025
*)
//
fun
<x0:vt>
strm_vt_ndrop
( xs
: strm_vt(x0), n0: nint): strm_vt(x0)
fun
<x0:vt>
strm_vt_ntake
( xs
: strm_vt(x0), n0: nint): strm_vt(x0)
//
#symload ndrop with strm_vt_ndrop of 1000
#symload ntake with strm_vt_ntake of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_SATS_VT_strn000_vt.sats] *)
(***********************************************************************)
